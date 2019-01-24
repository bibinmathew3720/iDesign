//
//  LoginUser.m
//
//  Created by FEBIN FATHAH on 25/07/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoginUser.h"
#import "User.h"


NSString *const kLoginUserId = @"id";
NSString *const kLoginUserUser = @"user";
NSString *const kLoginUserSessionId = @"session_id";


@interface LoginUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginUser

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize user = _user;
@synthesize sessionId = _sessionId;


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
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kLoginUserId fromDictionary:dict] doubleValue];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kLoginUserUser]];
            self.sessionId = [self objectOrNilForKey:kLoginUserSessionId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kLoginUserId];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kLoginUserUser];
    [mutableDict setValue:self.sessionId forKey:kLoginUserSessionId];

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

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kLoginUserId];
    self.user = [aDecoder decodeObjectForKey:kLoginUserUser];
    self.sessionId = [aDecoder decodeObjectForKey:kLoginUserSessionId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kLoginUserId];
    [aCoder encodeObject:_user forKey:kLoginUserUser];
    [aCoder encodeObject:_sessionId forKey:kLoginUserSessionId];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginUser *copy = [[LoginUser alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.user = [self.user copyWithZone:zone];
        copy.sessionId = [self.sessionId copyWithZone:zone];
    }
    
    return copy;
}


@end
