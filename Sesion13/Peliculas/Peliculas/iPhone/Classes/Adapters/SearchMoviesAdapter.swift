//
//  SearchMoviesAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 10/11/21.
//

import UIKit

protocol GenericSearchMoviesViewController: NSObjectProtocol {
    func didFilterMovies(_ arrayMovies: [Movie])
}

class SearchMoviesAdapter: NSObject {
    
    var arrayMovies = [Movie]()
    private unowned var controller: GenericSearchMoviesViewController
    
    init(_ controller: GenericSearchMoviesViewController) {
        self.controller = controller
    }
    
    func setSearchBar(_ searchBar: UISearchBar) {
        searchBar.delegate = self
    }
}

extension SearchMoviesAdapter: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let filterResult: [Movie]
        
        if searchText.count == 0 {
            filterResult = self.arrayMovies
            
        } else {
            
            filterResult = self.arrayMovies.filter { objMovie in
                
                let name = objMovie.name.lowercased()
                let searchText = searchText.lowercased()
                
                return name.contains(searchText)
            }
        }
        
        self.controller.didFilterMovies(filterResult)
    }
}
