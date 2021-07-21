//
//  MoviesInteractor.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//
import Foundation

protocol MoviesInteractorProtocol {
    
    func getMovies()
}


final class MoviesInteractor: MoviesInteractorProtocol {
    
    weak var presenter: MoviesPresenterProtocol?
    private let apiManager: ApiManager
    private var pageCounter = 1
    
    init(apiManager: ApiManager = ApiManager()) {
        self.apiManager = apiManager
    }
    // Fetching data from network
    func getMovies() {
        apiManager.fetch(page: pageCounter) { [weak self] (result: MoviesViewModel) in
            guard let self = self else { return }
            self.presenter?.moviesCollection += result.results
            self.presenter?.getMoviesFromInteractor()
            if self.pageCounter <= 500 {
                self.pageCounter += 1
            }
        }
    }
}
