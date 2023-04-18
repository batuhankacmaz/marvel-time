//
//  Coordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import Foundation
import UIKit


//MARK: - Coordinator
protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set}
    var type: CoordinatorType { get }
    
    func start()
    
    func finish()
    
    
}

//MARK: - Coordinator Type

enum CoordinatorType {
    case app, login, register, tab
}
