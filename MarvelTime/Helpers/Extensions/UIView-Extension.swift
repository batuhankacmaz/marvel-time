//
//  UIView-Extension.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 28.05.2023.
//

import UIKit

extension UIView {
    func fillSuperview(horizontalConstant: CGFloat = 0, verticalConstant: CGFloat = 0) {
        guard let superview = superview else { return }
        
        superview.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: horizontalConstant),
            topAnchor.constraint(equalTo: superview.topAnchor, constant: verticalConstant),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -horizontalConstant),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -verticalConstant),
        ])
    }
    
    func fillSuperview(horizontalConstant: CGFloat = 0, verticalConstant: CGFloat = 0, parentView: UIView) {
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: horizontalConstant),
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: verticalConstant),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -horizontalConstant),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -verticalConstant),
        ])
    }
    
    func centerSuperView(parentView: UIView) {
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        ])
    }

}

