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
        guard let imageUrl = url else { return }
        guard let imageURL = URL(string: imageUrl) else {
//            image = #imageLiteral(resourceName: <#T##String#>) //TODO - add default image
            return
        }
        
        //if image is in cache - use it
        if let cachedImage = getCachedImage(url: imageURL) {
            image = cachedImage
            return
        }
        
        //if image is not in cache
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else { return }
            
            if imageURL != responseURL {
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            //Save image to cache
            self.saveImageToCache(data: data, response: response)
            
        }.resume()
    }
    
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse.init(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cacheresponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheresponse.data)
        }
        return nil
    }
    
}
