//
//  BasketCell.swift
//  PhoneStoreApp
//
//  Created by i0240 on 10.01.2023.
//

import Foundation
import UIKit

class BasketCell: UITableViewCell {
    
    private lazy var phoneImage: UIImageView = .create {
        $0.image = UIImage(named: "phone")
        $0.layer.cornerRadius = 15
        $0.backgroundColor = Theme.appWhiteColor
    }
    
    private lazy var phoneName: UILabel = .create {
        $0.text = "Galaxy Note 20 \nUltra"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 20, weight: .medium)
    }
    
    private lazy var priceInCellLabel: UILabel = .create {
        $0.text = "$3000.00"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 20, weight: .medium)
    }
    
    private lazy var countView: UIView = .create {
        $0.backgroundColor = Theme.appBasketHalfVizorColor
    }
    
    private lazy var deleteButton: UIButton = .create {
        $0.backgroundColor = .clear
        $0.setImage(UIImage(named: "ic-busketB"), for: .normal)
        $0.addTarget(self, action: #selector(deletePhone), for: .touchUpInside)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        isUserInteractionEnabled = true
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deletePhone() {
        
    }
    
    private func setupLayout() {
        
        contentView.addSubview(phoneImage, constraints: [
            equal(\.topAnchor, constant: 45),
            equal(\.leadingAnchor, constant: 23)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 111),
            equal(\.widthAnchor, constant: 89)
        ])
        
        contentView.addSubview(phoneName, constraints: [
            equal(\.topAnchor, to: phoneImage, \.topAnchor),
            equal(\.leadingAnchor, to: phoneImage, \.trailingAnchor, constant: 4)
        ], singleConstraints: [
            equal(\.widthAnchor, constant: 50)
        ])
        
        contentView.addSubview(priceInCellLabel, constraints: [
            equal(\.topAnchor, to: phoneName, \.bottomAnchor, constant: 6),
            equal(\.leadingAnchor, to: phoneImage, \.trailingAnchor, constant: 4)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 25),
            equal(\.widthAnchor, constant: 100)
        ])
        
        contentView.addSubview(countView, constraints: [
            equal(\.topAnchor, to: phoneName, \.topAnchor),
            equal(\.leadingAnchor, to: phoneName, \.trailingAnchor, constant: 33)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 68),
            equal(\.widthAnchor, constant: 26)
        ])
        
        contentView.addSubview(deleteButton, constraints: [
            equal(\.centerYAnchor, to: contentView, \.centerYAnchor),
            equal(\.leadingAnchor, constant: 17)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 16),
            equal(\.widthAnchor, constant: 15)
        ])
    }
    
}
