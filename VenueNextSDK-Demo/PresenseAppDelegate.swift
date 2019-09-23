// Copyright © 2019 VenueNext. All rights reserved.

import Foundation
import PresenceSDK

public class PresenceAppDelegate: NSObject, UIApplicationDelegate {
    
    public static let shared = PresenceAppDelegate()
    
    public func applicationDidFinishLaunching(_ application: UIApplication) {
        configurePresenceSDK()
    }
    
    private func configurePresenceSDK() {
        guard let sdkKeyPath = Bundle.main.path(forResource: "Keys", ofType: "plist"),
            let keys = NSDictionary(contentsOfFile: sdkKeyPath),
            let consumerKey = keys["PresenceConsumerKey"] as? String else { return }
        
        PresenceSDK.getPresenceSDK().setConfig(consumerKey: consumerKey, displayName: "Florida Gators", useNewAccountsManager: true)
        PresenceSDK.getPresenceSDK().setBrandingColor(color: .accent)
    }
    
    private func configureExperienceSDK() {
        let experience = ExperienceConfigurationBuilder.init()
        let experienceConfig = experience
            .setAppId("234")
            .setAppSource("floridagatorsvn")
            .setAppName("floridagatorsvn")
            .setApiSubdomain("toad")
            .setSubdomain("gators")
            .setApiKey("naXxUPuhO9PhOJl8XsNfqW75")
            .build()
        PresenceSDK.getPresenceSDK().setExperienceConfiguration(experienceConfig)
    }
}
