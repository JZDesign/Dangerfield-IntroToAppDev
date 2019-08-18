//
//  HomeViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    fileprivate func setupView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
        
        view = homeView
    }
    

}
