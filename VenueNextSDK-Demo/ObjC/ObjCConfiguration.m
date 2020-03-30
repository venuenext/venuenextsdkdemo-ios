// Copyright © 2019 VenueNext. All rights reserved.

#import "ObjCConfiguration.h"

@import VNCore;
@import VNOrderData;

@interface ObjCConfiguration()

@end

@implementation ObjCConfiguration
+ (void)startWithURL:(NSURL *)configURL {
    [[VenueNext shared] initializeWithSdkKey:@"" sdkSecret:@"" jwt:@"" configURL:configURL completion:^(BOOL success, NSError * _Nullable error) {
        
    }];
}
@end
