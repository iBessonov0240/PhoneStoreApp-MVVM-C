//
//  BasketCell.swift
//  PhoneStoreApp
//
//  Created by i0240 on 10.01.2023.
//

import Foundation
import UIKit

class BasketCell: UITableViewCell {
    
    private lazy var playerAvatar: UIImageView = .create {
        $0.image = UIImage(named: "avatar-0")
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
    
    private lazy var separateViewTop: UIView = .create {
        $0.backgroundColor = Theme.appBasketHalfVizorColor
    }
    
    private lazy var totalPriceLabel: UILabel = .create {
        $0.text = "Total"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .regular)
    }
    
    private lazy var totalPriceCountLabel: UILabel = .create {
        $0.text = "$6,000 us"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .bold)
    }
    
    private lazy var deliveryLabel: UILabel = .create {
        $0.text = "Delivery"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .regular)
    }
    
    private lazy var deliveryCountLabel: UILabel = .create {
        $0.text = "Free"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 15, weight: .bold)
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
    
    @objc func checkout() {
        
    }
    
    private func setupLayout() {
        
    }
    
}
