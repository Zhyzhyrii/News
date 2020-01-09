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
    
    func getSavedFeed(forKey numberOfTab: Int) -> FeedModel? {
        guard let savedFeed = defaults.object(forKey: "\(Constants.UserDefaults.savedFeedForTab)" + "\(numberOfTab)") as? Data else { return nil}
        guard let fetchedFeed = try? JSONDecoder().decode(FeedModel.self, from: savedFeed) else { return nil }
        return fetchedFeed
    }
    
    func saveFeed(_ feed: FeedModel?, forKey numberOfTab: Int) {
        guard let feed = feed else { return }
        if !feed.isSelected {
            defaults.removeObject(forKey: "\(Constants.UserDefaults.savedFeedForTab)" + "\(numberOfTab)")
        } else {
            guard let feedEncoded = try? JSONEncoder().encode(feed) else { return }
            defaults.set(feedEncoded, forKey: "\(Constants.UserDefaults.savedFeedForTab)" + "\(numberOfTab)")
        }
    }
}
