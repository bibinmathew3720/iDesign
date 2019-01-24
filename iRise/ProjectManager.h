//
//  ProjectManager.h
//  iRise
//
//  Created by mobtecnica on 13/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"

typedef void (^ProjectHandler) (id object);

@interface ProjectManager : NSObject
-(void) ListProjectWithSearchParams:(NSDictionary *)searchParams andCompetionHandler:(ProjectHandler)handler;

@end
