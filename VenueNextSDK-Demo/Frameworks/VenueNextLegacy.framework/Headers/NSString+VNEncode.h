// Copyright © 2019 VenueNext. All rights reserved.

#import <Foundation/Foundation.h>

@interface NSString (VNEncode)

+ (NSData*)base64Decode:(NSString*)input;

+ (NSString*)base64FromData:(NSData*)data;
+ (NSString*)base64FromString:(NSString*)string;
+ (NSString*)base64encode:(const uint8_t*)input length:(NSUInteger)length;

+ (NSString*)urlSafebase64FromData:(NSData*)data;
+ (NSString*)urlSafebase64FromString:(NSString*)string;
+ (NSString*)urlSafebase64encode:(const uint8_t*)input length:(NSUInteger)length;

@end
