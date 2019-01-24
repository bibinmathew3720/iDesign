//
//  ColourDetails.h
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ColourDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double colourDetailsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double itemId;
@property (nonatomic, assign) double colourId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
