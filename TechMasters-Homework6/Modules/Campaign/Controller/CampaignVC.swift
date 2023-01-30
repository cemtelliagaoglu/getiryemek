//
//  CampaignVC.swift
//  TechMasters-Homework6
//
//  Created by admin on 25.01.2023.
//

import UIKit

class CampaignVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    func configureNavigationBar(){
        // set title
        let navLabel = UILabel()
        let attributedString = NSMutableAttributedString(string: "getir", attributes: [.foregroundColor: UIColor(named: "brandColor2")!, .font: UIFont(name: "Kohinoor Gujarati Bold", size: 25)!])
        attributedString.append(NSAttributedString(string: "yemek", attributes: [.foregroundColor: UIColor.white, .font: UIFont(name: "Kohinoor Gujarati Bold", size: 25)!]))
        navLabel.attributedText = attributedString
        navigationItem.titleView = navLabel
        
    }
}
