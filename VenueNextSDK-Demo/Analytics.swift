//
//  Analytics.swift
//  VenueNextSDK-Demo
//
//  Created by Nathan Fulkerson on 6/14/19.
//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import Foundation
import VNCore

class CustomAnalytics: AnalyticsAdapter {

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
