//
//  SuggestionCell.swift
//  TechMasters-Homework6
//
//  Created by admin on 26.01.2023.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    //MARK: - Properties
    //    lazy var imageView: UIImageView = {
    //        let iv = UIImageView()
    //        iv.contentMode = .scaleAspectFill
    //
    ////        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapped))
    ////
    ////        tap.numberOfTapsRequired = 1
    ////        iv.addGestureRecognizer(tap)
    //        iv.isUserInteractionEnabled = true
    //        return iv
    //    }()
    //
    //    let button: UIButton = {
    //
    //        let button = UIButton(type: .custom)
    //        button.setTitle("Mudavim", for: .normal)
    //        button.titleLabel?.font = .systemFont(ofSize: 16)
    //        button.setTitleColor(.black, for: .normal)
    //        button.backgroundColor = .white
    //
    //        var config = UIButton.Configuration.plain()
    //
    //        config.imagePadding = 4
    //        config.imagePlacement = .top
    //
    //        button.layer.cornerRadius = 10
    //        button.titleLabel?.numberOfLines = 1
    //        button.titleLabel?.minimumScaleFactor = 0.5
    //        button.titleLabel?.adjustsFontSizeToFitWidth = true
    //        button.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
    ////        button.configuration = config
    //
    //
    //        return button
    //    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        stackView.spacing = -16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(stackView)
//        stackView.frame = bounds
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , width: bounds.width, height: bounds.height)
        
        
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            imageView.heightAnchor.constraint(equalToConstant: 40),
//            imageView.widthAnchor.constraint(equalToConstant: 40),
//            label.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1, constant: 0)
//        ])
        
//        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 6, paddingLeft: 6, paddingBottom: 6, paddingRight: 6, width: 0 , height: 0)
//        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
