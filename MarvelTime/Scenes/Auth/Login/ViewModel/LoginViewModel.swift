//
//  LoginViewModel.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 25.06.2023.
//

import Foundation
import FirebaseAuth

final class LoginViewModel: LoginViewModelProtocol {
    
    weak var delegate: LoginViewModelDelegate?
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
            handleLogin()
        }
    }
    
    private func handleLogin() {
        Auth.auth().signIn(withEmail: username, password: password) {
            [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            guard let user = authResult?.user, error == nil else {
                strongSelf.notify(.hasError(error: true))
                return
            }
            strongSelf.notify(.success)
            print("\(user.email!) opened")
        }
    }
    
    private func loginButtonIsActive() -> Bool {
        return username.count > 0 && password.count > 0
    }
    
    
    private func notify(_ outputEvent: LoginViewModelOutput) {
        delegate?.LoginViewModelOutputs(outputEvent)
    }
    
}
