//
//  FeedModel.swift
//  News
//
//  Created by Игорь on 29.12.2019.
//  Copyright © 2019 Igor Zhyzhyrii. All rights reserved.
//

struct FeedModel: Codable {
    var feedName: String
    let feedSource: String
    var isSelected = false
}
