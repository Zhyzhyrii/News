//
//  XmlFields.swift
//  News
//
//  Created by Игорь on 25.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

enum XmlFields: String {
    case item
    case mediaContent = "media:content"
    case url
    case title
    case description
    case thumbnail
    
    var description: String { rawValue }
}
