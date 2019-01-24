//
//  Countrydetails.m
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Countrydetails.h"
#import "Citydetails.h"


NSString *const kCountrydetailsId = @"id";
NSString *const kCountrydetailsName = @"name";
NSString *const kCountrydetailsCitydetails = @"citydetails";


@interface Countrydetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Countrydetails

@synthesize countrydetailsIdentifier = _countrydetailsIdentifier;
@synthesize name = _name;
@synthesize citydetails = _citydetails;


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
            self.countrydetailsIdentifier = [[self objectOrNilForKey:kCountrydetailsId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kCountrydetailsName fromDictionary:dict];
    NSObject *receivedCitydetails = [dict objectForKey:kCountrydetailsCitydetails];
    NSMutableArray *parsedCitydetails = [NSMutableArray array];
    if ([receivedCitydetails isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCitydetails) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCitydetails addObject:[Citydetails modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCitydetails isKindOfClass:[NSDictionary class]]) {
       [parsedCitydetails addObject:[Citydetails modelObjectWithDictionary:(NSDictionary *)receivedCitydetails]];
    }

    self.citydetails = [NSArray arrayWithArray:parsedCitydetails];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countrydetailsIdentifier] forKey:kCountrydetailsId];
    [mutableDict setValue:self.name forKey:kCountrydetailsName];
    NSMutableArray *tempArrayForCitydetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.citydetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCitydetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCitydetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCitydetails] forKey:kCountrydetailsCitydetails];

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

    self.countrydetailsIdentifier = [aDecoder decodeDoubleForKey:kCountrydetailsId];
    self.name = [aDecoder decodeObjectForKey:kCountrydetailsName];
    self.citydetails = [aDecoder decodeObjectForKey:kCountrydetailsCitydetails];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_countrydetailsIdentifier forKey:kCountrydetailsId];
    [aCoder encodeObject:_name forKey:kCountrydetailsName];
    [aCoder encodeObject:_citydetails forKey:kCountrydetailsCitydetails];
}

- (id)copyWithZone:(NSZone *)zone
{
    Countrydetails *copy = [[Countrydetails alloc] init];
    
    if (copy) {

        copy.countrydetailsIdentifier = self.countrydetailsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.citydetails = [self.citydetails copyWithZone:zone];
    }
    
    return copy;
}


@end
