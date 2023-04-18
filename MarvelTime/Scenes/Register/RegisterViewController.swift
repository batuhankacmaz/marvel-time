//
//  RegisterViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 13.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.font = UIFont(name: label.font.fontName, size: 42.0)
        label.tintColor = UIColor(named: "DarkYellow")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor  = UIColor(named: "DarkGray")
        configureUI()
    }
    
    
    private func configureUI(){
        configureRegisterLabel()
    }
    
    private func configureRegisterLabel() {
        view.addSubview(registerLabel)
        
        NSLayoutConstraint.activate([
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
