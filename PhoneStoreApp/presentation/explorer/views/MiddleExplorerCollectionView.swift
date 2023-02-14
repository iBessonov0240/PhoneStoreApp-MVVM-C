//
//  BottomExplorerCollectionView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 26.12.2022.
//

import UIKit

class MiddleExplorerCollectionView: UICollectionView {
    
    var model: [HomeStoreProduct] = [] {
        didSet {
            reloadData()
        }
    }
    
    init(frame: CGRect, layout: UICollectionViewFlowLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = Theme.appBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MiddleExplorerCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MiddleExplorerCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.render(middleItem: model[indexPath.row])
        return cell
    }
    
    
}
