//
//  ApplicatorDetailsDB.h
//
//  Created by Mobtecnica  on 05/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface ApplicatorDetailsDB : NSManagedObject

@property (nonatomic, retain) NSNumber *applicatorDetailsDBIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *itemId;
@property (nonatomic, retain) NSNumber *applicatorId;
@property (nonatomic, retain) Product *product;


@end

