//
//  ListMoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 27/10/21.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    var arrayNombres = ["Kenyi", "Luis", "Rebeca", "Jacobo", "Jorge", "Ricardo", "Fernando", "Jean"]
}

extension ListMoviesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayNombres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPepito", for: indexPath)
        
        let item = self.arrayNombres[indexPath.row]
        cell.textLabel?.text = item
        
        return cell
    }
}

extension ListMoviesViewController: UITableViewDelegate {
    
}
