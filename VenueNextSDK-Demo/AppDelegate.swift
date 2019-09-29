//  Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNCore
import VNOrderData
import VNOrderUI
import VNWalletUI
import PresenceSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // VenueNext SDKs can be configured from Swift or ObjC
        // To run the ObjC app set isSwiftDemoApp to false
    
        let isSwiftDemoApp = true
        
        startConfiguration(for: isSwiftDemoApp)
        Appearance.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController(for: isSwiftDemoApp)
        window?.makeKeyAndVisible()

        //Setup PresenceSDK
        PresenceSDK.getPresenceSDK().setConfig(consumerKey: "", displayName: "Demo App", useNewAccountsManager: true)
        PresenceSDK.getPresenceSDK().setBrandingColor(color: .accent)
        
       
        
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

