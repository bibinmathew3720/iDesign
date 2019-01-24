//
//  Product.h
//
//  Created by Mobtecnica  on 05/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ComponentDetailsDB, CollectionDetailsDB, ColourDetailsDB, DesignerDetailsDB, ApplicatorDetailsDB, ClientDetailsDB, ProductDetailsDB, CompanyDetailsDB, ProductsDetailsDB;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber *internalBaseClassIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *pacId;
@property (nonatomic, retain) NSString *pmuName;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *pacName;
@property (nonatomic, retain) NSNumber *pmuId;
@property (nonatomic, retain) NSNumber *align;
@property (nonatomic, retain) NSSet *componentDetailsDB;
@property (nonatomic, retain) NSSet *collectionDetailsDB;
@property (nonatomic, retain) NSSet *colourDetailsDB;
@property (nonatomic, retain) NSSet *designerDetailsDB;
@property (nonatomic, retain) NSSet *applicatorDetailsDB;
@property (nonatomic, retain) NSSet *clientDetailsDB;
@property (nonatomic, retain) NSSet *productDetailsDB;
@property (nonatomic, retain) NSSet *companyDetailsDB;
@property (nonatomic, retain) NSSet *productsDetailsDB;


@end

@interface Product (JSONModelerGeneratedAccessors)

- (void)addComponentDetailsDBObject:(ComponentDetailsDB *)value;
- (void)removeComponentDetailsDBObject:(ComponentDetailsDB *)value;
- (void)addComponentDetailsDB:(NSSet *)value;
- (void)removeComponentDetailsDB:(NSSet *)value;

////
- (void)addCompanyDetailsDBObject:(CompanyDetailsDB *)value;
- (void)removeCompanyDetailsDBObject:(CompanyDetailsDB *)value;
- (void)addCompanyDetailsDB:(NSSet *)value;
- (void)removeCompanyDetailsDB:(NSSet *)value;

- (void)addProductsDetailsDBObject:(ProductsDetailsDB *)value;
- (void)removeProductsDetailsDBObject:(ProductsDetailsDB *)value;
- (void)addProductsDetailsDB:(NSSet *)value;
- (void)removeProductsDetailsDB:(NSSet *)value;

////

- (void)addCollectionDetailsDBObject:(CollectionDetailsDB *)value;
- (void)removeCollectionDetailsDBObject:(CollectionDetailsDB *)value;
- (void)addCollectionDetailsDB:(NSSet *)value;
- (void)removeCollectionDetailsDB:(NSSet *)value;

- (void)addColourDetailsDBObject:(ColourDetailsDB *)value;
- (void)removeColourDetailsDBObject:(ColourDetailsDB *)value;
- (void)addColourDetailsDB:(NSSet *)value;
- (void)removeColourDetailsDB:(NSSet *)value;

- (void)addDesignerDetailsDBObject:(DesignerDetailsDB *)value;
- (void)removeDesignerDetailsDBObject:(DesignerDetailsDB *)value;
- (void)addDesignerDetailsDB:(NSSet *)value;
- (void)removeDesignerDetailsDB:(NSSet *)value;

- (void)addApplicatorDetailsDBObject:(ApplicatorDetailsDB *)value;
- (void)removeApplicatorDetailsDBObject:(ApplicatorDetailsDB *)value;
- (void)addApplicatorDetailsDB:(NSSet *)value;
- (void)removeApplicatorDetailsDB:(NSSet *)value;

- (void)addClientDetailsDBObject:(ClientDetailsDB *)value;
- (void)removeClientDetailsDBObject:(ClientDetailsDB *)value;
- (void)addClientDetailsDB:(NSSet *)value;
- (void)removeClientDetailsDB:(NSSet *)value;

- (void)addProductDetailsDBObject:(ProductDetailsDB *)value;
- (void)removeProductDetailsDBObject:(ProductDetailsDB *)value;
- (void)addProductDetailsDB:(NSSet *)value;
- (void)removeProductDetailsDB:(NSSet *)value;

@end
