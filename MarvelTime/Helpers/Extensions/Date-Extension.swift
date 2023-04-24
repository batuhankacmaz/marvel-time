//
//  Date-Extension.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 21.04.2023.
//

import Foundation

extension Date {
    func currentTimeMillis() -> Int {
        return Int(self.timeIntervalSince1970 * 1000)
    }
}
