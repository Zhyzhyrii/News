//
//  TabSettingsConfigurator.swift
//  News
//
//  Created by Игорь on 26.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

class TabSettingsConfigurator {
    
    static let shared = TabSettingsConfigurator()
     
    func configure(with viewController: TabSettingsViewController) {
         let viewController = viewController
         let interactor = TabSettingsInteractor()
         let presenter = TabSettingsPresenter()
         let router = TabSettingsRouter()
         viewController.interactor = interactor
         viewController.router = router
         interactor.presenter = presenter
         presenter.viewController = viewController
         router.viewController = viewController
         router.dataStore = interactor
     }
    
}
