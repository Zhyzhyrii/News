//
//  Constants.swift
//  News
//
//  Created by Игорь on 07.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

struct Constants {
    
    struct UserDefaults {
        static let savedFeedsForTab                      = "savedFeedsForTab"
        static let savedIntervalOfUpdating               = "savedIntervalOfUpdating"
        static let savedSwitchValueForIntervalOfUpdating = "savedSwitchValueForIntervalOfUpdating"
    }
    
    struct Colors {
        static let backGroundColor           = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
        static let titleTextColor            = UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1)
        static let mainTextColor             = UIColor(red: 0.671, green: 0.654, blue: 0.654, alpha: 1)
        static let navigationTabBarItemColor = UIColor(red: 0.416, green: 0.831, blue: 0.569, alpha: 1)
    }
    
    struct Fonts {
        static let titleTextFontSize           = UIFont.systemFont(ofSize: 18)
        static let mainTextCellFontSize        = UIFont.systemFont(ofSize: 15)
        
        static let mainTextDetailedNewFontSize = UIFont.systemFont(ofSize: 16)
        
        static let settingsOptionsTextFontSize = UIFont.systemFont(ofSize: 17)
    }
    
    struct CellIdentifiers {
        static let newCell                    = "NewCell"
        static let tabSettingCell             = "TabSettingCell"
        static let intervalOfUpdatingNewsCell = "IntervalOfUpdatingNewsCell"
        static let sourceOfNewSettingsCell    = "SourceOfNewSettingsCell"
    }
    
    struct SegueIdentifiers {
        static let detailedNew         = "DetailedNew"
        static let sourceOfNewSettings = "SourceOfNewSettings"
        static let intervalOfUpdating  = "IntervalOfUpdating"
    }
    
}
