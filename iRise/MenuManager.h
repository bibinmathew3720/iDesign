//
//  MenuManager.h
//  iRise
//
//  Created by Mobile Developer on 14/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
#import "Models.h"

typedef  void (^completionHandler)(id object);

@interface MenuManager : NSObject

-(void)attachMenuDetailsWith:(User *)user CompletionHandler:(completionHandler)handler;


@end
