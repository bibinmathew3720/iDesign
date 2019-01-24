//
//  CompanyDetails.h
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyDetails : NSObject<NSCoding, NSCopying>

@property (nonatomic, assign) double companyDetailsIdentifier;
@property (nonatomic, assign) double companyId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double itemId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
