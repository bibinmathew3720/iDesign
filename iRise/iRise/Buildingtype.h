//
//  Buildingtype.h
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Buildingtype : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double buildingtypeIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double componentId;
@property (nonatomic, assign) double itemId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
