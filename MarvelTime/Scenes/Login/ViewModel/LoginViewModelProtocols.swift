//
//  LoginViewModelProtocols.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 25.06.2023.
//

import Foundation

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate? { get set }
    
    func LoginUIEvents(_ event: LoginUIEvent)
}

protocol LoginViewModelDelegate {
    func LoginViewModelOutputs(_ outputEvent: LoginViewModelOutput)
}

enum LoginViewModelOutput {
    case success
    case hasError(error: Bool)
    case loginButtonActive(isActive: Bool)
}

enum LoginUIEvent {
    case handleUsername(username: String)
    case handlePassword(password: String)
    case handleLogin
}
