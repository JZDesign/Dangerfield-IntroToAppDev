//
//  SignInView.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
import UIKit
class SignInView: UIView{
    
    var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var emailTextField : SimpleTextField = {
        let textField = SimpleTextField()
        textField.placeholder = "Enter Your Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        self.addSubview(titleLabel)
        self.addSubview(emailTextField)
        setConstraints()
    }
    
    private func setConstraints(){
        Constraints.constraintWithTopAndCenterXAnchor(field: titleLabel, width: 0, height: 0, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarHeight + UIElementSizes.statusBarHeight, centerXAnchor: centerXAnchor, centerXConstant: 0)
        Constraints.constraintWithTopAndCenterXAnchor(field: emailTextField, width: 300, height: 50, topAnchor: titleLabel.bottomAnchor, topConstant: 50, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
    }
}
