//
//  StorageManager.swift
//  News
//
//  Created by Игорь on 07.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    
    func getSavedFeeds(forKey numberOfTab: Int) -> [FeedModel]? {
        guard let savedFeeds = defaults.object(forKey: "\(Constants.UserDefaults.savedFeedsForTab)" + "\(numberOfTab)") as? Data else { return nil}
        guard let fetchedFeeds = try? JSONDecoder().decode([FeedModel].self, from: savedFeeds) else { return nil }
        return fetchedFeeds
    }
    
    func saveFeeds(_ feeds: [FeedModel], forKey numberOfTab: Int) {
//        guard let feeds = feeds else { return }
//        for feed in feeds {
//            if !feed.isSelected {
//                defaults.removeObject(forKey: "\(Constants.UserDefaults.savedFeedsForTab)" + "\(numberOfTab)")
//            } else {
                guard let feedEncoded = try? JSONEncoder().encode(feeds) else { return }
                defaults.set(feedEncoded, forKey: "\(Constants.UserDefaults.savedFeedsForTab)" + "\(numberOfTab)")
//            }
//        }
    }
}
