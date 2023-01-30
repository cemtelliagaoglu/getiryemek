//
//  RestaurantCell.swift
//  TechMasters-Homework6
//
//  Created by admin on 25.01.2023.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    //MARK: - Properties
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [imageView, restaurantNameLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear

        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 4, paddingBottom: 8, paddingRight: 4, width: 0, height: bounds.height - 32 )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

