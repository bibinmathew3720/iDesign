//
//  HomeManger.h
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"

typedef void (^HomeHandler) (id object);

@interface HomeManger : NSObject

-(void) ListProjects:(NSDictionary *)params andCompetionHandler:(HomeHandler)handler;

@end
