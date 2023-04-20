//
//  RegisterViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 13.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var didSendEventClosure: ((RegisterViewController.Event) -> Void)?
    
    private let avatarView:  UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "spiderman"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let userName: MTIconWithTextField = {
        
        let textField = MTIconWithTextField()
        let viewModel = MTIconWithTextFieldViewModel(icon: "person.fill", placeholder: "Enter your username")
        textField.configure(with: viewModel)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let password: MTIconWithTextField = {
        
        let textField = MTIconWithTextField()
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password", isPassword: true)
        textField.configure(with: viewModel)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let repassword: MTIconWithTextField = {
        
        let textField = MTIconWithTextField()
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password again", isPassword: true)
        textField.configure(with: viewModel)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    private let registerButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(named: "DarkYellow")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        self.hideKeyboardWhenTappedAround()
        
       
        userName.delegate = self
        password.delegate = self
        repassword.delegate = self
        configureUI()
    }
    
    deinit {
        print("LoginViewController deinit")
    }
    
    private func configureUI() {
        configureAvatar()
        configureUserName()
        configurePassword()
        configureRePassword()
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
    
    private func configureRePassword() {
        view.addSubview(repassword)
        
        NSLayoutConstraint.activate([
            repassword.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            repassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            repassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            repassword.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    private func configureRegisterButton() {
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: repassword.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    @objc private func didTapRegisterButton() {
        let registerEvent = Event.register
        didSendEventClosure?(registerEvent)
    }

}

//MARK: - RegisterViewController Extension

extension RegisterViewController {
    enum Event {
        case register
    }
}


extension RegisterViewController: MTIconWithTextFieldDelegate {
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
