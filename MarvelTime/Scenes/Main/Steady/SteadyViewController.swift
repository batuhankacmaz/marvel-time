//
//  SteadyViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit

class SteadyViewController: UIViewController {
    
    var didSendEventClosure: ((SteadyViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "DarkGray")
        
        configureUI()
    }
    
    deinit {
        print("SteadyViewController deinit")
    }
    
    private let steadyButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Steady", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func didTapSteadyButton(_ sender: Any) {
        didSendEventClosure?(.steady)
    }
    
    func configureUI() {
        configureSteadyButton()
    }
    
    func configureSteadyButton() {
        view.addSubview(steadyButton)
        
        NSLayoutConstraint.activate([
            steadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            steadyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            steadyButton.widthAnchor.constraint(equalToConstant: 200),
            steadyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        steadyButton.addTarget(self, action: #selector(didTapSteadyButton(_:)), for: .touchUpInside)
    }

}


//MARK: - ReadyViewController Extension

extension SteadyViewController {
    enum Event {
        case steady
    }
}
