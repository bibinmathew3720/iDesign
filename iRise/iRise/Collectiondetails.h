//
//  CollectionDetails.h
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CollectionDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double collectionDetailsIdentifier;
@property (nonatomic, assign) double collectionId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double itemId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
