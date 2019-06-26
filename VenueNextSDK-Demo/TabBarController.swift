//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import UIKit
import VNOrderUI
import VNOrderData

class TabBarController: UITabBarController {
    var orderCoordinator: OrderCoordinator!
    var orderHistoryCoordinator: OrderHistoryCoordinator!
    var deepLinkTableViewController: DeepLinkTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let paymentProcessor = PaymentAdapter()

        orderCoordinator = OrderCoordinator(paymentProcessor: paymentProcessor)
        orderCoordinator.start()
        orderCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        orderHistoryCoordinator = OrderHistoryCoordinator(paymentProcessor: paymentProcessor)
        orderHistoryCoordinator.start()
        orderHistoryCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        deepLinkTableViewController = DeepLinkTableViewController()
        let deepLinkNavigationController = UINavigationController(rootViewController: deepLinkTableViewController)
        deepLinkNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        let tabBarList = [orderCoordinator.navigationController!, orderHistoryCoordinator.navigationController!, deepLinkNavigationController]
        viewControllers = tabBarList

        tabBar.isTranslucent = false

    }
}
