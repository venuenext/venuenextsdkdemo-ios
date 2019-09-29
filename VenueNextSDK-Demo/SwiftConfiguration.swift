// Copyright © 2019 VenueNext. All rights reserved.

import VNCore
import VNWalletUI
import VNOrderUI

struct SwiftConfiguration {
    static func start() {
        VenueNext.shared.initialize(sdkKey: "", sdkSecret: "SDK_SECRET")
        Analytics.initialize(with: CustomAnalytics())
        
    }
}

