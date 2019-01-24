//
//  User.h
//
//  Created by FEBIN FATHAH on 13/05/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface User : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) NSString *countryId;
@property (nonatomic, assign) double mobile;
@property (nonatomic, assign) NSString *cityId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *addedOn;
@property (nonatomic, strong) NSString *pincode;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *gender;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
