//
//  NetworkManager.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 30.06.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let session = URLSession(configuration: .default)
    
    private init() {}
    
    func formRequest(url: String,
                             data: (any Codable)? = nil,
                             method: HTTPMethod = .get, isRequireKey: Bool = true ) -> URLRequest? {
        var baseURL = url
        if isRequireKey {
            baseURL = KeyManager.shared.addKey(url: url)
        }
        guard let url = URL(string: baseURL) else { return nil}
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let body = data {
            let requestBody = try! JSONEncoder().encode(body)
            request.httpBody = requestBody
            
        }
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    func getJsonObject(completion: @escaping(ResultLast<User>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        guard let request = formRequest(url: url, method: .get) else { return }
        self.request(request: request, completion: completion)
    }
    
    func postJsonObject(body: User, completion: @escaping(ResultLast<User>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        guard let request = formRequest(url: url, data: body, method: .post) else { return }
        self.request(request: request, completion: completion)
    }
    
    func request<T: Decodable>(request: URLRequest, completion: @escaping(ResultLast<T>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.networkError(error.localizedDescription))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.networkError(Errors.ERR_CONVERTING_TO_HTTP_RESPONSE))
                return
            }
            
            guard let data = data else {
                completion(.serverError(ErrorResponse(code: httpResponse.statusCode, message: Errors.ERR_NIL_BODY)))
                return
            }
            
            if (200..<300).contains(httpResponse.statusCode) {
                let responseBody: ResultLast<T> = self.parseResponse(data: data)
                completion(responseBody)
            } else {
                let responseBody: ResultLast<T> = self.parseError(data: data)
                completion(responseBody)
            }
        }
        
        task.resume()
    }
    
   
    
}

extension NetworkManager {
    private func parseResponse<T: Decodable>(data: Data) -> ResultLast<T> {
        do {
            return .success(try JSONDecoder().decode(T.self, from: data))
        } catch {
            return parseError(data: data)
        }
    }
    
    private func parseError<T>(data: Data) -> ResultLast<T> {
        do {
            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
            return .serverError(errorResponse)
        } catch {
            return .serverError(ErrorResponse(code: 0, message: Errors.ERR_PARSE_ERROR_RESPONSE))
        }
    }
}
