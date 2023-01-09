//
//  StartViewCoordinator.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

class StartCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = StartViewController()
        
        vc.delegateRouting = self
        vc.startViewModel = StartViewModel()
        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: - StartRoutingDelegate
extension StartCoordinator: StartRoutingDelegate {
    func routeToTabBar() {
        TabBarCoordinator(navigationController: navigationController).start()
    }
}

