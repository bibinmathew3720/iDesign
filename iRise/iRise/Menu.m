//
//  Menu.m
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Menu.h"
#import "Buildingtype.h"
#import "Architectdetails.h"
#import "ObjectsCoated.h"
#import "Countrydetails.h"
#import "Productdetails.h"
#import "Collectiondetails.h"
#import "ComponentDetails.h"


NSString *const kMenuBuildingtype = @"buildingtype";
NSString *const kMenuArchitectdetails = @"architectdetails";
NSString *const kMenuObjectsCoated = @"product_details";
NSString *const kMenuCountrydetails = @"countrydetails";
NSString *const kMenuProductdetails = @"productdetails";
NSString *const kMenuCollectiondetails = @"collectiondetails";


@interface Menu ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Menu

@synthesize buildingtype = _buildingtype;
@synthesize architectdetails = _architectdetails;
@synthesize objectsCoated = _objectsCoated;
@synthesize countrydetails = _countrydetails;
@synthesize productdetails = _productdetails;
@synthesize collectiondetails = _collectiondetails;


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
        
        NSObject *receivedBuildingtype = [dict objectForKey:kMenuBuildingtype];
        NSMutableArray *parsedBuildingtype = [NSMutableArray array];
        if ([receivedBuildingtype isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedBuildingtype) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    Buildingtype *buildingType = [Buildingtype modelObjectWithDictionary:(NSDictionary *)item];
                    if (![buildingType.name isEqualToString:@"N/A"])
                        [parsedBuildingtype addObject:buildingType];
                }
            }
        } else if ([receivedBuildingtype isKindOfClass:[NSDictionary class]]) {
            Buildingtype *buildingType = [Buildingtype modelObjectWithDictionary:(NSDictionary *)receivedBuildingtype];
            if (![buildingType.name isEqualToString:@"N/A"])
                [parsedBuildingtype addObject:buildingType];
        }
        self.buildingtype = [NSArray arrayWithArray:parsedBuildingtype];
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        NSObject *receivedArchitectdetails = [dict objectForKey:kMenuArchitectdetails];
        NSMutableArray *parsedArchitectdetails = [NSMutableArray array];
        if ([receivedArchitectdetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedArchitectdetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    Architectdetails *architectdetails = [Architectdetails modelObjectWithDictionary:item];
                    if (![architectdetails.name isEqualToString:@"N/A"])
                    [parsedArchitectdetails addObject:[Architectdetails modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedArchitectdetails isKindOfClass:[NSDictionary class]]) {
            Architectdetails *architectdetails = [Architectdetails modelObjectWithDictionary:(NSDictionary *)receivedArchitectdetails];
            if (![architectdetails.name isEqualToString:@"N/A"])
            [parsedArchitectdetails addObject:architectdetails];
        }
        self.architectdetails = [NSArray arrayWithArray:parsedArchitectdetails];
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        NSObject *receivedObjectsCoated = [dict objectForKey:kMenuObjectsCoated];
        NSMutableArray *parsedObjectsCoated = [NSMutableArray array];
        if ([receivedObjectsCoated isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedObjectsCoated) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    ObjectsCoated *objectCoated = [ObjectsCoated modelObjectWithDictionary:item];
                    if (![objectCoated.name isEqualToString:@"N/A"]) {
                        [parsedObjectsCoated addObject:objectCoated];
                    }
                    
                }
            }
        } else if ([receivedObjectsCoated isKindOfClass:[NSDictionary class]]) {
            ObjectsCoated *objectCoated = [ObjectsCoated modelObjectWithDictionary:(NSDictionary *)receivedObjectsCoated];
            if (![objectCoated.name isEqualToString:@"N/A"]) {
                [parsedObjectsCoated addObject:objectCoated];
            }
            
        }
        self.objectsCoated = [NSArray arrayWithArray:parsedObjectsCoated];
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        NSObject *receivedCountrydetails = [dict objectForKey:kMenuCountrydetails];
        NSMutableArray *parsedCountrydetails = [NSMutableArray array];
        if ([receivedCountrydetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedCountrydetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    Countrydetails *countryDetails = [Countrydetails modelObjectWithDictionary:item];
                    if (![countryDetails.name isEqualToString:@"N/A"]) {
                        [parsedCountrydetails addObject:countryDetails];
                    }
                    
                }
            }
        } else if ([receivedCountrydetails isKindOfClass:[NSDictionary class]]) {
            Countrydetails *countryDetails = [Countrydetails modelObjectWithDictionary:(NSDictionary *)receivedCountrydetails];
            if (![countryDetails.name isEqualToString:@"N/A"]) {
                [parsedCountrydetails addObject:countryDetails];
            }
        }
        self.countrydetails = [NSArray arrayWithArray:parsedCountrydetails];
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        NSObject *receivedProductdetails = [dict objectForKey:kMenuProductdetails];
        NSMutableArray *parsedProductdetails = [NSMutableArray array];
        if ([receivedProductdetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedProductdetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    ProductDetails *productDetails = [ProductDetails modelObjectWithDictionary:item];
                    if (![productDetails.name isEqualToString:@"N/A"]) {
                        [parsedProductdetails addObject:productDetails];
                    }
                    
                }
            }
        } else if ([receivedProductdetails isKindOfClass:[NSDictionary class]]) {
            ProductDetails *productDetails = [ProductDetails modelObjectWithDictionary:(NSDictionary *)receivedProductdetails];
            if (![productDetails.name isEqualToString:@"N/A"]) {
                [parsedProductdetails addObject:productDetails];
            }
        }
        self.productdetails = [NSArray arrayWithArray:parsedProductdetails];
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        NSObject *receivedCollectiondetails = [dict objectForKey:kMenuCollectiondetails];
        NSMutableArray *parsedCollectiondetails = [NSMutableArray array];
        if ([receivedCollectiondetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedCollectiondetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    CollectionDetails *collectionDeatils = [CollectionDetails modelObjectWithDictionary:item];
                    if (![collectionDeatils.name isEqualToString:@"N/A"]) {
                        [parsedCollectiondetails addObject:collectionDeatils];
                    }
                }
            }
        } else if ([receivedCollectiondetails isKindOfClass:[NSDictionary class]]) {
            CollectionDetails *collectionDeatils = [CollectionDetails modelObjectWithDictionary:(NSDictionary *)receivedCollectiondetails];
            if (![collectionDeatils.name isEqualToString:@"N/A"]) {
                [parsedCollectiondetails addObject:collectionDeatils];
            }
        }
        self.collectiondetails = [NSArray arrayWithArray:parsedCollectiondetails];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBuildingtype = [NSMutableArray array];
    for (NSObject *subArrayObject in self.buildingtype) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBuildingtype addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBuildingtype addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBuildingtype] forKey:kMenuBuildingtype];
    NSMutableArray *tempArrayForArchitectdetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.architectdetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForArchitectdetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForArchitectdetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArchitectdetails] forKey:kMenuArchitectdetails];
    NSMutableArray *tempArrayForObjectsCoated = [NSMutableArray array];
    for (NSObject *subArrayObject in self.objectsCoated) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForObjectsCoated addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForObjectsCoated addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForObjectsCoated] forKey:kMenuObjectsCoated];
    NSMutableArray *tempArrayForCountrydetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.countrydetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCountrydetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCountrydetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCountrydetails] forKey:kMenuCountrydetails];
    NSMutableArray *tempArrayForProductdetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.productdetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProductdetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProductdetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductdetails] forKey:kMenuProductdetails];
    NSMutableArray *tempArrayForCollectiondetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.collectiondetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCollectiondetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCollectiondetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCollectiondetails] forKey:kMenuCollectiondetails];
    
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
    
    self.buildingtype = [aDecoder decodeObjectForKey:kMenuBuildingtype];
    self.architectdetails = [aDecoder decodeObjectForKey:kMenuArchitectdetails];
    self.objectsCoated = [aDecoder decodeObjectForKey:kMenuObjectsCoated];
    self.countrydetails = [aDecoder decodeObjectForKey:kMenuCountrydetails];
    self.productdetails = [aDecoder decodeObjectForKey:kMenuProductdetails];
    self.collectiondetails = [aDecoder decodeObjectForKey:kMenuCollectiondetails];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_buildingtype forKey:kMenuBuildingtype];
    [aCoder encodeObject:_architectdetails forKey:kMenuArchitectdetails];
    [aCoder encodeObject:_objectsCoated forKey:kMenuObjectsCoated];
    [aCoder encodeObject:_countrydetails forKey:kMenuCountrydetails];
    [aCoder encodeObject:_productdetails forKey:kMenuProductdetails];
    [aCoder encodeObject:_collectiondetails forKey:kMenuCollectiondetails];
}

- (id)copyWithZone:(NSZone *)zone
{
    Menu *copy = [[Menu alloc] init];
    
    if (copy) {
        
        copy.buildingtype = [self.buildingtype copyWithZone:zone];
        copy.architectdetails = [self.architectdetails copyWithZone:zone];
        copy.objectsCoated = [self.objectsCoated copyWithZone:zone];
        copy.countrydetails = [self.countrydetails copyWithZone:zone];
        copy.productdetails = [self.productdetails copyWithZone:zone];
        copy.collectiondetails = [self.collectiondetails copyWithZone:zone];
    }
    
    return copy;
}


@end
