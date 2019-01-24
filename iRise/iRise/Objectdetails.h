//
//  Objectdetails.h
//
//  Created by FEBIN FATHAH on 24/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Objectdetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double objectdetailsIdentifier;
@property (nonatomic, assign) double objectsCoatedId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double projectId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
