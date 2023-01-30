//
//  RestaurantCell.swift
//  TechMasters-Homework6
//
//  Created by admin on 25.01.2023.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    //MARK: - Properties
    
    var restaurant: Restaurant?{
        didSet{
            guard let restaurant = restaurant else{ return }
            restaurantNameLabel.text = restaurant.name
            imageView.image = UIImage(named: restaurant.imageName)
           
            setSubviews(hasPhoto: restaurant.hasPhoto,
                        rating: restaurant.rating,
                        commentCount: restaurant.commentCount,
                        isMudavim: restaurant.isMudavim)
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
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
    
    let hasPhotoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "has-photo")
        return view
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "5.0"
        label.font = UIFont(name: "OpenSans-Regular", size: 16)
        label.textColor = UIColor(named: "brandColor1")
        
        return label
    }()
    
    lazy var ratingView: UIStackView = {
        let imageView = UIImageView(image: UIImage(systemName: "star.fill")!.withTintColor(UIColor(named: "brandColor1")!))
        imageView.contentMode = .scaleAspectFit
        let stackView = UIStackView(arrangedSubviews: [imageView, ratingLabel])
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 7.5
        stackView.axis = .horizontal
        stackView.tintColor = UIColor(named: "brandColor1")
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var mudavimView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "brandColor2")
        view.layer.cornerRadius = 5
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "brandColor1")
        label.text = "Müdavim"
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        view.addSubview(label)
        label.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        return view
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
    
    //MARK: - Methods
    func setSubviews(hasPhoto: Bool?, rating: Double?, commentCount: Int?, isMudavim: Bool){
        // set hasPhoto
        if hasPhoto == true{
            imageView.addSubview(hasPhotoImageView)
            hasPhotoImageView.anchor(top: nil, left: imageView.leftAnchor, bottom: imageView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 40, height: 40)
        }
        
        // check if rating exists
        if let rating = rating{
            let attributedString = NSMutableAttributedString(string: String(rating), attributes: [
                .foregroundColor: UIColor(named: "brandColor1")!,
                    .font: UIFont(name: "OpenSans-Regular", size: 16)!
            ])
            attributedString.append(NSAttributedString(string: "(\(commentCount!)+)", attributes: [
                .foregroundColor: UIColor.lightGray, .font: UIFont(name: "OpenSans-Regular", size: 14)!
            ]))
            ratingLabel.attributedText = attributedString
            
            // add ratingView if restaurant has rating
            imageView.addSubview(ratingView)
            ratingView.anchor(top: nil, left: nil, bottom: imageView.bottomAnchor, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 8, width: 100, height: 30)
        }
        if isMudavim{
            imageView.addSubview(mudavimView)
            mudavimView.anchor(top: imageView.topAnchor, left: imageView.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        }
        
    }
    
}

