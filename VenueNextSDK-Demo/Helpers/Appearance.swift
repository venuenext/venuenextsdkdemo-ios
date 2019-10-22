// Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNCore

struct Appearance {
    static func start() {
        UITabBar.appearance().tintColor = VN.theme.primaryAccent
        UITabBar.appearance().barTintColor = VN.theme.primaryDark
        UITabBar.appearance().unselectedItemTintColor = VN.theme.primaryLight
        UINavigationBar.appearance().barTintColor = VN.theme.primaryDark
        UINavigationBar.appearance().tintColor = VN.theme.primaryAccent
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: VN.theme.primaryAccent]
    }
}
