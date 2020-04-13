//
//  UIImage+WebP.h
//  iOS-WebP
//
//  Created by Sean Ooi on 12/21/13.
//  Copyright (c) 2013 Sean Ooi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WebP)

- (NSData *)dataWebPWithQuality:(float)quality;//quality = 0..100
+ (UIImage*)imageWithWebPAtPath:(NSString *)filePath;

+ (UIImage *)imageWithWebPData:(NSData *)imgData;
@property (nonatomic, readonly) NSData *dataWebPLossless;

- (BOOL)writeWebPToDocumentsWithFileName:(NSString *)filename quality:(float)quality;
- (BOOL)writeWebPLosslessToDocumentsWithFileName:(NSString *)filename;
@end
