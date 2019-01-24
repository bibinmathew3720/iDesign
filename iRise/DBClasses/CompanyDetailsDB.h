//
//  CompanyDetailsDB.h
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface CompanyDetailsDB : NSManagedObject

@property (nonatomic, retain) NSNumber *companyId;
@property (nonatomic, retain) NSNumber *companyDetailsDBIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *itemId;
@property (nonatomic, retain) Product *product;

@end
