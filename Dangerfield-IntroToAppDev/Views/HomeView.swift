//
//  HomeView.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//
import Foundation
import UIKit
class HomeView: UIView{
    
    var signOut: ActionButton = {
        let button = ActionButton()
        button.setTitle("Sign Out", for: .normal)
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
        self.addSubview(signOut)
        setConstraints()
    }
    
    private func setConstraints(){
        
        Constraints.constraintWithBottomAndCenterXAnchor(field: signOut, width: UIElementSizes.windowWidth-40, height: UIElementSizes.actionButtonHeight, bottomAnchor: bottomAnchor, bottomConstatnt: -100, centerXAnchor: centerXAnchor, centerXConstant: 0)
    }
}
