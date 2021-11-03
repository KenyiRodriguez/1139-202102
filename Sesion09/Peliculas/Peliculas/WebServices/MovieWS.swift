//
//  MovieWS.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 20/10/21.
//

import Foundation
import Alamofire

struct MovieWS {
    
    func getAllMovies() {
        
        let urlService = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        let request = AF.request(urlService, method: .get)
        
        request.response { response in
            
            guard let data = response.data else {
                print("Ocurrio un error en el servicio")
                return
            }
            
            let decoder = JSONDecoder()
            let pageMovies = try? decoder.decode(PageMoviesDTO.self, from: data)
            
        }
    }
}
