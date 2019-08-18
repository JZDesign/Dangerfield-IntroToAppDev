//
//  SignUpViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    

    fileprivate func setupView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sign Up"
        
        view = signUpView
    }

}
