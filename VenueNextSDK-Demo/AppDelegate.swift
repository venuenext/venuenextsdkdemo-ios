//  Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNCore
import VNOrderData
import VNOrderUI
import VNWalletUI
import PresenceSDK

class CustomWalletTheme: VNWalletBaseTheme {
    override var accent: UIColor {
        return navigationBarBackground
    }
}

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
        PresenceSDK.getPresenceSDK().setConfig(consumerKey: "NCA8hpkFiPJsDp03oX0sTXZri1jYLvhY", displayName: "Demo App", useNewAccountsManager: true)
        PresenceSDK.getPresenceSDK().setBrandingColor(color: VN.theme.primaryAccent)
        
        //Configure Payment processor (place this above modules that will need it)
        VenueNext.configure(paymentProcessor: PaymentAdapter())
        //configure wallet
        VenueNext.configure(wallet: VNWallet.shared, walletDelegate: self, theme: CustomWalletTheme())
        //turn on wallet for VNOrder
        VenueNext.enableWallet(for: VNOrder.shared)
        //Uncomment if you want to pass in a custom theme
        //VenueNext.configure(theme: <Custom Theme>)
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController(for: isSwift)
        window?.makeKeyAndVisible()

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let presenter = window?.rootViewController else {
            return false
        }
        
        let canHandle = VenueNext.canHandle(url: url)
        
        if canHandle {
            //must pass a valid presenter for this to work properly
            VenueNext.handle(url: url, presenter: presenter, completion: nil)
        }
        
        return canHandle
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
            VenueNext.shared.initialize(sdkKey: "vn:venuenext:dev:ios-sdk-WVtWMWcBZSItKf7lbEtxP9GsEgW0XqCmI1Y=", sdkSecret: "MrE9ZvCaW/8wWdba5iB5+uG/AEzQKM0pS605CDL5GcyI5537jcbCvJ6FU9yPxW8C4iC/EKnZi7QwduZw+3s/JQ==")
            Analytics.initialize(with: CustomAnalytics())
        case false:
            ObjCConfiguration.start()
        }
    }
}

extension AppDelegate: VNWalletDelegate {
    func virtualCurrencyName() -> String {
        return "Virtual Currency"
    }
    
    func walletModeConfig() -> WalletModeConfig {
        return WalletModeConfig() // modes: [.qrCode, .qrScanner, .virtualCurrencyToggle]
    }
    
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
        return "magic_money" //or "vn_bank"
    }
}
