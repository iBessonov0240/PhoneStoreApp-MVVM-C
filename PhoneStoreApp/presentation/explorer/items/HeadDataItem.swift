//
//  HeadCustomItem.swift
//  PhoneStoreApp
//
//  Created by i0240 on 19.12.2022.
//

import UIKit

struct HeadDataItem {
    var categories: String
    var img: UIImage
    var color: UIColor
    
    init(categories: String = "" , img: UIImage = UIImage(named: "phone-ic")!, color: UIColor = Theme.appWhiteColor) {
        self.categories = categories
        self.img = img
        self.color = color
    }
}
