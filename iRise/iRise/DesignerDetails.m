//
//  DesignerDetails.m
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DesignerDetails.h"


NSString *const kDesignerDetailsId = @"id";
NSString *const kDesignerDetailsDesignerId = @"designer_id";
NSString *const kDesignerDetailsItemId = @"item_id";
NSString *const kDesignerDetailsName = @"name";


@interface DesignerDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DesignerDetails

@synthesize designerDetailsIdentifier = _designerDetailsIdentifier;
@synthesize designerId = _designerId;
@synthesize itemId = _itemId;
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
            self.designerDetailsIdentifier = [[self objectOrNilForKey:kDesignerDetailsId fromDictionary:dict] doubleValue];
            self.designerId = [[self objectOrNilForKey:kDesignerDetailsDesignerId fromDictionary:dict] doubleValue];
            self.itemId = [[self objectOrNilForKey:kDesignerDetailsItemId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kDesignerDetailsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.designerDetailsIdentifier] forKey:kDesignerDetailsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.designerId] forKey:kDesignerDetailsDesignerId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kDesignerDetailsItemId];
    [mutableDict setValue:self.name forKey:kDesignerDetailsName];

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

    self.designerDetailsIdentifier = [aDecoder decodeDoubleForKey:kDesignerDetailsId];
    self.designerId = [aDecoder decodeDoubleForKey:kDesignerDetailsDesignerId];
    self.itemId = [aDecoder decodeDoubleForKey:kDesignerDetailsItemId];
    self.name = [aDecoder decodeObjectForKey:kDesignerDetailsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_designerDetailsIdentifier forKey:kDesignerDetailsId];
    [aCoder encodeDouble:_designerId forKey:kDesignerDetailsDesignerId];
    [aCoder encodeDouble:_itemId forKey:kDesignerDetailsItemId];
    [aCoder encodeObject:_name forKey:kDesignerDetailsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    DesignerDetails *copy = [[DesignerDetails alloc] init];
    
    if (copy) {

        copy.designerDetailsIdentifier = self.designerDetailsIdentifier;
        copy.designerId = self.designerId;
        copy.itemId = self.itemId;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
