//
//  CollectionDetails.m
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Collectiondetails.h"


NSString *const kCollectionDetailsId = @"id";
NSString *const kCollectionDetailsCollectionId = @"collection_id";
NSString *const kCollectionDetailsName = @"name";
NSString *const kCollectionDetailsItemId = @"item_id";


@interface CollectionDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CollectionDetails

@synthesize collectionDetailsIdentifier = _collectionDetailsIdentifier;
@synthesize collectionId = _collectionId;
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
            self.collectionDetailsIdentifier = [[self objectOrNilForKey:kCollectionDetailsId fromDictionary:dict] doubleValue];
            self.collectionId = [[self objectOrNilForKey:kCollectionDetailsCollectionId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kCollectionDetailsName fromDictionary:dict];
            self.itemId = [[self objectOrNilForKey:kCollectionDetailsItemId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collectionDetailsIdentifier] forKey:kCollectionDetailsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collectionId] forKey:kCollectionDetailsCollectionId];
    [mutableDict setValue:self.name forKey:kCollectionDetailsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kCollectionDetailsItemId];

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

    self.collectionDetailsIdentifier = [aDecoder decodeDoubleForKey:kCollectionDetailsId];
    self.collectionId = [aDecoder decodeDoubleForKey:kCollectionDetailsCollectionId];
    self.name = [aDecoder decodeObjectForKey:kCollectionDetailsName];
    self.itemId = [aDecoder decodeDoubleForKey:kCollectionDetailsItemId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_collectionDetailsIdentifier forKey:kCollectionDetailsId];
    [aCoder encodeDouble:_collectionId forKey:kCollectionDetailsCollectionId];
    [aCoder encodeObject:_name forKey:kCollectionDetailsName];
    [aCoder encodeDouble:_itemId forKey:kCollectionDetailsItemId];
}

- (id)copyWithZone:(NSZone *)zone
{
    CollectionDetails *copy = [[CollectionDetails alloc] init];
    
    if (copy) {

        copy.collectionDetailsIdentifier = self.collectionDetailsIdentifier;
        copy.collectionId = self.collectionId;
        copy.name = [self.name copyWithZone:zone];
        copy.itemId = self.itemId;
    }
    
    return copy;
}


@end
