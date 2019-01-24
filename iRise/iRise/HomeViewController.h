//
//  HomeViewController.h
//  iRise
//
//  Created by Mobile Developer on 24/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "BaseViewController.h"
#import "SearchParams.h"

@interface HomeViewController : BaseViewController


@property (weak, nonatomic) IBOutlet UICollectionView *homeCollectionView;

@property (strong,nonatomic) NSNumber *IdNum;
@property (strong,nonatomic) SearchParams *search;
@property (strong,nonatomic) NSArray *projectArray;
@property BOOL isProjects;

@end
