//
//  SearchParams.m
//
//  Created by FEBIN FATHAH on 16/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SearchParams.h"


NSString *const kSearchParamsCity = @"city";
NSString *const kSearchParamsCountry = @"country";
NSString *const kSearchParamsId = @"id";
NSString *const kSearchParamsBuilding = @"building";
NSString *const kSearchParamsCollection = @"collection";
NSString *const kSearchParamsSessionId = @"session_id";
NSString *const kSearchParamsProducts = @"product";
NSString *const kSearchParamsObjectsCoated = @"objects";
NSString *const kSearchParamsArchitect = @"architect";
NSString *const kSearchParamsItems = @"item";
NSString *const kSearchParamsClient = @"client";
NSString *const kSearchParamsApplicator = @"applicator";
NSString *const kSearchParamsColour = @"colour";
NSString *const kSearchParamsDesigner = @"designer";
NSString *const kSearchParamsComponent = @"component";
NSString *const kSearchParamsCompany = @"company";
NSString *const kSearchParamsProductsDetails = @"products";


NSString *const kSearchParamsPacCountry = @"pac_country";
NSString *const kSearchParamsPmuCountry = @"pmu_country";







@interface SearchParams ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SearchParams

@synthesize city = _city;
@synthesize country = _country;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize building = _building;
@synthesize collection = _collection;
@synthesize sessionId = _sessionId;
@synthesize products = _products;
@synthesize objectsCoated = _objectsCoated;
@synthesize architect = _architect;
@synthesize items = _items;
@synthesize client = _client;
@synthesize applicator = _applicator;
@synthesize colour = _colour;
@synthesize component = _component;
@synthesize pacCountry = _pacCountry;
@synthesize pmuCountry = _pmuCountry;
@synthesize designer = _designer;
@synthesize company = _company;
@synthesize productsDetails = _productsDetails;







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
           self.city = [[self objectOrNilForKey:kSearchParamsCity fromDictionary:dict] doubleValue];
            self.country = [[self objectOrNilForKey:kSearchParamsCountry fromDictionary:dict] doubleValue];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kSearchParamsId fromDictionary:dict];
           self.building = [[self objectOrNilForKey:kSearchParamsBuilding fromDictionary:dict] doubleValue];
            self.collection = [[self objectOrNilForKey:kSearchParamsCollection fromDictionary:dict] doubleValue];
            self.sessionId = [self objectOrNilForKey:kSearchParamsSessionId fromDictionary:dict];
            self.products = [[self objectOrNilForKey:kSearchParamsProducts fromDictionary:dict] doubleValue];
            self.objectsCoated = [[self objectOrNilForKey:kSearchParamsObjectsCoated fromDictionary:dict] doubleValue];
            self.architect = [[self objectOrNilForKey:kSearchParamsArchitect fromDictionary:dict] doubleValue];
           self.items = [[self objectOrNilForKey:kSearchParamsItems fromDictionary:dict] doubleValue];
         self.client = [[self objectOrNilForKey:kSearchParamsClient fromDictionary:dict] doubleValue];
        ////
        self.company = [[self objectOrNilForKey:kSearchParamsCompany fromDictionary:dict] doubleValue];
        self.productsDetails = [[self objectOrNilForKey:kSearchParamsProductsDetails fromDictionary:dict] doubleValue];

        ////
         self.applicator = [[self objectOrNilForKey:kSearchParamsApplicator fromDictionary:dict] doubleValue];
         self.colour = [[self objectOrNilForKey:kSearchParamsColour fromDictionary:dict] doubleValue];
         self.component = [[self objectOrNilForKey:kSearchParamsComponent fromDictionary:dict] doubleValue];
         self.pacCountry = [[self objectOrNilForKey:kSearchParamsPacCountry fromDictionary:dict] doubleValue];
         self.pmuCountry = [[self objectOrNilForKey:kSearchParamsPmuCountry fromDictionary:dict] doubleValue];
        self.designer = [[self objectOrNilForKey:kSearchParamsDesigner fromDictionary:dict] doubleValue];



    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.city] forKey:kSearchParamsCity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.country] forKey:kSearchParamsCountry];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kSearchParamsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.building] forKey:kSearchParamsBuilding];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collection] forKey:kSearchParamsCollection];
    [mutableDict setValue:self.sessionId forKey:kSearchParamsSessionId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.products] forKey:kSearchParamsProducts];
   [mutableDict setValue:[NSNumber numberWithDouble:self.objectsCoated] forKey:kSearchParamsObjectsCoated];
    [mutableDict setValue:[NSNumber numberWithDouble:self.architect] forKey:kSearchParamsArchitect];
    [mutableDict setValue:[NSNumber numberWithDouble:self.items] forKey:kSearchParamsItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.client] forKey:kSearchParamsClient];
    ////
    [mutableDict setValue:[NSNumber numberWithDouble:self.company] forKey:kSearchParamsCompany];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productsDetails] forKey:kSearchParamsProductsDetails];

    ////
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicator] forKey:kSearchParamsApplicator];
    [mutableDict setValue:[NSNumber numberWithDouble:self.colour] forKey:kSearchParamsColour];
    [mutableDict setValue:[NSNumber numberWithDouble:self.component] forKey:kSearchParamsComponent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pacCountry] forKey:kSearchParamsPacCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pmuCountry] forKey:kSearchParamsPmuCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.designer] forKey:kSearchParamsDesigner];








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

    self.city = [aDecoder decodeDoubleForKey:kSearchParamsCity];
    self.country = [aDecoder decodeDoubleForKey:kSearchParamsCountry];
   self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kSearchParamsId];
   self.building = [aDecoder decodeDoubleForKey:kSearchParamsBuilding];
    self.collection = [aDecoder decodeDoubleForKey:kSearchParamsCollection];
    self.sessionId = [aDecoder decodeObjectForKey:kSearchParamsSessionId];
    self.products = [aDecoder decodeDoubleForKey:kSearchParamsProducts];
    self.objectsCoated = [aDecoder decodeDoubleForKey:kSearchParamsObjectsCoated];
    self.architect = [aDecoder decodeDoubleForKey:kSearchParamsArchitect];
    self.items = [aDecoder decodeDoubleForKey:kSearchParamsItems];
    self.client = [aDecoder decodeDoubleForKey:kSearchParamsClient];
    self.applicator = [aDecoder decodeDoubleForKey:kSearchParamsApplicator];
    ////
    self.company = [aDecoder decodeDoubleForKey:kSearchParamsCompany];
    self.productsDetails = [aDecoder decodeDoubleForKey:kSearchParamsProductsDetails];

    ////
    self.colour = [aDecoder decodeDoubleForKey:kSearchParamsColour];
    self.component = [aDecoder decodeDoubleForKey:kSearchParamsComponent];
    self.designer = [aDecoder decodeDoubleForKey:kSearchParamsDesigner];
    self.pacCountry = [aDecoder decodeDoubleForKey:kSearchParamsPacCountry];
    self.pmuCountry = [aDecoder decodeDoubleForKey:kSearchParamsPmuCountry];







    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_city forKey:kSearchParamsCity];
    [aCoder encodeDouble:_country forKey:kSearchParamsCountry];
   [aCoder encodeObject:_internalBaseClassIdentifier forKey:kSearchParamsId];
   [aCoder encodeDouble:_building forKey:kSearchParamsBuilding];
    [aCoder encodeDouble:_collection forKey:kSearchParamsCollection];
    [aCoder encodeObject:_sessionId forKey:kSearchParamsSessionId];
    [aCoder encodeDouble:_products forKey:kSearchParamsProducts];
    [aCoder encodeDouble:_objectsCoated forKey:kSearchParamsObjectsCoated];
   [aCoder encodeDouble:_architect forKey:kSearchParamsArchitect];
    [aCoder encodeDouble:_items forKey:kSearchParamsItems];
    [aCoder encodeDouble:_client forKey:kSearchParamsClient];
    [aCoder encodeDouble:_applicator forKey:kSearchParamsApplicator];
    ////
    [aCoder encodeDouble:_company forKey:kSearchParamsCompany];
    [aCoder encodeDouble:_productsDetails forKey:kSearchParamsProductsDetails];

    ////
    [aCoder encodeDouble:_colour forKey:kSearchParamsColour];
    [aCoder encodeDouble:_component forKey:kSearchParamsComponent];
    [aCoder encodeDouble:_designer forKey:kSearchParamsDesigner];
    [aCoder encodeDouble:_pacCountry forKey:kSearchParamsPacCountry];
    [aCoder encodeDouble:_pmuCountry forKey:kSearchParamsPmuCountry];






}

- (id)copyWithZone:(NSZone *)zone
{
    SearchParams *copy = [[SearchParams alloc] init];
    
    if (copy) {

       copy.city = self.city;
        copy.country = self.country;
       copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
       copy.building = self.building;
        copy.collection = self.collection;
       copy.sessionId = [self.sessionId copyWithZone:zone];
        copy.products = self.products;
        copy.objectsCoated = self.objectsCoated;
        copy.architect = self.architect;
        copy.items = self.items;
        copy.client = self.client;
        copy.applicator = self.applicator;
        copy.colour = self.colour;
        copy.component = self.component;
        copy.designer = self.designer;
        copy.pacCountry = self.pacCountry;
        copy.pmuCountry = self.pmuCountry;
        copy.company = self.company;
        copy.productsDetails = self.productsDetails;


    }
    
    return copy;
}


@end
