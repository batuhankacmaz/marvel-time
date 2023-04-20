//
//  UIImage-Extension.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 20.04.2023.
//

import UIKit

extension UIImage {
    func resizeImage(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
