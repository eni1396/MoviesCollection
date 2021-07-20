//
//  MoviesViewController.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import SnapKit
import SDWebImage

protocol ViewProtocol: AnyObject {
    
    func getMoviesFromPresenter()
}

final class MoviesViewController: UIViewController, ViewProtocol {
    
    private let presenter: MoviesPresenterProtocol
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = Constants.appColor
        collection.register(MoviesCell.self, forCellWithReuseIdentifier: Constants.cellID)
        return collection
    }()
    private let layout = UICollectionViewFlowLayout()
    
    init(presenter: MoviesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        view.addSubview(collection)
        navigationItem.title = Constants.appTitle
        
        presenter.viewDidLoad()
    }
    
    func getMoviesFromPresenter() {
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.moviesCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as! MoviesCell
        DispatchQueue.global().async {
            let viewModel = self.presenter.setupMovieModel(indexPath: indexPath)
            DispatchQueue.main.async {
                cell.imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell.imageView.sd_imageIndicator = SDWebImageActivityIndicator.large
                cell.imageView.sd_setImage(with: viewModel.imageURL, completed: nil)
                cell.textLabel.text = viewModel.title
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CurrentMovieViewController()
        DispatchQueue.global().async {
            let viewModel = self.presenter.setupMovieModel(indexPath: indexPath)
            DispatchQueue.main.async {
                vc.configureView(with: viewModel)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastElement = presenter.moviesCollection.count - 1
        if indexPath.row == lastElement {
            presenter.viewDidLoad()
        }
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        let itemsPerRow: CGFloat = 1
        let totalSpaceBetweenItems = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - totalSpaceBetweenItems
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem * 1.2
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
