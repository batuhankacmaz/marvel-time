//
//  LoginCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import Foundation
import UIKit

class LoginCoordinator: LoginCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .login }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    deinit {
        print("LoginCoordinator deinit")
        
    }
    
    func start() {
        showLoginViewController()
    }
    
    func showLoginViewController() {
        let loginVC = LoginViewController()
        loginVC.didSendEventClosure = { [weak self] event in
//            switch event {
//            case  .login:
//                self?.finish()
//                self?.navigationController.pushViewController(loginVC, animated: true)
//            case .register:
//                self?.showRegisterViewController()
//            }
            self?.finish()
        }
        
        navigationController.pushViewController(loginVC, animated: true)
        
       
    }
    
    func showRegisterViewController() {
        let registerVC = RegisterViewController()
        navigationController.pushViewController(registerVC, animated: true)
    }
}
