// Copyright © 2019 VenueNext. All rights reserved.

#import <Foundation/Foundation.h>

@interface VNUserLogin : NSObject
@property (nonatomic, weak) NSString        *token;
@property (nonatomic, weak) NSString        *secret;
@property (nonatomic, weak) NSString        *userUuid;
@property (nonatomic, weak) NSString        *deviceGuid;
@property (nonatomic, weak) NSString        *extSecretId;

@property (nonatomic, weak) NSString        *jsonString;
@property (nonatomic, weak) NSDictionary    *jsonData;
@property (nonatomic)       bool             isValid;

+ (VNUserLogin*)createFromJsonData:(NSDictionary*)jsonData;
+ (VNUserLogin*)createFromJsonString:(NSString*)_string;
+ (NSDictionary*)jsonDataForInstance:(VNUserLogin*)value;
@end
