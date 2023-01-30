//
//  MainTabBarVC.swift
//  TechMasters-Homework6
//
//  Created by admin on 30.01.2023.
//

import UIKit

class MainTabVC: UITabBarController {
    //MARK: - Properties
    lazy var middleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 30, y: -20, width: 60, height: 60))
        button.layer.cornerRadius = 30
        let image = UIImage(named: "menu-icon")
        button.setBackgroundImage(image, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowColor = UIColor.black.cgColor

        button.addTarget(self, action: #selector(handleMenuButtonTapped), for: .touchUpInside)
        
        return button
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.addSubview(middleButton)
    }
    //MARK: - Handlers
    @objc func handleMenuButtonTapped(){
        print("handleMenuButtonTapped")
    }
   
}
