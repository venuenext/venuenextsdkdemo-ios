// Copyright © 2019 VenueNext. All rights reserved.

#import "ObjCConfiguration.h"

@import VNCore;
@import VNOrderData;

@interface ObjCConfiguration()

@end

@implementation ObjCConfiguration
+ (void)start {
    [[VenueNext shared] initializeWithSdkKey:@"" sdkSecret:@"" jwt:@"" completion:nil];
}
@end
