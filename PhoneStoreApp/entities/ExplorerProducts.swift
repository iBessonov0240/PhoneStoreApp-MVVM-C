//
//  ExplorerProducts.swift
//  PhoneStoreApp
//
//  Created by i0240 on 02.02.2023.
//

import Foundation

struct ExplorerProducts: Codable {
    var homeStore: [HomeStoreProduct]
    var bestSeller: [BestSellerProduct]
    
    private enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        homeStore = try container.decode([HomeStoreProduct].self, forKey: .homeStore)
        bestSeller = try container.decode([BestSellerProduct].self, forKey: .bestSeller)
    }
}


struct HomeStoreProduct: Codable {
    var id: Int? = 0
    var isNew: Bool? = false
    var title: String? = ""
    var subtitle: String? = ""
    var picture: String? = ""
    var isBuy: Bool? = false
    
    private enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title
        case subtitle
        case picture
        case isBuy = "is_buy"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        isNew = try? container.decode(Bool.self, forKey: .isNew)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        picture = try container.decode(String.self, forKey: .picture)
        isBuy = try container.decode(Bool.self, forKey: .isBuy)
    }
}

struct BestSellerProduct: Codable {
    var id: Int? = 0
    var isFavorites: Bool? = false
    var title: String? = ""
    var priceWithoutDiscount: Int? = 0
    var discountPrice: Int? = 0
    var picture: String? = ""
    
    private enum CodingKeys: String, CodingKey {
        case id
        case isFavorites = "is_favorites"
        case title
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        isFavorites = ((try? container.decode(Bool.self, forKey: .isFavorites)) != nil)
        title = try container.decode(String.self, forKey: .title)
        priceWithoutDiscount = try container.decode(Int.self, forKey: .priceWithoutDiscount)
        discountPrice = try container.decode(Int.self, forKey: .discountPrice)
        picture = try container.decode(String.self, forKey: .picture)
    }
}
