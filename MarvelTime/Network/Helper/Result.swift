//
//  Result.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 30.06.2023.
//

import Foundation

enum ResultLast<T> {
    case success(_ response: T)
    case serverError(_ err: ErrorResponse)
    case authError(_ err: ErrorResponse)
    case networkError(_ err: String)
    
}

