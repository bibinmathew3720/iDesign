//
//  Citydetails.m
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Citydetails.h"


NSString *const kCitydetailsId = @"id";
NSString *const kCitydetailsName = @"name";
NSString *const kCitydetailsCountryId = @"country_id";


@interface Citydetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Citydetails

@synthesize citydetailsIdentifier = _citydetailsIdentifier;
@synthesize name = _name;
@synthesize countryId = _countryId;


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
            self.citydetailsIdentifier = [[self objectOrNilForKey:kCitydetailsId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kCitydetailsName fromDictionary:dict];
            self.countryId = [[self objectOrNilForKey:kCitydetailsCountryId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.citydetailsIdentifier] forKey:kCitydetailsId];
    [mutableDict setValue:self.name forKey:kCitydetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countryId] forKey:kCitydetailsCountryId];

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

    self.citydetailsIdentifier = [aDecoder decodeDoubleForKey:kCitydetailsId];
    self.name = [aDecoder decodeObjectForKey:kCitydetailsName];
    self.countryId = [aDecoder decodeDoubleForKey:kCitydetailsCountryId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_citydetailsIdentifier forKey:kCitydetailsId];
    [aCoder encodeObject:_name forKey:kCitydetailsName];
    [aCoder encodeDouble:_countryId forKey:kCitydetailsCountryId];
}

- (id)copyWithZone:(NSZone *)zone
{
    Citydetails *copy = [[Citydetails alloc] init];
    
    if (copy) {

        copy.citydetailsIdentifier = self.citydetailsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.countryId = self.countryId;
    }
    
    return copy;
}


@end
