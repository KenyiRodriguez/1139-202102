//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 10/11/21.
//

import UIKit

protocol GenericListMoviesViewController: NSObjectProtocol {
    func goToDetailMovie(_ objMovie: Movie)
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
        
        let objMovie = self.arrayMovies[indexPath.row]
        self.controller.goToDetailMovie(objMovie)
    }
}
