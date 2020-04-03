// Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNCore

struct Appearance {
    static func configure() {
        UITabBar.appearance().tintColor = VN.theme.primaryLight
        UITabBar.appearance().barTintColor = VN.theme.primaryAccent
        UITabBar.appearance().unselectedItemTintColor = VN.theme.primaryLight
        UINavigationBar.appearance().barTintColor = VN.theme.primaryDark
        UINavigationBar.appearance().tintColor = VN.theme.primaryAccent
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: VN.theme.primaryAccent]
    }
}
