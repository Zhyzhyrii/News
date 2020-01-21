//
//  SettingsConfigurator.swift
//  News
//
//  Created by Игорь on 27.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

class SettingsConfigurator {
    
    static let shared = SettingsConfigurator()
    
    func configure(with viewController: SettingsViewController) {
        let viewController = viewController
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter()
        let router = SettingsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
}
