//
//  SearchCollectionViewCell.h
//  iRise
//
//  Created by mobtecnica on 11/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *KeywordText;
@property (weak, nonatomic) IBOutlet UILabel *DisplayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowPng;

@end
