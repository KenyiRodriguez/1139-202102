//
//  Movie.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 27/10/21.
//

import Foundation

struct Movie {
    
    let id: Int
    private let posterPath: String
    private let releaseDate: Date?
    let name: String
    let voteAverage: Double
    let overview: String
    
    var releaseDateFormat: String {
        return self.releaseDate?.toStringWithFormart("EEEE dd 'de' MMMM 'del' yyyy") ?? "Por definir"
    }
    
    var urlImage: String {
        return "https://image.tmdb.org/t/p/w500" + self.posterPath
    }
    
    init(dto: MovieDTO) {
        self.id             = dto.id ?? 0
        self.posterPath     = dto.poster_path ?? ""
        self.name           = dto.title ?? ""
        self.voteAverage    = dto.vote_average ?? 0
        self.overview       = dto.overview ?? ""
        self.releaseDate    = dto.release_date?.toDateWithFormat("yyyy-MM-dd")
    }
}
