// Copyright © 2019 VenueNext. All rights reserved.

import UIKit

struct Appearance {
    static func start() {
        UITabBar.appearance().tintColor = .accent
        UITabBar.appearance().barTintColor = .primaryDark
        UITabBar.appearance().unselectedItemTintColor = .primary
        UINavigationBar.appearance().barTintColor = .primaryDark
        UINavigationBar.appearance().tintColor = .accent
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.accent]
    }
}
