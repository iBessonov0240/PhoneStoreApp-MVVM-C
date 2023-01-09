//
//  FormDropdown.swift
//  PhoneStoreApp
//
//  Created by i0240 on 15.12.2022.
//

import UIKit

open class FormDropdown: UITextField {
    
    var dropdownDelegate: FormDropdownDelegate?
    var padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 32)
    var tagName: String? = nil // like tag for identity view by string
    var data: Any? = nil // associated data
    var isEditable = false // change value only from picker
    private var isChanging = false
    
    var titleLabel: UILabel = .create {
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .placeholderText
    }
    
    var dropdownButton: UIButton = .create {
       // $0.backgroundColor = .red
        $0.setImage(UIImage(named: "down-arrow"), for: .normal)
        $0.addTarget(nil, action: #selector(showDataPicker), for: .touchUpInside)
    }
    
    var isAutoHideTitle: Bool = false
    
    var title: String? {
        get {
            return titleLabel.text
        }
        
        set(value) {
            titleLabel.text = value
        }
    }
    
    var titleColor: UIColor {
        get {
            return titleLabel.textColor
        }
        
        set(value) {
            titleLabel.textColor = value
        }
    }
    
    open override var isHidden: Bool {
        didSet {
            titleLabel.isHidden = isHidden
        }
    }
    
    // Paddging for place holder
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // Padding for text
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // Padding for text in editting mode
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    open override var text: String? {
        didSet {
            didChangeText()
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        
        
        delegate = self
        setupLayout()
        addTarget(self, action: #selector(didChangeText), for: .editingChanged)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
        setupLayout()
        addTarget(self, action: #selector(didChangeText), for: .editingChanged)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        addSubview(dropdownButton, constraints: [
            equal(\.centerYAnchor),
            equal(\.trailingAnchor, constant: -16)
        ], singleConstraints: [
            equal(\.widthAnchor, constant: 16),
            equal(\.heightAnchor, constant: 16)
        ])
    }
    
    open override func didMoveToSuperview() {
        superview?.addSubview(titleLabel, constraints: [
            equal(\.leadingAnchor, to: self, constant: 8),
            equal(\.centerYAnchor, to: self, \.topAnchor),
        ])
    }
    
    // MARK: - objc handlers
    
    @objc private func didChangeText() {
       
        if isAutoHideTitle {
            guard let text = text else { return }
            titleLabel.isHidden = text.isEmpty
        }
        
        if !isChanging {
            isChanging = true
            dropdownDelegate?.valueChanged(dropdown: self)
            isChanging = false
        }
    }
    
    @objc private func showDataPicker() {
        dropdownDelegate?.showDataPicker(dropdown: self)
    }
}

// MARK: - UITextField
extension FormDropdown: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if !isEditable {
           showDataPicker()
        }
        
        return isEditable
    }
}

// MARK: - FormDropdownDelegate
protocol FormDropdownDelegate {
    func showDataPicker(dropdown: FormDropdown)
    func valueChanged(dropdown: FormDropdown)
}
