//
//  HomeViewController.m
//  iRise
//
//  Created by Mobile Developer on 24/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "HomeViewController.h"
#import "Reachability.h"
#import "DataModels.h"
#import "ProjectViewController.h"
#import "HomeCell.h"
#import "ProjectManager.h"
#import "DBManager.h"
#import "Models.h"
#import "HomeManger.h"



@interface HomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    Projects *projects;
    NSArray *projectArray;
    int index;
    
}
@end

@implementation HomeViewController
@synthesize projectArray;

- (void)viewDidLoad {
    [super viewDidLoad];
//     [SVProgressHUD resetOffsetFromCenter];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSNumber *offline = [defaults valueForKey:@"OFFLINE_STATUS"];
    NSNumber *data = [defaults valueForKey:@"GETDATA_STATUS"];
    if (!projectArray) {
        Reachability *reach =[Reachability reachabilityWithHostName:@"google.com"];
        NetworkStatus status = [reach currentReachabilityStatus];
        if (_search == nil) {
            _search =[[SearchParams alloc]init];
        }
        if (status == NotReachable&&[offline boolValue]&&[data boolValue]) {
            
//            if (_isProjects) {
//                DBManager *mngr=[[DBManager alloc]init];
//                projectArray = [mngr GetProjectList];
//                
//            }
//            else{
                DBManager *mngr=[[DBManager alloc]init];
                projectArray = [mngr GetProjectsWithSearchParams:_search andKeyword:@""];
//            }
            [_homeCollectionView reloadData];
        }
        else
        {
            
            ProjectManager *mngr = [[ProjectManager alloc]init];
            
            NSString *usrID = [defaults valueForKey:@"USER_ID"];
            NSString *userIDString = [NSString stringWithString:usrID];
            NSString *session = [defaults valueForKey:@"SESSION_ID"];
            
            _search.sessionId = session;
            _search.internalBaseClassIdentifier = userIDString;
            NSMutableDictionary *ParamsDic=[[NSMutableDictionary alloc] initWithDictionary:[_search dictionaryRepresentation]];
            [ParamsDic setObject:@"" forKey:@"keyword"];
            
            [SVProgressHUD showWithStatus:@"Loading..."];
            
            [mngr ListProjectWithSearchParams:ParamsDic andCompetionHandler:^(id object) {
                
                if ([object isKindOfClass:[Response class]]) {
                    
                    Response *response = (Response *)object;
                    if (response.status)
                        [self logout];
                    else
                        [SVProgressHUD showErrorWithStatus:response.message];
                }
                else{
                    projects = object;
                    projectArray = projects.data;
                    [_homeCollectionView reloadData];
                    if (_isProjects) {
                        DBManager *mngr=[[DBManager alloc]init];
                        [mngr AddProjectList:projectArray];
                    }
                    [SVProgressHUD dismiss];
                }
            }];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [projectArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"homeCellID" forIndexPath:indexPath];
    Data *data = [projectArray objectAtIndex:indexPath.item];
    [cell.projectImageView sd_setImageWithURL:[NSURL URLWithString:data.image] placeholderImage:[UIImage imageNamed:@"loading"]];
    [cell.projectImageView setShowActivityIndicatorView:YES];
    cell.title.text = data.name;
    if (![self IsIPad]) {
        [cell.title setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:13]];
    }

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width =  CGRectGetWidth(collectionView.frame)/3- 15;
    CGFloat height = width*3/4; //CGRectGetHeight(collectionView.frame)/2- 7;
    return CGSizeMake(width, height);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    index = (int)indexPath.item;
    [self performSegueWithIdentifier:@"homeDetailsViewSegue" sender:self];
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20.0;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
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

-(void) logout
{
    UIViewController *login= [self.storyboard instantiateViewControllerWithIdentifier:@"LoginNav"];
    [[UIApplication sharedApplication] keyWindow].rootViewController = login;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSNumber numberWithBool:NO] forKey:@"LOGIN_STATUS"];
    [defaults synchronize];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ProjectViewController *vc = [segue destinationViewController];
    vc.projects = projectArray;
    vc.index = index;
}


@end
