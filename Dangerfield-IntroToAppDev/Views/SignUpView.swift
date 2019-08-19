//
//  SignUpView.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
import UIKit
class SignUpView: UIView {

    var emailTextField: SimpleTextField = {
        let textField = SimpleTextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    var passwordTextField: SimpleTextField = {
        let textField = SimpleTextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    var confirmPasswordTextField: SimpleTextField = {
        let textField = SimpleTextField()
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    var signUpButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        backgroundColor = Colors.primaryColor
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(signUpButton)
        self.addSubview(confirmPasswordTextField)
        setConstraints()
    }

    private func setConstraints() {

        emailTextField
            .height(UIElementSizes.actionButtonHeight)
            .top(safeAreaLayoutGuide.topAnchor, constant: UIElementSizes.windowHeight/10)
            .leading(leadingAnchor, constant: 20)
            .trailing(trailingAnchor, constant: -20)
            .build()

        passwordTextField
            .height(UIElementSizes.actionButtonHeight)
            .top(emailTextField.bottomAnchor, constant: 20)
            .leading(emailTextField.leadingAnchor)
            .trailing(emailTextField.trailingAnchor)
            .build()

        confirmPasswordTextField
            .height(UIElementSizes.actionButtonHeight)
            .top(passwordTextField.bottomAnchor, constant: 20)
            .leading(emailTextField.leadingAnchor)
            .trailing(emailTextField.trailingAnchor)
            .build()

        signUpButton
            .height(UIElementSizes.actionButtonHeight)
            .top(confirmPasswordTextField.bottomAnchor, constant: 20)
            .leading(emailTextField.leadingAnchor)
            .trailing(emailTextField.trailingAnchor)
            .build()
    }
}
