//
//  RegisterViewModel.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 27.06.2023.
//

import Foundation
import FirebaseAuth

final class RegisterViewModel: RegisterViewModelProtocol {
    
    weak var delegate: RegisterViewModelDelegate?
    private let existUsername = "testUser"
    private var username = ""
    private var password = ""
    private var repassword = ""
    
    func registerUIEvents(_ event: RegisterUIEvent) {
        switch event {
        case .handleUsername(let username):
            self.username = username
            notify(.registerButtonActive(isActive: registerButtonIsActive()))
            notify(.hasError(type: nil))
        case .handlePassword(let password):
            self.password = password
            notify(.registerButtonActive(isActive: registerButtonIsActive()))
            notify(.hasError(type: nil))
        case .handleRePassword(let repassword):
            self.repassword =  repassword
            notify(.registerButtonActive(isActive: registerButtonIsActive()))
            notify(.hasError(type: nil))
        case .handleRegister:
            let errorType = findErrorType()
            guard let guardedErrorType = errorType else { return handleRegister() }
            
            notify(.hasError(type: guardedErrorType))
        }
    }
    
    private func handleRegister() {
        Auth.auth().createUser(withEmail: username, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            guard let user = authResult?.user, error == nil else {
                strongSelf.notify(.hasError(type: .registerUsernameError))
                return
            }
            strongSelf.notify(.success)
            print("\(user.email!) created")
        }
    }
    
    private func registerButtonIsActive() -> Bool {
        return username.count > 0 && password.count > 0 && repassword.count > 0
    }
    
    private func findErrorType() -> ErrorText? {
        let existUser = username == existUsername
        let passwordNotMatch = password != repassword
        
        if passwordNotMatch {
            return .registerPasswordError
        }
        
        if existUser {
            return .registerUsernameError
        }
        
        return nil
    }
    
    
    private func notify(_ outputEvent: RegisterViewModelOutput) {
        delegate?.registerViewModelOutputs(outputEvent)
    }
    
}
