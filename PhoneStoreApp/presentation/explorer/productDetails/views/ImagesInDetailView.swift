//
//  ImagesInDetailView.swift
//  PhoneStoreApp
//
//  Created by i0240 on 03.01.2023.
//

import UIKit

class ImagesInDetailView: UIView {
    
    private lazy var imageStackView: UIStackView = .create {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 64
    }
    
    private lazy var imageNameStackView: UIStackView = .create {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 36
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(imageStackView, constraints: [
            equal(\.topAnchor),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 28),
            equal(\.widthAnchor, constant: 28)
        ])
        
        addSubview(imageNameStackView, constraints: [
            equal(\.topAnchor, to: imageStackView, \.bottomAnchor, constant: 5),
            equal(\.centerXAnchor, to: imageStackView, \.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 14)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpImages(images: [UIImage]) {
        for img in images {
            let iconImage = UIImageView()
            iconImage.image = UIImage(named: "\(img)")
            imageStackView.addArrangedSubview(iconImage)
        }
    }
    
    func setUpImagesName(names: [String]) {
        for n in names {
            let iconName = UILabel()
            iconName.text = n
            imageNameStackView.addArrangedSubview(iconName)
        }
    }
    
}
