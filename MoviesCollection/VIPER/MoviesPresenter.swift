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
    func openVC(with navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath) 
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
    
    // call for interactor to start loading data
    func viewDidLoad() {
        interactor.getMovies()
      }
    // call from interactor to prepare data for UI
    func getMoviesFromInteractor() {
        view?.getMoviesFromPresenter(viewModel: moviesCollection)
    }
    
    // Passing data to MovieModel
//    func setupMovieModel(indexPath: IndexPath) -> MovieProtocol {
//        let path = Constants.imageString + (moviesCollection[indexPath.row].backdropPath ?? "")
//        let url = URL(string: path)
//        return MovieModel(title: moviesCollection[indexPath.row].title ?? "",
//                          imageURL: url,
//                          description: moviesCollection[indexPath.row].overview,
//                          releaseDate: moviesCollection[indexPath.row].releaseDate ?? "",
//                          userRating: moviesCollection[indexPath.row].voteAverage)
//    }
    
    func openVC(with navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath) {
        router.openDetailVC(navigationController: navigationController, viewModel: moviesCollection, indexPath: indexPath)
    }
}
