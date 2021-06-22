//
//  MoviesPresenter.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import UIKit

protocol MoviesPresenterProtocol: AnyObject {
    var moviesCollection: [Result] { get set }
    
    func viewDidLoad()
    func getMoviesFromInteractor()
    func setupMovieModel(indexPath: IndexPath) -> MovieModel
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
        interactor.getMovies()
      }
    
    func getMoviesFromInteractor() {
        view?.getMoviesFromPresenter()
    }
    
    func setupMovieModel(indexPath: IndexPath) -> MovieModel {
        let path = Constants.imageString + (moviesCollection[indexPath.row].backdropPath ?? "")
        return MovieModel(title: moviesCollection[indexPath.row].title ?? "",
                          image: path,
                          description: moviesCollection[indexPath.row].overview,
                          releaseDate: moviesCollection[indexPath.row].releaseDate ?? "",
                          userRating: moviesCollection[indexPath.row].voteAverage)
    }
}
