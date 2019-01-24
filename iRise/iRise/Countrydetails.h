//
//  Countrydetails.h
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Countrydetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double countrydetailsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *citydetails;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
