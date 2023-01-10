//
//  BasketView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 09.01.2023.
//

import UIKit

class BasketView: UIView {
    
    private var basketModel: [BasketItem] = []
    private var delModel: [DeliveryItem] = []
    
    private lazy var feedTableView: UITableView = .create(style: .plain) {
        $0.register(BasketCell.self)
//        $0.dataSource = self
//        $0.delegate = self
        $0.allowsSelection = true
        $0.isUserInteractionEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.isPrefetchingEnabled = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
    }
}
