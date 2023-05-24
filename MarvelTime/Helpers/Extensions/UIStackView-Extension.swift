//
//  StackView-Extension.swift
//  MarvelTime
//
//  Created by Batuhan Kaçmaz on 24.05.2023.
//

import UIKit

extension UIStackView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
