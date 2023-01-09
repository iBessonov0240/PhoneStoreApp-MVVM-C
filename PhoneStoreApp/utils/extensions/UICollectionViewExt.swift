//
//  UICollectionViewExt.swift
//  PhoneStoreApp
//
//  Created by i0240 on 15.12.2022.
//

import UIKit

public extension UICollectionView {
    
    func register<TCell: UICollectionViewCell>(_: TCell.Type) {
        register(TCell.self, forCellWithReuseIdentifier: TCell.reuseIdentifier)
    }
    
    func registerNib<TCell: UICollectionViewCell>(_: TCell.Type) {
        register(.init(nibName: TCell.reuseIdentifier,
                       bundle: nil),
                 forCellWithReuseIdentifier: TCell.reuseIdentifier)
    }
    
    func dequeueReusableCell<TCell: UICollectionViewCell>(for indexPath: IndexPath) -> TCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: TCell.reuseIdentifier,
                                             for: indexPath) as? TCell else {
            fatalError("Could not dequeue cell with identifier: \(TCell.reuseIdentifier)")
        }
        
        return cell
    }
    
}


//MARK: - Register and dequeue for UICollectionReusableView

public extension UICollectionView {
    
    func register<TView: UICollectionReusableView>(_: TView.Type,
                                                   forSupplimentaryViewOfKind kind: String) {
        register(TView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: TView.reuseIdentifier)
    }
    
    func dequeueReusableSupplementaryView<TView: UICollectionReusableView>(ofKind kind: String,
                                                                           for indexPath: IndexPath) -> TView {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind,
                                                          withReuseIdentifier: TView.reuseIdentifier,
                                                          for: indexPath) as? TView else {
            fatalError("Could not dequeue supplimentary view: \(kind) with identifier: \(TView.reuseIdentifier)")
        }
        
        return view
    }
}
