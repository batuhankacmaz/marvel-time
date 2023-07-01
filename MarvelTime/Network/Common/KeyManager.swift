//
//  KeyManager.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 30.06.2023.
//

import Foundation

final class KeyManager {
    static let shared = KeyManager()
    private let hashValue =  "\(Constants.timestamp)\(Constants.PRIVATE_KEY)\(Constants.PUBLIC_KEY)".MD5
    private init() {}
    
    func addKey(url: String) -> String {
        return "\(url)&ts=\(Constants.timestamp)&apikey=\(Constants.PUBLIC_KEY)&hash=\(hashValue)"
    }
    
}
