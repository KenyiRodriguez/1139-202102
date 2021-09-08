//
//  AlertManager.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 8/09/21.
//

import UIKit

extension UIViewController {
    
    func showAlerWithTitle(_ title: String, message: String, accept: String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let acceptButton = UIAlertAction(title: accept, style: .default, handler: nil)
        alertController.addAction(acceptButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

