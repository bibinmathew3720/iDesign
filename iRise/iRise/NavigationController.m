//
//  ViewController.m
//  iRise
//
//  Created by Mobile Developer on 24/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate;
{
    BOOL shouldAutorotate;
    if ([self.topViewController respondsToSelector:@selector(shouldAutorotate)])
    {
        shouldAutorotate = [self.topViewController shouldAutorotate];
    }
    else {
        shouldAutorotate = [super shouldAutorotate];
    }
    return shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    UIInterfaceOrientationMask supportedOrientations;
    if ([[self topViewController] respondsToSelector:@selector(supportedInterfaceOrientations)]) {
        supportedOrientations = [[self topViewController] supportedInterfaceOrientations];
    }
    else {
        supportedOrientations = [super supportedInterfaceOrientations];
    }
    return supportedOrientations;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
