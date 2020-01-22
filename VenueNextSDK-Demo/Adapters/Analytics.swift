//  VenueNextSDK-Demo
//  Copyright © 2019 VenueNext, Inc. All rights reserved.


import Foundation
import VNCore
import VNAnalytics

class CustomAnalytics: AnalyticsAdapter {
    func register(userID: String?) {
        
    }
    

    func track(event: EventTrackable) {
        track(name: event.eventName, metadata: event.metadata)
    }

    func track(name: String, metadata: [String : Any]?) {
        guard let unwrappedMeta = metadata else {
            print("event_name: \(name)")
            return
        }
        print("\(name) - \(unwrappedMeta)")
    }
}
