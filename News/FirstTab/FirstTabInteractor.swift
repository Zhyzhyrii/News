//
//  FirstTabInteractor.swift
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

protocol FirstTabBusinessLogic {
    func getNews(request: FirstTab.GetNews.Request)
    func getNewsByRefreshing(request: FirstTab.RefreshNews.Request)
}

protocol FirstTabDataStore {
}

class FirstTabInteractor: FirstTabBusinessLogic, FirstTabDataStore, Parser {
    
    var presenter: FirstTabPresentationLogic?
    var worker = FirstTabWorker()
    
    // MARK: - Parser delegate method
    
    func parsingWasFinished() {
        print("Parsing was finished") //TODO ??
    }
    
    // MARK: - Get selected FeedModel
    
    private func getSelectedFeedModel(indexOfTab: Int) -> FeedModel? {
        
        guard let feedsModels = UserDefaultsStorageManager.shared.getSavedFeeds(forKey: indexOfTab) else { return nil } //TODO something went wrong alert (not select source for tab)
        guard let feedModel = feedsModels.first(where: { (feedModel) -> Bool in
            feedModel.isSelected
        }) else { return nil } //TODO something went wrong alert (not select source for tab)
        
        return feedModel
        
    }
    
    // MARK: Get saved parser
    
    private func getNewsFromParser(indexOfTab: Int) -> [New]? { //TODO do not need this func because we get getNews func ???
        
        guard let feedModel = getSelectedFeedModel(indexOfTab: indexOfTab) else { return nil }
        
        guard let parser = Feed.init(rawValue: feedModel.feedSource)?.parser else { return nil } //TODO something went wrong alert
        
        parser.delegate = self
        parser.startParsingWithContentsOfURL()
        
        return parser.entities.map { (new) -> New in
            new.sourceOfNew = feedModel.feedSource
            return new
        }.sorted { (firstNew, secondNew) -> Bool in
            guard let firstDate = firstNew.pubDate, let secondDate = secondNew.pubDate else { return false }
            return firstDate > secondDate
        }
        
    }
    
    // MARK: Get news
    
    func getNews(request: FirstTab.GetNews.Request) {
        
        guard let feedModel = getSelectedFeedModel(indexOfTab: request.indexOfTab) else { return }
        
        if let news = worker.getNewsFromDataBase(feedSource: feedModel.feedSource) {
            let response = FirstTab.GetNews.Response(news: news)
            presenter?.presentNews(response: response)
        } else {
            guard let news = getNewsFromParser(indexOfTab: request.indexOfTab) else { return }
            
            worker.saveNewsToDataBase(news: news)
            
            let response = FirstTab.GetNews.Response(news: news)
            presenter?.presentNews(response: response)
        }
    }
    
    // MARK: - Get news by refreshing
    
    func getNewsByRefreshing(request: FirstTab.RefreshNews.Request) {
        var refreshedNews: [New]!
        
        guard let feedModel = getSelectedFeedModel(indexOfTab: request.indexOfTab) else { return }
        
        guard let newsFromNetwork = getNewsFromParser(indexOfTab: request.indexOfTab) else { return }
        
        if let newsFromDB = worker.getNewsFromDataBase(feedSource: feedModel.feedSource) {
            var amountOfDifferentNews = 0
            
            for new in newsFromNetwork {
                if new.title != newsFromDB[0].title {
                    amountOfDifferentNews += 1
                } else {
                    refreshedNews = Array(newsFromNetwork.prefix(amountOfDifferentNews))
                    worker.saveNewsToDataBase(news: refreshedNews)
                    break
                }
            }
        }
        
        let response = FirstTab.RefreshNews.Response(news: newsFromNetwork)
        presenter?.presentNewsByRefreshing(response: response)
    }
}
