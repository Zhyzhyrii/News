//
//  NewCell.swift
//  News
//
//  Created by Игорь on 22.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

class NewCell: UITableViewCell {
    
    @IBOutlet var newImageView: UIImageView!
    @IBOutlet var newTitleLabel: UILabel!
    @IBOutlet var newTextLabel: UILabel!
    
    func configure(with new: DisplayedNew) {
        
        newTitleLabel.text = new.title
        newTextLabel.text = new.descripton
        newTextLabel.isHidden = true
        newImageView.fetchImage(with: new.imageRef)
        
    }
}
