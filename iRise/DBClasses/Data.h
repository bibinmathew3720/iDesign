//
//  Data.h
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double align;
@property (nonatomic, strong) NSArray *architectdetails;
@property (nonatomic, assign) double countryId;
@property (nonatomic, strong) NSArray *productdetails;

@property (nonatomic, strong) NSArray *componentDetails;
@property (nonatomic, strong) NSArray *colourDetails;

@property (nonatomic, assign) double cityId;
@property (nonatomic, strong) NSString *buildingType;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign) double buildingTypeId;
@property (nonatomic, strong) NSString *completionYear;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSArray *collectiondetails;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *objectdetails;

@property (nonatomic, strong) NSArray *clientDetails;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
