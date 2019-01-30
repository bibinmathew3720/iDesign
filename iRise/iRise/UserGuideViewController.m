//
//  UserGuideViewController.m
//  iRise
//
//  Created by Mobile Developer on 24/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "UserGuideViewController.h"
#import "UserGuideCell.h"
#import "HomeViewController.h"

@interface UserGuideViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray *menuImagesArray, *menuTitleArray, *menuDescriptionArray;
}

@end

@implementation UserGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:gestureRecognizer];
    menuImagesArray = [[NSArray alloc]initWithObjects:@"ugmenu",@"ugSearch",@"uginfo",@"ugmobile",@"ugswipe",@"ugpinch", nil];
    menuTitleArray = [[NSArray alloc]initWithObjects:@"Menu",@"Search", @"Info",@"Viewing", @"Swipe", @"Pinch", nil];
    menuDescriptionArray = [[NSArray alloc]initWithObjects:@"Click to choose a display of furniture by product,designer or collection.",@"Filter Your searches by selecting specific fields to narrow down furniture of preference.",@"Look out for this icon on each furniture image which displays relevant information when clicked.",@"The contents in this App are presented in horizontal orientation for best viewing.",@"To view through a series of similar furnitures, you can simply swipe along to see one after the other",@"For a closer look on each furniture, simply pinch and enlarge to zoom in", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.@""
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UserGuideCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ugCellIdentifier" forIndexPath:indexPath];
    
    cell.icon.image = [UIImage imageNamed:[menuImagesArray objectAtIndex:indexPath.item]];
    cell.title.text = [menuTitleArray objectAtIndex:indexPath.item];
    cell.discription.text = [menuDescriptionArray objectAtIndex:indexPath.item];
    if ([self IsIPad]) {
        [cell.title setFont:[UIFont boldSystemFontOfSize:22]];
        [cell.discription setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightRegular]];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width =  CGRectGetWidth(collectionView.frame)/3- 7;
    CGFloat height = CGRectGetHeight(collectionView.frame)/2 - 7;
    if ([self IsIPad]) {
        height = width*3/4;
    }
    return CGSizeMake(width, height);
}

#pragma mark - Handeling rotation
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

#pragma mark - SwipeHandler
-(void)swipeHandlerLeft:(id)sender
{
    //Your ViewController
    [self performSegueWithIdentifier:@"UserGuideHomeSegue" sender:self];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HomeViewController *vc=[segue destinationViewController];
    vc.isProjects=YES;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
