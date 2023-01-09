//
//  ConstraintExt.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

extension String {
    static var height: String { return "HeightIdentifier" }
}

extension Array where Element == NSLayoutConstraint {
    
    subscript(id: String) -> NSLayoutConstraint? {
        return first(where: { $0.identifier == id })
    }
    
}

extension Optional where Wrapped == NSLayoutConstraint {
    
    func set(_ constant: CGFloat) {
        self?.constant = constant
    }
    
}

