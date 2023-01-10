//
//  UITableViewExt.swift
//  PhoneStoreApp
//
//  Created by i0240 on 10.01.2023.
//

import UIKit

//MARK: - Register and dequeue for UITableViewCell

public extension UITableView {
    
    func register<TCell: UITableViewCell>(_: TCell.Type) {
        register(TCell.self, forCellReuseIdentifier: TCell.reuseIdentifier)
    }
    
    func registerNib<TCell: UITableViewCell>(_: TCell.Type) {
        register(.init(nibName: TCell.reuseIdentifier,
                       bundle: nil),
                 forCellReuseIdentifier: TCell.reuseIdentifier)
    }
    
    func dequeueReusableCell<TCell: UITableViewCell>(for indexPath: IndexPath) -> TCell {
        guard let cell = dequeueReusableCell(withIdentifier: TCell.reuseIdentifier,
                                             for: indexPath) as? TCell else {
            fatalError("Could not dequeue cell with identifier: \(TCell.reuseIdentifier)")
        }
        
        return cell
    }
    
}
