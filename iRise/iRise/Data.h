//
//  Data.h
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSArray *designerDetails;
@property (nonatomic, strong) NSArray *productDetails;
@property (nonatomic, assign) double pacId;
@property (nonatomic, strong) NSArray *componentDetails;
@property (nonatomic, strong) NSArray *applicatorDetails;
@property (nonatomic, strong) NSString *pmuName;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign) double pmuId;
@property (nonatomic, strong) NSString *pacName;
@property (nonatomic, strong) NSArray *clientDetails;
@property (nonatomic, strong) NSArray *colourDetails;
@property (nonatomic, strong) NSArray *collectionDetails;
@property (nonatomic, assign) double align;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *companyDetails;
@property (nonatomic, strong) NSArray *productsDetails;



+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
