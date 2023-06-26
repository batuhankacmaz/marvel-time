//
//  MTCharacterViewModel.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 25.04.2023.
//

import Foundation

struct MTCharacterViewModel {
    let name: String?
    let thumbnail: Thumbnail?
    let modified: String?
    var modifiedDate: String {
        let charToFind: String.Element = "T"
        if let unwrappedModife = modified {
            if let lastIndex = unwrappedModife.firstIndex(of: charToFind) {
                let yearMontDay = String(unwrappedModife[..<lastIndex])
                return yearMontDay.formatDayMonthYear
            }
        }
        
        return ""
    }
}
