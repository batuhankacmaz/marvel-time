//
//  LoginViewModel.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 25.06.2023.
//

import Foundation

final class LoginViewModel: LoginViewModelProtocol {
    
    var delegate: LoginViewModelDelegate?
    private var username = ""
    private var password = ""
    
    func LoginUIEvents(_ event: LoginUIEvent) {
        switch event {
        case .handleUsername(let username):
            self.username = username
            let isActive = loginButtonIsActive()
            notify(.loginButtonActive(isActive: isActive))
            notify(.hasError(error: false))
        case .handlePassword(let password):
            self.password = password
            let isActive = loginButtonIsActive()
            notify(.loginButtonActive(isActive: isActive))
            notify(.hasError(error: false))
        case .handleLogin:
            let successLogin = username.count > 2 && password.count > 2
            if successLogin {
                notify(.success)
            } else {
                notify(.hasError(error: true))
            }
        }
    }
    
    private func loginButtonIsActive() -> Bool {
        return username.count > 0 && password.count > 0
    }
    
    
    private func notify(_ outputEvent: LoginViewModelOutput) {
        delegate?.LoginViewModelOutputs(outputEvent)
    }
    
}
