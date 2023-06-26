//
//  GoCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//


import Foundation
import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    func showGoViewController()
}


class HomeCoordinator: HomeCoordinatorProtocol {
    var rootViewController: UIViewController?
    
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("GoCoordinator deinit")
        
    }
    
    func start() {
        showGoViewController()
    }
    
    func showGoViewController() {
        let homeVC = HomeViewController()
        homeVC.didSendEventClosure = { [weak self] event in
         
            self?.finish()
        }
        
        navigationController.pushViewController(homeVC, animated: true)
    }
    
}



