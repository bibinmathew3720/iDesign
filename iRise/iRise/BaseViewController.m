//
//  ViewController.m
//  iRise
//
//  Created by Mobile Developer on 23/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "BaseViewController.h"
#import "MenuViewController.h"
#import "SearchViewController.h"
#import "DataModels.h"




@interface BaseViewController ()
{
    BOOL isSideMenuPop;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self landScapeMode:YES];
    activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    activityView.center=self.view.center;
//    [activityView startAnimating];
    [self.view addSubview:activityView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - hide Status bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark -  Setting UIInterfaceOrientation

-(void)landScapeMode:(BOOL) isLandscape{
    
    if (isLandscape) {
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationMaskLandscape];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    }
    else{
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationMaskPortrait];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    }
}

#pragma mark -  Setting UIInterfaceOrientation

-(BOOL)IsIPad{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        return YES;
    else
        return NO;

}
#pragma mark - Navigation Button Actions
- (IBAction)ProfileMenu:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    MenuViewController *menuView =[storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
    if (menuView.sideMenuPopped) {
        return;
    }
    DataModels *data = [[DataModels alloc] init];
    menuView.menu = [data getUserMenu];
    
    menuView.UsernameLabel.text = data.usernameStg;
    menuView.EmailLabel.text = data.emailStg;
    menuView.CountryLabel.text = data.countryStg;
    menuView.CityLabel.text = data.cityStg;
    
    menuView.menuDisplayed = NO;
    menuView.subMenuTableView.hidden =YES;
    menuView.sideMenuPopped = YES;
    menuView.userMenuPopped = YES;
    menuView.mainMenuPooped = NO;
    [self addChildViewController:menuView];
    menuView.view.tag = 20;
    [self.view addSubview:menuView.view];
    [menuView didMoveToParentViewController:self];
}

- (IBAction)searchMenu:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    SearchViewController *searchview = [storyboard instantiateViewControllerWithIdentifier:@"SearchView"];
    searchview.menuPopped=YES;
    [self addChildViewController:searchview];
    [self.view addSubview:searchview.view];
    [searchview didMoveToParentViewController:self];
}

- (IBAction)sideMenu:(id)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    MenuViewController *menuView =[storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
    if (menuView.sideMenuPopped) {
        return;
    }
    DataModels *data = [[DataModels alloc] init];
    menuView.menu = [data getMainMenu];
    menuView.menuDisplayed = YES;
    menuView.subMenuTableView.hidden =YES;
    menuView.sideMenuPopped = YES;
    menuView.mainMenuPooped = YES;
    menuView.userMenuPopped = NO;
    [self addChildViewController:menuView];
    menuView.view.tag = 20;
    [self.view addSubview:menuView.view];
    [menuView didMoveToParentViewController:self];
}



@end
