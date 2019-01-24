//
//  ProductDetailsDB.h
//
//  Created by Mobtecnica  on 05/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface ProductDetailsDB : NSManagedObject

@property (nonatomic, retain) NSNumber *productDetailsDBIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *itemId;
@property (nonatomic, retain) NSNumber *productsUsedId;
@property (nonatomic, retain) Product *product;


@end

