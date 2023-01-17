//
//  BasketViewController.swift
//  PhoneStoreApp
//
//  Created by i0240 on 13.12.2022.
//

import UIKit

class BasketViewController: UIViewController {

    var delegateRouting: BasketRoutingDelegate!
    var basketViewModel: BasketViewModel!
    private var basketModel: [BasketItem] = []
    private var delModel: [DeliveryItem] = []
    
    private lazy var cardLabel: UILabel = .create {
        $0.numberOfLines = 0
        $0.text = "My Cart"
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 35, weight: .bold)
        $0.textColor = Theme.appDarkBlueColor
    }
    
    private lazy var basketTableView: BasketView = .create {
        $0.backgroundColor = Theme.appDarkBlueColor
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationBar()
    }

    private func setupNavigationBar() {

        guard let navigationBar = navigationController?.navigationBar else { return }
        guard let navigationController = navigationController else  { return }

        navigationController.isNavigationBarHidden = true
        navigationBar.backgroundColor = Theme.appBackgroundColor

        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "backButton"), for: .normal)
        leftButton.setBackgroundImage(UIImage(named: "backImageBack"), for: .normal)
        leftButton.imageView?.contentMode = .scaleAspectFit
        leftButton.addTarget(self, action: #selector(closeSelf), for: .touchUpInside)
        let item = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = item
        navigationBar.prefersLargeTitles = false

        let rightButton = UIButton()
        rightButton.setTitle("Add address", for: .normal)
        rightButton.setImage(UIImage(named: "ic-whiteGeo"), for: .normal)
        rightButton.setBackgroundImage(UIImage(named: "navBusketBack"), for: .normal)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightButton.addTarget(self, action: #selector(checkAdress), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = item2
        navigationBar.prefersLargeTitles = false
    }
    
    @objc func closeSelf() {
        dismiss(animated: true)
    }
    
    @objc func checkAdress() {
        
    }
    
    private func setupLayout() {
        
        view.addSubview(cardLabel, constraints: [
            equal(\.safeAreaLayoutGuide.topAnchor, constant: 50),
            equal(\.leadingAnchor, constant: 42)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 44)
        ])
        
        view.addSubview(basketTableView, constraints: [
            equal(\.topAnchor, to: cardLabel, \.bottomAnchor, constant: 49),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
   
}
