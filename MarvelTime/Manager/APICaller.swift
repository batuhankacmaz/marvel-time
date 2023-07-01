//
//  APICaller.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 21.04.2023.
//

import Foundation

enum APIError: Error {
    case failedToGetCharacters
}

final class APICaller {
    static let shared = APICaller()
    private let hashValue =  "\(Constants.timestamp)\(Constants.PRIVATE_KEY)\(Constants.PUBLIC_KEY)".MD5
    
    func getCharacters(name: String, completion: @escaping(ResultLast<MTData<MTCharacter>>) -> Void) {
        let url = "\(Constants.marvelBaseURL)characters?nameStartsWith=\(name)&limit=10)"
        guard let request = NetworkManager.shared.formRequest(url: url) else { return }
        NetworkManager.shared.request(request: request, completion: completion)

    }
    
}
