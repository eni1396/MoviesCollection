//
//  MovieRatingView.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import SnapKit

class MovieRatingView: UIView {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star.fill")
        view.tintColor = .yellow
        return view
    }()
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(label)
        
        imageView.snp.makeConstraints { maker in
            maker.leading.top.centerY.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.5)
        }
        label.snp.makeConstraints { maker in
            maker.top.centerY.equalToSuperview()
            maker.trailing.equalToSuperview().offset(-10)
        }
    }
}
