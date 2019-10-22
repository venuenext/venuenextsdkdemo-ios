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
    
        let isSwift = true
        
        Appearance.start()
        
        //Initialize VenueNext SDK
        intializeSDK(for: isSwift)
        
        //Setup PresenceSDK
        PresenceSDK.getPresenceSDK().setConfig(consumerKey: "PRESENCE SDK KEY", displayName: "Demo App", useNewAccountsManager: true)
        PresenceSDK.getPresenceSDK().setBrandingColor(color: VN.theme.primaryAccent)
        
        //configure wallet
        VenueNext.configure(wallet: VNWallet.shared, walletDelegate: self, theme: nil)
        //turn on wallet for VNOrder
        VenueNext.enableWallet(for: VNOrder.shared)
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController(for: isSwift)
        window?.makeKeyAndVisible()

        return true
    }
    
    func tabBarController(for isSwift: Bool) -> UIViewController {
        switch isSwift {
        case true:
            return TabBarController()
        case false:
            return ObjCTabBarController()
        }
    }
    
    func intializeSDK(for isSwift: Bool) {
        switch isSwift {
        case true:
            // use the following code in your application:didFinishLaunchingWithOptions:
            VenueNext.shared.initialize(sdkKey: "VENUENEXT SDK KEY", sdkSecret: "SDK_SECRET")
            Analytics.initialize(with: CustomAnalytics())
        case false:
            ObjCConfiguration.start()
        }
    }
}

extension AppDelegate: VNWalletDelegate {
    
    func walletUser() -> VNWalletUser? {
        return nil
    }
    
    func loginController(completion: @escaping (VNWalletUser?, NSError?) -> Void) -> UIViewController {
        let presenceController = PresenceController()
        presenceController.logout()
        presenceController.loginCompletion = { (member, error) in
            guard let firstName = member?.firstName,
                let lastName = member?.lastName,
                let email = member?.email,
                let externalID = member?.id else {
                    let error = NSError(domain: "com.venuenext.VNWallet", code: 404, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve member information"])
                    completion(nil, error)
                    return
            }
            let walletUser = VNWalletUser(firstName: firstName, lastName: lastName, email: email, externalID: externalID)
            completion(walletUser, nil)
        }
        return presenceController
    }
    
    func walletTitle() -> String {
        return "Magic Money"
    }
    
    func walletVirtualCurrencyPaymentType() -> String {
        return "magic_money"
    }
}
