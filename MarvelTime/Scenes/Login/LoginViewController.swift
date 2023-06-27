//
//  LoginViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import UIKit

enum Icon: String {
    case username = "person.fill"
    case password = "lock.fill"
    
    func toImage() -> UIImage {
        return UIImage(systemName: self.rawValue)!
    }
}

enum PlaceHolder: String {
    case username = "Enter your username"
    case password = "Enter your password"
    case repassword = "Enter your password again"
}

class LoginViewController: UIViewController {
    
    var didSendEventClosure: ((LoginViewController.Event) -> Void)?
    private var isLoginButtonActive = false {
        didSet {
            loginButton.backgroundColor = isLoginButtonActive ? UIColor(named: "DarkYellow") : .gray
            loginButton.isEnabled = isLoginButtonActive
        }
    }
    private var viewModel: LoginViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private let avatarView: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "wolverine")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    private let userName = MTIconWithTextField(icon: Icon.username.toImage(), placeholder: PlaceHolder.username.rawValue)
    
    private let password = MTIconWithTextField(icon: Icon.password.toImage(), placeholder: PlaceHolder.password.rawValue, isPassword: true)
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Wrong username or password"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "Red")
        label.layer.opacity = 0
        return label
    }()
    
    private let loginButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        
        
        return button
    }()
    
    private let registerButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Don't have an account. Register", for: .normal)
        button.setTitleColor(UIColor(named: "DarkYellow"), for: .normal)
        button.backgroundColor = .clear
        
        return button
    }()
    
    lazy var textFieldStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        stackView.addSubviews([userName, password, errorLabel])
        return stackView
    }()
    
    lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addSubviews([loginButton, registerButton])
        return stackView
    }()
    
    lazy var loginStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 60.0
        stackView.addSubviews([ avatarView,textFieldStack, buttonStack])
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        view.backgroundColor = UIColor(named: "DarkGray")
        self.navigationItem.backButtonTitle = "Login"
        self.hideKeyboardWhenTappedAround()
        
        configureUI()
        animatedAppear()
        userName.delegate = self
        password.delegate = self
    }
    
    private func configureUI() {
        configureLoginStack()
        configureLoginButton()
        configureRegisterButton()
        initialLocation()
        
    }
    
    private func initialLocation() {
        avatarView.center.x -= view.bounds.width
        textFieldStack.center.x -= view.bounds.width
        buttonStack.center.y += view.bounds.height
        
    }
    
    private func animatedAppear() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut]) {
            self.avatarView.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseOut]) {
            self.textFieldStack.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 1, delay: 0.8, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3) {
            self.buttonStack.center.y -= self.view.bounds.height
        }
    }
    
    private func configureLoginStack() {
        view.addSubview(loginStack)
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            loginStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
        ])
    }
    
    
    private func configureLoginButton() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    private func configureRegisterButton() {
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        viewModel.LoginUIEvents(.handleLogin)
        
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
    func textDidChange(text: String, type: MTIconWithTextFieldType) {
        print("textChange", text)
    }
    
    func textFieldDidEndEditing(text: String, type: MTIconWithTextFieldType) {
        switch type {
        case .username:
            viewModel.LoginUIEvents(.handleUsername(username: text))
        case .password:
            viewModel.LoginUIEvents(.handlePassword(password: text))
        }
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    func LoginViewModelOutputs(_ outputEvent: LoginViewModelOutput) {
        switch outputEvent {
        case .success:
            let loginEvent = Event.login
            didSendEventClosure?(loginEvent)
        case .hasError(let error):
            errorLabel.layer.opacity = error ? 1.0 : 0
        case .loginButtonActive(let isActive):
            print("isActive", isActive)
            isLoginButtonActive = isActive
        }
    }
    
    
}
