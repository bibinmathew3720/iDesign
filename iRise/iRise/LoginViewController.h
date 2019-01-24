//
//  LoginViewController.h
//  iRise
//
//  Created by Mobile Developer on 23/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (nonatomic) BOOL isPresented;
@property (weak, nonatomic) IBOutlet UITextField *UsernameText;
@property (weak, nonatomic) IBOutlet UITextField *PasswordText;
@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;

@end
