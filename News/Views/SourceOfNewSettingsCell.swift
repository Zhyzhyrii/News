//
//  SourceOfNewSettingsCell.swift
//  News
//
//  Created by Игорь on 13.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

class SourceOfNewSettingsCell: UITableViewCell {
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var turnSourceOfNew: UISwitch!
    
    func configure() {
        backgroundColor       = Constants.Colors.backGroundColor
        sourceLabel.textColor = Constants.Colors.titleTextColor
        sourceLabel.font      = Constants.Fonts.titleTextFontSize
        
        containerLabel.layer.borderWidth  = 1
        containerLabel.layer.borderColor  = Constants.Colors.mainTextColor.cgColor
        containerLabel.layer.cornerRadius = 5
        
        selectionStyle = .none
    }
    
}
