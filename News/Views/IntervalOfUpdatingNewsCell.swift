//
//  IntervalOfUpdatingNewsCell.swift
//  News
//
//  Created by Игорь on 12.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

protocol ChangeValueOfIntervalOfUpdatingSwitcher: class {
    func changeValueOfIntervalOfUpdatingSwitcher(_ sender: UISwitch)
}

class IntervalOfUpdatingNewsCell: UITableViewCell {
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var titleText: UILabel!
    @IBOutlet var switcherIntervalOfUpdating: UISwitch!
    
    weak var delegate: ChangeValueOfIntervalOfUpdatingSwitcher?
    
    func configure() {
        selectionStyle = .none
        
        containerLabel.layer.borderWidth  = 1
        containerLabel.layer.borderColor  = Constants.Colors.mainTextColor.cgColor
        containerLabel.layer.cornerRadius = 5
    }
    
    @IBAction func changeToggleIntervalOfUpdating(_ sender: UISwitch) {
        delegate?.changeValueOfIntervalOfUpdatingSwitcher(sender)
    }
    
}
