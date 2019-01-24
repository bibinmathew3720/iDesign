//
//  Buildingtype.m
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Buildingtype.h"


NSString *const kBuildingtypeId = @"id";
NSString *const kBuildingtypeName = @"name";
NSString *const kBuildingtypeItemId = @"item_id";
NSString *const kBuildingcomponentId = @"component_id";



@interface Buildingtype ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Buildingtype

@synthesize buildingtypeIdentifier = _buildingtypeIdentifier;
@synthesize name = _name;
@synthesize componentId =_componentId ;
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
            self.buildingtypeIdentifier = [[self objectOrNilForKey:kBuildingtypeId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kBuildingtypeName fromDictionary:dict];
        self.componentId = [[self objectOrNilForKey:kBuildingcomponentId fromDictionary:dict]doubleValue];
        self.itemId = [[self objectOrNilForKey:kBuildingtypeItemId fromDictionary:dict]doubleValue];



    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buildingtypeIdentifier] forKey:kBuildingtypeId];
    [mutableDict setValue:self.name forKey:kBuildingtypeName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.componentId] forKey:kBuildingcomponentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kBuildingtypeItemId];



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

    self.buildingtypeIdentifier = [aDecoder decodeDoubleForKey:kBuildingtypeId];
    self.name = [aDecoder decodeObjectForKey:kBuildingtypeName];
    self.componentId = [aDecoder decodeDoubleForKey:kBuildingcomponentId];
    self.itemId = [aDecoder decodeDoubleForKey:kBuildingtypeItemId];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_buildingtypeIdentifier forKey:kBuildingtypeId];
    [aCoder encodeObject:_name forKey:kBuildingtypeName];
    [aCoder encodeDouble:_componentId forKey:kBuildingcomponentId];
    [aCoder encodeDouble:_itemId forKey:kBuildingtypeItemId];

}

- (id)copyWithZone:(NSZone *)zone
{
    Buildingtype *copy = [[Buildingtype alloc] init];
    
    if (copy) {

        copy.buildingtypeIdentifier = self.buildingtypeIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.componentId = self.componentId;
        copy.itemId = self.itemId;

    }
    
    return copy;
}


@end
