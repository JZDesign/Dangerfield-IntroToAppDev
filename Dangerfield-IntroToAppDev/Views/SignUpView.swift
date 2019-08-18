//
//  SignUpView.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
import UIKit
class SignUpView: UIView{
    
    
    var emailTextField : SimpleTextField = {
        let textField = SimpleTextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var passwordTextField : SimpleTextField = {
        let textField = SimpleTextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var confirmPasswordTextField : SimpleTextField = {
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
    
    private func setupView(){
        backgroundColor = Colors.primaryColor
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(signUpButton)
        self.addSubview(confirmPasswordTextField)
        setConstraints()
    }
    
    private func setConstraints(){
        
        Constraints.constrainWithTopAndLeadingAndTrailing(field: emailTextField, width: 0, height: UIElementSizes.actionButtonHeight, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarHeight + UIElementSizes.statusBarHeight + UIElementSizes.windowHeight/10, leadingAnchor: leadingAnchor, leadingConstant: 20, trailingAnchor: trailingAnchor, trailingConstant: -20)
        
        Constraints.constrainWithTopAndLeadingAndTrailing(field: passwordTextField, width: 0, height: UIElementSizes.actionButtonHeight, topAnchor: emailTextField.bottomAnchor, topConstant: 20, leadingAnchor: emailTextField.leadingAnchor, leadingConstant: 0, trailingAnchor: emailTextField.trailingAnchor, trailingConstant: 0)
        
         Constraints.constrainWithTopAndLeadingAndTrailing(field: confirmPasswordTextField, width: 0, height: UIElementSizes.actionButtonHeight, topAnchor: passwordTextField.bottomAnchor, topConstant: 20, leadingAnchor: emailTextField.leadingAnchor, leadingConstant: 0, trailingAnchor: emailTextField.trailingAnchor, trailingConstant: 0)
        
        Constraints.constrainWithTopAndLeadingAndTrailing(field: signUpButton, width: 0, height: UIElementSizes.actionButtonHeight, topAnchor: confirmPasswordTextField.bottomAnchor, topConstant: 30, leadingAnchor: emailTextField.leadingAnchor, leadingConstant: 0, trailingAnchor: emailTextField.trailingAnchor, trailingConstant: 0)
        
    }
}
