//
//  MoviesCell.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import SnapKit

class MoviesCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 23)
        label.numberOfLines = 0
        label.textAlignment = .center
       return label
    }()
    let imageView: CachedImageView = {
       let view = CachedImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.text = nil
        imageView.image = nil
    }
    
    private func setupView() {
        [textLabel, imageView].forEach { addSubview($0) }
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        imageView.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
            maker.height.equalTo(self.contentView.frame.size.height * 0.85)
        }
        textLabel.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(imageView.snp.bottom).offset(1)
            maker.height.equalTo(self.contentView.frame.size.height * 0.14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
