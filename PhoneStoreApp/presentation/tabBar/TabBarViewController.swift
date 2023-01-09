//
//  TabBarViewController.swift
//  PhoneStoreApp
//
//  Created by i0240 on 13.12.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var delegateRouting: TabBarRoutingDelegate!
    var startViewModel: TabBarViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeUnSelectedColor()
//        view.backgroundColor = Theme.appBackgroundColor
        self.tabBar.tintColor = Theme.appOrangeColor
        self.tabBar.backgroundColor = Theme.appDarkBlueColor
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.barStyle = .default
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = Theme.appDarkBlueColor
    }
    
    private func changeUnSelectedColor() {
        self.tabBar.unselectedItemTintColor = Theme.appWhiteColor
    }
}
