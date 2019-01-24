//
//  CollectionDetailsDB.h
//
//  Created by Mobtecnica  on 05/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface CollectionDetailsDB : NSManagedObject

@property (nonatomic, retain) NSNumber *collectionDetailsDBIdentifier;
@property (nonatomic, retain) NSNumber *collectionId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *itemId;
@property (nonatomic, retain) Product *product;


@end

