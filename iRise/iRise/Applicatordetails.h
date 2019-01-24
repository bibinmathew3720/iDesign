//
//  Applicatordetails.h
//  iRise
//
//  Created by Mobtecnica on 19/04/17.
//  Copyright © 2017 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Applicatordetails : NSObject <NSCoding, NSCopying>


@property (nonatomic, assign) double applicatordetailsIdentifier;
@property (nonatomic, assign) double applicatorId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double projectId;
@property (nonatomic, assign) double itemId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;


@end
