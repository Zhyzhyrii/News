//
//  SourceOfNewSettingsCell.swift
//  News
//
//  Created by Игорь on 13.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

protocol ChangeValueOfSourceOfNewSwitcher: class {
    func changeSourceOfNewSwitcherValue(_ sender: UISwitch)
}

class SourceOfNewSettingsCell: UITableViewCell {
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var turnSourceOfNew: UISwitch!
    
    weak var delegate: ChangeValueOfSourceOfNewSwitcher?
    
    func configureCellData(with feedModel: FeedModel) {
        sourceLabel.text = feedModel.feedName
    }
    
    func configureCellView() {
        backgroundColor                   = Constants.Colors.backGroundColor
        
        sourceLabel.textColor             = Constants.Colors.titleTextColor
        sourceLabel.font                  = Constants.Fonts.titleTextFontSize
        
        containerLabel.layer.borderWidth  = 0.5
        containerLabel.layer.borderColor  = Constants.Colors.cellBorderColor.cgColor
        containerLabel.layer.cornerRadius = 5
        
        selectionStyle = .none
    }
    
    @IBAction func changeToggleSourceOfNew(_ sender: UISwitch) {
        delegate?.changeSourceOfNewSwitcherValue(sender)
    }
    
}
