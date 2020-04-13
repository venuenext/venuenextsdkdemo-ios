// Copyright © 2019 VenueNext. All rights reserved.

#import <Foundation/Foundation.h>

@interface VNStorage : NSObject

@property (nonatomic, retain, readonly)  NSString *storagePath;
@property (nonatomic, retain, readwrite) NSString *storageName;
@property (nonatomic, assign, readonly)  bool     isValid;

+ (VNStorage*)instance;
- (void)reset;
- (void)removeAllItemsWithPrefix:(NSString*)prefix;

// Data

- (NSData*)dataForKey:(NSString*)key;
- (bool)setData:(NSData*)data forKey:(NSString*)key;
- (bool)clearDataForKey:(NSString*)key;

// Stirng

- (NSString*)stringForKey:(NSString*)key;
- (bool)setString:(NSString*)string forKey:(NSString*)key;
- (bool)clearStringForKey:(NSString*)key;

// Json

- (NSObject*)jsonForKey:(NSString*)key;
- (bool)setJson:(NSObject*)json forKey:(NSString*)key;
- (bool)clearJsonForKey:(NSString*)key;

- (NSArray*)jsonListForKey:(NSString*)key;
- (NSDictionary*)jsonDataForKey:(NSString*)key;

// Url

- (NSString*)keyForUrl:(NSString*)url;

@end
