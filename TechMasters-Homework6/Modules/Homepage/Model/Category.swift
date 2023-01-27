//
//  File.swift
//  TechMasters-Homework6
//
//  Created by admin on 27.01.2023.
//

import Foundation

struct Category{
    var id: Int
    var name: String
    var imageName: String
    
    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}
