//
//  CurrentMovieViewController.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import SnapKit

class CurrentMovieViewController: UIViewController {

    let movieTitle: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .medium)
        return label
    }()
    let movieImage: CachedImageView = {
       let view = CachedImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    let movieDesc: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.init(name: "Futura", size: 15)
        label.lineBreakMode = .byClipping
        return label
    }()
    let movieRating = MovieRatingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupView()
    }
    
    private func setupView() {
        
        [movieTitle, movieImage, movieDesc, movieRating].forEach {
            view.addSubview($0)
        }
        
        movieRating.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(100)
            maker.trailing.equalToSuperview().offset(-15)
            maker.height.equalTo(40)
            maker.width.equalTo(80)
        }
        
        movieImage.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(15)
            maker.trailing.equalToSuperview().offset(-15)
            maker.top.equalTo(movieRating.snp.bottom).offset(20)
            maker.height.equalToSuperview().multipliedBy(0.3)
        }
        
        movieTitle.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(movieImage.snp.bottom).offset(5)
            maker.leading.equalToSuperview().inset(15)
        }
        
        movieDesc.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(15)
            maker.trailing.equalToSuperview().offset(-15)
            maker.top.equalTo(movieTitle.snp.bottom).inset(-20)
        }
    }
}
