//
//  Data.m
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "DesignerDetails.h"
#import "Productdetails.h"
#import "ComponentDetails.h"
#import "Applicatordetails.h"
#import "ClientDetails.h"
#import "ColourDetails.h"
#import "Collectiondetails.h"
#import "CompanyDetails.h"
#import "ProductsNameDetails.h"


NSString *const kDataId = @"id";
NSString *const kDataDesignerDetails = @"designer_details";
NSString *const kDataProductDetails = @"product_details";
NSString *const kDataPacId = @"pac_id";
NSString *const kDataComponentDetails = @"component_details";
NSString *const kDataApplicatorDetails = @"applicator_details";
NSString *const kDataPmuName = @"pmu_name";
NSString *const kDataImage = @"image";
NSString *const kDataPmuId = @"pmu_id";
NSString *const kDataPacName = @"pac_name";
NSString *const kDataClientDetails = @"client_details";
NSString *const kDataColourDetails = @"colour_details";
NSString *const kDataCollectionDetails = @"collection_details";
NSString *const kDataAlign = @"align";
NSString *const kDataName = @"name";
NSString *const KDataCompanyDetails = @"company_details";
NSString *const KDataProductsDetails = @"products_details";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize designerDetails = _designerDetails;
@synthesize productDetails = _productDetails;
@synthesize pacId = _pacId;
@synthesize componentDetails = _componentDetails;
@synthesize applicatorDetails = _applicatorDetails;
@synthesize pmuName = _pmuName;
@synthesize image = _image;
@synthesize pmuId = _pmuId;
@synthesize pacName = _pacName;
@synthesize clientDetails = _clientDetails;
@synthesize colourDetails = _colourDetails;
@synthesize collectionDetails = _collectionDetails;
@synthesize align = _align;
@synthesize name = _name;
@synthesize companyDetails = _companyDetails;
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
        self.internalBaseClassIdentifier = [[self objectOrNilForKey:kDataId fromDictionary:dict] doubleValue];
        
        
        NSObject *receivedDesignerDetails = [dict objectForKey:kDataDesignerDetails];
        NSMutableArray *parsedDesignerDetails = [NSMutableArray array];
        if ([receivedDesignerDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedDesignerDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    DesignerDetails *itemModel = [DesignerDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedDesignerDetails addObject:itemModel];
                }
            }
        } else if ([receivedDesignerDetails isKindOfClass:[NSDictionary class]]) {
            DesignerDetails *itemModel = [DesignerDetails modelObjectWithDictionary:(NSDictionary *)receivedDesignerDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedDesignerDetails addObject:itemModel];
        }
        self.designerDetails = [NSArray arrayWithArray:parsedDesignerDetails];
        
        /**********************************************************************/
        NSObject *receivedProductDetails = [dict objectForKey:kDataProductDetails];
        NSMutableArray *parsedProductDetails = [NSMutableArray array];
        if ([receivedProductDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedProductDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    ProductDetails *itemModel = [ProductDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedProductDetails addObject:itemModel];
                }
            }
        } else if ([receivedProductDetails isKindOfClass:[NSDictionary class]]) {
            ProductDetails *itemModel = [ProductDetails modelObjectWithDictionary:(NSDictionary *)receivedProductDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedProductDetails addObject:itemModel];
        }
        
        self.productDetails = [NSArray arrayWithArray:parsedProductDetails];
        
        
        self.pacId = [[self objectOrNilForKey:kDataPacId fromDictionary:dict] doubleValue];
        NSObject *receivedComponentDetails = [dict objectForKey:kDataComponentDetails];
        NSMutableArray *parsedComponentDetails = [NSMutableArray array];
        if ([receivedComponentDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedComponentDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    ComponentDetails *itemModel = [ComponentDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedComponentDetails addObject:itemModel];
                }
            }
        } else if ([receivedComponentDetails isKindOfClass:[NSDictionary class]]) {
            ComponentDetails *itemModel = [ComponentDetails modelObjectWithDictionary:(NSDictionary *)receivedComponentDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedComponentDetails addObject:itemModel];
        }
        
        self.componentDetails = [NSArray arrayWithArray:parsedComponentDetails];
        
        
        NSObject *receivedApplicatorDetails = [dict objectForKey:kDataApplicatorDetails];
        NSMutableArray *parsedApplicatorDetails = [NSMutableArray array];
        if ([receivedApplicatorDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedApplicatorDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    Applicatordetails *itemModel = [Applicatordetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedApplicatorDetails addObject:itemModel];
                }
            }
        } else if ([receivedApplicatorDetails isKindOfClass:[NSDictionary class]]) {
            Applicatordetails *itemModel = [Applicatordetails modelObjectWithDictionary:(NSDictionary *)receivedApplicatorDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedApplicatorDetails addObject:itemModel];
        }
        
        self.applicatorDetails = [NSArray arrayWithArray:parsedApplicatorDetails];
        
        
        NSObject *receivedClientDetails = [dict objectForKey:kDataClientDetails];
        NSMutableArray *parsedClientDetails = [NSMutableArray array];
        if ([receivedClientDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedClientDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    ClientDetails *itemModel = [ClientDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedClientDetails addObject:itemModel];
                }
            }
        } else if ([receivedClientDetails isKindOfClass:[NSDictionary class]]) {
            ClientDetails *itemModel = [ClientDetails modelObjectWithDictionary:(NSDictionary *)receivedClientDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedClientDetails addObject:itemModel];
            
        }
        
        self.clientDetails = [NSArray arrayWithArray:parsedClientDetails];
        
        ////
        NSObject *receivedCompanyDetails = [dict objectForKey:KDataCompanyDetails];
        NSMutableArray *parsedCompanyDetails = [NSMutableArray array];
        if ([receivedCompanyDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedCompanyDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    CompanyDetails *itemModel = [CompanyDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedCompanyDetails addObject:itemModel];
                }
            }
        } else if ([receivedCompanyDetails isKindOfClass:[NSDictionary class]]) {
            CompanyDetails *itemModel = [CompanyDetails modelObjectWithDictionary:(NSDictionary *)receivedCompanyDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedCompanyDetails addObject:itemModel];
            
        }
        
        self.companyDetails = [NSArray arrayWithArray:parsedCompanyDetails];
        
        ////
        NSObject *receivedProductsDetails = [dict objectForKey:KDataProductsDetails];
        NSMutableArray *parsedProductsDetails = [NSMutableArray array];
        if ([receivedProductsDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedProductsDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    ProductsNameDetails *itemModel = [ProductsNameDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedProductsDetails addObject:itemModel];
                }
            }
        } else if ([receivedProductsDetails isKindOfClass:[NSDictionary class]]) {
            ProductsNameDetails *itemModel = [ProductsNameDetails modelObjectWithDictionary:(NSDictionary *)receivedProductsDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedProductsDetails addObject:itemModel];
            
        }
        
        self.productsDetails = [NSArray arrayWithArray:parsedProductsDetails];

        ////
        
        
        NSObject *receivedColourDetails = [dict objectForKey:kDataColourDetails];
        NSMutableArray *parsedColourDetails = [NSMutableArray array];
        if ([receivedColourDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedColourDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    ColourDetails *itemModel = [ColourDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedColourDetails addObject:itemModel];
                }
            }
        } else if ([receivedColourDetails isKindOfClass:[NSDictionary class]]) {
            ColourDetails *itemModel = [ColourDetails modelObjectWithDictionary:(NSDictionary *)receivedColourDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedColourDetails addObject:itemModel];
            
        }
        
        self.colourDetails = [NSArray arrayWithArray:parsedColourDetails];
        
        
        NSObject *receivedCollectionDetails = [dict objectForKey:kDataCollectionDetails];
        NSMutableArray *parsedCollectionDetails = [NSMutableArray array];
        if ([receivedCollectionDetails isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedCollectionDetails) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    CollectionDetails *itemModel = [CollectionDetails modelObjectWithDictionary:(NSDictionary *)item];
                    if (![itemModel.name isEqualToString:@"N/A"])
                        [parsedCollectionDetails addObject:itemModel];
                }
            }
        } else if ([receivedCollectionDetails isKindOfClass:[NSDictionary class]]) {
            CollectionDetails *itemModel = [CollectionDetails modelObjectWithDictionary:(NSDictionary *)receivedCollectionDetails];
            if (![itemModel.name isEqualToString:@"N/A"])
                [parsedCollectionDetails addObject:itemModel];
        }
        
        self.collectionDetails = [NSArray arrayWithArray:parsedCollectionDetails];
        self.align = [[self objectOrNilForKey:kDataAlign fromDictionary:dict] doubleValue];
        self.name = [self objectOrNilForKey:kDataName fromDictionary:dict];
        self.pmuName = [self objectOrNilForKey:kDataPmuName fromDictionary:dict];
        self.image = [self objectOrNilForKey:kDataImage fromDictionary:dict];
        self.pmuId = [[self objectOrNilForKey:kDataPmuId fromDictionary:dict] doubleValue];
        self.pacName = [self objectOrNilForKey:kDataPacName fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kDataId];
    NSMutableArray *tempArrayForDesignerDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.designerDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDesignerDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDesignerDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDesignerDetails] forKey:kDataDesignerDetails];
    NSMutableArray *tempArrayForProductDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.productDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProductDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProductDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductDetails] forKey:kDataProductDetails];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pacId] forKey:kDataPacId];
    NSMutableArray *tempArrayForComponentDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.componentDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForComponentDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForComponentDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComponentDetails] forKey:kDataComponentDetails];
    NSMutableArray *tempArrayForApplicatorDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.applicatorDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForApplicatorDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForApplicatorDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForApplicatorDetails] forKey:kDataApplicatorDetails];
    [mutableDict setValue:self.pmuName forKey:kDataPmuName];
    [mutableDict setValue:self.image forKey:kDataImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pmuId] forKey:kDataPmuId];
    [mutableDict setValue:self.pacName forKey:kDataPacName];
    NSMutableArray *tempArrayForClientDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.clientDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForClientDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForClientDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForClientDetails] forKey:kDataClientDetails];
    NSMutableArray *tempArrayForColourDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.colourDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForColourDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForColourDetails addObject:subArrayObject];
        }
    }
    
    ////
    
    NSMutableArray *tempArrayForCompanyDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.companyDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCompanyDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCompanyDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCompanyDetails] forKey:KDataCompanyDetails];
    
    NSMutableArray *tempArrayForProductsDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.productsDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProductsDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProductsDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductsDetails] forKey:KDataProductsDetails];
    
    ////
    
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColourDetails] forKey:kDataColourDetails];
    NSMutableArray *tempArrayForCollectionDetails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.collectionDetails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCollectionDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCollectionDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCollectionDetails] forKey:kDataCollectionDetails];
    [mutableDict setValue:[NSNumber numberWithDouble:self.align] forKey:kDataAlign];
    [mutableDict setValue:self.name forKey:kDataName];
    
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
    
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kDataId];
    self.designerDetails = [aDecoder decodeObjectForKey:kDataDesignerDetails];
    self.productDetails = [aDecoder decodeObjectForKey:kDataProductDetails];
    self.pacId = [aDecoder decodeDoubleForKey:kDataPacId];
    self.componentDetails = [aDecoder decodeObjectForKey:kDataComponentDetails];
    self.applicatorDetails = [aDecoder decodeObjectForKey:kDataApplicatorDetails];
    self.pmuName = [aDecoder decodeObjectForKey:kDataPmuName];
    self.image = [aDecoder decodeObjectForKey:kDataImage];
    self.pmuId = [aDecoder decodeDoubleForKey:kDataPmuId];
    self.pacName = [aDecoder decodeObjectForKey:kDataPacName];
    self.clientDetails = [aDecoder decodeObjectForKey:kDataClientDetails];
    ///
    self.companyDetails = [aDecoder decodeObjectForKey:KDataCompanyDetails];
    self.productsDetails = [aDecoder decodeObjectForKey:KDataProductsDetails];

    ///
    self.colourDetails = [aDecoder decodeObjectForKey:kDataColourDetails];
    self.collectionDetails = [aDecoder decodeObjectForKey:kDataCollectionDetails];
    self.align = [aDecoder decodeDoubleForKey:kDataAlign];
    self.name = [aDecoder decodeObjectForKey:kDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kDataId];
    [aCoder encodeObject:_designerDetails forKey:kDataDesignerDetails];
    [aCoder encodeObject:_productDetails forKey:kDataProductDetails];
    [aCoder encodeDouble:_pacId forKey:kDataPacId];
    [aCoder encodeObject:_componentDetails forKey:kDataComponentDetails];
    [aCoder encodeObject:_applicatorDetails forKey:kDataApplicatorDetails];
    [aCoder encodeObject:_pmuName forKey:kDataPmuName];
    [aCoder encodeObject:_image forKey:kDataImage];
    [aCoder encodeDouble:_pmuId forKey:kDataPmuId];
    [aCoder encodeObject:_pacName forKey:kDataPacName];
    [aCoder encodeObject:_clientDetails forKey:kDataClientDetails];
    ///
    [aCoder encodeObject:_companyDetails forKey:KDataCompanyDetails];
    [aCoder encodeObject:_productsDetails forKey:KDataProductsDetails];

    ///
    [aCoder encodeObject:_colourDetails forKey:kDataColourDetails];
    [aCoder encodeObject:_collectionDetails forKey:kDataCollectionDetails];
    [aCoder encodeDouble:_align forKey:kDataAlign];
    [aCoder encodeObject:_name forKey:kDataName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {
        
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.designerDetails = [self.designerDetails copyWithZone:zone];
        copy.productDetails = [self.productDetails copyWithZone:zone];
        copy.pacId = self.pacId;
        copy.componentDetails = [self.componentDetails copyWithZone:zone];
        copy.applicatorDetails = [self.applicatorDetails copyWithZone:zone];
        copy.pmuName = [self.pmuName copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.pmuId = self.pmuId;
        copy.pacName = [self.pacName copyWithZone:zone];
        copy.clientDetails = [self.clientDetails copyWithZone:zone];
        ///
        copy.companyDetails = [self.companyDetails copyWithZone:zone];
        copy.productsDetails = [self.productsDetails copyWithZone:zone];

        ///
        copy.colourDetails = [self.colourDetails copyWithZone:zone];
        copy.collectionDetails = [self.collectionDetails copyWithZone:zone];
        copy.align = self.align;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
