//
//  DBManager.h
//  iRise
//
//  Created by Mobile Developer on 23/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Product.h"
#import "ComponentDetailsDB.h"
#import "CollectionDetailsDB.h"
#import "ColourDetailsDB.h"
#import "DesignerDetailsDB.h"
#import "ApplicatorDetailsDB.h"
#import "ClientDetailsDB.h"
#import "ProductDetailsDB.h"
#import "SearchParams.h"
#import "CompanyDetailsDB.h"
#import "ProductsDetailsDB.h"

@interface DBManager : NSObject
-(void)AddProjectList:(NSArray *)projectArray;
//-(NSArray *) GetProjectList;
-(NSArray *) GetProjectsWithSearchParams:(SearchParams*)search andKeyword:(NSString*)keyword;

@end
