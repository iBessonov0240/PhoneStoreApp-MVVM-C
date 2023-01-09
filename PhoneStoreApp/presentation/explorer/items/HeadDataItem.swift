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
    var tag: Int
    var color: UIColor
    
    init(categories: String = "" , img: UIImage = UIImage(named: "phone-ic")!, tag: Int = 0, color: UIColor = Theme.appWhiteColor) {
        self.categories = categories
        self.img = img
        self.tag = tag
        self.color = color
    }
}

extension Array where Element == HeadDataItem {
    mutating func colorByTag(tag: Int) -> HeadDataItem? {
        
        for (ind, item) in self.enumerated() where item.tag == tag {
            remove(at: ind)
            return item
        }
        return nil
    }
}
