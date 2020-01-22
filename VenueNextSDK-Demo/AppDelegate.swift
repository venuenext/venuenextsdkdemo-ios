//  Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNCore
import VNOrderData
import VNOrderUI
import VNWalletUI
import VNPayment
import VNAnalytics
import PresenceSDK

class CustomWalletTheme: VNWalletBaseTheme {
    override var accent: UIColor {
        return navigationBarBackground
    }

    override var secondaryAccent: UIColor {
        return UIColor(red: 121/255.0, green: 188/255.0, blue: 67/255.0, alpha: 1)
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
        PresenceSDK.getPresenceSDK().setConfig(consumerKey: "", displayName: "Demo App", useNewAccountsManager: true)
        PresenceSDK.getPresenceSDK().setBrandingColor(color: VN.theme.primaryAccent)
        
        //Enable all wallet modes
        VNWallet.enableModes(walletModes: WalletMode.allCases)
        //Configure Payment processor (place this above modules that will need it)
        VenueNext.configure(paymentProcessor: PaymentAdapter())
        //configure wallet
        VenueNext.configure(wallet: VNWallet.shared, walletDelegate: self, theme: CustomWalletTheme())
        //turn on wallet for VNOrder
        VenueNext.enableWallet(for: VNOrder.shared)
        
        //Enable all product types to use VC
        VenueNext.enableVirtualCurrency(for: ProductType.allCases)
        //Uncomment if you want to pass in a custom theme
        //VenueNext.configure(theme: <Custom Theme>)

        VNPaymentProcessor.shared = PaymentAdapter()

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
            VenueNext.shared.initialize(sdkKey: "", sdkSecret: "")
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

    func walletUser() -> VNWalletUser? {
        return nil
    }

    func walletProgramName() -> String {
        return "Member"
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
