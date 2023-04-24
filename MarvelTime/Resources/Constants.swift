//
//  Constants.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 21.04.2023.
//

import Foundation
import CryptoKit

struct Constants {
    static let PUBLIC_KEY = Keys.MPUBLIC_KEY
    static let PRIVATE_KEY = Keys.MPRIVATE_KEY
    static let timestamp = Date().currentTimeMillis()
    static let marvelBaseURL = "http://gateway.marvel.com/v1/public/"
}
