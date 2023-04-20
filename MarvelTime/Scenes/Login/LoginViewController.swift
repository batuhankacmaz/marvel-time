//
//  LoginViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var didSendEventClosure: ((LoginViewController.Event) -> Void)?
    
    private let avatarView: UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "wolverine"))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let userName: MTIconWithTextField = {
        
        let viewModel = MTIconWithTextFieldViewModel(icon: "person.fill", placeholder: "Enter your username")
        let textField = MTIconWithTextField()
        textField.configure(with: viewModel)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    private let password: MTIconWithTextField = {
        
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password", isPassword: true)
        let textField = MTIconWithTextField()
        textField.configure(with: viewModel)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(named: "DarkYellow")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    private let registerButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Don't have an account. Register", for: .normal)
        button.setTitleColor(UIColor(named: "DarkYellow"), for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        self.navigationItem.backButtonTitle = "Login"
        self.hideKeyboardWhenTappedAround()
        
        userName.delegate = self
        password.delegate = self
        configureUI()
        
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
        view.addSubview(avatarView)
        
        NSLayoutConstraint.activate([
            avatarView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 160),
            avatarView.heightAnchor.constraint(equalToConstant: 160),
        ])
    }
    
    private func configureUserName() {
        view.addSubview(userName)
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userName.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configurePassword() {
        view.addSubview(password)
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            password.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureLoginButton() {
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
    }
    
    @objc private func didTapRegisterButton() {
        let registerEvent = Event.register
        didSendEventClosure?(registerEvent)
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
