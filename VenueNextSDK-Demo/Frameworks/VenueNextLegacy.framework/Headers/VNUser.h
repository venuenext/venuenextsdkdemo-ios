// Copyright © 2019 VenueNext. All rights reserved.

#import <Foundation/Foundation.h>
#import "VNUserLogin.h"

@class VNUserLogin;

@interface VNUser : NSObject

@property(nonatomic, weak) VNUserLogin    *userLogin;
@property(nonatomic, weak) NSString    *userUuid;
@property(nonatomic, weak) NSString    *deviceGuid;
@property(nonatomic, weak) NSString    *extSecretId;
@property(nonatomic, weak) NSString    *extAccountToken;

+ (VNUser*)instance;

@end
