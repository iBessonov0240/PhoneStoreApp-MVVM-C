//
//  FilterViewController.swift
//  PhoneStoreApp
//
//  Created by i0240 on 29.12.2022.
//

import UIKit

class FilterViewController: UIViewController {
    
    private var filters: PhoneFilter?

    private let TAG_BRAND = 1
    private let TAG_PRICE = 2
    private let TAG_SIZE = 3
    
    private let NOT_SELECTED = "Not selected"
    
//    private var filtersArray: [FeedFilterItem] = [] {
//        didSet {
//            filterCollectioView.model = filtersArray
//                if filters == nil {
//                    filters = UserFeedFilter()
//                }
//        }
//    }
    
    private lazy var closeButton: UIButton = .create {
        $0.backgroundColor = Theme.appWhiteColor
        $0.setImage(UIImage(named: "crossLines"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 18.5
        $0.addTarget(nil, action: #selector(closeFilter), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var titleLabel: UILabel = .create {
        $0.text = "Filter options"
        Theme.labelStyle($0, ofSize: 18, weight: .medium)
    }
    
    private lazy var doneButton: UIButton = .create {
        $0.backgroundColor = Theme.appOrangeColor
        $0.setTitle("Done", for: UIControl.State.normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        $0.setTitleColor(Theme.appWhiteColor, for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var brandLabel: UILabel = .create {
        $0.text = "Brand"
        Theme.labelStyle($0, ofSize: 18, weight: .medium)
    }
    
    private lazy var brandTextField: FormDropdown = .create {
        Theme.textFieldStyle($0, ofSize: 18, weight: .medium)
        $0.text = NOT_SELECTED
        $0.isEditable = false
        $0.tag = TAG_BRAND
        $0.dropdownDelegate = self
    }
    
    private lazy var priceLabel: UILabel = .create {
        $0.text = "Price"
        Theme.labelStyle($0, ofSize: 18, weight: .medium)
    }
    
    private lazy var priceTextField: FormDropdown = .create {
        Theme.textFieldStyle($0, ofSize: 18, weight: .medium)
        $0.text = NOT_SELECTED
        $0.isEditable = false
        $0.tag = TAG_PRICE
        $0.dropdownDelegate = self
    }
    
    private lazy var sizeLabel: UILabel = .create {
        $0.text = "Size"
        Theme.labelStyle($0, ofSize: 18, weight: .medium)
    }
    
    private lazy var sizeTextField: FormDropdown = .create {
        Theme.textFieldStyle($0, ofSize: 18, weight: .medium)
        $0.text = NOT_SELECTED
        $0.isEditable = false
        $0.tag = TAG_SIZE
        $0.dropdownDelegate = self
    }
    
    init(filters: PhoneFilter?) {
        super.init(nibName: nil, bundle: nil)
        self.filters = filters
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeFilter() {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.appBackgroundColor
        setupLayout()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    private func setupLayout() {
        view.addSubview(closeButton, constraints: [
            equal(\.topAnchor, constant: 24),
            equal(\.leadingAnchor, constant: 44)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 37),
            equal(\.widthAnchor, constant: 37)
        ])
        
        view.addSubview(titleLabel, constraints: [
            equal(\.topAnchor, constant: 31),
            equal(\.centerXAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 23)
        ])
        
        view.addSubview(doneButton, constraints: [
            equal(\.topAnchor, constant: 24),
            equal(\.trailingAnchor, constant: -20)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 37),
            equal(\.widthAnchor, constant: 86)
        ])
        
        view.addSubview(brandLabel, constraints: [
            equal(\.topAnchor, to: closeButton, \.bottomAnchor, constant: 50),
            equal(\.leadingAnchor, constant: 46)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 23)
        ])
        
        view.addSubview(brandTextField, constraints: [
            equal(\.topAnchor, to: brandLabel, \.bottomAnchor, constant: 5),
            equal(\.leadingAnchor, to: brandLabel, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 37)
        ])
        
        view.addSubview(priceLabel, constraints: [
            equal(\.topAnchor, to: brandTextField, \.bottomAnchor, constant: 15),
            equal(\.leadingAnchor, to: brandTextField, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 23)
        ])
        
        view.addSubview(priceTextField, constraints: [
            equal(\.topAnchor, to: priceLabel, \.bottomAnchor, constant: 5),
            equal(\.leadingAnchor, to: priceLabel, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 37)
        ])
        
        view.addSubview(sizeLabel, constraints: [
            equal(\.topAnchor, to: priceTextField, \.bottomAnchor, constant: 15),
            equal(\.leadingAnchor, to: priceTextField, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 23)
        ])
        
        view.addSubview(sizeTextField, constraints: [
            equal(\.topAnchor, to: sizeLabel, \.bottomAnchor, constant: 5),
            equal(\.leadingAnchor, to: sizeLabel, \.leadingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 37)
        ])
    }
}

// MARK: - FormDropdownDelegate
extension FilterViewController: FormDropdownDelegate {
    func showDataPicker(dropdown: FormDropdown) {
        switch dropdown.tag {
        case TAG_BRAND:
            showBrand(dropdown: dropdown)
            break
        case TAG_PRICE:
            showPrice(dropdown: dropdown)
            break
        case TAG_SIZE:
            showSize(dropdown: dropdown)
            break
        default:
            break
        }
    }
    
    func valueChanged(dropdown: FormDropdown) {
        
    }
    
    func showBrand(dropdown: FormDropdown) {
        let pickerData = ["Samsung", "Apple"]
        PickerDialog().show(title: dropdown.title!,
                            options: [pickerData],
                            selected: (pickerData[0], "")) {
            (value) -> Void in
            
            dropdown.text = value.0
            dropdown.data = pickerData.filter { $0 == value.0 }.first
            
        }
   }
    
    func showPrice(dropdown: FormDropdown) {
        let pickerData = ["$300 - $500", "$501 - $700"]
        PickerDialog().show(title: dropdown.title!,
                            options: [pickerData],
                            selected: (pickerData[0], "")) {
            (value) -> Void in
            
            dropdown.text = value.0
            dropdown.data = pickerData.filter { $0 == value.0 }.first
        }
    }
    
    func showSize(dropdown: FormDropdown) {
        let pickerData = ["4.5 to 5.5 inches", "5.6 to 6.5 inches"]
        PickerDialog().show(title: dropdown.title!,
                            options: [pickerData],
                            selected: (pickerData[0], "")) {
            (value) -> Void in
            
            dropdown.text = value.0
            dropdown.data = pickerData.filter { $0 == value.0 }.first
        }
    }
}
