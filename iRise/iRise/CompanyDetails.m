//
//  CompanyDetails.m
//  iRise
//
//  Created by Admin on 09/01/18.
//  Copyright © 2018 Febin. All rights reserved.
//

#import "CompanyDetails.h"


NSString *const kCompanyDetailsId = @"id";
NSString *const kCompanyDetailsComponentId = @"company_id";
NSString *const kCompanyDetailsName = @"name";
NSString *const kCompanyDetailsItemId = @"item_id";


@interface CompanyDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CompanyDetails

@synthesize companyDetailsIdentifier = _companyDetailsIdentifier;
@synthesize companyId = _companyId;
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
        self.companyDetailsIdentifier = [[self objectOrNilForKey:kCompanyDetailsId fromDictionary:dict] doubleValue];
        self.companyId = [[self objectOrNilForKey:kCompanyDetailsComponentId fromDictionary:dict] doubleValue];
        self.name = [self objectOrNilForKey:kCompanyDetailsName fromDictionary:dict];
        self.itemId = [[self objectOrNilForKey:kCompanyDetailsItemId fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.companyDetailsIdentifier] forKey:kCompanyDetailsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.companyId] forKey:kCompanyDetailsComponentId];
    [mutableDict setValue:self.name forKey:kCompanyDetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kCompanyDetailsItemId];
    
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
    
    self.companyDetailsIdentifier = [aDecoder decodeDoubleForKey:kCompanyDetailsId];
    self.companyId = [aDecoder decodeDoubleForKey:kCompanyDetailsComponentId];
    self.name = [aDecoder decodeObjectForKey:kCompanyDetailsName];
    self.itemId = [aDecoder decodeDoubleForKey:kCompanyDetailsItemId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_companyDetailsIdentifier forKey:kCompanyDetailsId];
    [aCoder encodeDouble:_companyId forKey:kCompanyDetailsComponentId];
    [aCoder encodeObject:_name forKey:kCompanyDetailsName];
    [aCoder encodeDouble:_itemId forKey:kCompanyDetailsItemId];
}

- (id)copyWithZone:(NSZone *)zone
{
    CompanyDetails *copy = [[CompanyDetails alloc] init];
    
    if (copy) {
        
        copy.companyDetailsIdentifier = self.companyDetailsIdentifier;
        copy.companyId = self.companyId;
        copy.name = [self.name copyWithZone:zone];
        copy.itemId = self.itemId;
    }
    
    return copy;
}

@end
