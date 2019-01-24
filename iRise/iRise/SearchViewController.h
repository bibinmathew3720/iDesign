//
//  SearchViewController.h
//  iRise
//
//  Created by mobtecnica on 10/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchViewController : BaseViewController 

@property (weak, nonatomic) IBOutlet UIView *SearchView;
@property (weak, nonatomic) IBOutlet UILabel *NoMatchLabel;
@property (weak, nonatomic) IBOutlet UITableView *SearchTableView;
- (IBAction)SearchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) NSString *keyWordHolder;

@property BOOL menuPopped;
@end
