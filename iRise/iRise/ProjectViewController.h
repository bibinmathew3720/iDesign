//
//  ProjectViewController.h
//  iRise
//
//  Created by Mobile Developer on 26/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "BaseViewController.h"


@interface ProjectViewController : BaseViewController

@property (nonatomic, strong) NSArray *projects;
@property (nonatomic) int index;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;



@end
