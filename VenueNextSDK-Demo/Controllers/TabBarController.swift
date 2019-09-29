//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import UIKit
import VNOrderUI
import VNOrderData
import VNWalletUI

class TabBarController: UITabBarController {
    var orderCoordinator: OrderCoordinator!
    var orderHistoryCoordinator: OrderHistoryCoordinator!
    var deepLinkTableViewController: DeepLinkTableViewController!
    var walletCoordinator: WalletCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()

        let paymentProcessor = PaymentAdapter()
    
        //configure wallet
        VenueNext.configure(wallet: VNWallet.shared, walletDelegate: self)
        //turn on wallet for VNOrder
        VenueNext.enableWallet(for: VNOrder.shared)

        orderCoordinator = OrderCoordinator(paymentProcessor: paymentProcessor)
        orderCoordinator.start()
        orderCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        orderHistoryCoordinator = OrderHistoryCoordinator(paymentProcessor: paymentProcessor)
        orderHistoryCoordinator.start()
        orderHistoryCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        walletCoordinator = WalletCoordinator()
        walletCoordinator.start()
        let imageIcon = UIImage(named: "wallet_icon", in: nil, compatibleWith: nil)
        walletCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Wallet", image: imageIcon, tag: 3)
        
        deepLinkTableViewController = DeepLinkTableViewController()
        let deepLinkNavigationController = UINavigationController(rootViewController: deepLinkTableViewController)
        deepLinkNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        let tabBarList = [orderCoordinator.navigationController!, orderHistoryCoordinator.navigationController!, walletCoordinator.navigationController!, deepLinkNavigationController]
        viewControllers = tabBarList

        tabBar.isTranslucent = false

    }
}

extension TabBarController: VNWalletDelegate {
    
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

