//
//  LoginViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
    var didSendEventClosure: ((LoginViewController.Event) -> Void)?
    
    private let avatarView = UIImageView()
    private let userName = MTIconWithTextField()
    private let password = MTIconWithTextField()
    private let loginButton = UIButton()
    private let registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        configureUI()
      
        self.navigationItem.backButtonTitle = "Login"
        self.hideKeyboardWhenTappedAround()
    }
    
    deinit {
        print("LoginViewController deinit")
    }
    
    private func configureUI() {
        configureAvatar()
        configureUserName()
        configurePassword()
        configureLoginButton()
        configureRegisterButton()
        
    }
    

    private func configureAvatar() {
        avatarView.image = UIImage(named: "wolverine")
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarView)
        NSLayoutConstraint.activate([
            avatarView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 160),
            avatarView.heightAnchor.constraint(equalToConstant: 160),
        ])
        
    }
    
    private func configureUserName() {
        let viewModel = MTIconWithTextFieldViewModel(icon: "person.fill", placeholder: "Enter your username")
        userName.configure(with: viewModel)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.delegate = self
        view.addSubview(userName)
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userName.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configurePassword() {
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password", isPassword: true)
        password.configure(with: viewModel)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.delegate = self
        view.addSubview(password)
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            password.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor(named: "DarkYellow")
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8.0
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    private func configureRegisterButton() {
        registerButton.setTitle("Don't have an account. Register", for: .normal)
        registerButton.setTitleColor(UIColor(named: "DarkYellow"), for: .normal)
        registerButton.backgroundColor = .clear
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        let loginEvent = Event.login
        didSendEventClosure?(loginEvent)
        //        print("username: \(String(describing: userName.textField.text))")
        //        print("password: \(String(describing: password.textField.text))")
    }
    
    @objc private func didTapRegisterButton() {
       let registerEvent = Event.register
//        didSendEventClosure?(loginEvent)
        didSendEventClosure?(registerEvent)
        //        print("username: \(String(describing: userName.textField.text))")
        //        print("password: \(String(describing: password.textField.text))")
    }
    
}

//MARK: - LoginViewController Extension

extension LoginViewController {
    enum Event {
        case login
        case register
    }
}


extension LoginViewController: MTIconWithTextFieldDelegate {
    func textDidChange(text: String?) {
        print(text ?? "")
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("Begin editing")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("DidEndEditing")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        print("Textfield")
    }
    
    
}
