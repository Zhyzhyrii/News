//
//  IntervalOfUpdatingNewsCell.swift
//  News
//
//  Created by Игорь on 12.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

class IntervalOfUpdatingNewsCell: UITableViewCell {
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var titleText: UILabel!
    @IBOutlet var switcherIntervalOfUpdating: UISwitch!
    
    func configure() {
        selectionStyle = .none
        
        containerLabel.layer.borderWidth  = 1
        containerLabel.layer.borderColor  = Constants.Colors.mainTextColor.cgColor
        containerLabel.layer.cornerRadius = 5
    }
    
}
