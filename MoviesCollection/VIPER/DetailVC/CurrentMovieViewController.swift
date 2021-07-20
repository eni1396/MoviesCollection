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
    // passing info to ui
    func configureView(with viewModel: MovieProtocol) {
        navigationItem.title = viewModel.title
        movieTitle.text = viewModel.title
        movieRating.label.text = "\(viewModel.userRating)"
        movieImage.sd_setImage(with: viewModel.imageURL, completed: nil)
        movieDesc.text = viewModel.description
    }
    
    // constraints setup
    private func setupView() {
        
        [movieTitle, movieImage, movieDesc, movieRating].forEach {
            view.addSubview($0)
        }
        
        movieRating.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(DetailVC_Constants.topInset)
            maker.trailing.equalToSuperview().offset(-DetailVC_Constants.sideInset)
            maker.height.equalTo(DetailVC_Constants.height)
            maker.width.equalTo(DetailVC_Constants.width)
        }
        
        movieImage.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(DetailVC_Constants.sideInset)
            maker.trailing.equalToSuperview().offset(-DetailVC_Constants.sideInset)
            maker.top.equalTo(movieRating.snp.bottom).offset(DetailVC_Constants.verticalInset)
            maker.height.equalToSuperview().multipliedBy(0.3)
        }
        
        movieTitle.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(movieImage.snp.bottom).offset(DetailVC_Constants.titleInset)
            maker.leading.equalToSuperview().inset(DetailVC_Constants.sideInset)
        }
        
        movieDesc.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(DetailVC_Constants.sideInset)
            maker.trailing.equalToSuperview().offset(-DetailVC_Constants.sideInset)
            maker.top.equalTo(movieTitle.snp.bottom).inset(-DetailVC_Constants.verticalInset)
        }
    }
}
