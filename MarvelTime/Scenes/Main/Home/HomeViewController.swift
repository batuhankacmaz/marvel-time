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
    
    private func configureUI() {
        configureNavbar()
      
    }
    
    private func configureNavbar() {
        configureLeftPartNavbar()
        configureRightPartNavbar()
    }
    
    private func configureLeftPartNavbar() {
        let fontSize:CGFloat = 22;
        let font:UIFont = UIFont.boldSystemFont(ofSize: fontSize);
        let attributes = [NSAttributedString.Key.font: font];
        let item = UIBarButtonItem.init();
        
        item.title = "Hi Batu";
        item.tintColor = .white
        item.setTitleTextAttributes(attributes, for: UIControl.State.normal);
        
        self.navigationItem.leftBarButtonItem = item;
    }
    
    private func configureRightPartNavbar() {
        var image = UIImage(named: "wolverine")?.resizeImage(size: CGSize(width: 32, height: 32))
        
        image = image?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
    }
    
    
    private func configureGoButton() {
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

extension HomeViewController: UIBarPositioningDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
