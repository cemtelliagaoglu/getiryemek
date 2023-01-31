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
    
    var restaurants: [Restaurant] = Database.restaurants
    
    enum ViewMode{
        case discounts, mudavims
    }
    var viewMode: ViewMode?{
        didSet{
            fetchRestaurants(with: viewMode)
        }
    }
    
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
        fetchRestaurants(with: viewMode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchRestaurants(with viewMode: ViewMode?){
        if let viewMode = viewMode{
            if viewMode == .discounts{
                self.restaurants = Database.discounts
            }else{
                self.restaurants = Database.mudavims
            }
            self.collectionView.reloadData()
        }
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

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (bounds.width - 16)
        
        return CGSize(width: width , height: bounds.height)
    }
    
    
    
}
