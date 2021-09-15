//
//  HomeViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 8/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func clickBtnShowAlert(_ sender: Any) {
        self.showAlerWithTitle("HOLA", message: "Hola, esta es mi primera alerta", accept: "Aceptar")
    }
}
