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
    
    // MARK: - @IBOutlets
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var titleText: UILabel!
    @IBOutlet var switcherIntervalOfUpdating: UISwitch!
    
    // MARK: - Public properties
    
    weak var delegate: ChangeValueOfIntervalOfUpdatingSwitcher?
    
    func configureCellView() {
        selectionStyle = .none
        
        containerLabel.layer.borderWidth  = 0.5
        containerLabel.layer.borderColor  = Constants.Colors.cellBorderColor.cgColor
        containerLabel.layer.cornerRadius = 5
    }
    
    func configureCellData() {
          titleText.text = "Interval of updating news"
    }
    
    @IBAction func changeToggleIntervalOfUpdating(_ sender: UISwitch) {
        delegate?.changeValueOfIntervalOfUpdatingSwitcher(sender)
    }
    
}
