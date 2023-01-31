//
//  AllRestaurantsCell.swift
//  TechMasters-Homework6
//
//  Created by admin on 31.01.2023.
//

import UIKit

class AllRestaurantsCell: UICollectionViewCell {
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
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.textColor = .black
        label.textAlignment = .left
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
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 0.2
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowOpacity = 0.2
        
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
        view.backgroundColor = UIColor(named: "brandColor1")
        view.layer.cornerRadius = 5
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Müdavim"
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        view.addSubview(label)
        label.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        return view
    }()
    
    lazy var stackView: UIStackView = {
        imageView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 4).isActive = true
        ratingView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 4).isActive = true
        midStackView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40) / 2).isActive = true
        let stackView = UIStackView(arrangedSubviews: [imageView, midStackView, ratingView])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .top
        stackView.distribution = .fill
        return stackView
    }()
    
    let restaurantBringsView: UIButton = {
        let button = UIButton(type: .custom)
        button.tintColor = .gray
        let attributedTitle = NSAttributedString(string: "35-45 dk• Min. ₺50.00", attributes: [.foregroundColor: UIColor.darkGray, .font: UIFont(name: "OpenSans-Regular", size: 14)!])
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        button.setTitleColor(.gray, for: .normal)
        button.setImage(UIImage(named: "restaurant-brings"), for: .normal)
        button.backgroundColor = .clear
        
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.2
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        
        var config = UIButton.Configuration.plain()
        config.imagePadding = 2
        button.configuration = config
        
        return button
    }()
    
    lazy var midStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [restaurantNameLabel,restaurantBringsView])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.tintColor = .gray
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 20
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setSubviews(hasPhoto: Bool?, rating: Double?, commentCount: Int?, isMudavim: Bool){
        // add stackView
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 16, paddingRight: 8, width: 0, height: bounds.height - 32)
        
        // add like button
        addSubview(likeButton)
        likeButton.anchor(top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 16, paddingRight: 16, width: 35, height: 30)
        
        // set hasPhoto
        if hasPhoto == true{
            imageView.addSubview(hasPhotoImageView)
            hasPhotoImageView.anchor(top: nil, left: imageView.leftAnchor, bottom: imageView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
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
        }
        if isMudavim{
            imageView.addSubview(mudavimView)
            mudavimView.anchor(top: imageView.topAnchor, left: imageView.leftAnchor, bottom: nil, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
            mudavimView.isHidden = false
        }else{
            mudavimView.isHidden = true
        }
    }
}
