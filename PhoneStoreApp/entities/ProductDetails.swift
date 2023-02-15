//
//  ProductDetails.swift
//  PhoneStoreApp
//
//  Created by i0240 on 02.02.2023.
//

import Foundation

struct ProductDetails: Codable {
    let cpu: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}

