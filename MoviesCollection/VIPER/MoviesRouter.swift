//
//  MoviesRouter.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import UIKit

protocol MoviesRouterProtocol {
    func openDetailVC(navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath)
    func showErrorAlert()
}

final class MoviesRouter: MoviesRouterProtocol {
    
    var viewController = UIViewController()
    
    func openDetailVC(navigationController: UINavigationController, viewModel: [Result], indexPath: IndexPath) {
        let viewController = CurrentMovieViewController()
        viewController.configureView(with: viewModel, at: indexPath)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showErrorAlert() {
        DispatchQueue.main.async {
            let vc = UIAlertController(title: "No network", message: "Please, refresh the feed", preferredStyle: .alert)
            let action = UIAlertAction(title: "Close", style: .default, handler: nil)
            vc.addAction(action)
            self.viewController.present(vc, animated: true, completion: nil)
        }
    }
}
