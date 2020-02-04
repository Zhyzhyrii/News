//
//  IntervalOfUpdatingConfigurator.swift
//  News
//
//  Created by Игорь on 31.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

class IntervalOfUpdatingConfigurator {
    
    static let shared = IntervalOfUpdatingConfigurator()
    
    func configure(with viewController: IntervalOfUpdatingViewController) {
        let viewController = viewController
        let interactor = IntervalOfUpdatingInteractor()
        let presenter = IntervalOfUpdatingPresenter()
        let router = IntervalOfUpdatingRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
}
