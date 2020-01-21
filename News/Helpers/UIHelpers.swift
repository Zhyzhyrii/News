//
//  UIHelpers.swift
//  News
//
//  Created by Игорь on 21.01.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//

import UIKit

class UIHelpers {
    
    // MARK: - Alert with text field
    
    static func showAlertWithTextField(withTitle title: String, message: String, viewController: UIViewController, buttonTitle: String, actionHandler: ((_ text: String?) -> Void)?, completeHandler: @escaping () -> Void) {
         let alert = createAlertWithTextField(withTitle: title, message: message, buttonTitle: buttonTitle, actionHandler: actionHandler, completeHandler: completeHandler)
         viewController.present(alert, animated: true, completion: nil)
     }
    
    private static func createAlertWithTextField(withTitle title: String, message: String, buttonTitle: String, actionHandler: ((_ text: String?) -> Void)?, completeHandler: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter new title"
        }
        
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { (action) in
            guard let textField = alertController.textFields?.first else {
                actionHandler?(nil)
                return
            }
            
            if let text = textField.text, !text.isEmpty {
                actionHandler?(text)
            } else {
                alertController.dismiss(animated: true, completion: nil)
                completeHandler()
            }
        }
        
        alertController.addAction(okAction)
        return alertController
    }
    
    // MARK: - Alert without text field
    
    static func showMessage(withTitle title: String, message: String, viewController: UIViewController, buttonTitle: String) {
         let alert = createAlertWithOutTextField(withTitle: title, message: message, buttonTitle: buttonTitle)
         viewController.present(alert, animated: true, completion: nil)
     }
    
    private static func createAlertWithOutTextField(withTitle title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        
        alertController.addAction(okAction)
        return alertController
    }
    
}
