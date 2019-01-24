//
//  MenuManager.m
//  iRise
//
//  Created by Mobile Developer on 14/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "MenuManager.h"
#import "APIHelper.h"


@implementation MenuManager

-(void)attachMenuDetailsWith:(User *)user CompletionHandler:(completionHandler)handler
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *usrID = [NSString stringWithFormat:@"%f", user.userIdentifier];
    NSString *name = [defaults valueForKey:@"SESSION_ID"];
    
    NSURL * url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@menu",APIURL]];
    NSMutableArray *keys = [[NSMutableArray alloc]initWithObjects:@"id",@"session_id", nil];
    NSMutableArray *objects = [[NSMutableArray alloc]initWithObjects:usrID,name, nil];
    NSDictionary *params = [[NSDictionary alloc]initWithObjects:objects forKeys:keys];
    
    [APIHelper initServerCallWithURL:url requestMethod:TRequestMethodPOST requestSerialize:NO headers:nil imageData:nil imageDataName:nil parameters:params success:^(id object) {
        
        handler([self successWithResponse:object]);
        
    } failure:^(id object) {
        
        handler([self failsWithError:object]);
    }];
}

-(id)successWithResponse:(id) object{
    
    
    NSNumber *status = [object valueForKey:@"status"];
    
    if ([status intValue] == 1) {
        
        NSDictionary *menuDictionary = [object valueForKey:@"data"];
//        Data *menu = [Data modelObjectWithDictionary:menuDictionary];
//        NSLog(@"menuDict: %@", [menu dictionaryRepresentation]);;
        return menuDictionary;
    }
    else
    {
        Response *user = [Response new];
        user.status=NO;
        user.message = [object valueForKey:@"message"];
        return user;
    }
    
    
}
-(Response *)failsWithError:(id) object{
    
    Response *user = [Response new];
    user.status=NO;
    user.message = @"Network Failure";
    return user;
}

@end
