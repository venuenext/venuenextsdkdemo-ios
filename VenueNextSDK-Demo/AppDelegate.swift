//
//  AppDelegate.swift
//  VenueNextSDK-Demo
//
//  Created by Nathan Fulkerson on 5/16/19.
//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import UIKit
import VNCore
import VNOrderData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let key = ProcessInfo.processInfo.environment["key"] ?? ""
        let secret = "dev"
        VenueNext.shared.initialize(sdkKey: key, sdkSecret: secret) { success, error in
            guard success else {
                return
            }
            VNOrderData.shared.reloadStands()
        }

        UITabBar.appearance().tintColor = .accent
        UITabBar.appearance().barTintColor = .primaryDark
        UITabBar.appearance().unselectedItemTintColor = .primary
        UINavigationBar.appearance().barTintColor = .primaryDark
        UINavigationBar.appearance().tintColor = .accent
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.accent]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        return true
    }

}

