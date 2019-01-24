//
//  ViewController.h
//  iRise
//
//  Created by Mobile Developer on 23/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImage/UIImageView+WebCache.h"
#import "SVProgressHUD/SVProgressHUD.h"
#import "Header.h"
#import <Google/Analytics.h>

@interface BaseViewController : UIViewController
{
    UIActivityIndicatorView *activityView;
}

-(BOOL)IsIPad;
-(void)landScapeMode:(BOOL) isLandscape;
- (IBAction)ProfileMenu:(id)sender;
- (IBAction)searchMenu:(id)sender;
- (IBAction)sideMenu:(id)sender;

@end

