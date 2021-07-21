//
//  MoviesCell.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import SnapKit
import SDWebImage

class MoviesCell: UICollectionViewCell {
    
    // UI setup
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
       return label
    }()
    let imageView: UIImageView = {
       let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    // Method to prevent cell usage of wrong data
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.text = nil
        imageView.sd_cancelCurrentImageLoad()
    }
    
    func configureView(with viewModel: [Result], at indexPath: IndexPath) {
        
        let path = Constants.imageString + (viewModel[indexPath.row].backdropPath ?? "")
        let url = URL(string: path)
        
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.large
        //imageView.sd_setImage(with: url, completed: nil)
        imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "film.fill"), options: .fromCacheOnly, progress: nil, completed: nil)
        textLabel.text = viewModel[indexPath.row].title
    }
    
    // Constraints setup
    private func setupView() {
        [textLabel, imageView].forEach { addSubview($0) }
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        imageView.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
            maker.height.equalToSuperview().multipliedBy(0.85)
        }
        textLabel.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(imageView.snp.bottom).offset(1)
            maker.height.equalToSuperview().multipliedBy(0.14)
        }
    }
}
