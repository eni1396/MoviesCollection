//
//  MoviesPresenter.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import UIKit

protocol MoviesPresenterProtocol: AnyObject {
    var moviesCollection: [Result] { get set }
    var isLoading: Bool { get set }
    
    func viewDidLoad()
    func getMoviesFromInteractor()
    func openVC(with navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath)
    func showError()
}

final class MoviesPresenter: MoviesPresenterProtocol {

    var moviesCollection = [Result]()
    var isLoading = false
    
    private let interactor: MoviesInteractorProtocol
    private let router: MoviesRouterProtocol
    weak var view: ViewProtocol?
    
    init(interactor: MoviesInteractorProtocol, router: MoviesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    // Call for interactor to start loading data
    func viewDidLoad() {
        interactor.getMovies()
      }
    // Call from interactor to prepare data for UI
    func getMoviesFromInteractor() {
        view?.getMoviesFromPresenter(viewModel: moviesCollection)
    }
    
    func openVC(with navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath) {
        router.openDetailVC(navigationController: navigationController, viewModel: moviesCollection, indexPath: indexPath)
    }
    
    func showError() {
        router.showErrorAlert()
    }
}
