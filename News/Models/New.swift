//
//  New.swift
//  News
//
//  Created by Игорь on 23.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

import RealmSwift

class New: Object {
    
    //Fields from XML
    
    @objc dynamic var title: String?
    @objc dynamic var descripton: String?
    @objc dynamic var imageRef: String?
    @objc dynamic var pubDate: Date?
    
    //Custom fields
    
    @objc dynamic var sourceOfNew: String?
    
}
