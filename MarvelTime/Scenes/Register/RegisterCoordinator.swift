//
//  RegisterCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 14.04.2023.
//

import UIKit

class RegisterCoordinator: RegisterCoordinatorProtocol {
  
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .register }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("RegisterCoordinator deinit")
    }
    
    func start() {
        showRegisterViewController()
    }
    
    func showRegisterViewController() {
        let registerVC = RegisterViewController()
        registerVC.didSendEventClosure = { [weak self] event in
            self?.finish()
            
        }
        navigationController.pushViewController(registerVC, animated: true)
    }
    
    
}
