//
//  CuisineCell.swift
//  TechMasters-Homework6
//
//  Created by admin on 30.01.2023.
//

import UIKit

class CuisineCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let cuisineCellIdentifier = "cuisineCell"
    
    private let cuisines: [Cuisine] = [
        Cuisine(name: "İndirimliler", imageName: "indirimliler"), Cuisine(name: "Müdavim", imageName: "mdvm"),
        Cuisine(name: "Döner", imageName: "doner"), Cuisine(name: "Burger", imageName: "burger"), Cuisine(name: "Tavuk", imageName: "tavuk"), Cuisine(name: "Kebap", imageName: "kebap"), Cuisine(name: "Sokak Lezzetleri", imageName: "sokak-lezzetleri")
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
        backgroundColor = .clear
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: cuisineCellIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - UICollelctionView
extension CuisineCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cuisines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cuisineCellIdentifier, for: indexPath) as! CarouselCell
        
        cell.imageView.image = UIImage(named: cuisines[indexPath.row].imageName)
        cell.label.text = cuisines[indexPath.row].name
        cell.stackView.spacing = 0
        cell.stackView.distribution = .fill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (bounds.width) / 3, height: 100)
    }
    
}

