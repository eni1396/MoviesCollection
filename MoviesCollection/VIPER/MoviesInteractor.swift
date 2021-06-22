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
    
    init(apiManager: ApiManager = ApiManager()) {
        self.apiManager = apiManager
    }
    
    func getMovies() {
        apiManager.fetch(page: 1) { [weak self] (result: MoviesViewModel) in
            guard let self = self else { return }
            self.presenter?.moviesCollection = result.results
            self.presenter?.getMoviesFromInteractor()
        }
    }
}
