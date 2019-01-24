//
//  Colour+CoreDataProperties.m
//  
//
//  Created by Mobtecnica on 10/04/17.
//
//

#import "Colour+CoreDataProperties.h"

@implementation Colour (CoreDataProperties)

+ (NSFetchRequest<Colour *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Colour"];
}

@dynamic id;
@dynamic item_id;
@dynamic colour_id;
@dynamic name;

@end
