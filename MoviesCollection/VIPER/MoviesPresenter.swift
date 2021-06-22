//
//  MoviesPresenter.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import Foundation

protocol MoviesPresenterProtocol: AnyObject {
    var moviesCollection: [Result] { get set }
    
    func viewDidLoad()
    func getMoviesFromInteractor()
}

final class MoviesPresenter: MoviesPresenterProtocol {
    
    var moviesCollection = [Result]()
    
    
    private let interactor: MoviesInteractorProtocol
    private let router: MoviesRouterProtocol
    weak var view: ViewProtocol?
    
    init(interactor: MoviesInteractorProtocol, router: MoviesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
          print("Presenter is being notified that the View was loaded.")
        interactor.getMovies()
      }
    
    func getMoviesFromInteractor() {
        view?.getMoviesFromPresenter()
    }
}
