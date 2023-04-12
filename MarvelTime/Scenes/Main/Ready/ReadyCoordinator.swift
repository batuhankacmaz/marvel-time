//
//  ReadyCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import Foundation
import UIKit

protocol ReadyCoordinatorProtocol: Coordinator {
    func showReadyViewController()
}


class ReadyCoordinator: ReadyCoordinatorProtocol {
    
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
        let readyVC = ReadyViewController()
        readyVC.didSendEventClosure = { [weak self] event in
            guard let self else { return }
            
            finish()
        }
        
        navigationController.pushViewController(readyVC, animated: true)
    }
    
}
