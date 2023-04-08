//
//  HomeViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 8.04.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "DarkGray")
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    

    private let homeTitle: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = .white
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func configureUI() {
        configureLabel()
    }

    private func configureLabel() {
        view.addSubview(homeTitle)
        NSLayoutConstraint.activate([
            homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
