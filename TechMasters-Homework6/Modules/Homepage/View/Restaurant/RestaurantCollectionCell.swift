//
//  RestaurantCollectionCell.swift
//  TechMasters-Homework6
//
//  Created by admin on 27.01.2023.
//

import UIKit

class RestaurantCollectionCell: UICollectionViewCell {

    //MARK: - Properties
    private let restaurantCellIdentifier = "restaurantCell"
    
    private let restaurants: [Restaurant] = [
        Restaurant(name: "Günaydın Köfte & Döner", imageName: "gunaydin"), Restaurant(name: "Greenie Fun & Food", imageName: "greenieFood"),
        Restaurant(name: "Zamane Tatlısı", imageName: "zamaneTatlisi"), Restaurant(name: "Zula", imageName: "zula")
    ]
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
        

    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: restaurantCellIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - UICollelctionView
extension RestaurantCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantCellIdentifier, for: indexPath) as! RestaurantCell
        
        cell.imageView.image = UIImage(named: restaurants[indexPath.row].imageName)
        cell.restaurantNameLabel.text = restaurants[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (bounds.width - 16) 
        
        return CGSize(width: width , height: bounds.height)
    }
    
    
    
}
