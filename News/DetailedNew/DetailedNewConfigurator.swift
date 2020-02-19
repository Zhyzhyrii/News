//
//  DetailedNewConfigurator.swift
//  News
//
//  Created by Игорь on 17.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

class DetailedNewConfigurator {
    
    static let shared = DetailedNewConfigurator()
    
    func configure(with viewController: DetailedNewViewController) {
        let viewController = viewController
        let interactor = DetailedNewInteractor()
        let presenter = DetailedNewPresenter()
        let router = DetailedNewRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

}
