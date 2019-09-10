//  Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNCore
import VNOrderData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // VenueNext SDKs can be configured from Swift or ObjC
        // To run the ObjC app set isSwiftDemoApp to false

        let isSwiftDemoApp = false
        
        startConfiguration(for: isSwiftDemoApp)
        Appearance.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController(for: isSwiftDemoApp)
        window?.makeKeyAndVisible()
        return true
    }
    
    func tabBarController(for isSwiftDemoApp: Bool) -> UIViewController {
        switch isSwiftDemoApp {
        case true:
            return TabBarController()
        case false:
            return ObjCTabBarController()
        }
    }
    
    func startConfiguration(for isSwiftDemoApp: Bool) {
        switch isSwiftDemoApp {
        case true:
            SwiftConfiguration.start()
        case false:
            ObjCConfiguration.start()
        }
    }
}
