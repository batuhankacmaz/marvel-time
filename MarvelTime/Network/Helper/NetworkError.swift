//
//  NetworkError.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 30.06.2023.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
       case missingParameter = "Missing Parameter on request"
}
