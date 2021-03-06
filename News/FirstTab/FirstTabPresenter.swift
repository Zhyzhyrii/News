//
//  FirstTabPresenter.swift
//  News
//
//  Created by Игорь on 19.12.2019.
//  Copyright (c) 2019 Igor Zhyzhyrii. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FirstTabPresentationLogic {
    func presentNews(response: FirstTab.GetNewsFromDBOrNetwork.Response)
    func presentNewsByRefreshing(response: FirstTab.RefreshNews.Response)
    func presentNewsByTimer(response: FirstTab.GetNewsByTimer.Response)
    func presentNavigationBar(response: FirstTab.DisplayNavigatioBar.Response)
}

class FirstTabPresenter: FirstTabPresentationLogic {
    
    weak var viewController: FirstTabDisplayLogic?
    
    // MARK: Present news
    
    func presentNews(response: FirstTab.GetNewsFromDBOrNetwork.Response) {
        
        if let error = response.error {
            let viewModel = FirstTab.GetNewsFromDBOrNetwork.ViewModel(news: nil)
            switch error {
            case .noSourceIsSelected:
                viewController?.displayNews(viewModel: viewModel)
            case .dataWasNotReceivedFromNetwork:
                viewController?.doNotDisplayNewsDueToNetworkProblem(viewModel: viewModel)
            }
            return
        }
        
        guard let news = response.news else { return }
        
        let displayedNews = prepareDisplayedNews(news)
        
        let viewModel = FirstTab.GetNewsFromDBOrNetwork.ViewModel(news: displayedNews)
        viewController?.displayNews(viewModel: viewModel)
        
    }
    
    // MARK: - Present news by refreshing
    
    func presentNewsByRefreshing(response: FirstTab.RefreshNews.Response) {
        let news = prepareDisplayedNews(response.news)

        let viewModel = FirstTab.RefreshNews.ViewModel(news: news)
        viewController?.displayNews(viewModel: viewModel)
    }

    // MARK: - Present news by timer

    func presentNewsByTimer(response: FirstTab.GetNewsByTimer.Response) {
        let news = prepareDisplayedNews(response.news)

        let viewModel = FirstTab.GetNewsByTimer.ViewModel(news: news)
        viewController?.displayNews(viewModel: viewModel)
    }
    
    // MARK: - Present navigation bar
    
    func presentNavigationBar(response: FirstTab.DisplayNavigatioBar.Response) {
        if let navigationBarTitle = response.title {
            let viewModel = FirstTab.DisplayNavigatioBar.ViewModel(title: navigationBarTitle)
            viewController?.displayNavigationBar(viewModel: viewModel)
        } else {
            viewController?.hideNavigationBar()
        }
        
    }
    
    // MARK: - Prepare displayed news
    
    private func prepareDisplayedNews(_ news: [New]) -> [DisplayedNew] {
        
        var displayedNews: [DisplayedNew] = []
        news.forEach { (new) in
            let title = new.title ?? ""
            let description = new.descripton ?? ""
            let imageRef = new.imageRef ?? ""
            
            let displayedNew = DisplayedNew(title: title, descripton: description, imageRef: imageRef)
            displayedNews.append(displayedNew)
        }
        return displayedNews
    }
    
}
