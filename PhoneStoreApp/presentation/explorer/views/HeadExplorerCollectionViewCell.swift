//
//  HeadCollectionViewCell.swift
//  PhoneStoreApp
//
//  Created by i0240 on 15.12.2022.
//

import UIKit

class HeadExplorerCollectionViewCell: UICollectionViewCell {
    
    var count: Int = 0
    private var headDataItem: HeadDataItem? = nil
    
    var headIconsButton: UIImageView = .create {
        $0.backgroundColor = Theme.appWhiteColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 35.5
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    var headImages: UIImageView = .create {
        $0.image = UIImage(named: "phone-ic")
    }
    
    private lazy var nameLabel: UILabel = .create {
        Theme.labelStyle($0, ofSize: 12, weight: .medium)
        $0.numberOfLines = 0
        $0.text = "Phones"
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        contentView.addSubview(headIconsButton, constraints: [
            equal(\.topAnchor),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 71),
            equal(\.widthAnchor, constant: 71)
        ])
        
        contentView.addSubview(headImages, constraints: [
            equal(\.centerXAnchor, to: headIconsButton, \.centerXAnchor),
            equal(\.centerYAnchor, to: headIconsButton, \.centerYAnchor)
        ], singleConstraints: [
            equal(\.widthAnchor, constant: 29),
            equal(\.heightAnchor, constant: 31)
        ])
        
        contentView.addSubview(nameLabel, constraints: [
            equal(\.topAnchor, to: headIconsButton, \.bottomAnchor, constant: 7),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func select() {
            headIconsButton.backgroundColor = Theme.appOrangeColor
        }
        
    func deselect() {
            headIconsButton.backgroundColor = Theme.appWhiteColor
        }
    
    func render(headItem: HeadDataItem) {
        headImages.image = headItem.img
        nameLabel.text = headItem.categories
        headIconsButton.backgroundColor = headItem.color
        headDataItem = headItem
    }
}
