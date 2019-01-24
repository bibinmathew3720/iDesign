//
//  Colour+CoreDataProperties.h
//  
//
//  Created by Mobtecnica on 10/04/17.
//
//

#import "Colour+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Colour (CoreDataProperties)

+ (NSFetchRequest<Colour *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber *id;
@property (nullable, nonatomic, copy) NSNumber *item_id;
@property (nullable, nonatomic, copy) NSNumber *colour_id;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
