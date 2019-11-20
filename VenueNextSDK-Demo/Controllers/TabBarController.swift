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

        // Assign a payment Processor
        VNPaymentProcessor.shared = PaymentProcessor()
        
        orderCoordinator = OrderCoordinator()
        orderCoordinator.start()
        orderCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        orderHistoryCoordinator = OrderHistoryCoordinator(navigationController: navigationController)
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




