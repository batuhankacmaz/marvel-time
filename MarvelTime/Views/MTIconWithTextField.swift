//
//  MTIconWithTextField.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 14.04.2023.
//

import UIKit

struct MTIconWithTextFieldViewModel {
    let icon: String
    let placeholder: String
    var isPassword: Bool? = false
}

protocol MTIconWithTextFieldDelegate: AnyObject {
    func textDidChange(text: String?)
    func textFieldDidBeginEditing(textField: UITextField)
    func textFieldDidEndEditing(textField: UITextField)
    func textField(textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
}

class MTIconWithTextField: UIView {
    
    weak var delegate: MTIconWithTextFieldDelegate?
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 12.0
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(named: "DarkYellow")?.cgColor
        textField.layer.borderWidth = 3.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    func configure(with viewModel: MTIconWithTextFieldViewModel) {
        iconImageView.image = UIImage(systemName: viewModel.icon)?.withTintColor(UIColor(named: "DarkYellow")!, renderingMode: .alwaysOriginal)
        textField.placeholder = viewModel.placeholder
        if let isPassword = viewModel.isPassword {
            textField.isSecureTextEntry = isPassword
        }
        
        
        
    }
    
    func configureUI() {
        configureImage()
        configureTextField()
    }
    
    func configureImage() {
        addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureTextField() {
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ])
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.textDidChange(text: textField.text)
    }
}


//MARK: - UITextFieldDelegate

extension MTIconWithTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing(textField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing(textField: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        delegate?.textField(textField: textField, shouldChangeCharactersIn: range, replacementString: string)
        return true
    }
}

class PaddedTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

