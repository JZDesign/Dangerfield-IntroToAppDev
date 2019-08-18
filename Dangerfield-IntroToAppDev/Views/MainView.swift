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
        //set a max font so it adjusts to width
        label.font = UIFont(name: "HelveticaNeue-Bold", size:100)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
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
        
        Constraints.constraintWithTopAndCenterXAnchor(field: titleLabel, width:UIElementSizes.windowWidth - 80 , height: 0, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarHeight + UIElementSizes.statusBarHeight , centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        //height constrainted to hold 2 action buttons w/ 20 spacing
        //topConstant to push to bottom 4th of screen
       Constraints.constrainWithTopAndLeadingAndTrailing(field: buttonStackView, width: 0, height: 2 * UIElementSizes.actionButtonHeight + 20, topAnchor: centerYAnchor, topConstant: UIElementSizes.windowHeight/4 ,leadingAnchor: leadingAnchor, leadingConstant: 20, trailingAnchor: trailingAnchor, trailingConstant: -20)

        
    }
    
}
