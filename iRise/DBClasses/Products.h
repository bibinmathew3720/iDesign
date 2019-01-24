//
//  Products.h
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface Products : NSManagedObject

@property (nonatomic, retain) NSNumber *productsIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *productsUsedId;
@property (nonatomic, retain) NSNumber *projectId;
@property (nonatomic, retain) Project *project;


@end

