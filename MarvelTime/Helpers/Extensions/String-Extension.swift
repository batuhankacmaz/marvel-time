//
//  String-Extension.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 20.04.2023.
//

import Foundation
import CryptoKit

extension String {
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
    
    var firstUppercased: String { lowercased().capitalized }
    
    var formatDayMonthYear: String {
        var formattedDate: String = ""
        let components = self.components(separatedBy: "-")
        if components.count == 3, let year = Int(components[0]), let month = Int(components[1]), let day = Int(components[2]) {
            formattedDate = String(format: "%02d/%02d/%d", day, month, year)
        }
        return formattedDate
    }
}


