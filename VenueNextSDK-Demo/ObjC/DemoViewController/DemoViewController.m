// Copyright © 2019 VenueNext. All rights reserved.
@import VNOrderUI;
@import VNCore;
#import "DemoViewController.h"

@interface DemoViewController ()
@end

@implementation DemoViewController

- (IBAction)pushRvCList:(id)sender {
    [self.navigationController pushVNRvCList:@[@(ProductTypeFood)] title:nil animated:YES];
}

- (IBAction)pushMenu:(id)sender {
    [self.navigationController pushVNMenuFor:@"" productType:ProductTypeFood animated:YES];
}
@end
