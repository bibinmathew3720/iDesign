//
//  ProductsDetailsDB.h
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface ProductsDetailsDB : NSManagedObject

@property (nonatomic, retain) NSNumber *productsDetailsDBIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *itemId;
@property (nonatomic, retain) NSNumber *productsId;
@property (nonatomic, retain) Product *product;

@end
