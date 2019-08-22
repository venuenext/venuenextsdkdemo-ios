// Copyright © 2019 VenueNext. All rights reserved.

#import "ObjCConfiguration.h"

@import VNCore;
@import VNOrderData;

@interface ObjCConfiguration()

@end

@implementation ObjCConfiguration
+ (void)start {
    // Requires Keys.plist to exist
    [VenueNext configureWithCompletion:^(BOOL success, NSError * _Nullable error) {
        [[VNOrderData shared] reloadStandsWithCompletion:nil];
    }];
    // OR setup manually
    // [[VenueNext shared] initializeWithSdkKey:@"SDK_KEY" sdkSecret:@"SDK_SECRET" completion:nil];
}
@end
