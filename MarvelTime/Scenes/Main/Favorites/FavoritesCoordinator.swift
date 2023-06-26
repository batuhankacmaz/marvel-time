//
//  ReadyCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import Foundation
import UIKit

protocol FavoritesCoordinatorProtocol: Coordinator {
    func showReadyViewController()
}


class FavoritesCoordinator: FavoritesCoordinatorProtocol {
    var rootViewController: UIViewController?
    
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    deinit {
        print("ReadyCoordinator deinit")
        
    }
    
    func start() {
        showReadyViewController()
    }
    
    func showReadyViewController() {
        let favoritesVC = FavoritesViewController()
        favoritesVC.didSendEventClosure = { [weak self] event in
            
            self?.finish()
        }
        
        navigationController.pushViewController(favoritesVC, animated: true)
    }
    
}
