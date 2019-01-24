//
//  ProjectManager.m
//  iRise
//
//  Created by mobtecnica on 13/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "ProjectManager.h"
#import "APIHelper.h"
#import "Projects.h"

@implementation ProjectManager

-(void) ListProjectWithSearchParams:(NSDictionary *)searchParams andCompetionHandler:(ProjectHandler)handler
{
    
    
    NSURL * url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@itemsearch",APIURL]];
    
    [APIHelper initServerCallWithURL:url requestMethod:TRequestMethodPOST requestSerialize:NO headers:nil imageData:nil imageDataName:nil parameters:searchParams success:^(id object) {
        
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
