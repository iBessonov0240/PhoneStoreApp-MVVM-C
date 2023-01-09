//
//  BacketCoordinator.swift
//  PhoneStoreApp
//
//  Created by i0240 on 09.01.2023.
//

import UIKit

class BasketCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BasketViewController()
        vc.delegateRouting = self
        vc.basketViewModel = BasketViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
}

extension BasketCoordinator: BasketRoutingDelegate {
    
}
