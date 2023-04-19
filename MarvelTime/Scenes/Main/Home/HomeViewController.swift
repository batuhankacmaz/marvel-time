//
//  GoViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var didSendEventClosure: ((HomeViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "DarkGray")
        
        configureUI()
    }
    
    deinit {
        print("GoViewController deinit")
    }
    
    private let goButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Go", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func didTapGoButton(_ sender: Any) {
        didSendEventClosure?(.comics)
    }
    
    func configureUI() {
        configureGoButton()
    }
    
    func configureGoButton() {
        view.addSubview(goButton)
        
        NSLayoutConstraint.activate([
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goButton.widthAnchor.constraint(equalToConstant: 200),
            goButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        goButton.addTarget(self, action: #selector(didTapGoButton(_:)), for: .touchUpInside)
    }

   

}


//MARK: - GoViewController Extension

extension HomeViewController {
    enum Event {
        case comics
    }
}
