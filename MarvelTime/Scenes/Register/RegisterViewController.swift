//
//  RegisterViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 13.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    var didSendEventClosure: ((RegisterViewController.Event) -> Void)?
    
    private let avatarView = UIImageView()
    private let userName = MTIconWithTextField()
    private let password = MTIconWithTextField()
    private let repassword = MTIconWithTextField()
    private let registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        configureUI()
      
        self.hideKeyboardWhenTappedAround()
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
        avatarView.image = UIImage(named: "spiderman")
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.contentMode = .scaleAspectFill
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
    
    private func configureRePassword() {
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password again", isPassword: true)
        repassword.configure(with: viewModel)
        repassword.translatesAutoresizingMaskIntoConstraints = false
        repassword.delegate = self
        view.addSubview(repassword)
        NSLayoutConstraint.activate([
            repassword.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            repassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            repassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            repassword.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    private func configureRegisterButton() {
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = UIColor(named: "DarkYellow")
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 8.0
        registerButton.translatesAutoresizingMaskIntoConstraints = false

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
        print("Register tapped!!")
        //        print("username: \(String(describing: userName.textField.text))")
        //        print("password: \(String(describing: password.textField.text))")
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
