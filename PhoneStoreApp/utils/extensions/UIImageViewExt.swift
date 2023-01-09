//
//  UIImageViewExt.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

extension UIImageView {
    
    func resizeHeight() {
        
        guard let image = image else {
            return
        }
        
        let ratio = image.size.width/image.size.height
        let newHeight = (bounds.width / ratio)
        
        if let constraint = (constraints.filter{$0.firstAttribute == .height}.first) {
            removeConstraint(constraint)
            self.heightAnchor.constraint(equalToConstant: newHeight).isActive = true
        }
    }
}
