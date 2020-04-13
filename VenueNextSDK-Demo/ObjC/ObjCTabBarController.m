// Copyright © 2019 VenueNext. All rights reserved.

#import "ObjCTabBarController.h"
#import "DemoViewController/DemoViewController.h"

@import UIKit;
@import VenueNextOrderUI;
@import VenueNextOrderData;
@import VenueNextCoreUI;
@import VenueNextCore;

@interface ObjCTabBarController ()

@property (strong, nonatomic) DemoViewController *demoViewController;
@property (strong, nonatomic) UINavigationController *standsTableNavigationController;
@property (strong, nonatomic) UINavigationController *orderHistoryNavigationController;

@end

@interface VNBraintree: NSObject <PaymentProcessable, PaymentMethodRepresentable>

@property (copy, nonatomic) NSString *cardType;
@property (copy, nonatomic) NSString *lastFour;
@property (nonatomic) PaymentMethodInstrument instrument;
@property (copy, nonatomic) NSString * _Nullable cardholderName;
@property (copy, nonatomic) NSString *nonce;


@end

@implementation ObjCTabBarController

-(id)init {
    
    if (self = [super init]) {
        [VNPaymentProcessor setShared: [VNBraintree new]];
        
        self.demoViewController = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:NSBundle.mainBundle];
        [self.demoViewController setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0]];
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:self.demoViewController];
        
        self.standsTableNavigationController = [VNOrderNavigation rvcNavigationControllerWithProductTypes:@[@(ProductTypeFood)] title:@"TEST" dismissDelegate:nil];
        [self.standsTableNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1]];
        
        self.orderHistoryNavigationController = [VNOrderNavigation orderHistoryNavigationControllerWithDismissDelegate:nil];
        [self.orderHistoryNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2]];
    
    
        [self setViewControllers:@[
                                   navController,
                                   self.standsTableNavigationController,
                                   self.orderHistoryNavigationController
        ]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end

@implementation VNBraintree

- (id)init {
    if (self = [super init]) {
        [self setInstrument:PaymentMethodInstrumentCreditCard];
    }

    return self;
}

- (void)postPaymentMethodWithPaymentMethod:(id<PaymentMethodRepresentable> _Nonnull)paymentMethod completion:(void (^ _Nonnull)(NSError * _Nullable))completion {
    completion(nil);
}

- (void)defaultPaymentMethodWithCompletion:(void (^ _Nonnull)(id<PaymentMethodRepresentable> _Nullable))completion {
    
}

- (void)processPaymentFrom:(UIViewController * _Nullable)viewController productType:(enum ProductType)productType displayType:(enum PaymentDisplayType)displayType completion:(void (^ _Nonnull)(id<PaymentMethodRepresentable> _Nullable, NSError * _Nullable))completion {
    completion(self, nil);
}


- (void)processPaymentFrom:(UIViewController * _Nullable)viewController productType:(enum ProductType)productType completion:(void (^ _Nonnull)(id<PaymentMethodRepresentable> _Nullable, NSError * _Nullable))completion {
    
}

@end
