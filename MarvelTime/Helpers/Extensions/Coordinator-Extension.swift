//
//  CoordinatorExtension.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import Foundation

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
