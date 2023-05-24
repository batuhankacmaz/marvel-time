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
        
        let image = UIImageView()
        image.image = UIImage(named: "wolverine")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let userName: MTIconWithTextField = {
        
        let viewModel = MTIconWithTextFieldViewModel(icon: "person.fill", placeholder: "Enter your username")
        let textField = MTIconWithTextField()
        textField.configure(with: viewModel)
      
        
        return textField
    }()
    private let password: MTIconWithTextField = {
        
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password", isPassword: true)
        let textField = MTIconWithTextField()
        textField.configure(with: viewModel)
   
        
        return textField
    }()

    private let loginButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(named: "DarkYellow")
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
        stackView.spacing = 40.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addSubviews([userName, password])
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
        stackView.addSubviews([ avatarView, textFieldStack, buttonStack])
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        self.navigationItem.backButtonTitle = "Login"
        self.hideKeyboardWhenTappedAround()
        
        configureUI()
        userName.delegate = self
        password.delegate = self
      
    }
    
    deinit {
        print("LoginViewController deinit")
    }
    
    private func configureUI() {
        configureLoginStack()
        configureLoginButton()
        configureRegisterButton()
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
