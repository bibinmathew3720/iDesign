//
//  SearchParams.h
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SearchParams : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double city;
@property (nonatomic, assign) double country;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, assign) double building;
@property (nonatomic, assign) double collection;

@property (nonatomic, strong) NSString *sessionId;

@property (nonatomic, assign) double products;
@property (nonatomic, assign) double objectsCoated;
@property (nonatomic, assign) double architect;

@property (nonatomic, assign) double items;
//@property (nonatomic, assign) double collection;
@property (nonatomic, assign) double client;
@property (nonatomic, assign) double applicator;
@property (nonatomic, assign) double colour;
//@property (nonatomic, assign) double products;
@property (nonatomic, assign) double component;

@property (nonatomic, assign) double designer;
@property (nonatomic, assign) double pacCountry;
@property (nonatomic, assign) double pmuCountry;
@property (nonatomic, assign) double company;
@property (nonatomic, assign) double productsDetails;



+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
