//
//  RealmNewManager.swift
//  News
//
//  Created by Игорь on 28.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import RealmSwift

class RealmNewManager {
    
    static func getNewsFromDataBase(feedSource: String) -> [New]? {
        
        let predicate = NSPredicate(format: "\(Constants.RealmNewManagerConstants.sourceOfNewField) = %@", feedSource)
        let realm = try! Realm()
        
        let news = Array(realm.objects(New.self).filter(predicate).sorted(byKeyPath: Constants.RealmNewManagerConstants.pubDateField, ascending: false))

        return news.count > 0 ? news : nil
        
    }
    
    static func getNewsFromDataBase() -> [New]? {
        
        let realm = try! Realm()
        
        let news = Array(realm.objects(New.self))
        
        return news.count > 0 ? news : nil
        
    }
    
}
