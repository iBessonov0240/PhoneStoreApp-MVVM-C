//
//  UIViewExt.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

public extension UIView {
    
    static func create<View: UIView>(with mutation: (View) -> Void) -> View {
        let view = View()
        mutation(view)
        return view
    }
    
    func set(width: CGFloat) {
        frame = .init(origin: frame.origin,
                      size: .init(width: width, height: intrinsicContentSize.height))
    }
    
    func find<T:UIView>(_ ofTType:T.Type) -> T? {
        if let test = subviews.first(where: { $0 is T }) as? T {
            return test
        } else {
            for view in subviews{
                return view.find(ofTType)
            }
        }
        return nil
    }
    
    func setBackgroundAll(color: UIColor) {
        backgroundColor = color
        subviews.forEach { child in
            child.setBackgroundAll(color: color)
        }
    }
    
    func removeAllChilds() {
        subviews.forEach { child in
            child.removeFromSuperview()
        }
    }
}

public extension UIBarButtonItem {
    
    static func create<BarButtonItem: UIBarButtonItem>(with mutation: (BarButtonItem) -> Void) -> BarButtonItem {
        let view = BarButtonItem()
        mutation(view)
        return view
    }
    
}

public extension UITextView {
    static func create<View: UITextView>(textContainer: NSTextContainer?, with mutation: (View) -> Void) -> UITextView {
        let view = View(frame: .zero, textContainer: textContainer)
        mutation(view)
        return view
    }
}

public extension UITableView {
    
    static func create(style: UITableView.Style,  with mutation: (UITableView) -> Void) -> UITableView {
        let view = UITableView(frame: .zero, style: style)
        mutation(view)
        return view
    }
}

public extension UICollectionView {
    
    static func create(itemSize: CGSize,  with mutation: (UICollectionView) -> Void) -> UICollectionView {
        let flowLayout  = UICollectionViewFlowLayout()
        flowLayout.itemSize = itemSize
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        mutation(view)
        return view
    }
    
}
