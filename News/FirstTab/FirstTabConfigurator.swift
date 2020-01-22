//
//  FirstTabConfigurator.swift
//  News
//
//  Created by Игорь on 22.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

class FirstTabConfigurator {
    
    static let shared = FirstTabConfigurator()
    
    func configure(with viewController: FirstTabViewController) {
        let viewController = viewController
        let interactor = FirstTabInteractor()
        let presenter = FirstTabPresenter()
        let router = FirstTabRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
}
