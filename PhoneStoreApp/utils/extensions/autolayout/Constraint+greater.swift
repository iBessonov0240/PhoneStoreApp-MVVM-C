//
//  Constraint+greater.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

public func greaterOrEqual<Anchor, AnchorType>(_ keyPath: KeyPath<UIView, Anchor>,
                                     to pairView: UIView? = nil,
                                     _ otherKeyPath: KeyPath<UIView, Anchor>? = nil,
                                     constant: CGFloat = 0,
                                     priority: UILayoutPriority = .required) -> PairedConstraint where Anchor: NSLayoutAnchor<AnchorType> {
    return { view, otherView in
        let otherView = pairView ?? otherView
   
        let constraint = view[keyPath: keyPath].constraint(greaterThanOrEqualTo: otherView[keyPath: otherKeyPath ?? keyPath],
                                                           constant: constant)
        
        constraint.priority = priority
        
        return constraint
    }
}


public func greaterOrEqual(_ keyPath: KeyPath<UIView, NSLayoutDimension>,
                  identifier: String? = nil,
                  constant: CGFloat = 0,
                  priority: UILayoutPriority = .required) -> SingleConstraint {
    
    return { view in
        let constraint = view[keyPath: keyPath].constraint(greaterThanOrEqualToConstant: constant)
        constraint.identifier = identifier
        constraint.priority = priority
        
        return constraint
    }
}
