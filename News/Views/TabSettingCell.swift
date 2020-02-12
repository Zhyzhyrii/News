//
//  TabSettingCell.swift
//  News
//
//  Created by Игорь on 12.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

class TabSettingCell: UITableViewCell {
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var titleText: UILabel!
    
    func configure() {
        selectionStyle = .none
        
        containerLabel.layer.borderWidth = 1
        containerLabel.layer.borderColor = Constants.Colors.mainTextColor.cgColor
        containerLabel.layer.cornerRadius = 5
    }
    
}
