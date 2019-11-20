#ifndef TARGET_OS_SIMULATOR
#include <TargetConditionals.h>
#endif
#if TARGET_OS_SIMULATOR
// Generated by Apple Swift version 4.2.1 (swiftlang-1000.11.42 clang-1000.11.45.1)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import CoreLocation;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="VNCore",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif






/// A class that represents the API environment, for example a staging or production environment.
/// This class is used for constructing the base URLs used in API requests and should not be manipulated directly.
SWIFT_CLASS("_TtC6VNCore11Environment")
@interface Environment : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) Environment * _Nonnull shared;)
+ (Environment * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
+ (void)setShared:(Environment * _Nonnull)value;
@property (nonatomic, readonly, copy) NSString * _Nullable organizationName;
@property (nonatomic, readonly, copy) NSString * _Nullable currentVenueUUID;
@property (nonatomic, readonly, copy) NSString * _Nullable venueHost;
@property (nonatomic, readonly, copy) NSString * _Nullable userHost;
@property (nonatomic, readonly, copy) NSString * _Nullable stadiumHost;
@property (nonatomic, readonly, copy) NSString * _Nullable stubsHost;
@property (nonatomic, readonly, copy) NSString * _Nullable paymentHost;
@property (nonatomic, readonly, copy) NSString * _Nullable notifyHost;
@property (nonatomic, readonly, copy) NSString * _Nullable loyaltyHost;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




@interface NSObject (SWIFT_EXTENSION(VNCore))
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull classStringName;)
+ (NSString * _Nonnull)classStringName SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull domain;)
+ (NSString * _Nonnull)domain SWIFT_WARN_UNUSED_RESULT;
@end

/// The method that was used to pay, either Credit Card or Apple Pay
typedef SWIFT_ENUM(NSInteger, PaymentMethodInstrument, closed) {
  PaymentMethodInstrumentCreditCard = 0,
  PaymentMethodInstrumentApplePay = 1,
  PaymentMethodInstrumentMagicMoney = 2,
  PaymentMethodInstrumentVnBank = 3,
};


/// An object that represents a payment method that was used to pay for goods.
SWIFT_PROTOCOL("_TtP6VNCore26PaymentMethodRepresentable_")
@protocol PaymentMethodRepresentable
@property (nonatomic, copy) NSString * _Nonnull nonce;
@property (nonatomic, copy) NSString * _Nonnull cardType;
@property (nonatomic, copy) NSString * _Nonnull lastFour;
@property (nonatomic) enum PaymentMethodInstrument instrument;
@property (nonatomic, copy) NSString * _Nullable cardholderName;
@end

@class UIViewController;
enum ProductType : NSInteger;

/// An object conforming to PaymentProcessable will be responsible for processing payments.
SWIFT_PROTOCOL("_TtP6VNCore18PaymentProcessable_")
@protocol PaymentProcessable
- (void)processPaymentFrom:(UIViewController * _Nullable)viewController productType:(enum ProductType)productType completion:(void (^ _Nonnull)(id <PaymentMethodRepresentable> _Nullable, NSError * _Nullable))completion;
- (void)postPaymentMethodWithPaymentMethod:(id <PaymentMethodRepresentable> _Nonnull)paymentMethod completion:(void (^ _Nonnull)(NSError * _Nullable))completion;
- (void)defaultPaymentMethodWithCompletion:(void (^ _Nonnull)(id <PaymentMethodRepresentable> _Nullable))completion;
@end

typedef SWIFT_ENUM(NSInteger, ProductType, closed) {
  ProductTypeFood = 0,
  ProductTypeExperience = 1,
  ProductTypeMerchandise = 2,
};




















SWIFT_PROTOCOL("_TtP6VNCore14VNCoreThemable_")
@protocol VNCoreThemable
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLight;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDark;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarTint;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryAccent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primarySeparator;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryExtraLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDarkGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryError;
@end


SWIFT_CLASS("_TtC6VNCore15VNCoreBaseTheme")
@interface VNCoreBaseTheme : NSObject <VNCoreThemable>
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLight;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDark;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryExtraLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDarkGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarTint;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryAccent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primarySeparator;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryError;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC6VNCore17VNLocationManager")
@interface VNLocationManager : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end

@class CLLocationManager;
@class CLLocation;

@interface VNLocationManager (SWIFT_EXTENSION(VNCore)) <CLLocationManagerDelegate>
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nonnull)error;
@end


SWIFT_PROTOCOL("_TtP6VNCore15VNOrderProtocol_")
@protocol VNOrderProtocol
- (void)enableWalletWithWallet:(id _Nonnull)wallet;
@end


/// An object to hold onto a shared PaymentProcessable. VenueNext frameworks will use this processor if set.
SWIFT_CLASS("_TtC6VNCore18VNPaymentProcessor")
@interface VNPaymentProcessor : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) id <PaymentProcessable> _Nullable shared;)
+ (id <PaymentProcessable> _Nullable)shared SWIFT_WARN_UNUSED_RESULT;
+ (void)setShared:(id <PaymentProcessable> _Nullable)value;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_PROTOCOL("_TtP6VNCore16VNWalletThemable_")
@protocol VNWalletThemable
@property (nonatomic, readonly, strong) UIColor * _Nonnull navigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull accent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull separator;
@end


SWIFT_CLASS("_TtC6VNCore17VNWalletBaseTheme")
@interface VNWalletBaseTheme : NSObject <VNWalletThemable>
@property (nonatomic, readonly, strong) UIColor * _Nonnull navigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull accent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull separator;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC6VNCore9VenueNext")
@interface VenueNext : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) VenueNext * _Nonnull shared;)
+ (VenueNext * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
/// Configures the app for VenueNext frameworks. Raises an exception if the Keys.plist is not found. This method is thread safe and contains synchronous file I/O (reading Keys-Info.plist from disk). If you do not have a Keys.plist, then use <code>VenueNext.shared.initialize(sdkKey:sdkSecret:) instead.</code>
/// This method should be called after the app is launched and before using VenueNext services such as in application(_:didFinishLaunchingWithOptions:).
+ (void)configureWithCompletion:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion;
/// Configures the app for VenueNext frameworks.
/// This method should be called after the app is launched and before using VenueNext services such as in application(_:didFinishLaunchingWithOptions:).
- (void)initializeWithSdkKey:(NSString * _Nonnull)sdkKey sdkSecret:(NSString * _Nonnull)sdkSecret completion:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion;
+ (BOOL)canHandleWithUrl:(NSURL * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
+ (void)handleWithUrl:(NSURL * _Nonnull)url presenter:(UIViewController * _Nonnull)presenter completion:(void (^ _Nullable)(BOOL))completion;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




@interface VenueNext (SWIFT_EXTENSION(VNCore))
- (BOOL)canHandleWithUrl:(NSURL * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
- (void)handleWithUrl:(NSURL * _Nonnull)url presenter:(UIViewController * _Nonnull)presenter completion:(void (^ _Nullable)(BOOL))completion;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop

#else
// Generated by Apple Swift version 4.2.1 (swiftlang-1000.11.42 clang-1000.11.45.1)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import CoreLocation;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="VNCore",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif






/// A class that represents the API environment, for example a staging or production environment.
/// This class is used for constructing the base URLs used in API requests and should not be manipulated directly.
SWIFT_CLASS("_TtC6VNCore11Environment")
@interface Environment : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) Environment * _Nonnull shared;)
+ (Environment * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
+ (void)setShared:(Environment * _Nonnull)value;
@property (nonatomic, readonly, copy) NSString * _Nullable organizationName;
@property (nonatomic, readonly, copy) NSString * _Nullable currentVenueUUID;
@property (nonatomic, readonly, copy) NSString * _Nullable venueHost;
@property (nonatomic, readonly, copy) NSString * _Nullable userHost;
@property (nonatomic, readonly, copy) NSString * _Nullable stadiumHost;
@property (nonatomic, readonly, copy) NSString * _Nullable stubsHost;
@property (nonatomic, readonly, copy) NSString * _Nullable paymentHost;
@property (nonatomic, readonly, copy) NSString * _Nullable notifyHost;
@property (nonatomic, readonly, copy) NSString * _Nullable loyaltyHost;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




@interface NSObject (SWIFT_EXTENSION(VNCore))
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull classStringName;)
+ (NSString * _Nonnull)classStringName SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull domain;)
+ (NSString * _Nonnull)domain SWIFT_WARN_UNUSED_RESULT;
@end

/// The method that was used to pay, either Credit Card or Apple Pay
typedef SWIFT_ENUM(NSInteger, PaymentMethodInstrument, closed) {
  PaymentMethodInstrumentCreditCard = 0,
  PaymentMethodInstrumentApplePay = 1,
  PaymentMethodInstrumentMagicMoney = 2,
  PaymentMethodInstrumentVnBank = 3,
};


/// An object that represents a payment method that was used to pay for goods.
SWIFT_PROTOCOL("_TtP6VNCore26PaymentMethodRepresentable_")
@protocol PaymentMethodRepresentable
@property (nonatomic, copy) NSString * _Nonnull nonce;
@property (nonatomic, copy) NSString * _Nonnull cardType;
@property (nonatomic, copy) NSString * _Nonnull lastFour;
@property (nonatomic) enum PaymentMethodInstrument instrument;
@property (nonatomic, copy) NSString * _Nullable cardholderName;
@end

@class UIViewController;
enum ProductType : NSInteger;

/// An object conforming to PaymentProcessable will be responsible for processing payments.
SWIFT_PROTOCOL("_TtP6VNCore18PaymentProcessable_")
@protocol PaymentProcessable
- (void)processPaymentFrom:(UIViewController * _Nullable)viewController productType:(enum ProductType)productType completion:(void (^ _Nonnull)(id <PaymentMethodRepresentable> _Nullable, NSError * _Nullable))completion;
- (void)postPaymentMethodWithPaymentMethod:(id <PaymentMethodRepresentable> _Nonnull)paymentMethod completion:(void (^ _Nonnull)(NSError * _Nullable))completion;
- (void)defaultPaymentMethodWithCompletion:(void (^ _Nonnull)(id <PaymentMethodRepresentable> _Nullable))completion;
@end

typedef SWIFT_ENUM(NSInteger, ProductType, closed) {
  ProductTypeFood = 0,
  ProductTypeExperience = 1,
  ProductTypeMerchandise = 2,
};




















SWIFT_PROTOCOL("_TtP6VNCore14VNCoreThemable_")
@protocol VNCoreThemable
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLight;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDark;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarTint;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryAccent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primarySeparator;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryExtraLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDarkGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryError;
@end


SWIFT_CLASS("_TtC6VNCore15VNCoreBaseTheme")
@interface VNCoreBaseTheme : NSObject <VNCoreThemable>
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLight;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDark;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryExtraLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryLightGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryDarkGray;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarTint;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryAccent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryNavigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primarySeparator;
@property (nonatomic, readonly, strong) UIColor * _Nonnull primaryError;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC6VNCore17VNLocationManager")
@interface VNLocationManager : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end

@class CLLocationManager;
@class CLLocation;

@interface VNLocationManager (SWIFT_EXTENSION(VNCore)) <CLLocationManagerDelegate>
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nonnull)error;
@end


SWIFT_PROTOCOL("_TtP6VNCore15VNOrderProtocol_")
@protocol VNOrderProtocol
- (void)enableWalletWithWallet:(id _Nonnull)wallet;
@end


/// An object to hold onto a shared PaymentProcessable. VenueNext frameworks will use this processor if set.
SWIFT_CLASS("_TtC6VNCore18VNPaymentProcessor")
@interface VNPaymentProcessor : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) id <PaymentProcessable> _Nullable shared;)
+ (id <PaymentProcessable> _Nullable)shared SWIFT_WARN_UNUSED_RESULT;
+ (void)setShared:(id <PaymentProcessable> _Nullable)value;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_PROTOCOL("_TtP6VNCore16VNWalletThemable_")
@protocol VNWalletThemable
@property (nonatomic, readonly, strong) UIColor * _Nonnull navigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull accent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull separator;
@end


SWIFT_CLASS("_TtC6VNCore17VNWalletBaseTheme")
@interface VNWalletBaseTheme : NSObject <VNWalletThemable>
@property (nonatomic, readonly, strong) UIColor * _Nonnull navigationBarBackground;
@property (nonatomic, readonly, strong) UIColor * _Nonnull accent;
@property (nonatomic, readonly, strong) UIColor * _Nonnull separator;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC6VNCore9VenueNext")
@interface VenueNext : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) VenueNext * _Nonnull shared;)
+ (VenueNext * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
/// Configures the app for VenueNext frameworks. Raises an exception if the Keys.plist is not found. This method is thread safe and contains synchronous file I/O (reading Keys-Info.plist from disk). If you do not have a Keys.plist, then use <code>VenueNext.shared.initialize(sdkKey:sdkSecret:) instead.</code>
/// This method should be called after the app is launched and before using VenueNext services such as in application(_:didFinishLaunchingWithOptions:).
+ (void)configureWithCompletion:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion;
/// Configures the app for VenueNext frameworks.
/// This method should be called after the app is launched and before using VenueNext services such as in application(_:didFinishLaunchingWithOptions:).
- (void)initializeWithSdkKey:(NSString * _Nonnull)sdkKey sdkSecret:(NSString * _Nonnull)sdkSecret completion:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion;
+ (BOOL)canHandleWithUrl:(NSURL * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
+ (void)handleWithUrl:(NSURL * _Nonnull)url presenter:(UIViewController * _Nonnull)presenter completion:(void (^ _Nullable)(BOOL))completion;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




@interface VenueNext (SWIFT_EXTENSION(VNCore))
- (BOOL)canHandleWithUrl:(NSURL * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
- (void)handleWithUrl:(NSURL * _Nonnull)url presenter:(UIViewController * _Nonnull)presenter completion:(void (^ _Nullable)(BOOL))completion;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop

#endif
