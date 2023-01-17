//
//  BasketView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 17.01.2023.
//

import UIKit

class BasketView: UIView {
    
    private var basketModel: [BasketItem] = []
    private var delModel: [DeliveryItem] = []
    
    private lazy var basketTableView: UITableView = .create(style: .plain) {
        $0.register(BasketCell.self)
        $0.backgroundColor = Theme.appDarkBlueColor
        $0.dataSource = self
        $0.delegate = self
        $0.allowsSelection = true
        $0.isUserInteractionEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.isPrefetchingEnabled = true
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(basketTableView, constraints: [
            equal(\.topAnchor, constant: 35),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ])
        
        addSubview(separateViewTop, constraints: [
            equal(\.topAnchor, to: basketTableView, \.bottomAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 2)
        ])
        
        addSubview(totalPriceLabel, constraints: [
            equal(\.topAnchor, to: separateViewTop, \.bottomAnchor, constant: 15),
            equal(\.leadingAnchor, constant: 55)
        ])
        
        addSubview(totalPriceCountLabel, constraints: [
            equal(\.topAnchor, to: totalPriceLabel, \.topAnchor),
            equal(\.leadingAnchor, to: totalPriceLabel, \.trailingAnchor, constant: 215)
        ])
        
        addSubview(deliveryLabel, constraints: [
            equal(\.topAnchor, to: totalPriceLabel, \.bottomAnchor, constant: 12),
            equal(\.leadingAnchor, to: totalPriceLabel, \.leadingAnchor)
        ])
        
        addSubview(deliveryCountLabel, constraints: [
            equal(\.topAnchor, to: deliveryLabel, \.topAnchor),
            equal(\.leadingAnchor, to: totalPriceCountLabel, \.leadingAnchor)
        ])
        
        addSubview(separateViewBottom, constraints: [
            equal(\.topAnchor, to: deliveryLabel, \.bottomAnchor, constant: 26),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 1)
        ])
        
        addSubview(addToCartButton, constraints: [
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
extension BasketView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasketCell = tableView.dequeueReusableCell(for: indexPath)
        
        return cell
    }
    
    
}
