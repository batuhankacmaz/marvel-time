//
//  MTIconWithTextField.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 14.04.2023.
//

import UIKit

protocol MTIconWithTextFieldDelegate: AnyObject {
    func textDidChange(text: String, type: MTIconWithTextFieldType)
    func textFieldDidEndEditing(text: String, type: MTIconWithTextFieldType)
}

enum MTIconWithTextFieldType {
    case username
    case password
}

final class MTIconWithTextField: UIView {
    
    weak var delegate: MTIconWithTextFieldDelegate?
    private var type: MTIconWithTextFieldType = .username
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor(named: "DarkYellow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = PaddedTextField()
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 12.0
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(named: "DarkYellow")?.cgColor
        textField.layer.borderWidth = 3.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(icon: UIImage, placeholder: String, isPassword: Bool = false) {
        super.init(frame: .zero)
        iconImageView.image = icon
        
        textField.placeholder = placeholder
        self.type = isPassword ? .password : .username
        textField.isSecureTextEntry = isPassword
        configureUI()
        
        print("initialize")
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    private func configureUI() {
        configureImage()
        configureTextField()
        configureSelf()
    }
    
    private func configureImage() {
        addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureTextField() {
        addSubview(textField)
        textField.delegate = self
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureSelf() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            centerYAnchor.constraint(equalTo: centerYAnchor),
            heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
  
    
}


//MARK: - UITextFieldDelegate

extension MTIconWithTextField: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing(text: textField.text!, type: type)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
            delegate?.textDidChange(text: updatedText, type: type)
            }
            
            // Return true to allow the text change or false to reject it if needed
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

