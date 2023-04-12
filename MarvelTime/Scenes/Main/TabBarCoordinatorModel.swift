//
//  TabCoordinator.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import Foundation
import UIKit

enum TabBarPage {
    case ready
    case steady
    case go
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .ready
        case 1:
            self = .steady
        case 2:
            self = .go
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String  {
        switch self {
        case .ready:
            return "Ready"
        case .steady:
            return "Steady"
        case .go:
            return "Go"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .ready:
            return 0
        case .steady:
            return 1
        case .go:
            return 2
        }
    }
    
    func tabIconValue() -> String {
        switch self {
        case .ready:
            return "house"
        case .steady:
            return "star.fill"
        case .go:
            return "house"
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
