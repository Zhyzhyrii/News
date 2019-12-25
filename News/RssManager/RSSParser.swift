//
//  RSSParser.swift
//  News
//
//  Created by Игорь on 19.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

import Foundation

protocol RSSParser: XMLParserDelegate {
    
    associatedtype T
    associatedtype DelegateProtocol
    associatedtype FeedSource
    
    var feed: FeedSource! { get }

    var entity: T! { get }
    var entities: [T] { get }

    var delegate: DelegateProtocol! { get }
    
}
