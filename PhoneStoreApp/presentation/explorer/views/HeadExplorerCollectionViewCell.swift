//
//  HeadCollectionViewCell.swift
//  PhoneStoreApp
//
//  Created by i0240 on 15.12.2022.
//

import UIKit

class HeadExplorerCollectionViewCell: UICollectionViewCell {
    
    var count: Int = 0
//    private var colors = [UIColor]()
    private var headDataItem: HeadDataItem? = nil
//    private var headData: [HeadDataItem] = []
//    override var isHighlighted: Bool {
//        didSet {
//            headIconsButton.backgroundColor = isHighlighted ? Theme.appOrangeColor : Theme.appWhiteColor
//        }
//    }
//    override var isSelected: Bool {
//        didSet {
//            headIconsButton.backgroundColor = isSelected ? Theme.appOrangeColor : Theme.appWhiteColor
//        }
//    }
    
    var headIconsButton: UIButton = .create {
        let image = UIImage(named: "phone-ic")
        $0.backgroundColor = Theme.appWhiteColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 35.5
        $0.setImage(image, for: UIControl.State.normal)
        $0.addTarget(nil, action: #selector(buttonTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        $0.tag = 0
    }
    
    private lazy var nameLabel: UILabel = .create {
        Theme.labelStyle($0, ofSize: 12, weight: .medium)
        $0.numberOfLines = 0
        $0.text = "Phones"
        $0.textAlignment = .center
    }
    
    @objc private func buttonTap(_ sender: UIButton) {
        
        print("-----> \(sender.tag)")
//        buttons.append(headIconsButton)
//        print("------\(colors.count)")
        
//        for button in buttons {
//            print(",,,,,,\(button)")
//            if button.backgroundColor == Theme.appOrangeColor && button != sender {
//                button.backgroundColor = Theme.appWhiteColor
//            }
//        }
        if sender.backgroundColor == Theme.appOrangeColor {
            sender.backgroundColor = Theme.appWhiteColor
        } else {
            sender.backgroundColor = Theme.appOrangeColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        contentView.addSubview(headIconsButton, constraints: [
            equal(\.topAnchor),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 71),
            equal(\.widthAnchor, constant: 71)
        ])
        
        contentView.addSubview(nameLabel, constraints: [
            equal(\.topAnchor, to: headIconsButton, \.bottomAnchor, constant: 7),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(headItem: HeadDataItem) {
        headIconsButton.setImage(headItem.img, for: .normal)
        nameLabel.text = headItem.categories
        headIconsButton.tag = headItem.tag
        headIconsButton.backgroundColor = headItem.color
        headDataItem = headItem
    }
}
