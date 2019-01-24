//
//  HomeManger.m
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//

#import "HomeManger.h"
#import "APIHelper.h"
#import "Projects.h"

@implementation HomeManger

-(void) ListProjects:(NSDictionary *)params andCompetionHandler:(HomeHandler)handler
{
    
    
    NSURL * url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@items",APIURL]];
    
    [APIHelper initServerCallWithURL:url requestMethod:TRequestMethodPOST requestSerialize:NO headers:nil imageData:nil imageDataName:nil parameters:params success:^(id object) {
        
        handler([self SuccesswithList:object]);
        
    } failure:^(id object) {
        
        handler([self failsWithError]);
    }];
}

-(id)SuccesswithList:(id)object
{
    NSNumber *status = [object valueForKey:@"status"];
    if ([status intValue] == 1) {
        Projects *projects = [Projects modelObjectWithDictionary:object];
        return projects;
    }
    else {
        Response *user = [Response new];
        user.status=YES;
        NSString *message = [object valueForKey:@"message"];
        user.message=message;
        return user;
    }
}
-(Response *)failsWithError
{
    Response *user = [Response new];
    user.status=NO;
    user.message = @"Network Failure";
    return user;
}
@end
