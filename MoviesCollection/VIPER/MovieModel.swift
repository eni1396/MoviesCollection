//
//  MovieInfoViewModel.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import Foundation

protocol MovieProtocol {
    var title: String { get set }
    var imageURL: URL? { get set }
    var description: String { get set }
    var releaseDate: String { get set }
    var userRating: Double { get set }
}

struct MovieModel: MovieProtocol {
    var title: String
    var imageURL: URL?
    var description: String
    var releaseDate: String
    var userRating: Double
}
