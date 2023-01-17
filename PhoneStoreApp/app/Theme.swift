//
//  Theme.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import Foundation
import UIKit
import SwiftUI

struct Theme {
    
    static var iconNotFavor = UIImage(named: "ic-notFavor")!.withRenderingMode(.alwaysTemplate)
    static var iconFavor = UIImage(named: "ic-favor")!.withRenderingMode(.alwaysTemplate)
    
    static var appBackgroundColor: UIColor = UIColor(hexString: "#F8F8F8")!
    static var appWhiteColor: UIColor = UIColor(hexString: "#FFFFFF")!
    static var appDarkBlueColor: UIColor = UIColor(hexString: "#010035")!
    static var appOrangeColor: UIColor = UIColor(hexString: "#FF6E4E")!
    static var appSearchColor: UIColor = UIColor(hexString: "#01003580")!
    static var appGrayColor: UIColor = UIColor(hexString: "#CCCCCC")!
    static var appLightGrayColor: UIColor = UIColor(hexString: "#B7B7B7")!
    static var appDarkGrayColor: UIColor = UIColor(hexString: "#8D8D8D")!
    static var appBrownColor: UIColor = UIColor(hexString: "#772D03")!
    static var appBasketHalfVizorColor: UIColor = UIColor(hexString: "#282843")!
    
    static func textFieldStyle(_ textField: UITextField,
                                    ofSize: CGFloat = 15,
                                    weight:  UIFont.Weight = .medium,
                                    name: UIFont.TextStyle.RawValue = "Mark Pro") {
        textField.textColor = appDarkBlueColor
        textField.font = .systemFont(ofSize: ofSize, weight: weight)
    }
    
    static func labelStyle(_ txtView: UILabel, ofSize: CGFloat = 15, weight:  UIFont.Weight = .medium, name: UIFont.TextStyle.RawValue = "Mark Pro") {
        txtView.font = .systemFont(ofSize: ofSize, weight: weight)
        txtView.textColor = appDarkBlueColor
    }
    
    static func labelGrayStyle(_ txtView: UILabel, ofSize: CGFloat = 15, weight:  UIFont.Weight = .regular, name: UIFont.TextStyle.RawValue = "Mark Pro") {
        txtView.font = .systemFont(ofSize: ofSize, weight: weight)
        txtView.textColor = appLightGrayColor
    }
}
