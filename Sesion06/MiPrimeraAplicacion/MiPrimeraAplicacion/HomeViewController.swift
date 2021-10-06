//
//  HomeViewController.swift
//  MiPrimeraAplicacion
//
//  Created by Kenyi Rodriguez on 29/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func clickBtnCloseSession(_ sender: Any) {
        
        let alertController = UIAlertController(title: "CERRAR SESIÓN", message: "¿Estas seguro que deseas cerrar sesión", preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: "Aceptar", style: .default) { action in
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertController.addAction(acceptAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}
