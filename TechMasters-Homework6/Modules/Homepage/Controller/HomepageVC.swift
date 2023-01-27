//
//  ViewController.swift
//  TechMasters-Homework6
//
//  Created by admin on 25.01.2023.
//

import UIKit
// Getir Food
    
class HomepageVC: UIViewController{
    //MARK: - Properties
    
    private let reuseIdentifier = "cellIdentifier"
    private let headerIdentifier = "headerIdentifier"
    private let restaurantCellIdentifier = "restaurantCell"
    private let bannerIdentifier = "bannerIdentifier"
    private let searchCellIdentifier = "searchIdentifier"
    private let carouselIdentifier = "carouselIdentifier"
    
    var serviceTimeInterval: String = "10-55 dk"
    private let sugggestions = ["Ne Yesem?","Müdavim","Siparişlerim","Masa"]
    private let imageNames = ["help","mudavim","history","masa"]
    private let headerTitles = ["75 TL'ye Varan İndirimler", "Müdavim Restoranları", "Zincir Restoranlar", "Mutfaklar", "Bu Saate Özel"]
    private let cuisineImageNames = [
        "indirimliler","mudavim", "doner", "burger", "tavuk", "kebap", "sokak-lezzetleri",
        "pide", "pizza", "lahmacun", "pasta-tatli", "cig-kofte", "vejetaryen", "ev-yemekleri"
    ]
    
    @IBOutlet weak var serviceTimeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.frame)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(BannerCollectionCell.self, forCellWithReuseIdentifier: bannerIdentifier)
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: searchCellIdentifier)
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: carouselIdentifier)
        collectionView.register(RestaurantCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.register(RestaurantCollectionCell.self, forCellWithReuseIdentifier: restaurantCellIdentifier)
        
        configureNavigationBar()
        configureUI()
    }

    func configureNavigationBar(){
        // set title
        let navLabel = UILabel()
        let attributedString = NSMutableAttributedString(string: "getir", attributes: [.foregroundColor: UIColor(named: "brandColor2")!, .font: UIFont(name: "Kohinoor Gujarati Bold", size: 25)!])
        attributedString.append(NSAttributedString(string: "yemek", attributes: [.foregroundColor: UIColor.white, .font: UIFont(name: "Kohinoor Gujarati Bold", size: 25)!]))
        navLabel.attributedText = attributedString
        navigationItem.titleView = navLabel
        
    }
    
    func configureUI(){
        
        serviceTimeLabel.attributedText = NSAttributedString(string: serviceTimeInterval)
        let attributedString = NSMutableAttributedString(string: "Ev, ", attributes: [.foregroundColor: UIColor(named: "brandColor1")!, .font: UIFont.boldSystemFont(ofSize: 16)])
        attributedString.append(NSAttributedString(string: "Göztepe, Nadirağa Sk. 22/A", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16)]))
        addressLabel.attributedText = attributedString
    }
    
}
//MARK: - UICollectionView

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else if section == 2{
            return 4
        }else if section == 3{
            return 1
        }else{
            return 2
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            // bannerCell
            return CGSize(width: UIScreen.main.bounds.width, height: 200)
        }else if indexPath.section == 1{
            // searchCell
            let width = UIScreen.main.bounds.size.width - 32
            return CGSize(width: width, height: 40)
        }else if indexPath.section == 2{
            // carouselCell
            let width = (UIScreen.main.bounds.size.width - 56) / 4
            return CGSize(width: width, height: 70)
            
        }else if indexPath.section == 3{
            return CGSize(width: UIScreen.main.bounds.width, height: 200)
        }else{
            let width = (UIScreen.main.bounds.width - 20) / 2
            return CGSize(width: width, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0{
            // banner
            return 0
        }else if section == 2{
            // carousel
            return 4
        }else{
            return 2
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerIdentifier, for: indexPath) as! BannerCollectionCell

            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCellIdentifier, for: indexPath) as! SearchCell
            
            return cell
        }else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: carouselIdentifier, for: indexPath) as! CarouselCell
            cell.imageView.image = UIImage(named: imageNames[indexPath.row])!
            cell.label.text = sugggestions[indexPath.row]
            
            return cell
        }else if indexPath.section == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantCellIdentifier, for: indexPath) as! RestaurantCollectionCell
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0{
            // banner
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if section == 1{
            // search filter
            return UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        }else if section == 2{
            // carousel
            return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        }else{
            // restaurant cell + others
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! RestaurantCellHeader
        header.titleLabel.text = headerTitles[indexPath.section - 3]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section > 2{
            return CGSize(width: view.bounds.width, height: 50)
        }else{
            return .zero
        }
    }
    
}

