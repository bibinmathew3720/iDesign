//
//  Data.m
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Architectdetails.h"
#import "Productdetails.h"
#import "Collectiondetails.h"
#import "Objectdetails.h"
#import "ComponentDetails.h"
#import "ColourDetails.h"
#import "ClientDetails.h"


NSString *const kDataId = @"id";
NSString *const kDataAlign = @"align";
//NSString *const kDataArchitectdetails = @"architectdetails";
NSString *const kDataArchitectdetails = @"applicator_details";

NSString *const kDataCountryId = @"country_id";
//NSString *const kDataProductdetails = @"productdetails";
NSString *const kDataProductdetails = @"product_details";

NSString *const kDataComponentDetails = @"component_details";
NSString *const kDataColourDetails = @"colour_details";

NSString *const kDataCityId = @"city_id";
//NSString *const kDataBuildingType = @"building_type";
//NSString *const kDataBuildingType = @"component_details";

NSString *const kDataImage = @"image";
NSString *const kDataBuildingTypeId = @"building_type_id";
//NSString *const kDataBuildingTypeId = @"component_id";

NSString *const kDataCompletionYear = @"completion_year";
//NSString *const kDataCity = @"city";
NSString *const kDataCity = @"pmu_name";

NSString *const kDataCollectiondetails = @"collection_details";
//NSString *const kDataCountry = @"country";
NSString *const kDataCountry = @"pac_name";
NSString *const kDataName = @"name";
NSString *const kDataObjectdetails = @"component_details";

NSString *const kDataClientDetails= @"client_details";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize dataIdentifier = _dataIdentifier;
@synthesize align = _align;
@synthesize architectdetails = _architectdetails;
@synthesize countryId = _countryId;
@synthesize productdetails = _productdetails;

@synthesize componentDetails = _componentDetails;
@synthesize colourDetails = _colourDetails;

@synthesize cityId = _cityId;
@synthesize buildingType = _buildingType;
@synthesize image = _image;
@synthesize buildingTypeId = _buildingTypeId;
@synthesize completionYear = _completionYear;
@synthesize city = _city;
@synthesize collectiondetails = _collectiondetails;
@synthesize country = _country;
@synthesize name = _name;
@synthesize objectdetails = _objectdetails;
@synthesize clientDetails = _clientDetails;


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
            self.dataIdentifier = [[self objectOrNilForKey:kDataId fromDictionary:dict] doubleValue];
            self.align = [[self objectOrNilForKey:kDataAlign fromDictionary:dict] doubleValue];
    NSObject *receivedArchitectdetails = [dict objectForKey:kDataArchitectdetails];
    NSMutableArray *parsedArchitectdetails = [NSMutableArray array];
    if ([receivedArchitectdetails isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedArchitectdetails) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedArchitectdetails addObject:[Architectdetails modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedArchitectdetails isKindOfClass:[NSDictionary class]]) {
       [parsedArchitectdetails addObject:[Architectdetails modelObjectWithDictionary:(NSDictionary *)receivedArchitectdetails]];
    }

    self.architectdetails = [NSArray arrayWithArray:parsedArchitectdetails];
            self.countryId = [[self objectOrNilForKey:kDataCountryId fromDictionary:dict] doubleValue];
   
        NSObject *receivedClientDetails = [dict objectForKey:kDataClientDetails];
    NSMutableArray *parsedClientDetails = [NSMutableArray array];
    if ([receivedClientDetails isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedClientDetails) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedClientDetails addObject:[ClientDetails modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedClientDetails isKindOfClass:[NSDictionary class]]) {
       [parsedClientDetails addObject:[ClientDetails modelObjectWithDictionary:(NSDictionary *)receivedClientDetails]];
    }
        
        self.clientDetails = [NSArray arrayWithArray:parsedClientDetails];
        NSObject *receivedProductdetails = [dict objectForKey:kDataProductdetails];
        NSMutableArray *parsedProductdetails = [NSMutableArray array];
        
        if ([receivedProductdetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedProductdetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedProductdetails addObject:[Productdetails modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedProductdetails isKindOfClass:[NSDictionary class]]) {
            [parsedProductdetails addObject:[ColourDetails modelObjectWithDictionary:(NSDictionary *)parsedProductdetails]];
        }
/*
        self.colourDetails = [NSArray arrayWithArray:parsedColourdetails];
        NSObject *receivedProductdetails = [dict objectForKey:kDataProductdetails];
        NSMutableArray *parsedProductdetails = [NSMutableArray array];
        
        if ([receivedProductdetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedProductdetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedProductdetails addObject:[Productdetails modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedProductdetails isKindOfClass:[NSDictionary class]]) {
            [parsedProductdetails addObject:[Productdetails modelObjectWithDictionary:(NSDictionary *)receivedProductdetails]];
        }*/
    self.productdetails = [NSArray arrayWithArray:parsedProductdetails];
            self.cityId = [[self objectOrNilForKey:kDataCityId fromDictionary:dict] doubleValue];
            //self.buildingType = [self objectOrNilForKey:kDataBuildingType fromDictionary:dict];
            self.image = [self objectOrNilForKey:kDataImage fromDictionary:dict];
            self.buildingTypeId = [[self objectOrNilForKey:kDataBuildingTypeId fromDictionary:dict] doubleValue];
            self.completionYear = [self objectOrNilForKey:kDataCompletionYear fromDictionary:dict];
            self.city = [self objectOrNilForKey:kDataCity fromDictionary:dict];
    NSObject *receivedCollectiondetails = [dict objectForKey:kDataCollectiondetails];
    NSMutableArray *parsedCollectiondetails = [NSMutableArray array];
    if ([receivedCollectiondetails isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCollectiondetails) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCollectiondetails addObject:[Collectiondetails modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCollectiondetails isKindOfClass:[NSDictionary class]]) {
       [parsedCollectiondetails addObject:[Collectiondetails modelObjectWithDictionary:(NSDictionary *)receivedCollectiondetails]];
    }

        
        
      /* self.componentdetails = [NSArray arrayWithArray:parsedProductdetails];
        self.cityId = [[self objectOrNilForKey:kDataCityId fromDictionary:dict] doubleValue];
        self.buildingType = [self objectOrNilForKey:kDataBuildingType fromDictionary:dict];
        self.image = [self objectOrNilForKey:kDataImage fromDictionary:dict];
        self.buildingTypeId = [[self objectOrNilForKey:kDataBuildingTypeId fromDictionary:dict] doubleValue];
        self.completionYear = [self objectOrNilForKey:kDataCompletionYear fromDictionary:dict];
        self.city = [self objectOrNilForKey:kDataCity fromDictionary:dict];
        NSObject *receivedCollectiondetails = [dict objectForKey:kDataCollectiondetails];
        NSMutableArray *parsedCollectiondetails = [NSMutableArray array];
        if ([receivedCollectiondetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedCollectiondetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedCollectiondetails addObject:[Collectiondetails modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedCollectiondetails isKindOfClass:[NSDictionary class]]) {
            [parsedCollectiondetails addObject:[Collectiondetails modelObjectWithDictionary:(NSDictionary *)receivedCollectiondetails]];
        }
        
        */
        
    self.collectiondetails = [NSArray arrayWithArray:parsedCollectiondetails];
            self.country = [self objectOrNilForKey:kDataCountry fromDictionary:dict];
            self.name = [self objectOrNilForKey:kDataName fromDictionary:dict];
    NSObject *receivedcolourDetails = [dict objectForKey:kDataColourDetails];
    NSMutableArray *parsedColourDetails = [NSMutableArray array];
    if ([receivedcolourDetails isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcolourDetails) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedColourDetails addObject:[ColourDetails modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcolourDetails isKindOfClass:[NSDictionary class]]) {
       [parsedColourDetails addObject:[ComponentDetails modelObjectWithDictionary:(NSDictionary *)receivedcolourDetails]];
    }
        
        
        self.colourDetails = [NSArray arrayWithArray:parsedColourDetails];
        self.align = [[self objectOrNilForKey:kDataAlign fromDictionary:dict] doubleValue];
        self.name = [self objectOrNilForKey:kDataName fromDictionary:dict];
        NSObject *receivedcomponentDetails = [dict objectForKey:kDataComponentDetails];
        NSMutableArray *parsedcomponentDetails = [NSMutableArray array];
        
        if ([receivedcomponentDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedcomponentDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                   [parsedColourDetails addObject:[ColourDetails modelObjectWithDictionary:item]];                }
            }
        } else if ([receivedcomponentDetails isKindOfClass:[NSDictionary class]]) {
            [parsedcomponentDetails addObject:[ComponentDetails modelObjectWithDictionary:(NSDictionary *)receivedcomponentDetails]];
        }

        
        self.componentDetails = [NSArray arrayWithArray:parsedcomponentDetails];
        NSObject *receivedObjectdetails = [dict objectForKey:kDataObjectdetails];
        NSMutableArray *parsedObjectdetails = [NSMutableArray array];
        
        if ([receivedObjectdetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedObjectdetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedObjectdetails addObject:[Objectdetails modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedObjectdetails isKindOfClass:[NSDictionary class]]) {
            [parsedObjectdetails addObject:[Objectdetails modelObjectWithDictionary:(NSDictionary *)receivedObjectdetails]];
        }
        
        
        
    self.objectdetails = [NSArray arrayWithArray:parsedObjectdetails];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.align] forKey:kDataAlign];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArchitectdetails] forKey:kDataArchitectdetails];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countryId] forKey:kDataCountryId];
    
    NSMutableArray *tempArrayForClientDetails = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.clientDetails) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForClientDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForClientDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForClientDetails] forKey:kDataClientDetails];

    
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductdetails] forKey:kDataProductdetails];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cityId] forKey:kDataCityId];
  //  [mutableDict setValue:self.buildingType forKey:kDataBuildingType];
    [mutableDict setValue:self.image forKey:kDataImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buildingTypeId] forKey:kDataBuildingTypeId];
    [mutableDict setValue:self.completionYear forKey:kDataCompletionYear];
    [mutableDict setValue:self.city forKey:kDataCity];
    
    
    NSMutableArray *tempArrayForColourDetails = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.colourDetails) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForColourDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForColourDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColourDetails] forKey:kDataColourDetails];
    [mutableDict setValue:[NSNumber numberWithDouble:self.align] forKey:kDataAlign];
    [mutableDict setValue:self.name forKey:kDataName];

    NSMutableArray *tempArrayForComponentDetails = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.componentDetails) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForComponentDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForComponentDetails addObject:subArrayObject];
        }
    }
    
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComponentDetails] forKey:kDataComponentDetails];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCollectiondetails] forKey:kDataCollectiondetails];
    [mutableDict setValue:self.country forKey:kDataCountry];
    [mutableDict setValue:self.name forKey:kDataName];
    NSMutableArray *tempArrayForObjectdetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.objectdetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForObjectdetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForObjectdetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForObjectdetails] forKey:kDataObjectdetails];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kDataId];
    self.align = [aDecoder decodeDoubleForKey:kDataAlign];
    self.componentDetails = [aDecoder decodeObjectForKey:kDataComponentDetails];
    self.architectdetails = [aDecoder decodeObjectForKey:kDataArchitectdetails];
    self.countryId = [aDecoder decodeDoubleForKey:kDataCountryId];
    self.productdetails = [aDecoder decodeObjectForKey:kDataProductdetails];
    self.cityId = [aDecoder decodeDoubleForKey:kDataCityId];
   // self.buildingType = [aDecoder decodeObjectForKey:kDataBuildingType];
    self.image = [aDecoder decodeObjectForKey:kDataImage];
    self.buildingTypeId = [aDecoder decodeDoubleForKey:kDataBuildingTypeId];
    self.completionYear = [aDecoder decodeObjectForKey:kDataCompletionYear];
    self.city = [aDecoder decodeObjectForKey:kDataCity];
    self.collectiondetails = [aDecoder decodeObjectForKey:kDataCollectiondetails];
    self.country = [aDecoder decodeObjectForKey:kDataCountry];
    self.name = [aDecoder decodeObjectForKey:kDataName];
    self.objectdetails = [aDecoder decodeObjectForKey:kDataObjectdetails];
    self.colourDetails = [aDecoder decodeObjectForKey:kDataColourDetails];
    
    self.clientDetails = [aDecoder decodeObjectForKey:kDataClientDetails];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kDataId];
    [aCoder encodeDouble:_align forKey:kDataAlign];
    [aCoder encodeObject:_architectdetails forKey:kDataArchitectdetails];
    [aCoder encodeDouble:_countryId forKey:kDataCountryId];
    [aCoder encodeObject:_productdetails forKey:kDataProductdetails];
    [aCoder encodeDouble:_cityId forKey:kDataCityId];
  //  [aCoder encodeObject:_buildingType forKey:kDataBuildingType];
    [aCoder encodeObject:_image forKey:kDataImage];
    [aCoder encodeDouble:_buildingTypeId forKey:kDataBuildingTypeId];
    [aCoder encodeObject:_completionYear forKey:kDataCompletionYear];
    [aCoder encodeObject:_city forKey:kDataCity];
    [aCoder encodeObject:_collectiondetails forKey:kDataCollectiondetails];
    [aCoder encodeObject:_country forKey:kDataCountry];
    [aCoder encodeObject:_name forKey:kDataName];
    [aCoder encodeObject:_objectdetails forKey:kDataObjectdetails];
    [aCoder encodeObject:_componentDetails forKey:kDataComponentDetails];
    [aCoder encodeObject:_colourDetails forKey:kDataColourDetails];
    [aCoder encodeObject:_clientDetails forKey:kDataClientDetails];


}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.align = self.align;
        copy.architectdetails = [self.architectdetails copyWithZone:zone];
        copy.countryId = self.countryId;
        copy.productdetails = [self.productdetails copyWithZone:zone];
        copy.cityId = self.cityId;
        copy.buildingType = [self.buildingType copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.buildingTypeId = self.buildingTypeId;
        copy.completionYear = [self.completionYear copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.collectiondetails = [self.collectiondetails copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.objectdetails = [self.objectdetails copyWithZone:zone];
        copy.componentDetails = [self.componentDetails copyWithZone:zone];
        copy.colourDetails = [self.colourDetails copyWithZone:zone];
        copy.clientDetails = [self.clientDetails copyWithZone:zone];



    }
    
    return copy;
}


@end
