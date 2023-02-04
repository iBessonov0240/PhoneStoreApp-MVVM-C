//
//  ProductDetails.swift
//  PhoneStoreApp
//
//  Created by i0240 on 02.02.2023.
//

import Foundation

class Item: Codable {
    var CPU: String
    var camera: String
    var capacity: [String]
    var color: [String]
    var id: String
    var images: [String]
    var isFavorites: Bool
    var price: Int
    var rating: Double
    var sd: String
    var ssd: String
    var title: String
    
    init(CPU: String, camera: String, capacity: [String], color: [String], id: String, images: [String], isFavorites: Bool, price: Int, rating: Double, sd: String, ssd: String, title: String) {
            self.CPU = CPU
            self.camera = camera
            self.capacity = capacity
            self.color = color
            self.id = id
            self.images = images
            self.isFavorites = isFavorites
            self.price = price
            self.rating = rating
            self.sd = sd
            self.ssd = ssd
            self.title = title
        }
}
