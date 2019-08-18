//
//  MainView.swift
//  Basic App
//
//  Created by eli dangerfield on 6/5/19.
//  Copyright © 2019 eli dangerfield. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView{
    
    var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Welcome User!"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var signupButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var signinButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signupButton,signinButton])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    fileprivate func setupView() {
        
        backgroundColor = Colors.primaryColor
        
        self.addSubview(titleLabel)
        self.addSubview(buttonStackView)
        
        setConstraints()
        
    }
    
    fileprivate func setConstraints(){
        
        Constraints.constraintWithTopAndCenterXAnchor(field: titleLabel, width: 0, height: 30, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarHeight + UIElementSizes.statusBarHeight + 75, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
       Constraints.constrainWithBottomAndLeadingAndTrailing(field: buttonStackView, width: 0, height: 2 * UIElementSizes.actionButtonHeight + 20, bottomAnchor: bottomAnchor, bottomConstant: -100, leadingAnchor: leadingAnchor, leadingConstant: 20, trailingAnchor: trailingAnchor, trailingConstant: -20)

        
    }
    
}
