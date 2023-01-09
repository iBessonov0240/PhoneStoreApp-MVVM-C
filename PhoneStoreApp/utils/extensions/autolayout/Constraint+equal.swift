//
//  Constraint+equal.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

public func equal<Anchor, AnchorType>(_ keyPath: KeyPath<UIView, Anchor>,
                                      to pairView: UIView? = nil,
                                      _ otherKeyPath: KeyPath<UIView, Anchor>? = nil,
                                      constant: CGFloat = 0,
                                      priority: UILayoutPriority = .required) -> PairedConstraint where Anchor: NSLayoutAnchor<AnchorType> {
    return { view, otherView in
        let otherView = pairView ?? otherView
        
        let constraint = view[keyPath: keyPath].constraint(equalTo: otherView[keyPath: otherKeyPath ?? keyPath],
                                                           constant: constant)
        
        return constraint
    }
}

public func equal(_ keyPath: KeyPath<UIView, NSLayoutDimension>,
                  to pairView: UIView? = nil,
                  _ otherKeyPath: KeyPath<UIView, NSLayoutDimension>? = nil,
                  constant: CGFloat = 0,
                  multiplier: CGFloat = 1,
                  priority: UILayoutPriority = .required) -> PairedConstraint {
    return { view, otherView in
        let otherView = pairView ?? otherView
        
        let constraint = view[keyPath: keyPath].constraint(equalTo: otherView[keyPath: otherKeyPath ?? keyPath],
                                                           multiplier: multiplier,
                                                           constant: constant)
        constraint.priority = priority
        
        return constraint
    }
}

public func equal(_ keyPath: KeyPath<UIView, NSLayoutDimension>,
                  identifier: String? = nil,
                  constant: CGFloat = 0,
                  priority: UILayoutPriority = .required) -> SingleConstraint {
    
    return { view in
        let constraint = view[keyPath: keyPath].constraint(equalToConstant: constant)
        constraint.identifier = identifier
        constraint.priority = priority
        
        return constraint
    }
}
