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
        view = mainView
    }
    
    fileprivate func getStatusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height)
    }
    

}
