//
//  MTErrorLabel.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 27.06.2023.
//

import UIKit

enum ErrorText: String {
    case loginError = "Wrong username or password"
    case registerUsernameError = "Username exist"
    case registerPasswordError = "Password and repassword cant match"
}

final class MTErrorLabel: UILabel {
    
    init(label: ErrorText) {
        super.init(frame: .zero)
        text = label.rawValue
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        self.font = UIFont.systemFont(ofSize: 16)
        self.textColor = UIColor(named: "Red")
    }
}

extension MTErrorLabel {
    
    func configureLabel(label: ErrorText) {
        text = label.rawValue
    }
}


