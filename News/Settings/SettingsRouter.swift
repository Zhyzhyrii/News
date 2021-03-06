//
//  SettingsRouter.swift
//  News
//
//  Created by Игорь on 27.12.2019.
//  Copyright (c) 2019 Igor Zhyzhyrii. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SettingsRoutingLogic {
    func routeToSourceOfNewSettings(segue: UIStoryboardSegue?)
}

protocol SettingsDataPassing {
    var dataStore: SettingsDataStore? { get }
}

class SettingsRouter: NSObject, SettingsRoutingLogic, SettingsDataPassing {
    
    weak var viewController: SettingsViewController?
    var dataStore: SettingsDataStore?
    
    // MARK: - Routing
    
    func routeToSourceOfNewSettings(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! SourceOfNewSettingsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToTabSettings(source: dataStore!, destination: &destinationDS)
        }
    }

    // MARK: - Passing data
    
    func passDataToTabSettings(source: SettingsDataStore, destination: inout SourceOfNewSettingsDataStore) {
        destination.numberOfTab = source.numberOfTab
    }
    
}
