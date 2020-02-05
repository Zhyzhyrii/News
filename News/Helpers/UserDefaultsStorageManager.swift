//
//  UserDefaultsStorageManager.swift
//  News
//
//  Created by Игорь on 07.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import Foundation

class UserDefaultsStorageManager {
    
    static let shared = UserDefaultsStorageManager()
    
    private let defaults = UserDefaults.standard
    
    func getSavedFeeds(forKey numberOfTab: Int) -> [FeedModel]? {
        guard let savedFeeds = defaults.object(forKey: "\(Constants.UserDefaults.savedFeedsForTab)" + "\(numberOfTab)") as? Data else { return nil}
        guard let fetchedFeeds = try? JSONDecoder().decode([FeedModel].self, from: savedFeeds) else { return nil }
        return fetchedFeeds
    }
    
    func saveFeeds(_ feeds: [FeedModel], forKey numberOfTab: Int) {
        guard let feedEncoded = try? JSONEncoder().encode(feeds) else { return }
        defaults.set(feedEncoded, forKey: "\(Constants.UserDefaults.savedFeedsForTab)" + "\(numberOfTab)")
    }
    
    func getSavedIntervalOfUpdatingInSeconds() -> Int? {
        guard let savedIntervalOfUpdating = defaults.object(forKey: Constants.UserDefaults.savedIntervalOfUpdating) as? Int else { return nil }
        return savedIntervalOfUpdating
    }

    func saveIntervalOfUpdatingIn(seconds: Int) {
        defaults.set(seconds, forKey: Constants.UserDefaults.savedIntervalOfUpdating)
    }
    
    func getSavedSwitchValueForIntervalOfUpdating() -> Bool {
        guard let switchValueForIntervalOfUpdating = defaults.object(forKey: Constants.UserDefaults.savedSwitchValueForIntervalOfUpdating) as? Bool else { return false }
        return switchValueForIntervalOfUpdating
    }

    func saveSwitchValueForIntervalOfUpdating(value: Bool) {
        defaults.set(value, forKey: Constants.UserDefaults.savedSwitchValueForIntervalOfUpdating)
    }
    
}
