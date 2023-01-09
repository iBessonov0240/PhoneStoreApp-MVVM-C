//
//  TabBarViewCoordinator.swift
//  PhoneStoreApp
//
//  Created by i0240 on 13.12.2022.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController
    }
    
    func start() {
        let vc = TabBarViewController()
        vc.startViewModel = TabBarViewModel()
        vc.view.backgroundColor = Theme.appBackgroundColor
        
        let item1 = ExplorerViewController()
        let icon1 = UITabBarItem(title: nil, image: UIImage(named: "explorer"), selectedImage: UIImage(named: "explorer"))
        item1.tabBarItem = icon1
        let item2 = BasketViewController()
        let icon2 = UITabBarItem(title: nil, image: UIImage(named: "basket"), selectedImage: UIImage(named: "basket"))
        item2.tabBarItem = icon2
        let item3 = FavoritesViewController()
        let icon3 = UITabBarItem(title: nil, image: UIImage(named:"favorites"), selectedImage: UIImage(named: "favorites"))
        item3.tabBarItem = icon3
        let item4 = ProfileViewController()
        let icon4 = UITabBarItem(title: nil, image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile"))
        item4.tabBarItem = icon4
        
        let controllers = [item1, item2, item3, item4]
        vc.viewControllers = controllers
        vc.selectedIndex = 0
        navigationController.pushViewController(vc, animated: false)
    }
}

// MARK: - TabBarRoutingDelegate
extension TabBarCoordinator: TabBarRoutingDelegate {
    
}

