//
//  DesignerDetails.h
//
//  Created by Mobtecnica  on 04/05/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DesignerDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double designerDetailsIdentifier;
@property (nonatomic, assign) double designerId;
@property (nonatomic, assign) double itemId;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
