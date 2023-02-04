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
    
    private lazy var backView: UIView = .create {
        $0.backgroundColor = Theme.appDarkBlueColor
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private lazy var basketTableView: UITableView = .create {
        $0.register(BasketCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.allowsSelection = true
        $0.isUserInteractionEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.isPrefetchingEnabled = true
        $0.backgroundColor = Theme.appDarkBlueColor
    }
    
    private lazy var separateViewTop: UIView = .create {
        $0.backgroundColor = Theme.appBasketHalfVizorColor
    }
    
    private lazy var totalPriceLabel: UILabel = .create {
        $0.text = "Total"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .regular)
        $0.textColor = Theme.appWhiteColor
    }
    
    private lazy var totalPriceCountLabel: UILabel = .create {
        $0.text = "$6,000 us"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .bold)
        $0.textColor = Theme.appWhiteColor
    }
    
    private lazy var deliveryLabel: UILabel = .create {
        $0.text = "Delivery"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .regular)
        $0.textColor = Theme.appWhiteColor
    }
    
    private lazy var deliveryCountLabel: UILabel = .create {
        $0.text = "Free"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .bold)
        $0.textColor = Theme.appWhiteColor
    }
    
    private lazy var separateViewBottom: UIView = .create {
        $0.backgroundColor = Theme.appBasketHalfVizorColor
    }
    
    private lazy var addToCartButton: UIButton = .create {
        $0.backgroundColor = Theme.appOrangeColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.addTarget(nil, action: #selector(checkout), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var addToCardLabel: UILabel = .create {
        $0.text = "Checkout"
        Theme.labelStyle($0, ofSize: 20, weight: .bold)
        $0.textColor = Theme.appWhiteColor
    }
    
    @objc func checkout() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationBar()
        basketModel = [BasketItem()]
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
        
        view.addSubview(backView, constraints: [
            equal(\.topAnchor, to: cardLabel, \.bottomAnchor, constant: 49),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        backView.addSubview(basketTableView, constraints: [
            equal(\.topAnchor, constant: 35),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ])
        
        backView.addSubview(separateViewTop, constraints: [
            equal(\.topAnchor, to: basketTableView, \.bottomAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 2)
        ])
        
        backView.addSubview(totalPriceLabel, constraints: [
            equal(\.topAnchor, to: separateViewTop, \.bottomAnchor, constant: 15),
            equal(\.leadingAnchor, constant: 55)
        ])
        
        backView.addSubview(totalPriceCountLabel, constraints: [
            equal(\.topAnchor, to: totalPriceLabel, \.topAnchor),
            equal(\.leadingAnchor, to: totalPriceLabel, \.trailingAnchor, constant: 215)
        ])
        
        backView.addSubview(deliveryLabel, constraints: [
            equal(\.topAnchor, to: totalPriceLabel, \.bottomAnchor, constant: 12),
            equal(\.leadingAnchor, to: totalPriceLabel, \.leadingAnchor)
        ])
        
        backView.addSubview(deliveryCountLabel, constraints: [
            equal(\.topAnchor, to: deliveryLabel, \.topAnchor),
            equal(\.leadingAnchor, to: totalPriceCountLabel, \.leadingAnchor)
        ])
        
        backView.addSubview(separateViewBottom, constraints: [
            equal(\.topAnchor, to: deliveryLabel, \.bottomAnchor, constant: 26),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 1)
        ])
        
        backView.addSubview(addToCartButton, constraints: [
            equal(\.topAnchor, to: separateViewBottom, \.bottomAnchor, constant: 27),
            equal(\.leadingAnchor, constant: 44),
            equal(\.trailingAnchor, constant: -44),
            equal(\.safeAreaLayoutGuide.bottomAnchor, constant: -44)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 54)
        ])
        
        addToCartButton.addSubview(addToCardLabel, constraints: [
            equal(\.centerYAnchor),
            equal(\.centerXAnchor)
        ])
    }
        
    }

//MARK: - UITableViewDataSource, UITableViewDelegate
extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasketCell = tableView.dequeueReusableCell(for: indexPath)
        cell.render(basketItem: basketModel[indexPath.row])
        print("Cell selected: \(basketModel[indexPath.row])")
        return cell
    }
}

