//
//  BottomExplorerCollectionView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 27.12.2022.
//

import UIKit

class BottomExplorerCollectionView: UICollectionView {
    
    var model: [BestSellerProduct] = [] {
        didSet {
            reloadData()
        }
    }
    var delegateRoute: BottomExplorerCollectionViewDelegate? = nil

    init(frame: CGRect, layout: UICollectionViewFlowLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = Theme.appBackgroundColor
        self.allowsMultipleSelection = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomExplorerCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("-------->>>>>>>\(model.count)")
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BottomExplorerCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.render(bottomItem: model[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegateRoute?.routeToDetails()
        print("routing delegate:____ \(indexPath.row)")
        
    }
    
}

protocol BottomExplorerCollectionViewDelegate{
    func routeToDetails()
}
