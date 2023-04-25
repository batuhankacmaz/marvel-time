//
//  UISearchBar-Extension.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 25.04.2023.
//

import UIKit

extension UISearchBar {
    public var textField: UITextField? {
        if #available(iOS 13, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
    
    func changePlaceholderColor(_ color: UIColor) {
        guard let UISearchBarTextFieldLabel: AnyClass = NSClassFromString("UISearchBarTextFieldLabel"),
              let field = textField else {
            return
        }
        for subview in field.subviews where subview.isKind(of: UISearchBarTextFieldLabel) {
            (subview as! UILabel).textColor = color
        }
    }
    
    func setLeftImage(_ image: UIImage,
                      with padding: CGFloat = 0,
                      tintColor: UIColor) {
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.tintColor = tintColor
        
        if padding != 0 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            let paddingView = UIView()
            paddingView.translatesAutoresizingMaskIntoConstraints = false
            paddingView.widthAnchor.constraint(equalToConstant: padding).isActive = true
            paddingView.heightAnchor.constraint(equalToConstant: padding).isActive = true
            stackView.addArrangedSubview(paddingView)
            stackView.addArrangedSubview(imageView)
            textField?.leftView = stackView
            
        } else {
            textField?.leftView = imageView
        }
    }
    
    func setLeftEmpty() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 3))
        textField?.leftView = view
    }
}
