//
//  UIView+Constraint.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import UIKit

public typealias SingleConstraint = (UIView) -> NSLayoutConstraint
public typealias PairedConstraint = (UIView, UIView) -> NSLayoutConstraint

public extension UIView {
    
    func addSubview(_ child: UIView,
                    constraints: [PairedConstraint]) {
        child.translatesAutoresizingMaskIntoConstraints = false
        addSubview(child)
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    func addSubview(_ child: UIView,
                    constraints: [PairedConstraint],
                    singleConstraints: [SingleConstraint]) {
        child.translatesAutoresizingMaskIntoConstraints = false
        addSubview(child)
        let allConstraints = constraints.map { $0(child, self) } + singleConstraints.map { $0(child) }
        NSLayoutConstraint.activate(allConstraints)
    }
    
    func setConstraints(_ constraints: [SingleConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(self) })
    }
    
    func setConstraints(to pairView: UIView, constraints: [PairedConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(self, pairView) })
    }
}

public enum Constraints {
    public static var pin: [PairedConstraint] {
        [
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.bottomAnchor),
            equal(\.topAnchor)
        ]
    }
    
    public static var pinToSafeArea: [PairedConstraint] {
        [
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.safeAreaLayoutGuide.bottomAnchor),
            equal(\.topAnchor)
        ]
    }
    
    public static func with(insets: UIEdgeInsets) -> [PairedConstraint] {
        [
            equal(\.leadingAnchor, constant: insets.left),
            equal(\.trailingAnchor, constant: -insets.right),
            equal(\.bottomAnchor, constant: -insets.bottom),
            equal(\.topAnchor, constant: insets.top)
        ]
    }
    
    public static func fixedSize(size: CGSize) -> [SingleConstraint] {
        [
            equal(\.widthAnchor, constant: size.width),
            equal(\.heightAnchor, constant: size.height)
        ]
    }
    
    public static func with(top: CGFloat? = nil,
                     bottom: CGFloat? = nil,
                     left: CGFloat? = nil,
                     right: CGFloat? = nil) -> [PairedConstraint] {
        [
            top.map { equal(\.topAnchor, constant: $0) },
            bottom.map { equal(\.bottomAnchor, constant: -$0) },
            left.map { equal(\.leadingAnchor, constant: $0) },
            right.map { equal(\.trailingAnchor, constant: -$0) }
        ]
        .compactMap { $0 }
    }
}

extension UIView {
    
    func changeTopAnchor(constant: CGFloat, updateConstraint: Bool = true) {
        if let constraint = (superview?.constraints.filter{$0.firstItem as? UIView == self && $0.firstAttribute == .top}.first) {
            constraint.constant = constant
            if updateConstraint {
                superview?.updateConstraints()
            }
        }
    }
    
    func addSubview(_ child: UIView, pairingTo pairingView: UIView? = nil, constraints: [PairedConstraint]) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        let constraints = convertToLayoutConstraints(child, pairingTo: pairingView, constraints: constraints)
        NSLayoutConstraint.activate(constraints)
    }
    
    func convertToLayoutConstraints(_ view: UIView, pairingTo pairingView: UIView? = nil, constraints: [PairedConstraint]) -> [NSLayoutConstraint] {
        return constraints.map { $0(view, pairingView ?? self) }
    }
    
    func constrainToView(_ pairingView: UIView, constraints: [PairedConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(self, pairingView) })
    }
    
    func constrain(to constraints: [SingleConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(self) })
    }
    
    func layoutConstraints(_ constraints: [SingleConstraint]) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        return constraints.map { $0(self) }
    }
    
    func constrain(to constraint: SingleConstraint) -> NSLayoutConstraint {
        let nsLayoutConstraint = constraint(self)
        NSLayoutConstraint.activate([nsLayoutConstraint])
        return nsLayoutConstraint
    }
}

extension Array where Element == PairedConstraint {
    static var pin: [PairedConstraint] {
        return [equal(\.topAnchor),
                equal(\.bottomAnchor),
                equal(\.leadingAnchor),
                equal(\.trailingAnchor)]
    }
    
    static var pinToSafeArea: [PairedConstraint] {
        return [equal(\.topAnchor),
                equal(\.bottomAnchor, \.safeAreaLayoutGuide.bottomAnchor),
                equal(\.leadingAnchor),
                equal(\.trailingAnchor)]
    }
}
