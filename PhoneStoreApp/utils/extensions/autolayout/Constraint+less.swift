//
//  Constraint+less.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

public func lessOrEqual<Anchor, AnchorType>(_ keyPath: KeyPath<UIView, Anchor>,
                                     to pairView: UIView? = nil,
                                     _ otherKeyPath: KeyPath<UIView, Anchor>? = nil,
                                     constant: CGFloat = 0,
                                     priority: UILayoutPriority = .required) -> PairedConstraint where Anchor: NSLayoutAnchor<AnchorType> {
    return { view, otherView in
        let otherView = pairView ?? otherView
        
        let constraint = view[keyPath: keyPath].constraint(lessThanOrEqualTo: otherView[keyPath: otherKeyPath ?? keyPath],
                                                           constant: constant)
        
        constraint.priority = priority
        
        return constraint
    }
}
