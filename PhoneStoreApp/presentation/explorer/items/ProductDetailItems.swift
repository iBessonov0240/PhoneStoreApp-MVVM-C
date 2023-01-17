//
//  ProductDetailItems.swift
//  PhoneStoreApp
//
//  Created by i0240 on 11.01.2023.
//

import UIKit

struct ProductDetailItems {
    var image: UIImage? = nil
    
    init(image: UIImage = UIImage(named: "phone")! ) {
        self.image = image
    }
}
