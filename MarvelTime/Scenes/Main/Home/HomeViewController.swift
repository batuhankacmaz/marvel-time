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
    
}


//MARK: - GoViewController Extension

extension HomeViewController {
    enum Event {
        case comics
    }
}

