//
//  Applicatordetails.m
//  iRise
//
//  Created by Mobtecnica on 19/04/17.
//  Copyright © 2017 Febin. All rights reserved.
//

#import "Applicatordetails.h"




NSString *const kApplicatordetailsId = @"id";
NSString *const kApplicatordetailsApplicatorId = @"applicator_id";
NSString *const kApplicatordetailsName = @"name";
NSString *const kApplicatordetailsProjectId = @"item_id";


@interface Applicatordetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Applicatordetails

@synthesize applicatordetailsIdentifier = _applicatordetailsIdentifier;
@synthesize applicatorId = _applicatorId;
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
        self.applicatordetailsIdentifier = [[self objectOrNilForKey:kApplicatordetailsId fromDictionary:dict] doubleValue];
        self.applicatorId = [[self objectOrNilForKey:kApplicatordetailsApplicatorId fromDictionary:dict] doubleValue];
        self.name = [self objectOrNilForKey:kApplicatordetailsName fromDictionary:dict];
        self.projectId = [[self objectOrNilForKey:kApplicatordetailsProjectId fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicatordetailsIdentifier] forKey:kApplicatordetailsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicatorId] forKey:kApplicatordetailsApplicatorId];
    [mutableDict setValue:self.name forKey:kApplicatordetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.projectId] forKey:kApplicatordetailsProjectId];
    
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
    
    self.applicatordetailsIdentifier = [aDecoder decodeDoubleForKey:kApplicatordetailsId];
    self.applicatorId = [aDecoder decodeDoubleForKey:kApplicatordetailsApplicatorId];
    self.name = [aDecoder decodeObjectForKey:kApplicatordetailsName];
    self.projectId = [aDecoder decodeDoubleForKey:kApplicatordetailsProjectId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_applicatordetailsIdentifier forKey:kApplicatordetailsId];
    [aCoder encodeDouble:_applicatorId forKey:kApplicatordetailsApplicatorId];
    [aCoder encodeObject:_name forKey:kApplicatordetailsName];
    [aCoder encodeDouble:_projectId forKey:kApplicatordetailsProjectId];
}

- (id)copyWithZone:(NSZone *)zone
{
   Applicatordetails *copy = [[Applicatordetails alloc] init];
    
    if (copy) {
        
        copy.applicatordetailsIdentifier = self.applicatordetailsIdentifier;
        copy.applicatorId = self.applicatorId;
        copy.name = [self.name copyWithZone:zone];
        copy.projectId = self.projectId;
    }
    
    return copy;
}


@end
