//
//  RegisterViewModelProtocols.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 27.06.2023.
//

import Foundation

protocol RegisterViewModelProtocol {
    var delegate: RegisterViewModelDelegate? { get set }
    
    func registerUIEvents(_ event: RegisterUIEvent)
}

protocol RegisterViewModelDelegate: AnyObject {
    func registerViewModelOutputs(_ outputEvent: RegisterViewModelOutput)
}

enum RegisterUIEvent {
    case handleUsername(username: String)
    case handlePassword(password: String)
    case handleRePassword(repassword: String)
    case handleRegister
}

enum RegisterViewModelOutput {
    case success
    case hasError(type: ErrorText? = nil)
    case registerButtonActive(isActive: Bool)
}



