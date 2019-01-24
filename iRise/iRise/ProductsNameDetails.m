
//
//  ProductsNameDetails.m
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//

#import "ProductsNameDetails.h"


NSString *const kProductsDetailsId = @"id";
NSString *const kProductsDetailsName = @"name";
NSString *const kProductsDetailsItemId = @"item_id";
NSString *const kProductsDetailsProductsId = @"product_id";


@interface ProductsNameDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductsNameDetails

@synthesize productsDetailsIdentifier = _productsDetailsIdentifier;
@synthesize name = _name;
@synthesize itemId = _itemId;
@synthesize productsId = _productsId;


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
        self.productsDetailsIdentifier = [[self objectOrNilForKey:kProductsDetailsId fromDictionary:dict] doubleValue];
        self.name = [self objectOrNilForKey:kProductsDetailsName fromDictionary:dict];
        self.itemId = [[self objectOrNilForKey:kProductsDetailsItemId fromDictionary:dict] doubleValue];
        self.productsId = [[self objectOrNilForKey:kProductsDetailsProductsId fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productsDetailsIdentifier] forKey:kProductsDetailsId];
    [mutableDict setValue:self.name forKey:kProductsDetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kProductsDetailsItemId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productsId] forKey:kProductsDetailsProductsId];
    
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
    
    self.productsDetailsIdentifier = [aDecoder decodeDoubleForKey:kProductsDetailsId];
    self.name = [aDecoder decodeObjectForKey:kProductsDetailsName];
    self.itemId = [aDecoder decodeDoubleForKey:kProductsDetailsItemId];
    self.productsId = [aDecoder decodeDoubleForKey:kProductsDetailsProductsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_productsDetailsIdentifier forKey:kProductsDetailsId];
    [aCoder encodeObject:_name forKey:kProductsDetailsName];
    [aCoder encodeDouble:_itemId forKey:kProductsDetailsItemId];
    [aCoder encodeDouble:_productsId forKey:kProductsDetailsProductsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProductsNameDetails *copy = [[ProductsNameDetails alloc] init];
    
    if (copy) {
        
        copy.productsDetailsIdentifier = self.productsDetailsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.itemId = self.itemId;
        copy.productsId = self.productsId;
    }
    
    return copy;
}


@end

