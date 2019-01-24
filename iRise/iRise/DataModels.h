//
//  DataModels.h
//  iRise
//
//  Created by Mobile Developer on 25/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface DataModels : NSObject

@property (nonatomic, strong) NSArray *mainMenu;
@property (nonatomic, strong) NSArray *country;
@property (nonatomic, strong) NSArray *city;
@property (nonatomic, strong) NSArray *projects;

@property (nonatomic, strong) NSString *usernameStg;
@property (nonatomic, strong) NSString *emailStg;
@property (nonatomic, strong) NSString *cityStg;
@property (nonatomic, strong) NSString *countryStg;

-(NSArray *)getMainMenu;
-(NSArray *)getUserMenu;
-(User *)getProfile;

@end
