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
    
    func configure(with newData: New) {
        
        newTitleLabel.text = newData.title
        newTextLabel.text = newData.descripton
        newTextLabel.isHidden = true
        
        if let imageData = newData.imageRef {
            guard let url = URL(string: imageData) else { return }
            DispatchQueue.global().async { //TODO - ??about dispatch
                guard let data = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    self.newImageView.image = UIImage(data: data)
                }
            }
        } else {
            print("Default image") //TODO
        }
        
    }
}
