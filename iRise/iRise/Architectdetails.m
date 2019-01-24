//
//  Architectdetails.m
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Architectdetails.h"


NSString *const kArchitectdetailsId = @"id";
NSString *const kArchitectdetailsArchitectId = @"applicator_id";
NSString *const kArchitectdetailsName = @"name";
NSString *const kArchitectdetailsProjectId = @"item_id";


@interface Architectdetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Architectdetails

@synthesize architectdetailsIdentifier = _architectdetailsIdentifier;
@synthesize architectId = _architectId;
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
            self.architectdetailsIdentifier = [[self objectOrNilForKey:kArchitectdetailsId fromDictionary:dict] doubleValue];
            self.architectId = [[self objectOrNilForKey:kArchitectdetailsArchitectId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kArchitectdetailsName fromDictionary:dict];
            self.projectId = [[self objectOrNilForKey:kArchitectdetailsProjectId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.architectdetailsIdentifier] forKey:kArchitectdetailsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.architectId] forKey:kArchitectdetailsArchitectId];
    [mutableDict setValue:self.name forKey:kArchitectdetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.projectId] forKey:kArchitectdetailsProjectId];

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

    self.architectdetailsIdentifier = [aDecoder decodeDoubleForKey:kArchitectdetailsId];
    self.architectId = [aDecoder decodeDoubleForKey:kArchitectdetailsArchitectId];
    self.name = [aDecoder decodeObjectForKey:kArchitectdetailsName];
    self.projectId = [aDecoder decodeDoubleForKey:kArchitectdetailsProjectId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_architectdetailsIdentifier forKey:kArchitectdetailsId];
    [aCoder encodeDouble:_architectId forKey:kArchitectdetailsArchitectId];
    [aCoder encodeObject:_name forKey:kArchitectdetailsName];
    [aCoder encodeDouble:_projectId forKey:kArchitectdetailsProjectId];
}

- (id)copyWithZone:(NSZone *)zone
{
    Architectdetails *copy = [[Architectdetails alloc] init];
    
    if (copy) {

        copy.architectdetailsIdentifier = self.architectdetailsIdentifier;
        copy.architectId = self.architectId;
        copy.name = [self.name copyWithZone:zone];
        copy.projectId = self.projectId;
    }
    
    return copy;
}


@end
