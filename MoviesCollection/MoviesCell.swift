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
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().offset(20)
            maker.top.equalTo(self.contentView.snp.top).inset(20)
            //maker.width.height.equalTo(60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
