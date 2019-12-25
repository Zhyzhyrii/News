//
//  NprParser.swift
//  News
//
//  Created by Игорь on 24.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

import Foundation

class NprParser: GenericNewsParser {
    
    override init() {
        super.init()
        self.feed = .nprFeed
    }
    
    // MARK: - Delegate methods
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if entity != nil {
            if currentElement == XmlFields.title.description, string.prefix(1) != "\n" {
                entity.title = string
            }
            if currentElement == XmlFields.description.description, string.prefix(1) != "\n" {
                entity.descripton = string
            }
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        if let string = String(data: CDATABlock, encoding: .utf8) {
            if let imageRef = ExtractHelper.getImageFromCDATA(string) {
                entity.imageRef = imageRef
            }
        }
    }
    
}
