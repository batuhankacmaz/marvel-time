//
//  MTNavigationBarAvatar.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 24.04.2023.
//

import UIKit

class MTNavigationBarAvatar: UIView {

    private let navigationBarAvatar: UIImageView
    
    init(frame: CGRect, avatarName: String, size: Double) {
        let image = UIImage(named: avatarName)?.resizeImage(size: CGSize(width: size, height: size))?.withRenderingMode(.alwaysOriginal)
        navigationBarAvatar = UIImageView(image: image)
        navigationBarAvatar.contentMode = .scaleAspectFit

        super.init(frame: frame)
        
        configureNavigationBarAvatar()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureNavigationBarAvatar() {
        addSubview(navigationBarAvatar)
        //navigationBarAvatar.frame = bounds
    }

}


