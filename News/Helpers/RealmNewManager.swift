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
        
        let predicate = NSPredicate(format: "sourceOfNew = %@", feedSource) //TODO sourceOfNew make as constant
        let realm = try! Realm()
        
        let news = Array(realm.objects(New.self).filter(predicate))
        
        return news.count > 0 ? news : nil
        
    }
    
}