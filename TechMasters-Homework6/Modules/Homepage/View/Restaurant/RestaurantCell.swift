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
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.backgroundColor = .red
        return label
    }()
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [imageView, restaurantNameLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
//
//        let view =  UIView()
//        view.backgroundColor = .clear
//        addSubview(view)
//        view.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 70)
//        view.layer.cornerRadius = 20
//        view.addSubview(imageView)
//        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.bounds.width, height: view.bounds.height)
//
//        addSubview(restaurantNameLabel)
//        restaurantNameLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 0, height: 20)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0 )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

