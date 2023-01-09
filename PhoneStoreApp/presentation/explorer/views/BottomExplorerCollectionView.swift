//
//  BottomExplorerCollectionView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 27.12.2022.
//

import UIKit

class BottomExplorerCollectionView: UICollectionView {
    
    var delegete: BottomExplorerCollectionViewDelegate? = nil

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

extension BottomExplorerCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BottomExplorerCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.backgroundColor = Theme.appWhiteColor
        cell.layer.cornerRadius = 10
        cell.tag = indexPath.row
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegete?.routeToDetails()
        print("routing delegate:____ \(indexPath.row)")
    }
    
}

protocol BottomExplorerCollectionViewDelegate{
    func routeToDetails()
}
