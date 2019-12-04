// Copyright © 2019 VenueNext. All rights reserved.

@import VNOrderUI;
#import "DemoViewController.h"

@interface DemoViewController ()
@property (strong, nonatomic) OrderCoordinator *orderCoordinator;
@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _orderCoordinator = [[OrderCoordinator alloc] initWithNavigationController:self.navigationController paymentProcessor:nil];
    [_orderCoordinator start];
    
}


- (IBAction)pushRvCList:(id)sender {
    [_orderCoordinator pushRvCListWithTitle:NULL];
}

- (IBAction)pushMenu:(id)sender {
    [_orderCoordinator pushMenuFor:@""];
}
@end
