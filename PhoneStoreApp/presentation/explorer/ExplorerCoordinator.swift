//
//  ExplorerCoordinator.swift
//  PhoneStoreApp
//
//  Created by i0240 on 07.01.2023.
//

import UIKit

class ExplorerCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ExplorerViewController()
        vc.delegateRouting = self
        vc.explorerViewModel = ExplorerViewModel()
        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: - ExplorerRoutingDelegate
extension ExplorerCoordinator: ExplorerRoutingDelegate {
    func routeToProductDetails() {
        ProductDetailsCoordinator(navigationController: navigationController).start()
    }
}
