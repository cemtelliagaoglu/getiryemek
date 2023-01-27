//
//  RestaurantCellFooter.swift
//  TechMasters-Homework6
//
//  Created by admin on 28.01.2023.
//

import UIKit

class RestaurantCellFooter: UICollectionReusableView {
    
    //MARK: - Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
//
//    let seeAllButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.setTitle("Tümünü gör(77)", for: .normal)
//        button.backgroundColor = .clear
//        button.titleLabel?.font = .systemFont(ofSize: 14)
//        button.setTitleColor(UIColor(named: "brandColor1"), for: .normal)
//
//        return button
//    }()

    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 0, width: 0, height: 0)
        
//        addSubview(seeAllButton)
//        seeAllButton.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 8, width: 0, height: 0)
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
