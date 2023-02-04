//
//  CountPhonesView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 17.01.2023.
//

import UIKit

class CountPhonesView: UIView {
    
    var count = 0
    
    private lazy var plusButton: UIButton = .create {
        let image = UIImage(named: "ic-plusB")
        $0.backgroundColor = Theme.appBasketHalfVizorColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.setImage(image, for: UIControl.State.normal)
        $0.addTarget(nil, action: #selector(plusTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var phoneCountLabel: UILabel = .create {
        $0.text = String(count)
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 20, weight: .medium)
        $0.textColor = Theme.appWhiteColor
    }
    
    private lazy var minusButton: UIButton = .create {
        let image = UIImage(named: "ic-minB")
        $0.backgroundColor = Theme.appBasketHalfVizorColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.setImage(image, for: UIControl.State.normal)
        $0.addTarget(nil, action: #selector(minusTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func plusTap() {
        count += 1
        phoneCountLabel.text = String(count)
    }
    
    @objc func minusTap() {
        count -= 1
        phoneCountLabel.text = String(count)
    }
    
    private func setupLayout() {
        
        addSubview(plusButton, constraints: [
            equal(\.topAnchor, constant: 8),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 11),
            equal(\.widthAnchor, constant: 11)
        ])
        
        addSubview(phoneCountLabel, constraints: [
            equal(\.centerXAnchor),
            equal(\.centerYAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 25),
            equal(\.widthAnchor, constant: 11)
        ])
        
        addSubview(minusButton, constraints: [
            equal(\.bottomAnchor, constant: -8),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 11),
            equal(\.widthAnchor, constant: 11)
        ])
    }
}
