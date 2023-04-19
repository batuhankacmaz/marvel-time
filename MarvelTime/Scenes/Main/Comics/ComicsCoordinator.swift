//
//  SteadyCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import Foundation
import UIKit

protocol ComicsCoordinatorProtocol: Coordinator {
    func showSteadyViewController()
}


class ComicsCoordinator: ComicsCoordinatorProtocol {
    
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
        let comicsVC = ComicsViewController()
        comicsVC.didSendEventClosure = { [weak self] event in
            
            self?.finish()
        }
        
        navigationController.pushViewController(comicsVC, animated: true)
    }
    
}
