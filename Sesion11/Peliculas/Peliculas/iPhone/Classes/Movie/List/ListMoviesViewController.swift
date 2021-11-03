//
//  ListMoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 27/10/21.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    @IBOutlet private weak var tlbMovies: UITableView!
    
    private var arrayMovies = [Movie]()
    private let webService = MovieWS()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllMovies()
    }
    
    func getAllMovies() {
        
        self.webService.getAllMovies { arrayMoviesDTO in
            self.arrayMovies = arrayMoviesDTO.toMovies
            self.tlbMovies.reloadData()
        }
    }
}

extension ListMoviesViewController: UITableViewDataSource {
    
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

extension ListMoviesViewController: UITableViewDelegate {
    
}
