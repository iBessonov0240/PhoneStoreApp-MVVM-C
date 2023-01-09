//
//  FilterItem.swift
//  PhoneStoreApp
//
//  Created by i0240 on 29.12.2022.
//

import Foundation

class PhoneFilter {
    var brand: String? = nil
    var price: Int? = nil
    var size: String? = nil
    
    
    func toNil() {
        brand = nil
        price = nil
        size = nil
    }
}
