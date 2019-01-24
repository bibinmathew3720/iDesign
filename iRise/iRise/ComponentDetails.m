//
//  ComponentDetails.m
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ComponentDetails.h"


NSString *const kComponentDetailsId = @"id";
NSString *const kComponentDetailsComponentId = @"component_id";
NSString *const kComponentDetailsName = @"name";
NSString *const kComponentDetailsItemId = @"item_id";


@interface ComponentDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ComponentDetails

@synthesize componentDetailsIdentifier = _componentDetailsIdentifier;
@synthesize componentId = _componentId;
@synthesize name = _name;
@synthesize itemId = _itemId;


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
            self.componentDetailsIdentifier = [[self objectOrNilForKey:kComponentDetailsId fromDictionary:dict] doubleValue];
            self.componentId = [[self objectOrNilForKey:kComponentDetailsComponentId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kComponentDetailsName fromDictionary:dict];
            self.itemId = [[self objectOrNilForKey:kComponentDetailsItemId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.componentDetailsIdentifier] forKey:kComponentDetailsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.componentId] forKey:kComponentDetailsComponentId];
    [mutableDict setValue:self.name forKey:kComponentDetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kComponentDetailsItemId];

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

    self.componentDetailsIdentifier = [aDecoder decodeDoubleForKey:kComponentDetailsId];
    self.componentId = [aDecoder decodeDoubleForKey:kComponentDetailsComponentId];
    self.name = [aDecoder decodeObjectForKey:kComponentDetailsName];
    self.itemId = [aDecoder decodeDoubleForKey:kComponentDetailsItemId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_componentDetailsIdentifier forKey:kComponentDetailsId];
    [aCoder encodeDouble:_componentId forKey:kComponentDetailsComponentId];
    [aCoder encodeObject:_name forKey:kComponentDetailsName];
    [aCoder encodeDouble:_itemId forKey:kComponentDetailsItemId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ComponentDetails *copy = [[ComponentDetails alloc] init];
    
    if (copy) {

        copy.componentDetailsIdentifier = self.componentDetailsIdentifier;
        copy.componentId = self.componentId;
        copy.name = [self.name copyWithZone:zone];
        copy.itemId = self.itemId;
    }
    
    return copy;
}


@end
