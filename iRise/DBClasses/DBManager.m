//
//  DBManager.m
//  iRise
//
//  Created by Mobile Developer on 23/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "DBManager.h"
#import "AppDelegate.h"
#import "Models.h"
#import "DesignerDetails.h"
#import "SearchParams.h"



@implementation DBManager

-(NSManagedObjectContext *) managedObjectContexts
{
    NSManagedObjectContext *context=nil;
    id delgate = [[UIApplication sharedApplication]delegate];
    
    if([delgate performSelector:@selector(managedObjectContext)])
    {
        context=[delgate managedObjectContext];
    }
    return context;
}

-(void)AddProjectList:(NSArray *)projectArray
{
    
   
    NSManagedObjectContext *context=[self managedObjectContexts];
    
    //delete all objects
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] initWithEntityName:@"Product"];
    NSMutableArray *items=[[context executeFetchRequest:fetchRequest error:nil]mutableCopy];
    for (Product *obj in items) {
        [context deleteObject:obj];
    }
    NSError *err=nil;
    if(![context save:&err ])
    {
        NSLog(@"Can't Delete! %@ %@", err, [err localizedDescription]);
    }
    
    if (projectArray.count>0) {
        
    for(Data *productObj in projectArray)
    {
//        @property (nonatomic, retain) NSNumber *projectIdentifier;
//        @property (nonatomic, retain) NSString *name;
//        @property (nonatomic, retain) NSString *buildingType;
//        @property (nonatomic, retain) NSString *city;
//        @property (nonatomic, retain) NSString *image;
//        @property (nonatomic, retain) NSString *completionYear;
//        @property (nonatomic, retain) NSString *country;
//        @property (nonatomic, retain) NSNumber *align;
//        @property (nonatomic, retain) NSSet *object;
//        @property (nonatomic, retain) NSSet *products;
//        @property (nonatomic, retain) NSSet *architect;
        Product *newProduct = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];

//        @property (nonatomic, retain) NSNumber *internalBaseClassIdentifier;
//        @property (nonatomic, retain) NSString *name;
//        @property (nonatomic, retain) NSNumber *pacId;
//        @property (nonatomic, retain) NSString *pmuName;
//        @property (nonatomic, retain) NSString *image;
//        @property (nonatomic, retain) NSString *pacName;
//        @property (nonatomic, retain) NSNumber *pmuId;
//        @property (nonatomic, retain) NSNumber *align;
//        @property (nonatomic, retain) NSSet *componentDetailsDB;
//        @property (nonatomic, retain) NSSet *collectionDetailsDB;
//        @property (nonatomic, retain) NSSet *colourDetailsDB;
//        @property (nonatomic, retain) NSSet *designerDetailsDB;
//        @property (nonatomic, retain) NSSet *applicatorDetailsDB;
//        @property (nonatomic, retain) NSSet *clientDetailsDB;
//        @property (nonatomic, retain) NSSet *productDetailsDB;
//
        newProduct.internalBaseClassIdentifier = [NSNumber numberWithDouble:productObj.internalBaseClassIdentifier];
        newProduct.name = productObj.name;
        newProduct.pacId = [NSNumber numberWithDouble:productObj.pacId];
        newProduct.pmuName = productObj.pmuName;
        newProduct.image = productObj.image;
        newProduct.pacName = productObj.pacName;
        newProduct.pmuId  = [NSNumber numberWithDouble:productObj.pmuId];
        newProduct.align = [NSNumber numberWithDouble:productObj.align];
        
        

        
        
////        newProject.name = projectObj.name;
//        newProject.buildingType = projectObj.buildingType;
//        newProject.city = projectObj.city;
//        newProject.image = projectObj.image;
//        newProject.completionYear = projectObj.completionYear;
//        newProject.country = projectObj.country;
//        newProject.countryId = [NSNumber numberWithDouble:projectObj.countryId];
//        newProject.cityId = [NSNumber numberWithDouble:projectObj.cityId];
//        newProject.buildingTypeId = [NSNumber numberWithDouble:projectObj.buildingTypeId];
//        newProject.align = [NSNumber numberWithDouble:projectObj.align];
//        newProject.projectIdentifier = [NSNumber numberWithDouble:projectObj.dataIdentifier];
//        
//        
    
        NSMutableSet *componentDetailSet = [[NSMutableSet alloc]init];
        for (ComponentDetails *obj in productObj.componentDetails) {
            ComponentDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"ComponentDetailsDB" inManagedObjectContext:context];
            newObj.componentDetailsDBIdentifier = [NSNumber numberWithDouble:obj.componentDetailsIdentifier];
            newObj.componentId = [NSNumber numberWithDouble:obj.componentId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [componentDetailSet addObject:newObj];
        }
        newProduct.componentDetailsDB = componentDetailSet;

        ////
        NSMutableSet *companyDetailSet = [[NSMutableSet alloc]init];
        for (CompanyDetails *obj in productObj.companyDetails) {
            CompanyDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"CompanyDetailsDB" inManagedObjectContext:context];
            newObj.companyDetailsDBIdentifier = [NSNumber numberWithDouble:obj.companyDetailsIdentifier];
            newObj.companyId = [NSNumber numberWithDouble:obj.companyId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [companyDetailSet addObject:newObj];
        }
        newProduct.companyDetailsDB = companyDetailSet;
        
        NSMutableSet *productsDetailSet = [[NSMutableSet alloc]init];
        for (ProductsNameDetails *obj in productObj.productsDetails) {
            ProductsDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"ProductsDetailsDB" inManagedObjectContext:context];
            newObj.productsDetailsDBIdentifier = [NSNumber numberWithDouble:obj.productsDetailsIdentifier];
            newObj.productsId = [NSNumber numberWithDouble:obj.productsId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [productsDetailSet addObject:newObj];
        }
        newProduct.productsDetailsDB = productsDetailSet;
        ////
        
        NSMutableSet *collectionDetailSet = [[NSMutableSet alloc]init];
        for (CollectionDetails *obj in productObj.collectionDetails) {
            CollectionDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"CollectionDetailsDB" inManagedObjectContext:context];
            newObj.collectionDetailsDBIdentifier = [NSNumber numberWithDouble:obj.collectionDetailsIdentifier];
            newObj.collectionId = [NSNumber numberWithDouble:obj.collectionId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [collectionDetailSet addObject:newObj];
        }
         newProduct.collectionDetailsDB = collectionDetailSet;
        
        NSMutableSet *colourDetailSet = [[NSMutableSet alloc]init];
        for (ColourDetails *obj in productObj.colourDetails) {
            ColourDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"ColourDetailsDB" inManagedObjectContext:context];
            newObj.colourDetailsDBIdentifier = [NSNumber numberWithDouble:obj.colourDetailsIdentifier];
            newObj.colourId = [NSNumber numberWithDouble:obj.colourId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [colourDetailSet addObject:newObj];
        }
         newProduct.colourDetailsDB = colourDetailSet;
        
        NSMutableSet *designerDetailset = [[NSMutableSet alloc]init];
        for (DesignerDetails *obj in productObj.designerDetails) {
            DesignerDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"DesignerDetailsDB" inManagedObjectContext:context];
            newObj.designerDetailsDBIdentifier = [NSNumber numberWithDouble:obj.designerDetailsIdentifier];
            newObj.designerId = [NSNumber numberWithDouble:obj.designerId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [designerDetailset addObject:newObj];
        }
         newProduct.designerDetailsDB = designerDetailset;
        
        
        
        NSMutableSet *applicatorDetailSet = [[NSMutableSet alloc]init];
        for (Applicatordetails *obj in productObj.applicatorDetails) {
            ApplicatorDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"ApplicatorDetailsDB" inManagedObjectContext:context];
            newObj.applicatorDetailsDBIdentifier = [NSNumber numberWithDouble:obj.applicatordetailsIdentifier];
            newObj.applicatorId = [NSNumber numberWithDouble:obj.applicatorId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [applicatorDetailSet addObject:newObj];
        }
         newProduct.applicatorDetailsDB = applicatorDetailSet;
        
        
        NSMutableSet *clientDetailSet = [[NSMutableSet alloc]init];
        for (ClientDetails *obj in productObj.clientDetails) {
            ClientDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"ClientDetailsDB" inManagedObjectContext:context];
            newObj.clientDetailsDBIdentifier = [NSNumber numberWithDouble:obj.clientDetailsIdentifier];
            newObj.clientId = [NSNumber numberWithDouble:obj.clientId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [clientDetailSet addObject:newObj];
        }
         newProduct.clientDetailsDB = clientDetailSet;
        
        
        NSMutableSet *productDetailSet = [[NSMutableSet alloc]init];
        for (ProductDetails *obj in productObj.productDetails) {
            ProductDetailsDB *newObj = [NSEntityDescription insertNewObjectForEntityForName:@"ProductDetailsDB" inManagedObjectContext:context];
            newObj.productDetailsDBIdentifier = [NSNumber numberWithDouble:obj.productDetailsIdentifier];
            newObj.productsUsedId = [NSNumber numberWithDouble:obj.productsUsedId];
            newObj.name = obj.name;
            newObj.itemId = [NSNumber numberWithDouble:obj.itemId];
            [productDetailSet addObject:newObj];
        }
         newProduct.productDetailsDB = productDetailSet;
    }
    
        NSError *err=nil;
        if(![context save:&err ])
        {
            NSLog(@"Can't Delete! %@ %@", err, [err localizedDescription]);
        }
        else
        {
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            [defaults setValue:[NSNumber numberWithBool:YES] forKey:@"GETDATA_STATUS"];
            [defaults synchronize];

        }
    }
}
//-(NSArray *) GetProjectList{
//    NSManagedObjectContext *context=[self managedObjectContexts];
//    NSMutableArray *FrndsArray=[[NSMutableArray alloc]init];
//    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] initWithEntityName:@"Project"];
//    NSMutableArray *items=[[context executeFetchRequest:fetchRequest error:nil]mutableCopy];
//    for (Project *ProjectObj in items) {
//        Data *projct=[Data new];
//        projct.name = ProjectObj.name;
//        projct.dataIdentifier = [ProjectObj.projectIdentifier doubleValue];
//        projct.align = [ProjectObj.align doubleValue];
//        projct.country = ProjectObj.country;
//        projct.completionYear = ProjectObj.completionYear;
//        projct.city = ProjectObj.city;
//        projct.image = ProjectObj.image;
//        projct.buildingType = ProjectObj.buildingType;
//        projct.countryId = [ProjectObj.countryId doubleValue];
//        projct.cityId = [ProjectObj.cityId doubleValue];
//        projct.buildingTypeId = [ProjectObj.buildingTypeId doubleValue];
//        
//        NSMutableArray *objectArray = [NSMutableArray new];
//        for (Objectcoated *obj in ProjectObj.objectcoated) {
//     
//            Objectdetails *newObj = [Objectdetails new];
//            newObj.name = obj.name;
//            newObj.projectId = [obj.projectId doubleValue];
//            newObj.objectsCoatedId = [obj.objectsCoatedId doubleValue];
//            newObj.objectdetailsIdentifier = [obj.objectcoatedIdentifier doubleValue];
//            [objectArray addObject:newObj];
//        }
//        projct.objectdetails = objectArray;
//        
//        
//        NSMutableArray *ProductArray = [[NSMutableArray alloc]init];
//        for (Products *obj in ProjectObj.products) {
//            Productdetails *newObj = [Productdetails new];
//            newObj.name = obj.name;
//            newObj.projectId = [obj.projectId doubleValue];
//            newObj.productsUsedId = [obj.productsUsedId doubleValue];
//            newObj.productdetailsIdentifier = [obj.productsIdentifier doubleValue];
//            [ProductArray addObject:newObj];
//        }
//        projct.productdetails = ProductArray;
//        
//        NSMutableArray *CollectionArray =[[NSMutableArray alloc]init];
//        for (Collection *obj in ProjectObj.collection) {
//            Collectiondetails *newObj = [Collectiondetails new];
//            newObj.name = obj.name;
//            newObj.projectId = [obj.projectId doubleValue];
//            newObj.collectiondetailsIdentifier = [obj.collectionIdentifier doubleValue];
//            newObj.collectionId = [obj.collectionId doubleValue];
//            [CollectionArray addObject:newObj];
//        }
//        projct.collectiondetails = CollectionArray;
//        
//        NSMutableArray *ArchitectArray = [[NSMutableArray alloc]init];
//        for (Architect *obj in ProjectObj.architect) {
//            Architectdetails *newObj = [Architectdetails new];
//            newObj.name = obj.name;
//            newObj.projectId = [obj.projectId doubleValue];
//            newObj.architectdetailsIdentifier = [obj.architectIdentifier doubleValue];
//            newObj.architectId = [obj.architectId doubleValue];
//            [ArchitectArray addObject:newObj];
//        }
//        projct.architectdetails = ArchitectArray;
//        [FrndsArray addObject:projct];
//
//    }
//    NSArray *array = [[FrndsArray reverseObjectEnumerator] allObjects];
//    return array;
//}

-(NSArray *)GetProjectsWithSearchParams:(SearchParams*)search andKeyword:(NSString*)keyword{
    
    NSManagedObjectContext *context=[self managedObjectContexts];
    NSMutableArray *ProjectArray=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] initWithEntityName:@"Product"];
    
    NSMutableArray *subPredicates = [[NSMutableArray alloc] init];
    if (keyword.length>0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@", keyword];
        [subPredicates addObject:predicate];
    }
//    if (search.client!=0)
//    {
//         NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cityId==%@", [NSString stringWithFormat:@"%f",search.client]];
//        [subPredicates addObject:predicate];
//    }
    if (search.pacCountry!=0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pacId==%@", [NSString stringWithFormat:@"%f",search.pacCountry]];
        [subPredicates addObject:predicate];
    }
    if (search.pmuCountry!=0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pmuId==%@", [NSString stringWithFormat:@"%f",search.pmuCountry]];
        [subPredicates addObject:predicate];
    }
   
    if (subPredicates.count>0) {
        NSPredicate *orPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:subPredicates];
        [fetchRequest setPredicate:orPredicate];
    }
    NSMutableArray *items=[[context executeFetchRequest:fetchRequest error:nil]mutableCopy];
    for (Product *productObj in items) {
        
        Data *prodct=[Data new];
        prodct.name = productObj.name;
        prodct.internalBaseClassIdentifier =[productObj.internalBaseClassIdentifier doubleValue];
        prodct.pacId = [productObj.pacId doubleValue];
        prodct.pacName=productObj.pacName;
        prodct.pmuName = productObj.pmuName;
        prodct.image = productObj.image;
        prodct.pmuId = [productObj.pmuId doubleValue];
        prodct.align = [productObj.align doubleValue];
        
        //        @property (nonatomic, retain) NSNumber *internalBaseClassIdentifier;
        //        @property (nonatomic, retain) NSString *name;
        //        @property (nonatomic, retain) NSNumber *pacId;
        //        @property (nonatomic, retain) NSString *pmuName;
        //        @property (nonatomic, retain) NSString *image;
        //        @property (nonatomic, retain) NSString *pacName;
        //        @property (nonatomic, retain) NSNumber *pmuId;
        //        @property (nonatomic, retain) NSNumber *align;
        //        @property (nonatomic, retain) NSSet *componentDetailsDB;
        //        @property (nonatomic, retain) NSSet *collectionDetailsDB;
        //        @property (nonatomic, retain) NSSet *colourDetailsDB;
        //        @property (nonatomic, retain) NSSet *designerDetailsDB;
        //        @property (nonatomic, retain) NSSet *applicatorDetailsDB;
        //        @property (nonatomic, retain) NSSet *clientDetailsDB;
        //        @property (nonatomic, retain) NSSet *productDetailsDB;
        
        NSMutableArray *componentArray = [NSMutableArray new];
        for (ComponentDetailsDB *obj in productObj.componentDetailsDB) {
            ComponentDetails *newObj = [ComponentDetails new];
            newObj.name = obj.name;
            newObj.componentDetailsIdentifier = [obj.componentDetailsDBIdentifier doubleValue];
            newObj.componentId = [obj.componentId doubleValue];
            newObj.itemId = [obj.itemId doubleValue];
            [componentArray addObject:newObj];
        }
        prodct.componentDetails = componentArray;
        
        
        NSMutableArray *collectionArray = [NSMutableArray new];
        for (CollectionDetailsDB *obj in productObj.collectionDetailsDB) {
            CollectionDetails *newObj = [CollectionDetails new];
            newObj.name = obj.name;
            newObj.collectionDetailsIdentifier = [obj.collectionDetailsDBIdentifier doubleValue];
            newObj.collectionId = [obj.collectionId doubleValue];
            newObj.itemId = [obj.itemId doubleValue];
            [collectionArray addObject:newObj];
        }
        prodct.collectionDetails = collectionArray;
        
        
        NSMutableArray *colourArray = [NSMutableArray new];
        for (ColourDetailsDB *obj in productObj.colourDetailsDB) {
            ColourDetails *newObj = [ColourDetails new];
            newObj.name = obj.name;
            newObj.colourDetailsIdentifier = [obj.colourDetailsDBIdentifier doubleValue];
            newObj.colourId = [obj.colourId doubleValue];
            newObj.itemId = [obj.itemId doubleValue];
            [colourArray addObject:newObj];
        }
        prodct.colourDetails = colourArray;
        
        NSMutableArray *designerArray = [NSMutableArray new];
        for (DesignerDetailsDB *obj in productObj.designerDetailsDB) {
            DesignerDetails *newObj = [DesignerDetails new];
            newObj.name = obj.name;
            newObj.designerDetailsIdentifier = [obj.designerDetailsDBIdentifier doubleValue];
            newObj.designerId = [obj.designerId doubleValue];
            newObj.itemId = [obj.itemId doubleValue];
            [designerArray addObject:newObj];
        }
        prodct.designerDetails = designerArray;
        
        
        NSMutableArray *applicatorArray = [NSMutableArray new];
        for (ApplicatorDetailsDB *obj in productObj.applicatorDetailsDB) {
            Applicatordetails *newObj = [Applicatordetails new];
            newObj.name = obj.name;
            newObj.applicatordetailsIdentifier = [obj.applicatorDetailsDBIdentifier doubleValue];
            newObj.applicatorId = [obj.applicatorId doubleValue];
            newObj.itemId = [obj.itemId doubleValue];
            [applicatorArray addObject:newObj];
        }
        prodct.applicatorDetails = applicatorArray;
        
        NSMutableArray *clientArray = [NSMutableArray new];
        for (ClientDetailsDB *obj in productObj.clientDetailsDB) {
            ClientDetails *newObj = [ClientDetails new];
            newObj.name = obj.name;
            newObj.clientDetailsIdentifier = [obj.clientDetailsDBIdentifier doubleValue];
            newObj.clientId = [obj.clientId doubleValue];
            newObj.itemId = [obj.itemId doubleValue];
            [clientArray addObject:newObj];
        }
        prodct.clientDetails = clientArray;
        
        NSMutableArray *productArray = [NSMutableArray new];
        for (ProductDetailsDB *obj in productObj.productDetailsDB) {
            ProductDetails *newObj = [ProductDetails new];
            newObj.name = obj.name;
            newObj.productDetailsIdentifier = [obj.productDetailsDBIdentifier doubleValue];
            newObj.productsUsedId = [obj.productsUsedId doubleValue];
            newObj.itemId = [obj.itemId doubleValue];
            [productArray addObject:newObj];
        }
        prodct.productDetails = productArray;
        
        
        [ProjectArray addObject:prodct];
        
    }
    
    
    NSMutableArray *FilteredArray=[[NSMutableArray alloc]init];
    //        @property (nonatomic, retain) NSSet *componentDetailsDB;
    //        @property (nonatomic, retain) NSSet *collectionDetailsDB;
    //        @property (nonatomic, retain) NSSet *colourDetailsDB;
    //        @property (nonatomic, retain) NSSet *designerDetailsDB;
    //        @property (nonatomic, retain) NSSet *applicatorDetailsDB;
    //        @property (nonatomic, retain) NSSet *clientDetailsDB;
    //        @property (nonatomic, retain) NSSet *productDetailsDB;
    
    //filtering objects coated from searched array
    if (search.component!=0)
    {
        for(Data *productObj in ProjectArray)
        {
            for(ComponentDetails *obj in productObj.componentDetails)
            {
                if (obj.componentId==search.component)
                    [FilteredArray  addObject:productObj];
            }
        }
        ProjectArray=[[NSMutableArray alloc]initWithArray:FilteredArray];
        FilteredArray=[[NSMutableArray alloc]init];
    }
    // filtering client from searched array
    if (search.client!=0)
    {
        for(Data *clientObj in ProjectArray)
        {
            for(ClientDetails *obj in clientObj.clientDetails)
            {
                if (obj.clientId==search.client)
                    [FilteredArray  addObject:clientObj];
            }
        }
        ProjectArray=[[NSMutableArray alloc]initWithArray:FilteredArray];
        FilteredArray=[[NSMutableArray alloc]init];
    }
    
    //filtering products from searched array
    if (search.collection!=0)
    {
        for(Data *productObj in ProjectArray)
        {
            for(CollectionDetails *obj in productObj.collectionDetails)
            {
                if (obj.collectionId==search.collection)
                    [FilteredArray  addObject:productObj];

            }
        }
        ProjectArray=[[NSMutableArray alloc]initWithArray:FilteredArray];
        FilteredArray=[[NSMutableArray alloc]init];
    }


    
    
    //filtering architect from searched array
    if (search.colour!=0)
    {
        for(Data *productObj in ProjectArray)
        {
            for(ColourDetails *obj in productObj.colourDetails)
            {
                if (obj.colourId==search.colour)
                    [FilteredArray  addObject:productObj];
                
            }
        }
        ProjectArray=[[NSMutableArray alloc]initWithArray:FilteredArray];
        FilteredArray=[[NSMutableArray alloc]init];
    }
    
    //filtering architect from searched array
    if (search.designer!=0)
    {
        for(Data *productObj in ProjectArray)
        {
            for(DesignerDetails *obj in productObj.designerDetails)
            {
                if (obj.designerId==search.designer)
                    [FilteredArray  addObject:productObj];
                
            }
        }
        ProjectArray=[[NSMutableArray alloc]initWithArray:FilteredArray];
        FilteredArray=[[NSMutableArray alloc]init];
    }
    
    //filtering architect from searched array
    if (search.applicator!=0)
    {
        for(Data *productObj in ProjectArray)
        {
            for(Applicatordetails *obj in productObj.applicatorDetails)
            {
                if (obj.applicatorId==search.applicator)
                    [FilteredArray  addObject:productObj];
                
            }
        }
        ProjectArray=[[NSMutableArray alloc]initWithArray:FilteredArray];
        FilteredArray=[[NSMutableArray alloc]init];
    }
    
    
    
    //filtering collections from searched array
    if (search.products!=0)
    {
        for(Data *productObj in ProjectArray)
        {
            for(ProductDetails *obj in productObj.productDetails)
            {
                if (obj.productsUsedId==search.products)
                    [FilteredArray  addObject:productObj];
            }
        }
        ProjectArray=[[NSMutableArray alloc]initWithArray:FilteredArray];
    }


    return ProjectArray;
}


@end
