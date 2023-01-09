//
//  ReusableView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 15.12.2022.
//

import UIKit

public protocol ReusableView: class { }

extension ReusableView {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionReusableView: ReusableView { }
