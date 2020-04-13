//
//   Copyright 2012 Square Inc.
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

#import <Foundation/Foundation.h>
#import <Security/SecCertificate.h>

typedef enum {
    SR_CONNECTING2   = 0,
    SR_OPEN2         = 1,
    SR_CLOSING2      = 2,
    SR_CLOSED2       = 3,
} SRReadyState2;

@class SRWebSocket2;

extern NSString *const SRWebSocket2ErrorDomain;

#pragma mark - SRWebSocket2Delegate

@protocol SRWebSocket2Delegate;

#pragma mark - SRWebSocket2

@interface SRWebSocket2 : NSObject <NSStreamDelegate>

@property (nonatomic, weak) id <SRWebSocket2Delegate> delegate;

@property (nonatomic, readonly) SRReadyState2 readyState;
@property (nonatomic, readonly, retain) NSURL *url;

// This returns the negotiated protocol.
// It will be nil until after the handshake completes.
@property (nonatomic, readonly, copy) NSString *protocol;

// Protocols should be an array of strings that turn into Sec-WebSocket-Protocol.
- (id)initWithURLRequest:(NSURLRequest *)request protocols:(NSArray *)protocols;
- (id)initWithURLRequest:(NSURLRequest *)request;

// Some helper constructors.
- (id)initWithURL:(NSURL *)url protocols:(NSArray *)protocols;
- (id)initWithURL:(NSURL *)url;

// Delegate queue will be dispatch_main_queue by default.
// You cannot set both OperationQueue and dispatch_queue.
- (void)setDelegateOperationQueue:(NSOperationQueue*) queue;
- (void)setDelegateDispatchQueue:(dispatch_queue_t) queue;

// By default, it will schedule itself on +[NSRunLoop SR_networkRunLoop] using defaultModes.
- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode;
- (void)unscheduleFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode;

// SRWebSocket2s are intended for one-time-use only.  Open should be called once and only once.
- (void)open;

- (void)close;
- (void)closeWithCode:(NSInteger)code reason:(NSString *)reason;

// Send a UTF8 String or Data.
- (void)send:(id)data;

@end

#pragma mark - SRWebSocket2Delegate

@protocol SRWebSocket2Delegate <NSObject>

// message will either be an NSString if the server is using text
// or NSData if the server is using binary.
- (void)webSocket:(SRWebSocket2 *)webSocket didReceiveMessage:(id)message;

@optional

- (void)webSocketDidOpen:(SRWebSocket2 *)webSocket;
- (void)webSocket:(SRWebSocket2 *)webSocket didFailWithError:(NSError *)error;
- (void)webSocket:(SRWebSocket2 *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;

@end

#pragma mark - NSURLRequest (CertificateAdditions2)

@interface NSURLRequest (CertificateAdditions2)

@property (nonatomic, retain, readonly) NSArray *SR_SSLPinnedCertificates;

@end

#pragma mark - NSMutableURLRequest (CertificateAdditions2)

@interface NSMutableURLRequest (CertificateAdditions2)

@property (nonatomic, retain) NSArray *SR_SSLPinnedCertificates;

@end

#pragma mark - NSRunLoop (SRWebSocket2)

@interface NSRunLoop (SRWebSocket2)

+ (NSRunLoop *)SR_networkRunLoop;

@end
