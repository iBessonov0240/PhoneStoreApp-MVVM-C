//
//  BottomExplorerCollectionView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 26.12.2022.
//

import UIKit

class MiddleExplorerCollectionView: UICollectionView {
    
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MiddleExplorerCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
         cell.backgroundColor = .red
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
}
