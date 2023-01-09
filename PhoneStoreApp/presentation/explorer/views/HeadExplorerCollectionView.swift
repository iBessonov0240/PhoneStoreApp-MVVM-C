//
//  HeadCollectionView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 15.12.2022.
//

import UIKit

class HeadExplorerCollectionView: UICollectionView {
    
    var lastSelectedIndexPath: IndexPath?
    var selectedStatHeaders = Set<Int>()
    var model: [HeadDataItem] = [] {
        didSet {
            reloadData()
        }
    }

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

extension HeadExplorerCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 71, height: 93)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HeadExplorerCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.render(headItem: model[indexPath.row])
        cell.headIconsButton.backgroundColor = Theme.appWhiteColor
        
        cell.count = indexPath.item
        print("Cell selected: \(model[indexPath.row])")
//        if cell.headIconsButton.backgroundColor == Theme.appOrangeColor && cell.headIconsButton != cell {
//            cell.headIconsButton.backgroundColor = Theme.appWhiteColor
//        }
//        if indexPath.row == 0 {
//            lastSelectedIndexPath = indexPath
//            cell.isSelected = true
//        }
//        cell.isSelected = (lastSelectedIndexPath == indexPath)
//        if selectedStatHeaders.contains(indexPath.row) {
//            cell.headIconsButton.backgroundColor = Theme.appWhiteColor
//        } else {
//            cell.headIconsButton.backgroundColor = Theme.appOrangeColor
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you selected cell #\(indexPath.item)")
//        guard lastSelectedIndexPath != indexPath else { return }
//        selectedStatHeaders.insert(indexPath.row)
//        collectionView.reloadItems(at: [indexPath])
//        if let index = lastSelectedIndexPath {
//            let cell: HeadExplorerCollectionViewCell = collectionView.cellForItem(at: index) as! HeadExplorerCollectionViewCell
//            cell.isSelected = false
//        }
//        let cell: HeadExplorerCollectionViewCell = collectionView.cellForItem(at: indexPath) as! HeadExplorerCollectionViewCell
//        cell.isSelected = true
//        lastSelectedIndexPath = indexPath
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
////        if let index = lastSelectedIndexPath {
//            let cell: HeadExplorerCollectionViewCell = collectionView.cellForItem(at: indexPath) as! HeadExplorerCollectionViewCell
//            cell.isSelected = false
////        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        let cell: HeadExplorerCollectionViewCell = collectionView.cellForItem(at: indexPath) as! HeadExplorerCollectionViewCell
//        cell.backgroundColor = UIColor.red
//    }
//
//    // change background color back when user releases touch
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        let cell: HeadExplorerCollectionViewCell = collectionView.cellForItem(at: indexPath) as! HeadExplorerCollectionViewCell
//        cell.backgroundColor = UIColor.cyan
//    }
}
