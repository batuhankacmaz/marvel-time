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

class APICaller {
    static let shared = APICaller()
    private let hashValue =  "\(Constants.timestamp)\(Constants.PRIVATE_KEY)\(Constants.PUBLIC_KEY)".MD5
    func getCharacters(name: String, completion: @escaping(Result<[MTCharacter], Error>) -> Void)  {
        
        guard let url = URL(string: "\(Constants.marvelBaseURL)characters?nameStartsWith=\(name)&limit=10&ts=\(Constants.timestamp)&apikey=\(Constants.PUBLIC_KEY)&hash=\(hashValue)") else { return }
       
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data)
                let results = try JSONDecoder().decode(MTData.self, from: data)
                
                completion(.success(results.data.results))
            } catch {
                completion(.failure(APIError.failedToGetCharacters))
            }
        }
        task.resume()
    }
    
    func getCharacters(name: String) -> Void  {
        
        guard let url = URL(string: "\(Constants.marvelBaseURL)characters?nameStartsWith=\(name)&limit=1&ts=\(Constants.timestamp)&apikey=\(Constants.PUBLIC_KEY)&hash=\(hashValue)") else { return }
        print("url", url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data)
                let results = try JSONDecoder().decode(MTData.self, from: data)
                print("results",results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
