//
//  Icon.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 27.06.2023.
//

import Foundation
import UIKit

enum Icon: String {
    case username = "person.fill"
    case password = "lock.fill"
    
    func toImage() -> UIImage {
        return UIImage(systemName: self.rawValue)!
    }
}
