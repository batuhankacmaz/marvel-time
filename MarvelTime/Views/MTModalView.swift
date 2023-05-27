//
//  MTModalView.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 28.05.2023.
//

import UIKit

class MTModalView: UIView {
    
    //MARK: - Prepare UI
    private let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DarkGray")
        view.layer.cornerRadius = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dissapperView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    //MARK: - LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTapGesture()
        setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
    }
    
    //MARK: - FUNCTIONS
    
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissModal))
        dissapperView.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissModal() {
        removeFromSuperview()
    }
    
    func addCustomSubview(_ subviews: [UIView]) {
        stackView.addSubviews(subviews)
    }
    
    //MARK: - CONSTRAINTS
    
    private func setupConstraints() {
        setupDisappearView()
        setupModalView()
        setupStackView()
    }
    
    private func setupDisappearView() {
        dissapperView.fillSuperview(parentView: self)
    }
    
    private func setupModalView() {
        addSubview(modalView)
        
        NSLayoutConstraint.activate([
            modalView.centerXAnchor.constraint(equalTo: centerXAnchor),
            modalView.centerYAnchor.constraint(equalTo: centerYAnchor),
            modalView.heightAnchor.constraint(equalToConstant: 140),
            modalView.widthAnchor.constraint(equalToConstant: 200 ),
        ])
    }
    
    private func setupStackView() {
        stackView.fillSuperview(horizontalConstant: 10, verticalConstant: 10, parentView: modalView)
    }
}
