//
//  Menu.h
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Menu : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *buildingtype;
@property (nonatomic, strong) NSArray *architectdetails;
@property (nonatomic, strong) NSArray *objectsCoated;
@property (nonatomic, strong) NSArray *countrydetails;
@property (nonatomic, strong) NSArray *productdetails;
@property (nonatomic, strong) NSArray *collectiondetails;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
