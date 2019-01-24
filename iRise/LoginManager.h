//
//  LoginManager.h
//  iRise
//
//  Created by mobtecnica on 09/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"

typedef  void (^loginHandler)(id object);

@interface LoginManager : NSObject

-(void) loginWithUsername:(NSString*)name andPassword:(NSString*)password WithCompletionHandler:(loginHandler)handler;
-(void) logoutWithCompletionHandler:(loginHandler)handler;

@end
