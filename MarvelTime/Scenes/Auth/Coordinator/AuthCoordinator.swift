//
//  AuthCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import Foundation
import UIKit

class AuthCoordinator: AuthCoordinatorProtocol, CoordinatorFinishDelegate {
    var rootViewController: UIViewController?
    
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
        case .register:
            navigationController.viewControllers.removeAll()
            self.finish()
        default:
            break
        }
    }
    
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .login }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLoginViewController()
    }
    
    func showLoginViewController() {
        let loginVC = LoginViewController()
        self.rootViewController = loginVC
        loginVC.didSendEventClosure = { [weak self] event in
            switch event {
            case  .login:
                self?.finish()
            case .register:
                self?.showRegisterViewController()
            }
            
        }
        navigationController.pushViewController(loginVC, animated: true)
        
        
    }
    
    func showRegisterViewController() {
        let registerVC = RegisterViewController()
        registerVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .register:
                self?.finish()
            }
        }
                 
        navigationController.pushViewController(registerVC, animated: true)
    }
    
}
