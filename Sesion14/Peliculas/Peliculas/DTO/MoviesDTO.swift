//
//  MoviesDTO.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 20/10/21.
//

import Foundation

struct PageMoviesDTO: Decodable {
    
    let page: Int?
    let results: [MovieDTO]?
}

struct MovieDTO: Decodable {
    
    let id: Int?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let vote_average: Double?
    let overview: String?
}
