//
//  ProductDetails.h
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProductDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double productDetailsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double itemId;
@property (nonatomic, assign) double productsUsedId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
