//
//  ListMoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 27/10/21.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    @IBOutlet private weak var tlbMovies: UITableView!
    @IBOutlet private weak var srcMovies: UISearchBar!
    
    private lazy var listAdapter = ListMoviesAdapter(self)
    private lazy var searchAdapter = SearchMoviesAdapter(self)
    private let webService = MovieWS()
}

//MARK: - Life cycle
extension ListMoviesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAdapters()
        self.getAllMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? MovieDetailViewController, let objMovie = sender as? Movie {
            controller.objMovie = objMovie
        }
    }
}

//MARK: - Methods
extension ListMoviesViewController: GenericListMoviesViewController, GenericSearchMoviesViewController {
    
    func didDeleteMovieAtIndex(_ index: Int) {
        self.searchAdapter.arrayMovies.remove(at: index)
    }

    private func setupAdapters() {
        self.listAdapter.setTableView(self.tlbMovies)
        self.searchAdapter.setSearchBar(self.srcMovies)
    }
    
    private func getAllMovies() {
        
        self.webService.getAllMovies { arrayMoviesDTO in
            
            self.searchAdapter.arrayMovies = arrayMoviesDTO.toMovies
            self.listAdapter.arrayMovies = arrayMoviesDTO.toMovies
            self.tlbMovies.reloadData()
        }
    }
    
    func goToDetailMovie(_ objMovie: Movie) {
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
    }
    
    func didFilterMovies(_ arrayMovies: [Movie]) {
        
        self.listAdapter.arrayMovies = arrayMovies
        self.tlbMovies.reloadData()
    }
}
