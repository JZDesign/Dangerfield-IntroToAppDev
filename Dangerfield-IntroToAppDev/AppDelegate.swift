//
//  AppDelegate.swift
//  Dangerfield-IntroToAppDev
//
//  Created by Jacob Rakidzich on 8/17/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()

        //code to help use programatic views
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = HomeViewController()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()

        return true
    }

}
