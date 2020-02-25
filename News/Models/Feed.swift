//
//  Feed.swift
//  News
//
//  Created by Игорь on 25.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

enum Feed: String, CaseIterable {
    case theWestFeed = "https://thewest.com.au/sport/rss"
    case nprFeed     = "https://www.npr.org/rss/rss.php?id=1001"
    case cbnFeed     = "https://www1.cbn.com/app_feeds/rss/news/rss.php?section=world"
    
    var url: String { rawValue }
    
    var newName: String {
        get {
            switch self {
            case .theWestFeed:
                return "The West"
            case .nprFeed:
                return "NPR"
            case .cbnFeed:
                return "CBN"
            }
        }
    }
    
    var parser: GenericNewsParser {
        switch self {
        case .theWestFeed:
            return TheWestParser()
        case .nprFeed:
            return NprParser()
        case .cbnFeed:
            return CbnParser()
        }
    }
    
}
