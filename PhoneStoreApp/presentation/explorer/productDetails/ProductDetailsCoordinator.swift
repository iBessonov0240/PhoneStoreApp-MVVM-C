//
//  ProductDetailsCoordinator.swift
//  PhoneStoreApp
//
//  Created by i0240 on 09.01.2023.
//

import UIKit

class ProductDetailsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProductDetailsViewController()
        vc.delegateRouting = self
        vc.viewModel = ProductDetailsViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
}

extension ProductDetailsCoordinator: ProductDetailsRoutingDelegate {
   
}
