//
//  AppDelegate.swift
//  albelliTest
//
//  Created by Alex Yaroshyn on 08/01/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        /* Create ui-view-controller instance*/
        let homeModule = HomeRouter.createModule()
        /* Initiating instance of ui-navigation-controller with view-controller */
        let navigationController = UINavigationController()
        navigationController.viewControllers = [homeModule]
        
        window = UIWindow()
        window?.rootViewController = navigationController //UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
        return true
    }
}
