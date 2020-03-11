//
//  Extension+String.swift
//  News
//
//  Created by Игорь on 11.03.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

extension String {
    
    var getPureValue: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
    
}
