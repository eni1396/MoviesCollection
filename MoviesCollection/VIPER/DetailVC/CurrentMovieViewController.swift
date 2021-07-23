//
//  CurrentMovieViewController.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import SnapKit

class CurrentMovieViewController: UIViewController {
 
    // UI setup
    let movieTitle: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .medium)
        return label
    }()
    let movieImage: UIImageView = {
       let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        return view
    }()
    let movieDesc: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.init(name: "Futura", size: 15)
        label.lineBreakMode = .byClipping
        return label
    }()
    let movieRating = MovieRatingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.appColor
        setupView()
    }
    // Passing info to ui
    func configureView(with viewModel: [Result], at indexPath: IndexPath) {
        
        let path = Constants.imageString + (viewModel[indexPath.row].backdropPath ?? "")
        let url = URL(string: path)
        
        navigationItem.title = viewModel[indexPath.row].title
        movieTitle.text = viewModel[indexPath.row].title
        movieRating.label.text = "\(viewModel[indexPath.row].voteAverage)"
        movieImage.sd_setImage(with: url, completed: nil)
        movieDesc.text = viewModel[indexPath.row].overview
    }
    
    // Constraints setup
    private func setupView() {
        
        [movieTitle, movieImage, movieDesc, movieRating].forEach {
            view.addSubview($0)
        }
        
        movieRating.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(DetailVcConstants.topInset)
            maker.trailing.equalToSuperview().offset(-DetailVcConstants.sideInset)
            maker.height.equalTo(DetailVcConstants.height)
            maker.width.equalTo(DetailVcConstants.width)
        }
        
        movieImage.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(DetailVcConstants.sideInset)
            maker.trailing.equalToSuperview().offset(-DetailVcConstants.sideInset)
            maker.top.equalTo(movieRating.snp.bottom).offset(DetailVcConstants.verticalInset)
            maker.height.equalToSuperview().multipliedBy(0.3)
        }
        
        movieTitle.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(movieImage.snp.bottom).offset(DetailVcConstants.titleInset)
            maker.leading.equalToSuperview().inset(DetailVcConstants.sideInset)
        }
        
        movieDesc.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(DetailVcConstants.sideInset)
            maker.trailing.equalToSuperview().offset(-DetailVcConstants.sideInset)
            maker.top.equalTo(movieTitle.snp.bottom).inset(-DetailVcConstants.verticalInset)
        }
    }
}
