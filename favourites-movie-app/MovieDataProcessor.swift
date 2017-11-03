//
//  MovieDataProcessor.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 10/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation

class MovieDataProcessor {
    static func mapJsonToMovies(object: [String: AnyObject], moviesKey: String) -> [Movie] {
        var mappedMovies: [Movie] = []
        
        guard let movies = object[moviesKey] as? [[String: AnyObject]] else {
            return mappedMovies
        }
        
        for movie in movies {
            
            guard let id = movie["id"] as? Int,
                let name = movie["title"] as? String,
                let year = movie["release_date"] as? String,
                let posterPath = movie["poster_path"] as? String else {
                continue
            }
            let imageUrl = "https://image.tmdb.org/t/p/w45_and_h67_bestv2\(posterPath)"
            let movieClass = Movie(id: "\(id)", title: name, year: year, imageUrl: imageUrl)
            mappedMovies.append(movieClass)
        }
        return mappedMovies
        
    }
    
}
