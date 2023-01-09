//
//  DetailedProdView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 31.12.2022.
//

import UIKit

class DetailedProdView: UIView {
    
    private var startIcon: UIImage = UIImage(named: "star")!
    private let stars: Int = 5
    private var fiveStars = [UIImage]()
    private var images: [UIImageView] = [UIImageView(image: UIImage(named: "ic-chip")), UIImageView(image: UIImage(named: "ic-camera")), UIImageView(image: UIImage(named: "ic-memory")), UIImageView(image: UIImage(named: "ic-hardDisk"))]
    private var imageNames: [String] = ["Exynos 990", "108 + 12 mp", "8 GB", "256 GB"]
    var isHighlighted: Bool = false
    
    private lazy var brandLabel: UILabel = .create {
        $0.text = "Galaxy Note 20 Ultra"
        Theme.labelStyle($0, ofSize: 24, weight: .medium)
    }
    
    private lazy var favFromDetailButton: UIButton = .create {
        let image = UIImage(named: "favorites")
        $0.backgroundColor = Theme.appDarkBlueColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 18.5
        $0.setImage(image, for: UIControl.State.normal)
        $0.addTarget(nil, action: #selector(favFromDetailTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        $0.tag = 0
    }
    
    lazy var starsStackView: UIStackView = .create {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 9
    }
    
    private lazy var detailInDetail: CustomSegmentedControl = .create {
        $0.setButtonTitles(buttonTitles: ["Shop","Details","Features"])
        $0.selectorViewColor = .orange
        $0.selectorTextColor = .orange
        $0.backgroundColor = .clear
    }
    
    private lazy var imgNLabelDetail: UIStackView = .create {
//        $0.setUpImages(images: [images])
//        $0.setUpImagesName(names: [imageNames])
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 36
        $0.addArrangedSubview(imgNLabelDetailCell)
    }
    
    private lazy var imgNLabelDetailCell: UIStackView = .create {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 5
        $0.addArrangedSubview(imgDetail(icon: "\(images)"))
        $0.addArrangedSubview(labelDetail(name: "\(imageNames)"))
//        $0.addArrangedSubview(constractiveDetail(icon: "ic-chip", name: "Exynos 990"))
//        $0.addArrangedSubview(constractiveDetail(icon: "ic-camera", name: "108 + 12 mp"))
//        $0.addArrangedSubview(constractiveDetail(icon: "ic-memory", name: "8 GB"))
//        $0.addArrangedSubview(constractiveDetail(icon: "ic-hardDisk", name: "256 GB"))
    }
    
    private lazy var selectedColorLabel: UILabel = .create {
        $0.text = "Select color and capacity"
        Theme.labelStyle($0, ofSize: 16, weight: .medium)
    }
    
    private lazy var selectedColor1Button: UIButton = .create {
        let image = UIImage(named: "selected")
        $0.imageView?.isHidden = false
        $0.backgroundColor = Theme.appBrownColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.setImage(image, for: UIControl.State.normal)
        $0.addTarget(nil, action: #selector(brownBTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var selectedColor2Button: UIButton = .create {
        let image = UIImage(named: "selected")
        $0.imageView?.isHidden = true
        $0.backgroundColor = Theme.appDarkBlueColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.setImage(image, for: UIControl.State.normal)
        $0.addTarget(nil, action: #selector(darkBlueBTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var selectedMemoryButton: UIButton = .create {
        $0.backgroundColor = Theme.appOrangeColor
        $0.setTitle("128 GB", for: UIControl.State.normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        $0.setTitleColor(Theme.appWhiteColor, for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.addTarget(nil, action: #selector(lowGBTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var selectedMemory2Button: UIButton = .create {
        $0.backgroundColor = Theme.appBackgroundColor
        $0.setTitle("256 GB", for: UIControl.State.normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        $0.setTitleColor(Theme.appDarkGrayColor, for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.addTarget(nil, action: #selector(highGBTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var addToCartButton: UIButton = .create {
        $0.backgroundColor = Theme.appOrangeColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.addTarget(nil, action: #selector(addToCardTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var addToCardLabel: UILabel = .create {
        $0.text = "Add to Cart"
        Theme.labelStyle($0, ofSize: 20, weight: .bold)
        $0.textColor = Theme.appWhiteColor
    }
    
    private lazy var addToCardPrice: UILabel = .create {
        $0.text = "$1,500.00"
        Theme.labelStyle($0, ofSize: 20, weight: .bold)
        $0.textColor = Theme.appWhiteColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setUpStars()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpStars() {
        for _ in 1...stars {
//            let imageView = UIImageView(image: UIImage(named: "star"))
//            fiveStars.append(imageView)
            starsStackView.addArrangedSubview(UIImageView(image: UIImage(named: "star")))
        }
    }
    
    private func imgDetail(icon: String) -> UIImageView {
        let iconD = UIImageView(image: UIImage(named: "\(icon)"))
        iconD.translatesAutoresizingMaskIntoConstraints = false
        return iconD
    }
    
    private func labelDetail(name: String) -> UILabel {
        let nameD = UILabel()
        nameD.translatesAutoresizingMaskIntoConstraints = false
        nameD.text = name
        return nameD
    }
    
//    private func constractiveDetail(icon: String, name: String) -> (UIImageView, UILabel){
//        let iconD = UIImageView(image: UIImage(named: "\(icon)"))
//        iconD.translatesAutoresizingMaskIntoConstraints = false
//        let nameD = UILabel()
//        nameD.translatesAutoresizingMaskIntoConstraints = false
//        nameD.text = name
//        return (iconD, nameD)
//    }
    
    @objc func favFromDetailTap() {
        
    }
    
    @objc func brownBTap() {
//        selectedColor1Button.imageView.isHidden = !selectedColor1Button.isHidden
        if selectedColor1Button.imageView?.isHidden == true {
            selectedColor1Button.imageView?.isHidden = false
            selectedColor2Button.imageView?.isHidden = true
        } else {
            selectedColor1Button.imageView?.isHidden = false
            selectedColor2Button.imageView?.isHidden = true
        }
    }
    
    @objc func darkBlueBTap() {
        if selectedColor2Button.imageView?.isHidden == true {
            selectedColor2Button.imageView?.isHidden = false
            selectedColor1Button.imageView?.isHidden = true
        } else {
            selectedColor2Button.imageView?.isHidden = false
            selectedColor1Button.imageView?.isHidden = true
        }
    }
    
    @objc func lowGBTap() {
//        if selectedMemoryButton.backgroundColor == Theme.appOrangeColor && selectedMemoryButton.tintColor == Theme.appWhiteColor {
//            selectedMemory2Button.backgroundColor = Theme.appBackgroundColor && selectedMemory2Button.tintColor = Theme.appDarkGrayColor
//        }
        isHighlighted = !isHighlighted
        
        if isHighlighted {
            backgroundColor = isHighlighted ? Theme.appOrangeColor : Theme.appBackgroundColor
            tintColor = isHighlighted ? Theme.appWhiteColor : Theme.appDarkGrayColor
            selectedMemory2Button.isHighlighted = false
        }
    }
    
    @objc func highGBTap() {
        isHighlighted = !isHighlighted
        
        if isHighlighted {
            backgroundColor = isHighlighted ? Theme.appOrangeColor : Theme.appBackgroundColor
            tintColor = isHighlighted ? Theme.appWhiteColor : Theme.appDarkGrayColor
            selectedMemoryButton.isHighlighted = false
        }
    }
    
    @objc func addToCardTap() {
        
    }
    
    private func setupLayout() {
        
        addSubview(brandLabel, constraints: [
            equal(\.topAnchor, constant: 28),
            equal(\.leadingAnchor, constant: 38)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 30)
        ])
        
        addSubview(favFromDetailButton, constraints: [
            equal(\.centerYAnchor, to: brandLabel, \.centerYAnchor),
            equal(\.trailingAnchor, constant: -37)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 37),
            equal(\.widthAnchor, constant: 37)
        ])
        
        addSubview(starsStackView, constraints: [
            equal(\.topAnchor, to: brandLabel, \.bottomAnchor, constant: 7),
            equal(\.leadingAnchor, constant: 38)
        ])
        
        addSubview(detailInDetail, constraints: [
            equal(\.topAnchor, to: starsStackView, \.bottomAnchor, constant: 32),
            equal(\.leadingAnchor, constant: 38)
        ])
        
        addSubview(imgNLabelDetail, constraints: [
            equal(\.topAnchor, to: detailInDetail, \.bottomAnchor, constant: 33),
            equal(\.leadingAnchor, constant: 45)
        ])
        
        imgNLabelDetailCell.addSubview(imgNLabelDetailCell)
        
        addSubview(selectedColorLabel, constraints: [
            equal(\.topAnchor, to: imgNLabelDetail, \.bottomAnchor, constant: 29),
            equal(\.leadingAnchor, constant: 30)
        ])
        
        addSubview(selectedColor1Button, constraints: [
            equal(\.topAnchor, to: selectedColorLabel, \.bottomAnchor, constant: 14),
            equal(\.leadingAnchor, constant: 34)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 40),
            equal(\.widthAnchor, constant: 40)
        ])
        
        addSubview(selectedColor2Button, constraints: [
            equal(\.centerYAnchor, to: selectedColor1Button, \.centerYAnchor),
            equal(\.leadingAnchor, to: selectedColor1Button, \.trailingAnchor, constant: 19)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 40),
            equal(\.widthAnchor, constant: 40)
        ])
        
        addSubview(selectedMemoryButton, constraints: [
            equal(\.centerYAnchor, to: selectedColor2Button, \.centerYAnchor),
            equal(\.leadingAnchor, to: selectedColor2Button, \.trailingAnchor, constant: 58)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 30),
            equal(\.widthAnchor, constant: 71)
        ])
        
        addSubview(selectedMemory2Button, constraints: [
            equal(\.centerYAnchor, to: selectedMemoryButton, \.centerYAnchor),
            equal(\.leadingAnchor, to: selectedMemoryButton, \.trailingAnchor, constant: 20)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 30),
            equal(\.widthAnchor, constant: 71)
        ])
        
        addSubview(addToCartButton, constraints: [
            equal(\.topAnchor, to: selectedMemoryButton, \.bottomAnchor, constant: 33),
            equal(\.leadingAnchor, constant: 30),
            equal(\.trailingAnchor, constant: -30)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 54)
        ])
        
        addToCartButton.addSubview(addToCardLabel, constraints: [
            equal(\.topAnchor, constant: 14),
            equal(\.leadingAnchor, constant: 45)
        ])
        
        addToCartButton.addSubview(addToCardPrice, constraints: [
            equal(\.centerYAnchor, to: addToCardLabel, \.centerYAnchor),
            equal(\.trailingAnchor, constant: -38)
        ])
    }
    
}
