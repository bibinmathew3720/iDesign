//
//  ProjectViewController.m
//  iRise
//
//  Created by Mobile Developer on 26/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "ProjectViewController.h"
#import "ContentCollectionViewCell.h"
#import "Models.h"

#define ZOOM_STEP 1.5
@class ContentCollectionViewCell;
@interface ProjectViewController ()<UIScrollViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>
{
    UIPinchGestureRecognizer *twoFingerPinch;
    NSMutableArray *listarray;
    NSMutableArray *contentArray;
    Data *data;
    BOOL IdGet;
    __weak IBOutlet ContentCollectionViewCell *collectionViewCell;
}
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (weak, nonatomic) IBOutlet UIView *titleViewRight;
@property (weak, nonatomic) IBOutlet UILabel *rightTitle;
@property (weak, nonatomic) IBOutlet UILabel *leftTitle;
@property (weak, nonatomic) IBOutlet UIButton *closeRight;
@property (weak, nonatomic) IBOutlet UIButton *closeLeft;
@property (weak, nonatomic) IBOutlet UIButton *infoButtonLeft;
@property (weak, nonatomic) IBOutlet UIButton *infoButtonRight;

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    // add gesture recognizers to the image view
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    
    UISwipeGestureRecognizer *leftGuster = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
    UISwipeGestureRecognizer *rightGuster = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerRight:)];
    if (![self IsIPad]) {
        [_rightTitle setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:35]];
        [_leftTitle setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:35]];
    }
    
    [leftGuster setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [rightGuster setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [doubleTap setNumberOfTapsRequired:2];
    [twoFingerTap setNumberOfTouchesRequired:2];
    
    [self.imageView addGestureRecognizer:singleTap];
    [self.imageView addGestureRecognizer:doubleTap];
    [self.imageView addGestureRecognizer:twoFingerTap];
//    [_nameLabel addGestureRecognizer:MoveGesture];
    
    [self.view addGestureRecognizer:leftGuster];
    [self.view addGestureRecognizer:rightGuster];
    
    // calculate minimum scale to perfectly fit image width, and begin at that scale
    float minimumScale = [_scrollView frame].size.width  / [_imageView frame].size.width;
    [_scrollView setMinimumZoomScale:minimumScale];
    [_scrollView setZoomScale:6];
    self.scrollView.maximumZoomScale=4.0;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self setupContent];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:NSStringFromClass([self class])];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

-(void) setupContent
{
    //listarray = [[NSMutableArray alloc]initWithObjects:@"Project",@"Completion Date",@"Products Used",@"City",@"Building Type",@"Objects Coated",@"Country",@"Architect",@"Collections", nil];
    data = [_projects objectAtIndex:_index];
    
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:data.image] placeholderImage:[UIImage imageNamed:@"loading"]];
    [_imageView setShowActivityIndicatorView:YES];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _nameLabel.text = data.name;
    _rightTitle.text = data.name;
    if (data.align == 2) {
        _titleView.hidden = YES;
        _titleViewRight.hidden = NO;
        _closeLeft.hidden = NO;
        _closeRight.hidden = YES;
    }
    else
    {
        _titleView.hidden = NO;
        _titleViewRight.hidden = YES;
        _closeLeft.hidden = YES;
        _closeRight.hidden = NO;
    }
    NSString *ProductsUsedStg=@"";
    for (ProductDetails *productObj in data.productDetails) {
        ProductsUsedStg = [ProductsUsedStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",productObj.name]];
    }
    if (ProductsUsedStg.length>2)
    ProductsUsedStg = [ProductsUsedStg substringToIndex:[ProductsUsedStg length]-2];
    
//    NSString *componentCoated=@"";
//    for (ComponentDetails *componentObj in data.componentDetails) {
//        componentCoated = [componentCoated stringByAppendingString:[NSString stringWithFormat:@"%@, ",componentObj.name]];
//    }
//    if (componentCoated.length>2)
//    componentCoated = [componentCoated substringToIndex:[componentCoated length]-2];
    
    NSString *applicatorDetailsStg=@"";
    for (Applicatordetails *ApplicatorObj in data.applicatorDetails) {
        applicatorDetailsStg = [applicatorDetailsStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",ApplicatorObj.name]];
    }
    if (applicatorDetailsStg.length>2)
    applicatorDetailsStg = [applicatorDetailsStg substringToIndex:[applicatorDetailsStg length]-2];
    
    //Testing -- John
   NSString *componentsUsedStg =@"";
    for (ComponentDetails *componentObj in data.componentDetails) {
        componentsUsedStg = [componentsUsedStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",componentObj.name]];
    }
    if (componentsUsedStg.length>2)
        componentsUsedStg = [componentsUsedStg substringToIndex:[componentsUsedStg length]-2];
   
    
    NSString *colourUsedStg =@"";
    for (ColourDetails *colourObj in data.colourDetails) {
        colourUsedStg = [colourUsedStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",colourObj.name]];
    }
    if (colourUsedStg.length>2)
        colourUsedStg = [colourUsedStg substringToIndex:[colourUsedStg length]-2];
    
    NSString *ClientDetailsStg =@"";
    for (ClientDetails *clientObj in data.clientDetails) {
        ClientDetailsStg = [ClientDetailsStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",clientObj.name]];
    }
    if (ClientDetailsStg.length>2)
        ClientDetailsStg = [ClientDetailsStg substringToIndex:[ClientDetailsStg length]-2];
    
    NSString *CollectionStg=@"";
    for (CollectionDetails *CollectionObj in data.collectionDetails) {
        CollectionStg = [CollectionStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",CollectionObj.name]];
    }
    if (CollectionStg.length>2)
    CollectionStg = [CollectionStg substringToIndex:[CollectionStg length]-2];
    
    NSString *companyStg=@"";
    for (CompanyDetails *companyObj in data.companyDetails) {
        companyStg = [companyStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",companyObj.name]];
    }
    if (companyStg.length>2)
        companyStg = [companyStg substringToIndex:[companyStg length]-2];
    
    
    NSString *productsNameStg=@"";
    for (ProductsNameDetails *productObj in data.productsDetails) {
        productsNameStg = [productsNameStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",productObj.name]];
    }
    if (productsNameStg.length>2)
        productsNameStg = [productsNameStg substringToIndex:[productsNameStg length]-2];
    
    NSString *designerStg=@"";
    for (DesignerDetails *designerObj in data.designerDetails) {
        designerStg = [designerStg stringByAppendingString:[NSString stringWithFormat:@"%@, ",designerObj.name]];
    }
    if (designerStg.length>2)
        designerStg = [designerStg substringToIndex:[designerStg length]-2];
    
//    Removing collection header if no data
//    NSMutableArray *firstListArray =[[NSMutableArray alloc]initWithObjects:@"Item Name",@"Customer Name",@"Component Coated",@"Products used",@"Colour Name",@"Collection Name",@"Powder Application Country",@"Powder manufacturing Unit",@"Applicator", nil];

    NSMutableArray *firstListArray =[[NSMutableArray alloc]initWithObjects:@"Name of Item",@"Company",@"Customer",@"Item Coated",@"Products Code",@"Colour",@"Product Name",@"Collection Name",@"Powder Application Country",@"Powder Manufacturing Unit",@"Designer",@"Design House", nil];
    
    NSMutableArray *firstContentArray =[[NSMutableArray alloc]initWithObjects:data.name,companyStg,ClientDetailsStg,componentsUsedStg,ProductsUsedStg,colourUsedStg,productsNameStg,CollectionStg,data.pacName,data.pmuName,designerStg,applicatorDetailsStg, nil];
  ///
    if ([companyStg isEqualToString:@""]||[companyStg  isEqualToString:@"N/A"]||[companyStg  isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Company"];
        [firstContentArray removeObject:companyStg];
    }
    if ([productsNameStg isEqualToString:@""]||[productsNameStg  isEqualToString:@"N/A"]||[productsNameStg  isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Product Name"];
        [firstContentArray removeObject:productsNameStg];
    }
    if ([designerStg isEqualToString:@""]||[designerStg  isEqualToString:@"N/A"]||[designerStg  isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Designer"];
        [firstContentArray removeObject:designerStg];
    }
    /////
    
    if ([data.name isEqualToString:@""]||[data.name  isEqualToString:@"N/A"]||[data.name  isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Item Name"];
        [firstContentArray removeObject:data.name];
    }
    if ([ClientDetailsStg isEqualToString:@""]||[ClientDetailsStg isEqualToString:@"N/A"]||[ClientDetailsStg isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Customer"];
        [firstContentArray removeObject:ClientDetailsStg];
    }
    if ([componentsUsedStg isEqualToString:@""]||[componentsUsedStg isEqualToString:@"N/A"]||[componentsUsedStg isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Item Coated"];
        [firstContentArray removeObject:componentsUsedStg];
    }
    if ([ProductsUsedStg isEqualToString:@""]||[ProductsUsedStg isEqualToString:@"N/A"]||[ProductsUsedStg isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Products Code"];
        [firstContentArray removeObject:ProductsUsedStg];
    }

    if ([colourUsedStg isEqualToString:@""]||[colourUsedStg isEqualToString:@"N/A"]||[colourUsedStg isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Colour"];
        [firstContentArray removeObject:colourUsedStg];
    }
    
    if ([CollectionStg isEqualToString:@""]||[CollectionStg isEqualToString:@"N/A"]||[CollectionStg isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Collection Name"];
        [firstContentArray removeObject:CollectionStg];
    }
    if ([data.pacName isEqualToString:@""]||[data.pacName isEqualToString:@"N/A"]||[data.pacName isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Powder Application Country"];
        [firstContentArray removeObject:data.pacName];
    }
    if ([data.pmuName isEqualToString:@""]||[data.pmuName isEqualToString:@"N/A"]||[data.pmuName isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Powder manufacturing Unit"];
        [firstContentArray removeObject:data.pmuName];
    }
    if ([applicatorDetailsStg isEqualToString:@""]||[applicatorDetailsStg isEqualToString:@"N/A"]||[applicatorDetailsStg isEqualToString:@"N/A"]) {
        [firstListArray removeObject:@"Design House"];
        [firstContentArray removeObject:applicatorDetailsStg];
    }

    //contentArray = [[NSMutableArray alloc]initWithObjects:data.name,data.completionYear,ProductsUsedStg,data.city,data.buildingType,ObjectsCoatedStg,data.country,ArchitectStg,CollectionStg, nil];
    listarray =firstListArray;
    
    contentArray = firstContentArray;
    
  

   // NSDictionary *dataDictionry = [data dictionaryRepresentation];
    
}

- (void)setEstimatedSizeIfNeeded {
//    self.contentCollectionView.nu
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)_contentCollectionView.collectionViewLayout;
    CGFloat widthAvailbleForAllItems =  (_contentCollectionView.frame.size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right);
    CGFloat width =  widthAvailbleForAllItems/3.2;
    flowLayout.estimatedItemSize = CGSizeMake(width, 95);
    if (flowLayout.estimatedItemSize.width > width) {
        [flowLayout setEstimatedItemSize:CGSizeMake(width, 95)];
        [flowLayout invalidateLayout];
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.contentCollectionView.collectionViewLayout invalidateLayout];
        [self.contentCollectionView reloadData];
    }];
}
- (void)reload {
    [self setEstimatedSizeIfNeeded];
    [self.contentCollectionView reloadData];
}


#pragma mark - scrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView

{
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - collection delegates


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return listarray.count;

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collcellID";
    
    
    ContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
            cell.TitleLabel.text = [listarray objectAtIndex:indexPath.row];
    
       cell.DetailsLabel.text = [contentArray objectAtIndex:indexPath.row];
    
    if ([self IsIPad]) {
        [cell.TitleLabel setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:22]];
        [cell.DetailsLabel setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:26]];
    }

    cell.contentView.frame = cell.bounds;
    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        cell.tittleLabel.text=[LeftMenuArray objectAtIndex:indexPath.row];
//        cell.imagView.image=[LeftIconArray objectAtIndex:indexPath.row];
   

//    CGSize inSize = cell.DetailsLabel.intrinsicContentSize;
//    cell.DetailsLabel.frame = CGRectMake(0, 0, inSize.width, inSize.height);
  
    return cell;
}




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)_contentCollectionView.collectionViewLayout;
    CGFloat widthAvailbleForAllItems =  (_contentCollectionView.frame.size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right);
    CGFloat width =  widthAvailbleForAllItems/3.2;
    if ([self IsIPad]) {
        return CGSizeMake(width,  150);
    }
    return CGSizeMake(width,  100);
    
}



//-(NSString *)DictionaryToString :(NSArray *)array
//{
//    NSString *stg=@"";
//    for (NSDictionary *dic in array) {
//        stg=[stg stringByAppendingString:[NSString stringWithFormat:@"%@, ",[dic valueForKey:@"name"]]];
//    }
//    return stg;
//}

#pragma mark - Handeling rotation
- (BOOL)shouldAutorotate
{
    return YES; // I've also tried returning YES - no success
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape; // I've also tried UIInterfaceOrientationPortrait - no success
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft; // Never called
}

#pragma mark- Handle swipe gestures
- (void)swipeHandlerLeft:(UISwipeGestureRecognizer *)gestureRecognizer{
    
    
    if (_index>=_projects.count-1) {
        return;
    }
    ++_index;
    [self slideToViewFromLeft:NO];
}
- (void)swipeHandlerRight:(UISwipeGestureRecognizer *)gestureRecognizer{
    
    if (_index <= 0) {
        return;
    }
    --_index;
    [self slideToViewFromLeft:YES];
}

-(void)slideToViewFromLeft:(BOOL)animateFromLeft{
    
    // get the view that's currently showing
    UIView *currentView = self.imageView;
    // get the the underlying UIWindow, or the view containing the current view
    UIView *theWindow = [currentView superview];
    
    UIView *newView = self.imageView;
    
    
    // set up an animation for the transition between the views
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.6];
    [animation setType:kCATransitionPush];
    if(animateFromLeft){
        [animation setSubtype:kCATransitionFromLeft];
    }
    else{
        [animation setSubtype:kCATransitionFromRight];
    }
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [[theWindow layer] addAnimation:animation forKey:@"SwitchToView"];
    newView.frame= _contentView.bounds;
    _infoView.hidden = YES;
    _infoButtonLeft.hidden = NO;
   _infoButtonRight.hidden = NO;
//    data = [_projects objectAtIndex:_index];
//    [_imageView sd_setImageWithURL:[NSURL URLWithString:data.image] placeholderImage:[UIImage imageNamed:@"loading"]];
//    [_imageView setShowActivityIndicatorView:YES];
//    _nameLabel.text = data.name;
//    _rightTitle.text = data.name;
//    if (data.align == 2) {
//        _titleView.hidden = YES;
//        _titleViewRight.hidden = NO;
//        _closeLeft.hidden = NO;
//        _closeRight.hidden = YES;
//    }
//    else
//    {
//        _titleView.hidden = NO;
//        _titleViewRight.hidden = YES;
//        _closeLeft.hidden = YES;
//        _closeRight.hidden = NO;
//    }
//    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self setupContent];
    [_contentCollectionView reloadData];
}

/************************************** NOTE **************************************/
/* The following delegate method works around a known bug in zoomToRect:animated: */
/* In the next release after 3.0 this workaround will no longer be necessary      */
/**********************************************************************************/
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    [scrollView setZoomScale:scale+0.01 animated:NO];
    [scrollView setZoomScale:scale animated:NO];
//    if (scale == 1) {
//        _imageView.contentMode = UIViewContentModeScaleAspectFit;
////        _scrollView.bounds = CGRectMake(0, 0, _imageView.image.size.width, _imageView.image.size.height);
////        _scrollView.contentSize = _imageView.image.size;
//    }
//    else{
//        _imageView.contentMode = UIViewContentModeScaleAspectFill;
////        _scrollView.bounds = CGRectMake(0, 0, _imageView.image.size.width, _imageView.image.size.height);
////        _scrollView.contentSize = _imageView.image.size;
//    }
}

#pragma mark TapDetectingImageViewDelegate methods

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    // single tap does nothing for now
//    _titleView.hidden = !_titleView.hidden;
    if ([_scrollView zoomScale] == 1) {
        if (_imageView.contentMode == UIViewContentModeScaleAspectFill) {
            _imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
        else{
            _imageView.contentMode = UIViewContentModeScaleAspectFill;
        }
    }
    
    
    
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {
    // double tap zooms in
    float newScale = [_scrollView zoomScale] * ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [_scrollView zoomToRect:zoomRect animated:YES];
}

- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer {
    // two-finger tap zooms out
    float newScale = [_scrollView zoomScale] / ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [_scrollView zoomToRect:zoomRect animated:YES];
}

#pragma mark- Animation

-(void) animateView :(UIView *)view
{
    CGSize sourceSize = self.view.bounds.size;
    CGSize popupSize = view.bounds.size;
    CGRect popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                       sourceSize.height,
                                       popupSize.width,
                                       popupSize.height);

    CGRect popupEndRect = view.frame;
    view.frame=popupStartRect;
    [UIView animateWithDuration:0.35 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        //[self.menuTableView viewWillAppear:NO];
        //    self.mj_popupBackgroundView.alpha = 1.0f;
        view.frame = popupEndRect;
    } completion:^(BOOL finished) {
        // [self.mj_popupViewController viewDidAppear:NO];
        [_contentCollectionView reloadData];
    }];
}
-(void) DismissAnimateView :(UIView *)view
{
    CGSize sourceSize = self.view.bounds.size;
    CGSize popupSize = view.bounds.size;
    CGRect popupStartRect = view.frame;
    CGRect popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                     sourceSize.height,
                                     popupSize.width,
                                     popupSize.height);
    [UIView animateWithDuration:0.35 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        //[self.menuTableView viewWillAppear:NO];
        //    self.mj_popupBackgroundView.alpha = 1.0f;
        view.frame = popupEndRect;
    } completion:^(BOOL finished) {
        [view setHidden:YES];
        view.frame = popupStartRect;
    }];
}

#pragma mark Utility methods

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    // the zoom rect is in the content view's coordinates.
    //    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
    //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
    zoomRect.size.height = [_scrollView frame].size.height / scale;
    zoomRect.size.width  = [_scrollView frame].size.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}
- (IBAction)infoPressed:(id)sender {
    _infoView.hidden = NO;
    [self animateView:_infoView];
    if (data.align == 2) {
//        _titleViewRight.hidden = YES;
        _infoButtonLeft.hidden = YES;
    }
    else{
//        _titleView.hidden = YES;
        _infoButtonRight.hidden = YES;
        
    }
    //_contentCollectionView.hidden=NO;
}
- (IBAction)closePressed:(id)sender {
    [self DismissAnimateView:_infoView];
    if (data.align == 2) {
//        _titleViewRight.hidden = NO;
       _infoButtonLeft.hidden = NO;
    }
    else{
//        _titleView.hidden = NO;
        _infoButtonRight.hidden = NO;
    }
    //_contentCollectionView.hidden=YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
