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
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let userName: MTIconWithTextField = {
        
        let textField = MTIconWithTextField()
        let viewModel = MTIconWithTextFieldViewModel(icon: "person.fill", placeholder: "Enter your username")
        textField.configure(with: viewModel)
        
        return textField
    }()
    
    private let password: MTIconWithTextField = {
        
        let textField = MTIconWithTextField()
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password", isPassword: true)
        textField.configure(with: viewModel)
        
        return textField
    }()
    
    private let repassword: MTIconWithTextField = {
        
        let textField = MTIconWithTextField()
        let viewModel = MTIconWithTextFieldViewModel(icon: "lock.fill", placeholder: "Enter your password again", isPassword: true)
        textField.configure(with: viewModel)
        
        return textField
    }()
    private let registerButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(named: "DarkYellow")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()
    
    lazy var textFieldStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addSubviews([userName, password, repassword])
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
        
        view.backgroundColor = UIColor(named: "DarkGray")
        self.hideKeyboardWhenTappedAround()
        
        configureUI()
        userName.delegate = self
        password.delegate = self
        repassword.delegate = self
    }
    
    deinit {
        print("LoginViewController deinit")
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
