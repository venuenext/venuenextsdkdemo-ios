// Copyright © 2019 VenueNext. All rights reserved.

#import "ObjCConfiguration.h"

@import VNCore;
@import VNOrderData;

@interface ObjCConfiguration()

@end

@implementation ObjCConfiguration
+ (void)start {
     [[VenueNext shared] initializeWithSdkKey:@"SDK_KEY" sdkSecret:@"SDK_SECRET" completion:nil];
}
@end
