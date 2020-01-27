//
//  RealmManager.swift
//  News
//
//  Created by Игорь on 25.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import RealmSwift

class RealmManager {
    
    private static let realm = try! Realm()
    
    static func addObjects(objects: [Object]) {
        do {
            try realm.write {
                realm.add(objects)
            }
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    static func updateObject(closure: () -> ()) {
        do {
            try realm.write {
                closure()
            }
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
}
