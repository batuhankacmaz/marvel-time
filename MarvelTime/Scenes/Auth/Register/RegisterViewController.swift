//
//  RegisterViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 13.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var didSendEventClosure: ((RegisterViewController.Event) -> Void)?
    private var viewModel: RegisterViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var isRegisterButtonActive: Bool! {
        didSet {
            registerButton.backgroundColor = isRegisterButtonActive ? UIColor(named: "DarkYellow") : .gray
            registerButton.isEnabled = isRegisterButtonActive
        }
    }
    
    private let avatarView:  UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "spiderman"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let userName = MTIconWithTextField(icon: Icon.username.toImage(), placeholder: PlaceHolder.username.rawValue, type: .username)
    
    private let password = MTIconWithTextField(icon: Icon.password.toImage(), placeholder: PlaceHolder.password.rawValue, type: .password)
    
    private let repassword = MTIconWithTextField(icon: Icon.password.toImage(), placeholder: PlaceHolder.repassword.rawValue, type: .repassword)
    
    private let registerButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(named: "DarkYellow")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()
    
    private let errorLabel: MTErrorLabel = {
        let label = MTErrorLabel(label: .registerUsernameError)
        label.layer.opacity = 0
        return label
    }()
    
    lazy var textFieldStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.addSubviews([userName, password, repassword, errorLabel])
        return stackView
    }()
    
    lazy var registerStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 60.0
        stackView.distribution = .equalCentering
        stackView.addSubviews([ avatarView, textFieldStack, registerButton])
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RegisterViewModel()
        isRegisterButtonActive = false
        view.backgroundColor = UIColor(named: "DarkGray")
        self.hideKeyboardWhenTappedAround()
        
        configureUI()
        userName.delegate = self
        password.delegate = self
        repassword.delegate = self
    }

    
    private func configureUI() {
        configureRegisterStack()
        configureRegisterButton()
        
    }
    
    private func configureRegisterStack() {
        view.addSubview(registerStack)
        registerStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registerStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            registerStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        
        ])
    }
    
    private func configureRegisterButton() {
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    @objc private func didTapRegisterButton() {
        viewModel.registerUIEvents(.handleRegister)
   
    }

}

//MARK: - RegisterViewController Extension

extension RegisterViewController {
    enum Event {
        case register
    }
}


extension RegisterViewController: MTIconWithTextFieldDelegate {
    func textDidChange(text: String, type: MTIconWithTextFieldType) {
    }
    
    func textFieldDidEndEditing(text: String, type: MTIconWithTextFieldType) {
        switch type {
        case .username:
            viewModel.registerUIEvents(.handleUsername(username: text))
        case .password:
            viewModel.registerUIEvents(.handlePassword(password: text))
        case .repassword:
            viewModel.registerUIEvents(.handleRePassword(repassword: text))
        }
    }

}

extension RegisterViewController: RegisterViewModelDelegate {
    func registerViewModelOutputs(_ outputEvent: RegisterViewModelOutput) {
        switch outputEvent {
        case .success:
            let registerEvent = Event.register
            didSendEventClosure?(registerEvent)
        case .hasError(let type):
            guard let guardedType = type else { return errorLabel.layer.opacity = 0 }
            errorLabel.configureLabel(label: guardedType)
            errorLabel.layer.opacity = 1.0
            print("type", guardedType)
        case .registerButtonActive(let isActive):
            isRegisterButtonActive = isActive
        }
    }
    
    
}
