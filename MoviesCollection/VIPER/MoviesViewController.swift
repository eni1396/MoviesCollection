//
//  MoviesViewController.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import SnapKit

protocol ViewProtocol: AnyObject {
    var movies: [Result] { get set }
    
    func getMoviesFromPresenter()
}

final class MoviesViewController: UIViewController, ViewProtocol {
    
    private let presenter: MoviesPresenterProtocol
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .green
        collection.register(MoviesCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    private let layout = UICollectionViewFlowLayout()
    
    var movies = [Result]()
    
    
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
        
        presenter.viewDidLoad()
    }
    
    func getMoviesFromPresenter() {
        DispatchQueue.global().async {
            self.movies = self.presenter.moviesCollection
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
        }
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.moviesCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviesCell
        cell.imageView.downloadImageFrom(withUrl:"https://image.tmdb.org/t/p/original" + movies[indexPath.row].backdrop_path)
        cell.textLabel.text = movies[indexPath.row].title
        return cell
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
