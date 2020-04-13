// Copyright © 2019 VenueNext. All rights reserved.

#import <Foundation/Foundation.h>

@interface VNSettings: NSObject

@property (nonatomic)  bool isValid;
@property (nonatomic, retain) NSMutableDictionary    *data;
@property (nonatomic, weak) NSString            *userUuid;
@property (nonatomic, weak) NSString            *userLogin;
@property (nonatomic, weak) NSString            *userSeat;
@property (nonatomic, weak) NSString            *userSeatEventUuid;
@property (nonatomic, weak) NSString            *userSeatVenueUuid;
@property (nonatomic, weak) NSString            *userTicketsEmail;
@property (nonatomic, weak) NSString            *userCreditCard;
@property (nonatomic, weak) NSString            *userCreditCardPassword;
@property (nonatomic, weak) NSString            *userCreditCardTracke;
@property (nonatomic, weak) NSString            *userProfileInfo;
@property (nonatomic, weak) NSString            *userPaymentMethod;
@property (nonatomic, weak) NSString            *userFirstName;
@property (nonatomic, weak) NSString            *userLastName;
@property (nonatomic, weak) NSString            *userFullName;
@property (nonatomic, weak) NSString            *userPhone;
@property (nonatomic, weak) NSString            *userEmail;
@property (nonatomic, weak) NSString            *specialModeEmail;
@property (nonatomic, weak) NSString            *localyticsMode;

@property (nonatomic, weak) NSString            *appId;
@property (nonatomic, weak) NSString            *appTitle;
@property (nonatomic, weak) NSString            *appVersion;
@property (nonatomic, weak) NSString            *appExecutable;
@property (nonatomic, weak) NSDictionary      *appUrlSchemes;
@property (nonatomic, weak) NSString          *appInAppPaymentId;
@property (nonatomic, weak) NSString            *appName;
@property (nonatomic, weak) NSString            *appEnvironment;

@property(nonatomic, retain, readwrite) NSString            *userPreferences;
@property(nonatomic, retain, readwrite) NSString            *externalAccountToken;

- (NSString*)accountInfoForSocailNetwork:(NSString*)network;
- (void)setAccountInfo:(NSString*)accountInfo forSocailNetwork:(NSString*)network;

- (NSString*)userDetailForKey:(NSString*)key;
- (void)setUserDetail:(NSString*)value forKey:(NSString*)key;

+ (VNSettings*)instance;

- (void)reset;

// Settings Helpers

- (NSString*)getStringForKey:(NSString*)key;
- (void)putString:(NSString*)value forKey:(NSString*)key;

- (NSNumber*)getNumberForKey:(NSString*)key;
- (void)putNumber:(NSNumber*)value forKey:(NSString*)key;

- (NSInteger)getIntegerForKey:(NSString*)key;
- (void)putInteger:(NSInteger)integer forKey:(NSString*)key;

- (NSDictionary*)getDictionaryForKey:(NSString*)key;
- (void)putDictionary:(NSDictionary*)value forKey:(NSString*)key;

- (id)getObjectForKey:(NSString*)key;
- (void)putObject:(id)value forKey:(NSString*)key;

// Global Settings Helpers

- (NSString*)globalStringSettingNamed:(NSString*)settingName;
- (NSString*)globalStringSettingNamed:(NSString*)settingName defaults:(NSString*)defaultValue;

- (NSInteger)globalIntegerSettingNamed:(NSString*)settingName;
- (NSInteger)globalIntegerSettingNamed:(NSString*)settingName defaults:(NSInteger)defaultValue;

- (bool)globalBooleanSettingNamed:(NSString*)settingName;
- (bool)globalBooleanSettingNamed:(NSString*)settingName defaults:(bool)defaultValue;

- (id)globalSettingNamed:(NSString*)settingName;
- (id)globalSettingDefaultNamed:(NSString*)settingName;

@end
