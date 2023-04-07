//
//  ViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 7.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        configureUI()
    }
    
    
    private let MTButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let MTLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    @objc func buttonPressed() {
        
        if let _ = MTLabel.text {
            MTLabel.text! += " Pressed"
        } else {
            MTLabel.text = "First"
        }
        
        
        
        print("Pressed")
    }
    
    func configureUI() {
        configureButton()
        configureLabel()
    }
    
    func configureButton() {
        view.addSubview(MTButton)
        MTButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            MTButton.widthAnchor.constraint(equalToConstant: 260),
            MTButton.heightAnchor.constraint(equalToConstant: 50),
            MTButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MTButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
    }
    
    func configureLabel() {
        view.addSubview(MTLabel)
        
        NSLayoutConstraint.activate([
            MTLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MTLabel.topAnchor.constraint(equalTo: MTButton.bottomAnchor, constant: 30)
        ])
    }
    
}

