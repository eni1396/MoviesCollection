//
//  MovieInfoViewModel.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import Foundation

struct MovieModel {
    var title: String?
    var imageURL: URL?
    var description: String?
    var releaseDate: String?
    var userRating: Double?
    
//    init(result: Result) {
//        title = result.title
//        if let path = result.backdropPath {
//            imageURL = URL(string: path)
//        }
//        description = result.overview
//        releaseDate = result.releaseDate
//        userRating = result.voteAverage
//    }
}
