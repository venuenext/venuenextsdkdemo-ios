// Copyright © 2019 VenueNext. All rights reserved.
@import VenueNextOrderUI;
@import VenueNextCore;
#import "DemoViewController.h"

@interface DemoViewController ()
@end

@implementation DemoViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIColor *barColor = [UIColor colorWithRed:23.0f/255.0f green:117.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    [[self.navigationController navigationBar] setPrefersLargeTitles:NO];
    [[self.navigationController navigationBar] setTranslucent:NO];
    [[self.navigationController navigationBar] setBarTintColor:barColor];
    [[self.navigationController navigationBar] setTintColor:[UIColor whiteColor]];
    [[self.navigationController navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTitle:@"Demo"];
}

- (IBAction)pushRvCList:(id)sender {
    [self.navigationController pushVNRvCList:@[@(ProductTypeFood)] title:nil animated:YES];
}

- (IBAction)pushMenu:(id)sender {
    [self.navigationController pushVNMenuFor:@"d1192eb8-2369-40a3-8880-d279137f5426" eventUUID: nil productType:ProductTypeFood animated:YES];
}
@end
