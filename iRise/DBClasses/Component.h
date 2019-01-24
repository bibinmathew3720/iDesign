//
//  Component.h
//  iRise
//
//  Created by Mobtecnica on 11/04/17.
//  Copyright © 2017 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;


@interface Component : NSObject

@property (nonatomic, retain) NSNumber *componentIdentifier;
@property (nonatomic, retain) NSNumber *componentId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *itemId;
@property (nonatomic, retain) Project *project;

@end
