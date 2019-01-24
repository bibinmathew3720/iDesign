//
//  ProductsNameDetails.h
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductsNameDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double productsDetailsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double itemId;
@property (nonatomic, assign) double productsId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
