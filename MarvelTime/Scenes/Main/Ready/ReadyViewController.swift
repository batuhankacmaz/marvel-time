//
//  ReadyViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit

class ReadyViewController: UIViewController {
    
    var didSendEventClosure: ((ReadyViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "DarkGray")
        
        configureUI()
    }
    
    deinit {
        print("ReadyViewController deinit")
    }
    
    private let readyButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Ready", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func didTapReadyButton(_ sender: Any) {
        didSendEventClosure?(.ready)
    }
    
    func configureUI() {
        configureReadyButton()
    }
    
    func configureReadyButton() {
        view.addSubview(readyButton)
        
        NSLayoutConstraint.activate([
            readyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            readyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            readyButton.widthAnchor.constraint(equalToConstant: 200),
            readyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        readyButton.addTarget(self, action: #selector(didTapReadyButton(_:)), for: .touchUpInside)
    }
}


//MARK: - ReadyViewController Extension

extension ReadyViewController {
    enum Event {
        case ready
    }
}
