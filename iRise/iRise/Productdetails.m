//
//  ProductDetails.m
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ProductDetails.h"


NSString *const kProductDetailsId = @"id";
NSString *const kProductDetailsName = @"name";
NSString *const kProductDetailsItemId = @"item_id";
NSString *const kProductDetailsProductsUsedId = @"products_used_id";


@interface ProductDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductDetails

@synthesize productDetailsIdentifier = _productDetailsIdentifier;
@synthesize name = _name;
@synthesize itemId = _itemId;
@synthesize productsUsedId = _productsUsedId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.productDetailsIdentifier = [[self objectOrNilForKey:kProductDetailsId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kProductDetailsName fromDictionary:dict];
            self.itemId = [[self objectOrNilForKey:kProductDetailsItemId fromDictionary:dict] doubleValue];
            self.productsUsedId = [[self objectOrNilForKey:kProductDetailsProductsUsedId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productDetailsIdentifier] forKey:kProductDetailsId];
    [mutableDict setValue:self.name forKey:kProductDetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kProductDetailsItemId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productsUsedId] forKey:kProductDetailsProductsUsedId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.productDetailsIdentifier = [aDecoder decodeDoubleForKey:kProductDetailsId];
    self.name = [aDecoder decodeObjectForKey:kProductDetailsName];
    self.itemId = [aDecoder decodeDoubleForKey:kProductDetailsItemId];
    self.productsUsedId = [aDecoder decodeDoubleForKey:kProductDetailsProductsUsedId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_productDetailsIdentifier forKey:kProductDetailsId];
    [aCoder encodeObject:_name forKey:kProductDetailsName];
    [aCoder encodeDouble:_itemId forKey:kProductDetailsItemId];
    [aCoder encodeDouble:_productsUsedId forKey:kProductDetailsProductsUsedId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProductDetails *copy = [[ProductDetails alloc] init];
    
    if (copy) {

        copy.productDetailsIdentifier = self.productDetailsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.itemId = self.itemId;
        copy.productsUsedId = self.productsUsedId;
    }
    
    return copy;
}


@end
