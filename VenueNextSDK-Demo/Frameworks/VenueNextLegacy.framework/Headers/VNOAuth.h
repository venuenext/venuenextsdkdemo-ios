// Copyright © 2019 VenueNext. All rights reserved.


#import <Foundation/Foundation.h>

@interface VNOAuth : NSObject {
@protected
    NSString    *key;
    NSString    *secret;
    NSString    *token;
    NSString    *token_secret;

    NSData      *signingKey;
}

@property (nonatomic, retain, readwrite) NSString            *key;
@property (nonatomic, retain, readwrite) NSString            *secret;
@property (nonatomic, retain, readwrite) NSString            *token;
@property (nonatomic, retain, readwrite) NSString            *token_secret;

- (id)initWithKey:(NSString*)aKey secret:(NSString*)aSecret;
- (id)initWithToken:(NSString*)aToken secret:(NSString*)aSecret;
- (id)initWithKey:(NSString*)aKey secret:(NSString*)aSecret token:(NSString*)aToken tokenSecret:(NSString*)aTokenSecret;
- (id)initWithOAuth:(VNOAuth*)auth token:(NSString*)aToken secret:(NSString*)aSecret;

- (void)setKey:(NSString*)aKey secret:(NSString*)aSecret;
- (void)setToken:(NSString*)aToken secret:(NSString*)aSecret;


@end
