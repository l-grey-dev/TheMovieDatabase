//
//  Movie.swift
//  The Movie Database
//
//  Created by Sergey Lukaschuk on 05.02.2021.
//

import Foundation


struct MovieResponse: Decodable {
    
    let results: [Movie]
}


struct Movie: Decodable {
    
    let id: Int
    let title: String
    let backdropPuch: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
}




