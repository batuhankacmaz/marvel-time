//
//  ErrorResponse.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 30.06.2023.
//

import Foundation

struct ErrorResponse: Codable {
    let code: Int
    let message: String
}
