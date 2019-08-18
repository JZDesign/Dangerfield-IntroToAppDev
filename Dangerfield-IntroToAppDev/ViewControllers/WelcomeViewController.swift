//
//  WelcomeViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //lazy such that the navigationBarHeigh can update before view uses the value
    lazy var mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        UIElementSizes.navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        UIElementSizes.statusBarHeight = getStatusBarHeight()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    fileprivate func setupView(){
        //styleistic choice to remove background of navigation controller
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        mainView.signinButton.addTarget(self, action: #selector(handleSignInClick(sender:)), for: .touchUpInside)
        mainView.signupButton.addTarget(self, action: #selector(handleSignUpClick(sender:)), for: .touchUpInside)

        view = mainView
    }
    
    fileprivate func getStatusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height)
    }
    
    @objc
    func handleSignInClick(sender: ActionButton){
        let signInVC = SignInViewController()
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    @objc
    func handleSignUpClick(sender: ActionButton){
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

}
