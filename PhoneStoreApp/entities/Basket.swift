//
//  Basket.swift
//  PhoneStoreApp
//
//  Created by i0240 on 02.02.2023.
//

import Foundation

class Basket {
    var basket: [Product]
    var delivery: String
    var id: String
    var total: Int
    
    init(basket: [Product], delivery: String, id: String, total: Int) {
        self.basket = basket
        self.delivery = delivery
        self.id = id
        self.total = total
    }
}

class Product {
    var id: Int
    var images: String
    var price: Int
    var title: String
    
    init(id: Int, images: String, price: Int, title: String) {
        self.id = id
        self.images = images
        self.price = price
        self.title = title
    }
}
