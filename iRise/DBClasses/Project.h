//
//  Project.h
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Objectcoated, Products, Architect, Collection, Projects,Colour;

@interface Project : NSManagedObject

@property (nonatomic, retain) NSNumber *projectIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *countryId;
@property (nonatomic, retain) NSNumber *cityId;
@property (nonatomic, retain) NSString *buildingType;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSNumber *buildingTypeId;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *completionYear;
@property (nonatomic, retain) NSNumber *align;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSSet *objectcoated;
@property (nonatomic, retain) NSSet *products;
@property (nonatomic, retain) NSSet *architect;
@property (nonatomic, retain) NSSet *collection;
@property (nonatomic, retain) NSSet *colour;
@property (nonatomic, retain) NSSet *component;


@property (nonatomic, retain) Projects *projects;


@end

@interface Project (JSONModelerGeneratedAccessors)

- (void)addObjectcoatedObject:(Objectcoated *)value;
- (void)removeObjectcoatedObject:(Objectcoated *)value;
- (void)addObjectcoated:(NSSet *)value;
- (void)removeObjectcoated:(NSSet *)value;

- (void)addProductsObject:(Products *)value;
- (void)removeProductsObject:(Products *)value;
- (void)addProducts:(NSSet *)value;
- (void)removeProducts:(NSSet *)value;

//added code
- (void)addColourObject:(Colour *)value;
- (void)removeColourObject:(Colour *)value;
- (void)addColour:(NSSet *)value;
- (void)removeColour:(NSSet *)value;

/*
- (void)addComponentObject:(Component *)value;
- (void)removeComponentObject:(Component *)value;
- (void)addComponent:(NSSet *)value;
- (void)removeComponent:(NSSet *)value;
*/


- (void)addArchitectObject:(Architect *)value;
- (void)removeArchitectObject:(Architect *)value;
- (void)addArchitect:(NSSet *)value;
- (void)removeArchitect:(NSSet *)value;

- (void)addCollectionObject:(Collection *)value;
- (void)removeCollectionObject:(Collection *)value;
- (void)addCollection:(NSSet *)value;
- (void)removeCollection:(NSSet *)value;

@end
