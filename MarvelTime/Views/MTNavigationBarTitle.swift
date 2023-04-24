//
//  MTNavigationBarTitle.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 24.04.2023.
//

import UIKit

class MTNavigationBarTitle: UIView {

    private let navigationBarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor  = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureNavigationBarLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureNavigationBarLabel()  {
        addSubview(navigationBarLabel)
        navigationBarLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    public func configureLabel(title: String) {
        navigationBarLabel.text = title
    }
    
}
