//
//  ProductDetails.swift
//  PhoneStoreApp
//
//  Created by i0240 on 02.02.2023.
//

import Foundation
import Alamofire

class ProductDetails: Codable {
    var cpu: String
    var camera: String
    var capacity: [String]
    var color: [String]
    var id: String
    var images: [String]
    var isFavorites: Bool
    var price: Int
    var rating: Float
    var sd: String
    var ssd: String
    var title: String
    
    private enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cpu = try values.decode(String.self, forKey: .cpu)
        camera = try values.decode(String.self, forKey: .camera)
        capacity = try values.decode([String].self, forKey: .capacity)
        color = try values.decode([String].self, forKey: .color)
        id = try values.decode(String.self, forKey: .id)
        images = try values.decode([String].self, forKey: .images)
        isFavorites = try values.decode(Bool.self, forKey: .isFavorites)
        price = try values.decode(Int.self, forKey: .price)
        rating = try values.decode(Float.self, forKey: .rating)
        sd = try values.decode(String.self, forKey: .sd)
        ssd = try values.decode(String.self, forKey: .ssd)
        title = try values.decode(String.self, forKey: .title)
    }
}
