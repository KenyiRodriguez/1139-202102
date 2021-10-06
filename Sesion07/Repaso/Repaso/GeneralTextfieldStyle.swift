//
//  GeneralTextfieldStyle.swift
//  Repaso
//
//  Created by Kenyi Rodriguez on 6/10/21.
//

import UIKit

extension UITextField {
    
    func setupStyle() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
