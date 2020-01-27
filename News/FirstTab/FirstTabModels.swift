//
//  FirstTabModels.swift
//  News
//
//  Created by Игорь on 19.12.2019.
//  Copyright (c) 2019 Igor Zhyzhyrii. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum FirstTab {
    
    // MARK: Use cases
    
    enum GetNews {
        struct Request {
            let indexOfTab: Int
        }
        
        struct Response {
            let news: [New]
        }
        
        struct ViewModel {
            let news: [DisplayedNew]
        }
    }
}
