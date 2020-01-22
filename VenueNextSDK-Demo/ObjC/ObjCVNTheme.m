// Copyright © 2019 VenueNext. All rights reserved.

#import "ObjCVNTheme.h"

@interface ObjCVNTheme() <NSObject>

@property (strong, nonatomic) VNCoreBaseTheme* baseTheme;

@end

@implementation ObjCVNTheme
@synthesize primaryAccent;
@synthesize primaryDark;
@synthesize primaryDarkGray;
@synthesize primaryError;
@synthesize primaryExtraLightGray;
@synthesize primaryGray;
@synthesize primaryLight;
@synthesize primaryLightGray;
@synthesize primaryNavigationBarBackground;
@synthesize primaryNavigationBarTint;
@synthesize primarySeparator;

-(id)init {
    if (self = [super init]) {
        self.baseTheme = [VNCoreBaseTheme new];
    }
    return self;
}

-(UIColor *)primaryAccent {
    return [UIColor greenColor];
}

-(UIColor *)primaryDark {
    return [self.baseTheme primaryDark];
}

-(UIColor *)primaryDarkGray {
    return [self.baseTheme primaryDarkGray];
}

-(UIColor *)primaryError {
    return [self.baseTheme primaryDark];
}

-(UIColor *)primaryExtraLightGray {
    return [self.baseTheme primaryExtraLightGray];
}

-(UIColor *)primaryGray {
    return [self.baseTheme primaryDark];
}

-(UIColor *)primaryLight {
    return [self.baseTheme primaryLight];
}

-(UIColor *)primaryLightGray {
    return [self.baseTheme primaryLightGray];
}

-(UIColor *)primaryNavigationBarBackground {
    return [UIColor redColor];
}

-(UIColor *)primaryNavigationBarTint {
    return [self.baseTheme primaryNavigationBarTint];
}

-(UIColor *)primarySeparator {
    return [self.baseTheme primarySeparator];
}

@end
