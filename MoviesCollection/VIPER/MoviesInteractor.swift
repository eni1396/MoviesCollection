//
//  MoviesInteractor.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//
import Foundation

protocol MoviesInteractorProtocol {
    
}


final class MoviesInteractor: MoviesInteractorProtocol {
    
    
    weak var presenter: MoviesPresenterProtocol?
    private let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getMovies() {
        apiManager.fetch(page: <#T##Int#>) { result: in
            <#code#>
        }
    }
}
