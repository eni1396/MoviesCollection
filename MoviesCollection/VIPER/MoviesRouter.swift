//
//  MoviesRouter.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import UIKit

protocol MoviesRouterProtocol {
    func openDetailVC(navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath)
}

final class MoviesRouter: MoviesRouterProtocol {
    
     var viewController = UIViewController()
    
    func openDetailVC(navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath) {
        let viewController = CurrentMovieViewController()
        viewController.configureView(with: viewModel, at: indexPath)
        navigationController.pushViewController(viewController, animated: true)
    }
}
