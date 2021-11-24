//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 10/11/21.
//

import UIKit

protocol GenericListMoviesViewController: NSObjectProtocol {
    func goToDetailMovie(_ objMovie: Movie)
    func didDeleteMovieAtIndex(_ index: Int)
}

class ListMoviesAdapter: NSObject {
    
    var arrayMovies = [Movie]()
    private unowned var controller: GenericListMoviesViewController
    
    init(_ controller: GenericListMoviesViewController) {
        self.controller = controller
    }
    
    func setTableView(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ListMoviesAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let objMovie = self.arrayMovies[indexPath.row]
        return MovieTableViewCell.createInTableView(tableView, indexPath: indexPath, objMovie: objMovie)
    }
}

extension ListMoviesAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let objMovie = self.arrayMovies[indexPath.row]
        self.controller.goToDetailMovie(objMovie)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { _, _, _ in
            
//            let objMovie = self.arrayMovies[indexPath.row]
            
            self.arrayMovies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.controller.didDeleteMovieAtIndex(indexPath.row)
            
//            objMovie.id
            //Consumiras un servicio web para eliminarlo del server
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .red
        
        
        let seeDetailAction = UIContextualAction(style: .normal, title: "Ver más") { _, _, _ in
            let objMovie = self.arrayMovies[indexPath.row]
            self.controller.goToDetailMovie(objMovie)
        }
        
        seeDetailAction.image = UIImage(systemName: "doc.richtext")
        seeDetailAction.backgroundColor = .systemIndigo
        
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, seeDetailAction])
        return swipeActions
    }
}
