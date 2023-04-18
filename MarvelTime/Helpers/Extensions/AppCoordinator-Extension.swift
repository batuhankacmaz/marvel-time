//
//  AppCoordinator-Extension.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import Foundation


extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            
            showLoginFlow()
        case .login:
            navigationController.viewControllers.removeAll()
            
            showMainFlow()
        default:
            break
        }
    }
}
