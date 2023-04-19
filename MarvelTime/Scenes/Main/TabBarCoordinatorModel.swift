//
//  TabCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import Foundation
import UIKit

enum TabBarPage {
    case home
    case comics
    case favorites
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .comics
        case 2:
            self = .favorites
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String  {
        switch self {
        case .home:
            return "Home"
        case .comics:
            return "Comics"
        case .favorites:
            return "Favorites"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .comics:
            return 1
        case .favorites:
            return 2
        }
    }
    
    func tabIconValue() -> String {
        switch self {
        case .home:
            return "house"
        case .comics:
            return "newspaper.fill"
        case .favorites:
            return "star.fill"
        }
    }
    
}

enum TabBarItemColor {
    case selectedColor
    case deselectedColor
    
    var color: UIColor {
        switch self {
        case .selectedColor:
            return UIColor(named: "DarkYellow") ?? UIColor.yellow
        case .deselectedColor:
            return UIColor.white
        }
    }
}
