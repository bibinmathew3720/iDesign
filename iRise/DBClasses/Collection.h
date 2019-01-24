//
//  Collection.h
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface Collection : NSManagedObject

@property (nonatomic, retain) NSNumber *collectionIdentifier;
@property (nonatomic, retain) NSNumber *collectionId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *projectId;
@property (nonatomic, retain) Project *project;


@end

