// Copyright © 2019 VenueNext. All rights reserved.

import VNCore
import VNOrderData

struct SwiftConfiguration {
    static func start() {
        // Requires Keys.plist to exist
        VenueNext.configure { success, error in
            guard success else { return }
            VNOrderData.shared.reloadStands()
        }
        // OR setup manually
        // VenueNext.shared.initialize(sdkKey: "SDK_KEY", sdkSecret: "SDK_SECRET")
        
        Analytics.initialize(with: CustomAnalytics())
    }
}
