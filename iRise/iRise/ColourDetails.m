//
//  ColourDetails.m
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ColourDetails.h"


NSString *const kColourDetailsId = @"id";
NSString *const kColourDetailsName = @"name";
NSString *const kColourDetailsItemId = @"item_id";
NSString *const kColourDetailsColourId = @"colour_id";


@interface ColourDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ColourDetails

@synthesize colourDetailsIdentifier = _colourDetailsIdentifier;
@synthesize name = _name;
@synthesize itemId = _itemId;
@synthesize colourId = _colourId;


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
            self.colourDetailsIdentifier = [[self objectOrNilForKey:kColourDetailsId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kColourDetailsName fromDictionary:dict];
            self.itemId = [[self objectOrNilForKey:kColourDetailsItemId fromDictionary:dict] doubleValue];
            self.colourId = [[self objectOrNilForKey:kColourDetailsColourId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.colourDetailsIdentifier] forKey:kColourDetailsId];
    [mutableDict setValue:self.name forKey:kColourDetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kColourDetailsItemId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.colourId] forKey:kColourDetailsColourId];

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

    self.colourDetailsIdentifier = [aDecoder decodeDoubleForKey:kColourDetailsId];
    self.name = [aDecoder decodeObjectForKey:kColourDetailsName];
    self.itemId = [aDecoder decodeDoubleForKey:kColourDetailsItemId];
    self.colourId = [aDecoder decodeDoubleForKey:kColourDetailsColourId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_colourDetailsIdentifier forKey:kColourDetailsId];
    [aCoder encodeObject:_name forKey:kColourDetailsName];
    [aCoder encodeDouble:_itemId forKey:kColourDetailsItemId];
    [aCoder encodeDouble:_colourId forKey:kColourDetailsColourId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ColourDetails *copy = [[ColourDetails alloc] init];
    
    if (copy) {

        copy.colourDetailsIdentifier = self.colourDetailsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.itemId = self.itemId;
        copy.colourId = self.colourId;
    }
    
    return copy;
}


@end
