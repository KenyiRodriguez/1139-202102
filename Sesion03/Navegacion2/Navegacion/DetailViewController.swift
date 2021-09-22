//
//  DetailViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 8/09/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBAction func clickBtnClose(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
