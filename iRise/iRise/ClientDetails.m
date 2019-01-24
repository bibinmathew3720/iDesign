//
//  ClientDetails.m
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ClientDetails.h"


NSString *const kClientDetailsClientId = @"client_id";
NSString *const kClientDetailsId = @"id";
NSString *const kClientDetailsName = @"name";
NSString *const kClientDetailsItemId = @"item_id";


@interface ClientDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClientDetails

@synthesize clientId = _clientId;
@synthesize clientDetailsIdentifier = _clientDetailsIdentifier;
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
            self.clientId = [[self objectOrNilForKey:kClientDetailsClientId fromDictionary:dict] doubleValue];
            self.clientDetailsIdentifier = [[self objectOrNilForKey:kClientDetailsId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kClientDetailsName fromDictionary:dict];
            self.itemId = [[self objectOrNilForKey:kClientDetailsItemId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.clientId] forKey:kClientDetailsClientId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.clientDetailsIdentifier] forKey:kClientDetailsId];
    [mutableDict setValue:self.name forKey:kClientDetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kClientDetailsItemId];

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

    self.clientId = [aDecoder decodeDoubleForKey:kClientDetailsClientId];
    self.clientDetailsIdentifier = [aDecoder decodeDoubleForKey:kClientDetailsId];
    self.name = [aDecoder decodeObjectForKey:kClientDetailsName];
    self.itemId = [aDecoder decodeDoubleForKey:kClientDetailsItemId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_clientId forKey:kClientDetailsClientId];
    [aCoder encodeDouble:_clientDetailsIdentifier forKey:kClientDetailsId];
    [aCoder encodeObject:_name forKey:kClientDetailsName];
    [aCoder encodeDouble:_itemId forKey:kClientDetailsItemId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ClientDetails *copy = [[ClientDetails alloc] init];
    
    if (copy) {

        copy.clientId = self.clientId;
        copy.clientDetailsIdentifier = self.clientDetailsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.itemId = self.itemId;
    }
    
    return copy;
}


@end
