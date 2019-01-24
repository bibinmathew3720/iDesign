//
//  User.m
//
//  Created by FEBIN FATHAH on 13/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "User.h"


NSString *const kUserId = @"id";
NSString *const kUserPhone = @"phone";
NSString *const kUserCountryId = @"country_id";
NSString *const kUserMobile = @"mobile";
NSString *const kUserCityId = @"city_id";
NSString *const kUserAddress = @"address";
NSString *const kUserAddedOn = @"added_on";
NSString *const kUserPincode = @"pincode";
NSString *const kUserUsername = @"username";
NSString *const kUserFirstName = @"first_name";
NSString *const kUserLastName = @"last_name";
NSString *const kUserEmail = @"email";
NSString *const kUserGender = @"gender";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

@synthesize userIdentifier = _userIdentifier;
@synthesize phone = _phone;
@synthesize countryId = _countryId;
@synthesize mobile = _mobile;
@synthesize cityId = _cityId;
@synthesize address = _address;
@synthesize addedOn = _addedOn;
@synthesize pincode = _pincode;
@synthesize username = _username;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize email = _email;
@synthesize gender = _gender;


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
            self.userIdentifier = [[self objectOrNilForKey:kUserId fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kUserPhone fromDictionary:dict];
            self.countryId = [self objectOrNilForKey:kUserCountryId fromDictionary:dict];
            self.mobile = [[self objectOrNilForKey:kUserMobile fromDictionary:dict] doubleValue];
            self.cityId = [self objectOrNilForKey:kUserCityId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kUserAddress fromDictionary:dict];
            self.addedOn = [self objectOrNilForKey:kUserAddedOn fromDictionary:dict];
            self.pincode = [self objectOrNilForKey:kUserPincode fromDictionary:dict];
            self.username = [self objectOrNilForKey:kUserUsername fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kUserFirstName fromDictionary:dict];
            self.lastName = [self objectOrNilForKey:kUserLastName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kUserEmail fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kUserGender fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kUserId];
    [mutableDict setValue:self.phone forKey:kUserPhone];
    [mutableDict setValue:self.countryId forKey:kUserCountryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mobile] forKey:kUserMobile];
    [mutableDict setValue:self.cityId forKey:kUserCityId];
    [mutableDict setValue:self.address forKey:kUserAddress];
    [mutableDict setValue:self.addedOn forKey:kUserAddedOn];
    [mutableDict setValue:self.pincode forKey:kUserPincode];
    [mutableDict setValue:self.username forKey:kUserUsername];
    [mutableDict setValue:self.firstName forKey:kUserFirstName];
    [mutableDict setValue:self.lastName forKey:kUserLastName];
    [mutableDict setValue:self.email forKey:kUserEmail];
    [mutableDict setValue:self.gender forKey:kUserGender];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kUserId];
    self.phone = [aDecoder decodeObjectForKey:kUserPhone];
    self.countryId = [aDecoder decodeObjectForKey:kUserCountryId];
    self.mobile = [aDecoder decodeDoubleForKey:kUserMobile];
    self.cityId = [aDecoder decodeObjectForKey:kUserCityId];
    self.address = [aDecoder decodeObjectForKey:kUserAddress];
    self.addedOn = [aDecoder decodeObjectForKey:kUserAddedOn];
    self.pincode = [aDecoder decodeObjectForKey:kUserPincode];
    self.username = [aDecoder decodeObjectForKey:kUserUsername];
    self.firstName = [aDecoder decodeObjectForKey:kUserFirstName];
    self.lastName = [aDecoder decodeObjectForKey:kUserLastName];
    self.email = [aDecoder decodeObjectForKey:kUserEmail];
    self.gender = [aDecoder decodeObjectForKey:kUserGender];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kUserId];
    [aCoder encodeObject:_phone forKey:kUserPhone];
    [aCoder encodeObject:_countryId forKey:kUserCountryId];
    [aCoder encodeDouble:_mobile forKey:kUserMobile];
    [aCoder encodeObject:_cityId forKey:kUserCityId];
    [aCoder encodeObject:_address forKey:kUserAddress];
    [aCoder encodeObject:_addedOn forKey:kUserAddedOn];
    [aCoder encodeObject:_pincode forKey:kUserPincode];
    [aCoder encodeObject:_username forKey:kUserUsername];
    [aCoder encodeObject:_firstName forKey:kUserFirstName];
    [aCoder encodeObject:_lastName forKey:kUserLastName];
    [aCoder encodeObject:_email forKey:kUserEmail];
    [aCoder encodeObject:_gender forKey:kUserGender];
}

- (id)copyWithZone:(NSZone *)zone
{
    User *copy = [[User alloc] init];
    
    if (copy) {

        copy.userIdentifier = self.userIdentifier;
        copy.phone = [self.phone copyWithZone:zone];
        copy.countryId = [self.countryId copyWithZone:zone];
        copy.mobile = self.mobile;
        copy.cityId = [self.cityId copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.addedOn = [self.addedOn copyWithZone:zone];
        copy.pincode = [self.pincode copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
    }
    
    return copy;
}


@end
