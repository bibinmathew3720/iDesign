//
//  LoginManager.m
//  iRise
//
//  Created by mobtecnica on 09/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "LoginManager.h"
#import "APIHelper.h"


//#import "AFNetworking.h"

@implementation LoginManager

-(void) loginWithUsername:(NSString*)name andPassword:(NSString*)password WithCompletionHandler:(loginHandler)handler
{

    NSURL * url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@login",APIURL]];
    NSMutableArray *keys = [[NSMutableArray alloc]initWithObjects:@"username",@"password", nil];
    NSMutableArray *objects = [[NSMutableArray alloc]initWithObjects:name,password, nil];
    NSDictionary *params = [[NSDictionary alloc]initWithObjects:objects forKeys:keys];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setValue:name forKey:@"USERNAME"];
    [defaults synchronize];
    
    [APIHelper initServerCallWithURL:url requestMethod:TRequestMethodPOST requestSerialize:NO headers:nil imageData:nil imageDataName:nil parameters:params success:^(id object) {
        
        handler([self successinLogin:object]);
        
    } failure:^(id object) {
        
        handler([self failsWithError:object]);
    }];
     
     
}
-(void) logoutWithCompletionHandler:(loginHandler)handler
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *usrID = [defaults valueForKey:@"USER_ID"];
    NSString *name = [defaults valueForKey:@"SESSION_ID"];
    
    NSURL * url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@logout",APIURL]];
    NSMutableArray *keys = [[NSMutableArray alloc]initWithObjects:@"id",@"session_id", nil];
    NSMutableArray *objects = [[NSMutableArray alloc]initWithObjects:usrID,name, nil];
    NSDictionary *params = [[NSDictionary alloc]initWithObjects:objects forKeys:keys];

    
    [APIHelper initServerCallWithURL:url requestMethod:TRequestMethodPOST requestSerialize:YES headers:nil imageData:nil imageDataName:nil parameters:params success:^(id object) {
        
        handler([self successWithResponse:object]);
        
    } failure:^(id object) {
        
        handler([self failsWithError:object]);
    }];

}

-(id)successinLogin:(id) object{
    
    NSNumber *status = [object valueForKey:@"status"];
    
    if ([status intValue] == 1) {
        
        
        return object;
    }
    else {
        Response *user = [Response new];
        user.status = NO;
        NSString *message = [object valueForKey:@"message"];
        user.message = message;
        return user;
    }
}

-(Response *)successWithResponse:(id) object{
    
    Response *user = [Response new];
    NSNumber *status = [object valueForKey:@"status"];
    
    if ([status intValue] == 1) {
        user.status = YES;
    }
    else
    {
        user.status=NO;
        
    }
    user.message = [object valueForKey:@"message"];
    return user;

}
-(Response *)failsWithError:(id) object{
    
    Response *user = [Response new];
    user.status=NO;
    user.message = @"Network Failure";
    return user;
}
@end
