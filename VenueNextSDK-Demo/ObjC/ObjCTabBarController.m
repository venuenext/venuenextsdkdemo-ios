// Copyright © 2019 VenueNext. All rights reserved.

#import "ObjCTabBarController.h"
#import "DemoViewController/DemoViewController.h"
@import UIKit;
@import VNOrderUI;
@import VNOrderData;

@interface ObjCTabBarController ()
@property (strong, nonatomic) OrderCoordinator *orderCoordinator;
@property (strong, nonatomic) OrderHistoryCoordinator *orderHistoryCoordinator;
@property (strong, nonatomic) DemoViewController *demoViewContoller;

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
        
        self.orderCoordinator = [OrderCoordinator new];
        [self.orderCoordinator start];
        [[self.orderCoordinator navigationController] setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1]];
        
        _demoViewContoller = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:NSBundle.mainBundle];
        [_demoViewContoller setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0]];
        
        self.orderHistoryCoordinator = [[OrderHistoryCoordinator alloc] initWithNavigationController:self.navigationController paymentProcessor:nil];
        [self.orderHistoryCoordinator start];
        [[self.orderHistoryCoordinator navigationController] setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2]];
        
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:_demoViewContoller];
    
    
        [self setViewControllers:@[navController,self.orderHistoryCoordinator.navigationController, self.orderHistoryCoordinator.navigationController]];
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

- (void)processPaymentFrom:(UIViewController * _Nullable)viewController completion:(void (^ _Nonnull)(id<PaymentMethodRepresentable> _Nullable, NSError * _Nullable))completion {
    completion(self, nil);
}

@end
