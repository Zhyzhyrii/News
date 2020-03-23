//
//  Extension+UIImageView.swift
//  News
//
//  Created by Игорь on 25.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func fetchImage(with url: String?) {
        guard let imageUrlString = url else { return }
        guard let imageURL = URL(string: imageUrlString) else { return }
        
        //if image is in cache - use it
        if let cachedImage = self.getCachedImage(url: imageURL) {
            self.image = cachedImage
            return
        }
        //if image is not in cache
        URLSession.shared.dataTask(with: imageURL) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data, let response = response, let image = UIImage(data: data) else { return }
            
            self.saveImageToCache(data: data, response: response, url: imageURL)
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
    private func saveImageToCache(data: Data, response: URLResponse, url: URL) {
        let cachedResponse = CachedURLResponse.init(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cacheresponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheresponse.data)
        }
        return nil
    }
    
}
