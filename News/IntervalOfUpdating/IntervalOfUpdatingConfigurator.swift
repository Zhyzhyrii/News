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
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
}
