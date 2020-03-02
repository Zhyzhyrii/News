//
//  SourceOfNewSettingsRouter.swift
//  News
//
//  Created by Игорь on 25.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

protocol SourceOfNewSettingsDataPassing {
    var dataStore: SourceOfNewSettingsDataStore? { get }
}

class SourceOfNewSettingsRouter: SourceOfNewSettingsDataPassing {
    
    weak var viewController: SourceOfNewSettingsViewController?
    var dataStore: SourceOfNewSettingsDataStore?
    
}
