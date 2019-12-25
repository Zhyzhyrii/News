//
//  CbnParser.swift
//  News
//
//  Created by Игорь on 25.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

import Foundation

class CbnParser: GenericNewsParser {
    
    override init() {
        super.init()
        self.feed = .cbnFeed
    }
    
    // MARK: - Delegate methods
    
    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        if entity != nil {
            if currentElement == XmlFields.title.description {
                entity.title = String(data: CDATABlock, encoding: .utf8)
            }
            if currentElement == XmlFields.description.description {
                entity.descripton = String(data: CDATABlock, encoding: .utf8)
            }
            if currentElement == XmlFields.thumbnail.description {
                entity.imageRef = String(data: CDATABlock, encoding: .utf8)
            }
        }
    }
    
}
