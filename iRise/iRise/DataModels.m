//
//  DataModels.m
//  iRise
//
//  Created by Mobile Developer on 25/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "DataModels.h"

@implementation DataModels



-(instancetype)init{
    
    self = [super init];
    if (self) {
        //Create project model array for projects and load array on home screen from data model
        
    }
    return self;
}

-(NSArray *)getMainMenu
{
    //NSArray *menu = [[NSArray alloc]initWithObjects:@"Projects",@"Country",@"Building Type",@"Objects Coated",@"Products Used",@"Architect",@"Collections",nil];
    NSArray *menu = [[NSArray alloc]initWithObjects:@"Name of Item",@"Company",@"Customer",@"Item Coated",@"Products Code",@"Colour",@"Product Name",@"Collection Name",@"Powder Application country",@"Powder Manufacturing Unit",@"Designer",@"Design House",nil];
    return menu;
}

-(NSArray *)getUserMenu
{
    NSArray *menu = [[NSArray alloc]initWithObjects:@"User info",@"User guide",@"Settings",@"Contact",@"Log out", nil];
    return menu;
}

-(User *)getProfile
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *userDict = [defaults valueForKey:@"USER"];
    User *user = [User modelObjectWithDictionary:userDict];
//    _usernameStg=user.username;
//    _emailStg=user.email;
//    _cityStg=[NSString stringWithFormat:@"%f", user.cityId];
//    _countryStg=[NSString stringWithFormat:@"%f", user.countryId];
    return user;
}
@end

//Projects
//Country - With two levels ( Country and City)
//Building Type -
//Objects Coated
//Products Used
//Architect
//Facade
