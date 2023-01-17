//
//  ProductCollectionViewCell.swift
//  PhoneStoreApp
//
//  Created by i0240 on 30.12.2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    private var productDetailItem: ProductDetailItems? = nil
    
    private lazy var backgroundImageView: UIImageView = .create {
        $0.image = UIImage(named: "phone")
        $0.backgroundColor = Theme.appBackgroundColor
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        contentView.addSubview(backgroundImageView, constraints: [
            equal(\.topAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.bottomAnchor)
        ])
    }
    
    func render(prodDItem: ProductDetailItems) {
        backgroundImageView.image = prodDItem.image
    }
}
