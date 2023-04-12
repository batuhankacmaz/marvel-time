//
//  SteadyCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import Foundation
import UIKit

protocol SteadyCoordinatorProtocol: Coordinator {
    func showSteadyViewController()
}


class SteadyCoordinator: SteadyCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    deinit {
        print("SteadyCoordinator deinit")
        
    }
    
    func start() {
        showSteadyViewController()
    }
    
    func showSteadyViewController() {
        let steadyVC = SteadyViewController()
        steadyVC.didSendEventClosure = { [weak self] event in
            guard let self else { return }
            
            finish()
        }
        
        navigationController.pushViewController(steadyVC, animated: true)
    }
    
}
