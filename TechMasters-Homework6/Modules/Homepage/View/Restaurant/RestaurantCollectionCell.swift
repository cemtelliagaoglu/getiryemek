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
        Restaurant(name: "Günaydın Köfte & Döner (Göztepe Mah.)", imageName: "gunaydin",hasPhoto: true, rating: 4.8, commentCount: 150, isMudavim: true),
        Restaurant(name: "Greenie Fun & Food (Bostancı Mah.)", imageName: "greenieFood", rating: 4.3, commentCount: 50, isMudavim: true),
        Restaurant(name: "Zamane Tatlısı (Koşuyolu Mah.)", imageName: "zamaneTatlisi",hasPhoto: true, rating: 3.9, commentCount: 10, isMudavim: false), Restaurant(name: "Zula (Eğitim Mah.)", imageName: "zula",hasPhoto: true, rating: 4.2, commentCount: 100, isMudavim: false)
    ]
    
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
        

    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
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
        let rest = restaurants[indexPath.row]
        cell.restaurant = rest
        cell.imageView.image = UIImage(named: restaurants[indexPath.row].imageName)
        cell.restaurantNameLabel.text = restaurants[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (bounds.width - 16)
        
        return CGSize(width: width , height: bounds.height)
    }
    
    
    
}
