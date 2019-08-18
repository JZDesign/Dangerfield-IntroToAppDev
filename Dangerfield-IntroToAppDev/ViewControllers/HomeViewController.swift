//
//  HomeViewController.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    var homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                print("User was not authenticated")
                let navigationController = UINavigationController(rootViewController: WelcomeViewController())
                self.present(navigationController, animated: false, completion: nil)
            }
        }else{
            setupView()
        }
    }
    
    
    fileprivate func setupView(){
        //styleistic choice to remove background of navigation controller
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        homeView.signOut.addTarget(self, action: #selector(handleSignOutClick(sender:)), for: .touchUpInside)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
        
        view = homeView
    }
    
    @objc
    func handleSignOutClick(sender: ActionButton){
        if FirebaseConnection.signOutUser() {
            let navigationController = UINavigationController(rootViewController: WelcomeViewController())
            self.present(navigationController, animated: false, completion: nil)
        }
    }
    

}
