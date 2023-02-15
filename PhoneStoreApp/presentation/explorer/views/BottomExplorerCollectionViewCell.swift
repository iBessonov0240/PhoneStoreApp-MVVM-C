//
//  BottomExplorerCollectionViewCell.swift
//  PhoneStoreApp
//
//  Created by i0240 on 27.12.2022.
//

import UIKit
import AlamofireImage

class BottomExplorerCollectionViewCell: UICollectionViewCell {
    
    var delegate: BottomExplorerCollectionViewCellDelegate? = nil
    
    private var bottomDataItem: BestSellerProduct? = nil
     
     private lazy var phonesImageView: UIImageView = .create {
         $0.image = UIImage(named: "phone")
         $0.backgroundColor = Theme.appBackgroundColor
         $0.layer.cornerRadius = 10
     }
    
    private lazy var favorites: UIButton = .create {
        $0.setImage(Theme.iconNotFavor, for: .normal)
        $0.setImage(Theme.iconFavor, for: .selected)
        $0.backgroundColor = Theme.appWhiteColor
        $0.tintColor = Theme.appOrangeColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12.5
        $0.addTarget(nil, action: #selector(changeFavor), for: .touchUpInside)
    }
    
    private lazy var newPriceLabel: UILabel = .create {
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "$1,047"
        $0.textColor = Theme.appDarkBlueColor
        $0.backgroundColor = Theme.appWhiteColor
        $0.numberOfLines = 0
    }
    
    private lazy var oldPriceLabel: UILabel = .create {
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.attributedText = "$1,500".strikeThrough()
        $0.textColor = Theme.appGrayColor
        $0.backgroundColor = Theme.appWhiteColor
        $0.numberOfLines = 0
    }
    
    private lazy var nameLabel: UILabel = .create {
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        Theme.labelStyle($0, ofSize: 10)
        $0.text = "Iphone 12"
        $0.textColor = Theme.appDarkBlueColor
        $0.numberOfLines = 0
    }
    
    @objc func changeFavor() {
        favorites.isSelected.toggle()
        
        guard let explorerProducts = bottomDataItem else { return }
        delegate?.setFavorite(product: explorerProducts)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = Theme.appWhiteColor
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        contentView.addSubview(phonesImageView, constraints: [
            equal(\.topAnchor, constant: 5),
            equal(\.leadingAnchor, constant: 3),
            equal(\.trailingAnchor, constant: -3)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 168)
        ])
        
        contentView.addSubview(favorites, constraints: [
            equal(\.topAnchor, constant: 11),
            equal(\.trailingAnchor, constant: -12)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 25),
            equal(\.widthAnchor, constant: 25)
        ])
        
        contentView.addSubview(newPriceLabel, constraints: [
            equal(\.topAnchor, to: phonesImageView, \.bottomAnchor, constant: 2),
            equal(\.leadingAnchor, constant: 21)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 20)
        ])
        
        contentView.addSubview(oldPriceLabel, constraints: [
            equal(\.bottomAnchor, to: newPriceLabel, \.bottomAnchor),
            equal(\.leadingAnchor, to: newPriceLabel, \.trailingAnchor, constant: 7)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 13)
        ])
        
        contentView.addSubview(nameLabel, constraints: [
            equal(\.topAnchor, to: newPriceLabel, \.bottomAnchor, constant: 5),
            equal(\.leadingAnchor, constant: 21)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 13)
        ])
    }
    
    func render(bottomItem: BestSellerProduct) {
        if let url = URL(string: (bottomItem.picture!)) {
            phonesImageView.af.setImage(withURL: url)
        }
        newPriceLabel.text = "$\(bottomItem.discountPrice ?? 0)"
        oldPriceLabel.text = "$\(bottomItem.priceWithoutDiscount ?? 0)"
        nameLabel.text = bottomItem.title
        favorites.isSelected = bottomItem.isFavorites ?? true
        bottomDataItem = bottomItem
    }
}

protocol BottomExplorerCollectionViewCellDelegate {
    func setFavorite(product: BestSellerProduct)
}
