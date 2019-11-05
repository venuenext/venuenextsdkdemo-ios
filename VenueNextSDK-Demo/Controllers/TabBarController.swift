//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import UIKit
import VNOrderUI
import VNOrderData
import VNWalletUI

class TabBarController: UITabBarController {
    
    var deepLinkTableViewController: DeepLinkTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = VN.theme.primaryNavigationBarTint
        tabBar.barTintColor = VN.theme.primaryNavigationBarBackground
        tabBar.unselectedItemTintColor = VN.theme.primaryNavigationBarTint
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        
        VNPaymentProcessor.shared = PaymentAdapter()
        deepLinkTableViewController = DeepLinkTableViewController()
        
        let deepLinkNavigationController = UINavigationController(rootViewController: deepLinkTableViewController)
        deepLinkNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let tabBarList = [
            deepLinkNavigationController,
            ]
        
        viewControllers = tabBarList
        
        tabBar.isTranslucent = false
    }
}




