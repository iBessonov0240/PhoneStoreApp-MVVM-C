//
//  ProductExplorerCollectionView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 30.12.2022.
//

import UIKit

class ProductCollectionView: UICollectionView {
    
    init(frame: CGRect, layout: UICollectionViewFlowLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
//        self.dataSource = self
//        self.delegate = self
        self.backgroundColor = Theme.appBackgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
