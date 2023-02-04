//
//  ExplorerProducts.swift
//  PhoneStoreApp
//
//  Created by i0240 on 02.02.2023.
//

import Foundation

class ExplorerProducts: Codable {
    let id: Int
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool?
    let priceWithoutDiscount: Int?
    let discountPrice: Int?
    let isFavorites: Bool?

    init(id: Int, title: String, subtitle: String, picture: String, isBuy: Bool? = nil, priceWithoutDiscount: Int? = nil, discountPrice: Int? = nil, isFavorites: Bool? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.picture = picture
        self.isBuy = isBuy
        self.priceWithoutDiscount = priceWithoutDiscount
        self.discountPrice = discountPrice
        self.isFavorites = isFavorites
    }
}
