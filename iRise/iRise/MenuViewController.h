//
//  MenuViewController.h
//  iRise
//
//  Created by Mobile Developer on 26/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


@interface MenuViewController : BaseViewController

@property (nonatomic,strong) NSArray *menu;
@property (nonatomic,strong) NSArray *subMenu;
@property (nonatomic,strong) NSArray *subSubMenu;

@property (nonatomic, assign) BOOL menuDisplayed;
@property (nonatomic, assign) BOOL sideMenuPopped;
@property (nonatomic, assign) BOOL subMenuDisplayed;
@property (nonatomic, assign) BOOL userMenuPopped;
@property (nonatomic, assign) BOOL mainMenuPooped;

@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet UITableView *subMenuTableView;
@property (weak, nonatomic) IBOutlet UITableView *subSubMenuTableView;

@property (weak, nonatomic) IBOutlet UIView *SettingsView;
@property (weak, nonatomic) IBOutlet UIView *UserInfoView;
@property (weak, nonatomic) IBOutlet UIView *contactView;

@property (weak, nonatomic) IBOutlet UILabel *UsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *CityLabel;
@property (weak, nonatomic) IBOutlet UILabel *CountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *EmailLabel;

@property (weak, nonatomic) IBOutlet UILabel *TSettingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *TDownloadLabel;
@property (weak, nonatomic) IBOutlet UILabel *TUserProfileLabel;
@property (weak, nonatomic) IBOutlet UILabel *TNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *TCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *TEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *TCityLabel;

@property (weak, nonatomic) IBOutlet UILabel *contactDetails;
@property (weak, nonatomic) IBOutlet UIButton *contactEmail;
@property (weak, nonatomic) IBOutlet UILabel *contactHeadinf;
@property (weak, nonatomic) IBOutlet UIButton *ContactButton;

- (IBAction)ContactUsAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *SwitchButton;
- (IBAction)SwitchAction:(id)sender;
@end
