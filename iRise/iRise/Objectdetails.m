//
//  Objectdetails.m
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Objectdetails.h"


NSString *const kObjectdetailsId = @"id";
NSString *const kObjectdetailsObjectsCoatedId = @"collection_id";
NSString *const kObjectdetailsName = @"name";
NSString *const kObjectdetailsProjectId = @"item_id";


@interface Objectdetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Objectdetails

@synthesize objectdetailsIdentifier = _objectdetailsIdentifier;
@synthesize objectsCoatedId = _objectsCoatedId;
@synthesize name = _name;
@synthesize projectId = _projectId;


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
            self.objectdetailsIdentifier = [[self objectOrNilForKey:kObjectdetailsId fromDictionary:dict] doubleValue];
            self.objectsCoatedId = [[self objectOrNilForKey:kObjectdetailsObjectsCoatedId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kObjectdetailsName fromDictionary:dict];
            self.projectId = [[self objectOrNilForKey:kObjectdetailsProjectId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objectdetailsIdentifier] forKey:kObjectdetailsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objectsCoatedId] forKey:kObjectdetailsObjectsCoatedId];
    [mutableDict setValue:self.name forKey:kObjectdetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.projectId] forKey:kObjectdetailsProjectId];

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

    self.objectdetailsIdentifier = [aDecoder decodeDoubleForKey:kObjectdetailsId];
    self.objectsCoatedId = [aDecoder decodeDoubleForKey:kObjectdetailsObjectsCoatedId];
    self.name = [aDecoder decodeObjectForKey:kObjectdetailsName];
    self.projectId = [aDecoder decodeDoubleForKey:kObjectdetailsProjectId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_objectdetailsIdentifier forKey:kObjectdetailsId];
    [aCoder encodeDouble:_objectsCoatedId forKey:kObjectdetailsObjectsCoatedId];
    [aCoder encodeObject:_name forKey:kObjectdetailsName];
    [aCoder encodeDouble:_projectId forKey:kObjectdetailsProjectId];
}

- (id)copyWithZone:(NSZone *)zone
{
    Objectdetails *copy = [[Objectdetails alloc] init];
    
    if (copy) {

        copy.objectdetailsIdentifier = self.objectdetailsIdentifier;
        copy.objectsCoatedId = self.objectsCoatedId;
        copy.name = [self.name copyWithZone:zone];
        copy.projectId = self.projectId;
    }
    
    return copy;
}


@end
