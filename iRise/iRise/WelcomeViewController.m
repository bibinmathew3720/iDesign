//
//  WelcomeViewController.m
//  iRise
//
//  Created by Mobile Developer on 23/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIView *swipeView;
@property (weak, nonatomic) IBOutlet UILabel *discriptionText;
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    [self landScapeMode:YES];
    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:gestureRecognizer];
    [SVProgressHUD resetOffsetFromCenter];
    if ([self IsIPad]) {
        [self.WelcomeLabel setFont:[UIFont fontWithName:@"FrutigerLTStd-Bold" size:36]];
        [self.ContentLabel setFont:[UIFont fontWithName:@"FrutigerLTStd-Light" size:19]];
    }
   
    
//    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
//    
//    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
//        statusBar.backgroundColor = [UIColor colorWithRed:36/255 green:50/255 blue:106/255 alpha:1];
//        statusBar.tintColor=[UIColor whiteColor];
//    }

}
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    // Implement font logic depending on screen size
//    self.font = [UIFont fontWithName:@"CustomFont" size:self.font.pointSize];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Handeling rotation
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft; // or Right of course
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}


#pragma mark - SwipeHandler
-(void)swipeHandlerLeft:(id)sender
{
    //Your ViewController
    [self performSegueWithIdentifier:@"welcomeUserGuideSegue" sender:self];
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
