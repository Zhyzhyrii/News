//
//  TabSettingCell.swift
//  News
//
//  Created by Игорь on 12.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

class TabSettingCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var titleText: UILabel!
    
    // MARK: - Private properties
    
    private let titlesForFirstSectionOfTable = ["The first tab",
                                                "The second tab",
                                                "The third tab"]
    
    func configureCellView() {
        selectionStyle = .none
        
        containerLabel.layer.borderWidth = 0.5
        containerLabel.layer.borderColor  = Constants.Colors.cellBorderColor.cgColor
        containerLabel.layer.cornerRadius = 5
    }
    
    func configureCellData(for row: Int) {
        titleText.text = titlesForFirstSectionOfTable[row]
    }
    
}
