//
//  SearchVC.swift
//  TechMasters-Homework6
//
//  Created by admin on 25.01.2023.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    func configureNavigationBar(){
        // set title
        let navLabel = UILabel()
        navLabel.font = UIFont(name: "OpenSans-Regular", size: 16)!
        navLabel.text = "Arama"
        navLabel.textColor = .white
        navigationItem.titleView = navLabel
        
    }
}
