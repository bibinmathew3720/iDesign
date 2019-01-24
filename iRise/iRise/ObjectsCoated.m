//
//  ObjectsCoated.m
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ObjectsCoated.h"


NSString *const kObjectsCoatedId = @"id";
NSString *const kObjectsCoatedName = @"name";


@interface ObjectsCoated ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ObjectsCoated

@synthesize objectsCoatedIdentifier = _objectsCoatedIdentifier;
@synthesize name = _name;


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
            self.objectsCoatedIdentifier = [[self objectOrNilForKey:kObjectsCoatedId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kObjectsCoatedName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objectsCoatedIdentifier] forKey:kObjectsCoatedId];
    [mutableDict setValue:self.name forKey:kObjectsCoatedName];

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

    self.objectsCoatedIdentifier = [aDecoder decodeDoubleForKey:kObjectsCoatedId];
    self.name = [aDecoder decodeObjectForKey:kObjectsCoatedName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_objectsCoatedIdentifier forKey:kObjectsCoatedId];
    [aCoder encodeObject:_name forKey:kObjectsCoatedName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ObjectsCoated *copy = [[ObjectsCoated alloc] init];
    
    if (copy) {

        copy.objectsCoatedIdentifier = self.objectsCoatedIdentifier;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
