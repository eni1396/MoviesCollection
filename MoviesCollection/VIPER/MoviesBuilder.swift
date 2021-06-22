//
//  MoviesBuilder.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import Foundation

final class MoviesBuilder {
  
    static func build() -> MoviesViewController {
        let interactor = MoviesInteractor()
//        let router = MoviesRouter()
//        let presenter = MoviesPresenter(interactor: interactor, router: router)
        let viewController = MoviesViewController()
        
//        router.viewController = viewController
//        presenter.view = viewController
//        interactor.presenter = presenter
        
        return viewController
    }
}
