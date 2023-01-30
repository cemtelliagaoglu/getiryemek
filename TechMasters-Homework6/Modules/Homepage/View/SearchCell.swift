//
//  SearchCell.swift
//  TechMasters-Homework6
//
//  Created by admin on 26.01.2023.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    lazy var searchButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = UIColor(named: "brandColor1")
        button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 16)
        button.setTitle("Canın ne çekiyor ?", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setImage(UIImage(named: "search-icon"), for: .normal)
        button.backgroundColor = .clear
        
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.2
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        
        var config = UIButton.Configuration.plain()
        config.imagePadding = 8
        button.configuration = config
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(handleSearchTapped))
        tapped.numberOfTapsRequired = 1
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(tapped)
        return button
    }()
    
    lazy var filterSortButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = UIColor(named: "brandColor1")
        button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 16)
        button.setTitle("Filtrele & Sırala", for: .normal)
        button.setImage(UIImage(named: "filter-icon"), for: .normal)
        button.backgroundColor = .clear
        
        // place image to the right side
        var config = UIButton.Configuration.plain()
        config.imagePadding = 8
        button.configuration = config
        button.semanticContentAttribute = .forceRightToLeft
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(handleFilterSortTapped))
        tapped.numberOfTapsRequired = 1
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(tapped)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [searchButton, filterSortButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.backgroundColor = .white
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        
        return stackView
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        configViews()
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    @objc func handleSearchTapped(){
        print("Search Button Tapped")
    }
    
    @objc func handleFilterSortTapped(){
        print("Filter & Sort Tapped")
    }
    
    func configViews(){
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = frame.height / 4
        addSubview(view)
        view.frame = bounds
        
        view.addSubview(stackView)
        stackView.frame = view.bounds
        
    }
    
}
