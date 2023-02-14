//
//  MiddleExplorerCollectionViewCell.swift
//  PhoneStoreApp
//
//  Created by i0240 on 26.12.2022.
//

import UIKit
import AlamofireImage

class MiddleExplorerCollectionViewCell: UICollectionViewCell {
    
    private var middleDataItem: HomeStoreProduct? = nil
    
    private lazy var backgroundImageView: UIImageView = .create {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
    }
    
    private lazy var newItemsButton: UIButton = .create {
        $0.backgroundColor = Theme.appOrangeColor
        $0.setTitle("New", for: UIControl.State.normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        $0.setTitleColor(Theme.appWhiteColor, for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 13.5
        $0.isHidden = true
//        $0.setImage(image, for: UIControl.State.normal)
//        $0.addTarget(nil, action: #selector(), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var titleLabel: UILabel = .create {
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.font = .systemFont(ofSize: 25, weight: .bold)
        $0.text = "Iphone 12"
        $0.textColor = Theme.appWhiteColor
        $0.numberOfLines = 0
    }
    
    private lazy var subtitleLabel: UILabel = .create {
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.font = .systemFont(ofSize: 11, weight: .regular)
        $0.text = "super"
        $0.textColor = Theme.appWhiteColor
        $0.numberOfLines = 0
    }
    
    private lazy var buyNowButton: UIButton = .create {
        $0.backgroundColor = Theme.appWhiteColor
        $0.layer.cornerRadius = 5.0
        //$0.layer.borderColor = UIColor.white.cgColor
        //$0.layer.borderWidth = 1
        $0.titleLabel?.font = .systemFont(ofSize: 11, weight: .bold)
        $0.setTitle("Buy now!", for: UIControl.State.normal)
        $0.setTitleColor(Theme.appDarkBlueColor, for: .normal)
        $0.addTarget(nil, action: #selector(routeToBuy), for: .touchUpInside)
    }
    
    @objc func routeToBuy() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = Theme.appBackgroundColor
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        contentView.addSubview(backgroundImageView, constraints: .pin)
        backgroundImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(newItemsButton, constraints: [
            equal(\.topAnchor, constant: 18),
            equal(\.leadingAnchor, constant: 32)
        ], singleConstraints: [
            equal(\.widthAnchor, constant: 27),
            equal(\.heightAnchor, constant: 27)
        ])
        
        contentView.addSubview(titleLabel, constraints: [
            equal(\.topAnchor, to: newItemsButton, \.bottomAnchor, constant: 18),
            equal(\.leadingAnchor, to: newItemsButton, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 30)
        ])
        
        contentView.addSubview(subtitleLabel, constraints: [
            equal(\.bottomAnchor, to: titleLabel, \.bottomAnchor, constant: 10),
            equal(\.leadingAnchor, to: titleLabel, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 13)
        ])
        
        contentView.addSubview(buyNowButton, constraints: [
            equal(\.topAnchor, to: subtitleLabel, \.bottomAnchor, constant: 26),
            equal(\.leadingAnchor, to: subtitleLabel, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 23),
            equal(\.widthAnchor, constant: 98)
        ])
    }
    
    func render(middleItem: HomeStoreProduct) {
        if let url = URL(string: (middleItem.picture!)) {
            backgroundImageView.af.setImage(withURL: url)
        }
        newItemsButton.isHidden = middleItem.isNew ?? false
        titleLabel.text = "\(middleItem.title ?? "")"
        subtitleLabel.text = "\(middleItem.subtitle ?? "")"
    }
}
