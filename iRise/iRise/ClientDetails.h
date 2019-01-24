//
//  ClientDetails.h
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ClientDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double clientId;
@property (nonatomic, assign) double clientDetailsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double itemId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
