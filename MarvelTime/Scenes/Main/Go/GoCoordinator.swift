//
//  GoCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//


import Foundation
import UIKit

protocol GoCoordinatorProtocol: Coordinator {
    func showGoViewController()
}


class GoCoordinator: GoCoordinatorProtocol {
    
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
        let goVC = GoViewController()
        goVC.didSendEventClosure = { [weak self] event in
            guard let self else { return }
            
            finish()
        }
        
        navigationController.pushViewController(goVC, animated: true)
    }
    
}
