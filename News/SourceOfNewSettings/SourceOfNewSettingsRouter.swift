//
//  SourceOfNewSettingsRouter.swift
//  News
//
//  Created by Игорь on 25.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

@objc protocol SourceOfNewSettingsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SourceOfNewSettingsDataPassing {
    var dataStore: SourceOfNewSettingsDataStore? { get }
}

class SourceOfNewSettingsRouter: NSObject, SourceOfNewSettingsRoutingLogic, SourceOfNewSettingsDataPassing {
    
    weak var viewController: SourceOfNewSettingsViewController?
    var dataStore: SourceOfNewSettingsDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: SourceOfNewSettingsViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: SourceOfNewSettingsDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
