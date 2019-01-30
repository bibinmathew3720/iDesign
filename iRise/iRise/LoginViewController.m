//
//  LoginViewController.m
//  iRise
//
//  Created by Mobile Developer on 23/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginManager.h"
#import "UITextField+Animations.h"
#import "MenuManager.h"
#import "User.h"

@interface LoginViewController () <UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _UsernameText.delegate=self;
    _PasswordText.delegate=self;
    
    // Do any additional setup after loading the view.
    _isPresented = YES;
    [self landScapeMode:NO];
    self.navigationController.navigationBarHidden = YES;
    if (![self IsIPad]) {
        [self.ContentLabel setFont:[UIFont systemFontOfSize:13 weight:UIFontWeightLight]];
    }
}



-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    _isPresented = NO;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [_UsernameText resignFirstResponder];
    [_PasswordText resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButtonPressed:(id)sender {
    [self.view endEditing:YES];
    
    if (_UsernameText.text.length>0&&_PasswordText.text.length>0) {
        
        LoginManager *mngr=[[LoginManager alloc]init];
//        [activityView startAnimating];
        [SVProgressHUD showWithStatus:@"Loading..."];
        [mngr loginWithUsername:_UsernameText.text andPassword:_PasswordText.text WithCompletionHandler:^(id object) {
            if(![object isKindOfClass:[Response class]]){
                NSDictionary *data = [object valueForKey:@"data"];
                NSDictionary *userDic = [data valueForKey:@"user"];
                NSNumber *sessionIDNumber = [data valueForKey:@"session_id"];
                NSString *sessionID = [NSString stringWithFormat:@"%@",sessionIDNumber];
                NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                [defaults setValue:sessionID forKey:@"SESSION_ID"];
                [defaults setValue:userDic forKey:@"USER"];
                [defaults setValue:[NSNumber numberWithBool:NO] forKey:@"OFFLINE_STATUS"];
                [defaults setValue:[NSNumber numberWithBool:NO] forKey:@"GETDATA_STATUS"];
                [defaults synchronize];
                id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
                
                User *user = [[User alloc]initWithDictionary:userDic];
                [tracker set:kGAIUserId
                       value:[NSString stringWithFormat:@"%f",user.userIdentifier]];
                
                // This hit will be sent with the User ID value and be visible in User-ID-enabled views (profiles).
                [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Log in"            // Event category (required)
                                                                      action:@"iOS Log in"  // Event action (required)
                                                                       label:[NSString stringWithFormat:@"%@ %@",user.firstName, user.lastName]             // Event label
                                                                       value:nil] build]];    // Event value
                
                
//                [SVProgressHUD dismiss];
                [SVProgressHUD showWithStatus:@"Attaching menu..."];
                MenuManager *mngr = [[MenuManager alloc]init];
                [mngr attachMenuDetailsWith:user CompletionHandler:^(id object) {
                    
                    if ([object isKindOfClass:[Response class]]) {
                        NSLog(@"Error: ");
                        //[SVProgressHUD setMinimumDismissTimeInterval:0.3];
                        [SVProgressHUD showErrorWithStatus:@"Login failed"];
                    }
                    else{
                        NSNumber *userIDNumber = [data valueForKey:@"id"];
                        NSString *user_ID = [NSString stringWithFormat:@"%@",userIDNumber];
                        NSString *userID = [defaults valueForKey:@"USER_ID"];
                        if (userID) {
                            if ([userID isEqualToString:user_ID]) {
                                [self performSegueWithIdentifier:@"projectSegue" sender:self];
                            }
                            else
                            {
                                [self welcomeSreen];
                            }
                        }
                        else
                        {
                            [self welcomeSreen];
                            
                        }
                        NSDictionary *menuDictionary = object;
                        
                        [defaults setValue:[NSNumber numberWithBool:YES] forKey:@"LOGIN_STATUS"];
                        [defaults setValue:user_ID forKey:@"USER_ID"];
                        [defaults setValue:menuDictionary forKey:@"MENU"];
                        [defaults synchronize];
                        [SVProgressHUD dismiss];
                        //                        [SVProgressHUD showSuccessWithStatus:@"Menu attached successfully"];
                    }
                }];
            }
            else
            {
                //[SVProgressHUD setMinimumDismissTimeInterval:0.3];
                [SVProgressHUD showErrorWithStatus:@"Login failed"];
                
            }
            [activityView stopAnimating];
        }];
    }
    else
    {
        if ([_UsernameText isEmpty]) {
            [_UsernameText showError];
        }
        if ([_PasswordText isEmpty]) {
            [_PasswordText showError];
        }
        [SVProgressHUD showErrorWithStatus:@"Please, fill the fields"];
        
        
        
//        UIAlertController *alertController =  [UIAlertController alertControllerWithTitle:@"Fill the Fields" message:nil preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *okayAction = [UIAlertAction
//                                     actionWithTitle:@"OK"
//                                     style:UIAlertActionStyleDefault
//                                     handler:^(UIAlertAction * _Nonnull action) {
//                                         [alertController dismissViewControllerAnimated:YES completion:nil];
//                                     }];
//        [alertController addAction:okayAction];
//        [self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void)welcomeSreen
{
    
    [self performSegueWithIdentifier:@"loginWelcomeSegue" sender:self];
}



- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
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
