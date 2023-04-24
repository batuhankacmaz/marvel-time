//
//  SteadyViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit

class ComicsViewController: UIViewController {
    
    var didSendEventClosure: ((ComicsViewController.Event) -> Void)?
    
    private let navigationBarTitle = MTNavigationBarTitle(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
    private let navigationBarAvatar = MTNavigationBarAvatar(frame: CGRect(x: 0, y: 0, width: 32, height: 32), avatarName: "wolverine", size: 32)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        
        configureUI()
    }
    
    private func configureUI() {
        configureNavbar()
    }
    
    private func configureNavbar() {
        configureLeftPartNavbar()
        configureRightPartNavbar()
    }
    
    private func configureLeftPartNavbar() {
        navigationBarTitle.configureLabel(title: "Comics")
        let leftBarButtonItem = UIBarButtonItem(customView: navigationBarTitle)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func configureRightPartNavbar() {
        let rightBarButtonItem = UIBarButtonItem(customView: navigationBarAvatar)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    

}


//MARK: - ReadyViewController Extension

extension ComicsViewController {
    enum Event {
        case favorites
    }
}
