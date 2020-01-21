//
//  SourceOfNewSettingsConfigurator.swift
//  News
//
//  Created by Игорь on 29.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

class SourceOfNewSettingsConfigurator {
    
    static let shared = SourceOfNewSettingsConfigurator()
    
    func configure(with viewController: SourceOfNewSettingsViewController) {
        let viewController = viewController
        let interactor = SourceOfNewSettingsInteractor()
        let presenter = SourceOfNewSettingsPresenter()
        let router = SourceOfNewSettingsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
}
