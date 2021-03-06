//
//  NewCell.swift
//  News
//
//  Created by Игорь on 22.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

class NewCell: UITableViewCell {
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var newImageView: UIImageView!
    @IBOutlet var newTextLabel: UILabel!
    
    func configureCellData(with new: DisplayedNew) {
        newTextLabel.text = new.title
        if let imageRef = new.imageRef, !imageRef.isEmpty {
            newImageView.fetchImage(with: imageRef)
        } else {
            newImageView.image = #imageLiteral(resourceName: "noPhotoImg")
        }
    }
    
    func configureNotSelectedCellView() {
        newTextLabel.textColor            = Constants.Colors.titleTextColor
        newTextLabel.font                 = Constants.Fonts.titleTextFontSize
        
        backgroundColor                   = Constants.Colors.backGroundColor
        
        containerLabel.layer.borderWidth  = 0.5
        containerLabel.layer.borderColor  = Constants.Colors.cellBorderColor.cgColor
        containerLabel.layer.cornerRadius = 5
       
        selectionStyle = .none
    }
    
    func configureSelectedCellView() {
        newTextLabel.textColor = Constants.Colors.mainTextColor
        newTextLabel.font      = Constants.Fonts.mainTextCellFontSize
    }
}
