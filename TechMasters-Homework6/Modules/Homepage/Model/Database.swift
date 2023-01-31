//
//  Database.swift
//  TechMasters-Homework6
//
//  Created by admin on 30.01.2023.
//

import Foundation

struct Database{
    
    static let restaurants: [Restaurant] = [
        Restaurant(name: "Günaydın Köfte & Döner (Göztepe Mah.)", imageName: "gunaydin",hasPhoto: true, rating: 4.8, commentCount: 150, isMudavim: true, restaurantBrings: true),
        Restaurant(name: "Greenie Fun & Food (Bostancı Mah.)", imageName: "greenieFood", rating: 4.3, commentCount: 50, isMudavim: true,restaurantBrings: true),
        Restaurant(name: "Zamane Tatlısı (Koşuyolu Mah.)", imageName: "zamaneTatlisi",hasPhoto: true, rating: 3.9, commentCount: 10, isMudavim: false, restaurantBrings: true),
        Restaurant(name: "Zula (Eğitim Mah.)", imageName: "zula",hasPhoto: true, rating: 4.2, commentCount: 100, isMudavim: false,restaurantBrings: false),
        Restaurant(name: "Şahika Ev Yemekleri(Feneryolu Mah.)", imageName: "sahika-ev-yemekleri",hasPhoto: true, rating: 4.9, commentCount: 2000, isMudavim: true,restaurantBrings: true),
        Restaurant(name: "Pizza Monza(Koşuyolu Mah.)", imageName: "pizza-monza",hasPhoto: true, rating: 4.6, commentCount: 250, isMudavim: false,restaurantBrings: true),
        Restaurant(name: "Cajun Corner(Caferağa Mah.)", imageName: "cajun-corner",hasPhoto: true, rating: 4.1, commentCount: 350, isMudavim: true,restaurantBrings: true),
        Restaurant(name: "Burger Station(Osmanağa Mah.)", imageName: "burger-station",hasPhoto: true, rating: 4.4, commentCount: 90, isMudavim: false,restaurantBrings: false),
        Restaurant(name: "Sushico(Feneryolu Mah.)", imageName: "sushico",hasPhoto: true, rating: 4.7, commentCount: 1200, isMudavim: false,restaurantBrings: true),
        Restaurant(name: "Arsamiea Çiğköfte(Bostancı Mah.)", imageName: "arsamiea-cigkofte",hasPhoto: true, rating: 3.7, commentCount: 2400, isMudavim: true,restaurantBrings: true)
        
    ]
    
    static let cuisines: [Cuisine] = [
        Cuisine(name: "İndirimliler", imageName: "indirimliler"), Cuisine(name: "Müdavim", imageName: "mdvm"),
        Cuisine(name: "Döner", imageName: "doner"), Cuisine(name: "Burger", imageName: "burger"), Cuisine(name: "Tavuk", imageName: "tavuk"), Cuisine(name: "Kebap", imageName: "kebap"), Cuisine(name: "Sokak Lezzetleri", imageName: "sokak-lezzetleri")
    ]
    
    static let mudavims: [Restaurant] = {
        let mudavimRestaurants = restaurants.filter({ $0.isMudavim == true})
        return mudavimRestaurants
    }()
    
    static let discounts: [Restaurant] = {
        var newArray = [Restaurant]()
        for i in 0..<5{
            newArray.append(restaurants[i])
        }
        return newArray
    }()
    
    
}
    
