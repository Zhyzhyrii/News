//
//  ExtractHelper.swift
//  News
//
//  Created by Игорь on 24.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

import Foundation
    
class ExtractHelper {
    
    static func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    static func getImageFromCDATA(_ string: String) -> String? {
        if let matched = matches(for: "<img src='.* alt", in: string).first {
            return matched.replacingOccurrences(of: "<img src='", with: "")
                .replacingOccurrences(of: "' alt", with: "")
        }
        return nil
    }
    
}
