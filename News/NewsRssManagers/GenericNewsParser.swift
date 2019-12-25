//
//  GenericNewsParser.swift
//  News
//
//  Created by Игорь on 24.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

import Foundation

class GenericNewsParser: NSObject, RSSParser {

    var feed: Feed!
    
    var currentElement = ""
    
    typealias T = New
    typealias DelegateProtocol = Parser
    
    var entity: New!
    var entities: [New] = []
    
    var delegate: Parser!
    
    // MARK: - XMLParserDelegate delegate methods
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        if currentElement == XmlFields.item.description {
            entity = New()
        }
        
        if currentElement == XmlFields.mediaContent.description {
            if let imageRef = attributeDict[XmlFields.url.description] {
                entity.imageRef = imageRef
            }
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == XmlFields.item.description {
            
            if let new = entity {
                entities.append(new)
            }
            
            entity = nil
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        delegate.parsingWasFinished()
    }
    
    func startParsingWithContentsOfURL() {
        guard let url = URL(string: feed.url) else { return }
        guard let parser = XMLParser(contentsOf: url) else { return }
        parser.delegate = self
        parser.parse()
    }
    
}
