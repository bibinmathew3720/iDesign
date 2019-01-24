//
//  SearchViewController.m
//  iRise
//
//  Created by mobtecnica on 10/05/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "SearchViewController.h"
#import "HomeViewController.h"
#import "SearchCollectionViewCell.h"
#import "SearchButtonCollectionViewCell.h"
#import "Reachability.h"
#import "MenuManager.h"
#import "ProjectManager.h"
#import "DBManager.h"
#import "SearchParams.h"
#import "Projects.h"
#import "Models.h"

@interface SearchViewController () <UITextFieldDelegate, UITableViewDelegate>
{
    NSArray *MenuArray;
    NSArray *listArray;
    NSDictionary *menuDict;
    int ListSection;
    int CountryIndex;
    
    NSString *CountryId;
    NSString *CityId;
    NSString *ProductId;
    NSString *TypeId;
    NSString *ArchitecId;
    NSString *ColId;
    NSString *ItemId;
    NSString *CustomerId;
    NSString *ApplicatorId;
    NSString *ColourId;
    NSString *ComponentId;
    NSString *DesignerId;
    NSString *PacCountryId;
    NSString *PmuCountryId;
    NSString *CompanyId;
    NSString *ProductsId;

}


@end

@implementation SearchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
      [SVProgressHUD resetOffsetFromCenter];
//    _CountryArray = [[NSArray alloc]initWithObjects:@"Australia",@"Bahrain",@"India",@"Indonasia",@"Japan",@"Kuwait",@"Malasia",@"Oman",@"Poland",@"Qatar",@"Saudi arabia",@"Singapore",@"Thailand",@"Turkey",@"UAE", nil];
//    _CityArray = [[NSArray alloc]initWithObjects:@"Dubai",@"Abu Dhabi",@"Sharjah",@"Al Ain",@"Ajman",@"Ras al-Khaimah",@"Al Fujayrah",@"Umm al Qaywayn",@"Khawr Fakkān",@"Dibba Al-Fujairah", nil];
     MenuArray=[[NSArray alloc]init];
    //listArray = [[NSArray alloc]initWithObjects:@"Keyword",@"Country",@"City",@"Product",@"Project Type",@"Architect",@"Facade/Collection", nil];
//    listArray = [[NSArray alloc]initWithObjects:@"Keywords",@"Customer Name",@"Component Coated",@"Products Used",@"Colour Name",@"Collection Name",@"Applicator", nil];
    listArray = [[NSArray alloc]initWithObjects:@"Keyword",@"Company Name",@"Item Coated",@"Product Name",@"Collection Name",@"Powder Application Country",@"Designer",@"Design House", nil];

    menuDict = [[NSUserDefaults standardUserDefaults] valueForKey:@"MENU"];
    if (![menuDict isKindOfClass:[NSDictionary class]]) {
        return;
    }
    if (![self IsIPad])
        self.TitleLabel.font=[UIFont fontWithName:@"FrutigerLTStd-Bold" size:12];
    
    [self animateView:_SearchView];
    _SearchTableView.estimatedRowHeight = UITableViewAutomaticDimension;
//    MenuManager *mngr = [[MenuManager alloc]init];
//    [mngr attachMenuDetailsWithCompletionHandler:^(id object) {
//        
//        if ([object isKindOfClass:[Response class]]) {
//            NSLog(@"Error: ");
//            
//        }
//        else{
//            menuDict = object;
//        }
//    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - UITableViewDataSource and UITableViewDelegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return MenuArray.count+1;
}


//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
//{
//    if([view isKindOfClass:[UITableViewHeaderFooterView class]]){
//        UITableViewHeaderFooterView *tableViewHeaderFooterView = (UITableViewHeaderFooterView *) view;
//        tableViewHeaderFooterView.textLabel.text = [tableViewHeaderFooterView.textLabel.text capitalizedString];
//    }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MenuCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel *label = [cell viewWithTag:100];
    if (![self IsIPad]) {
        [label setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:12]];
    }
    if (indexPath.row == MenuArray.count) {
        label.text = @"Clear";
        return cell;
    }
    
    NSDictionary *subMenuItem = [MenuArray objectAtIndex:indexPath.row];
    label.text = [subMenuItem valueForKey:@"name"];
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView setBackgroundColor:[UIColor darkGrayColor]];
        [cell setSelectedBackgroundView:bgColorView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *IdStg = 0;
    UILabel *LabelText;
    if (indexPath.row == MenuArray.count) {
        LabelText = (UILabel *) [self.view viewWithTag:3000+ListSection];
        LabelText.text = @"";
//        return;
    }
    else
    {
    
    NSDictionary *subMenuItem = [MenuArray objectAtIndex:indexPath.row];
    IdStg = [subMenuItem valueForKey:@"id"];
    LabelText = (UILabel *) [self.view viewWithTag:3000+ListSection];
    LabelText.text = [subMenuItem valueForKey:@"name"];
    
    }
    switch (ListSection) {
        case 1:
            CompanyId = IdStg;
//            CustomerId=IdStg;
            //CountryIndex=(int) indexPath.row;
            //LabelText = (UILabel *) [self.view viewWithTag:3000+ListSection+1];
           // LabelText.text = @"";
            //CustomerId = 0;
            break;
        case 2:
            ComponentId=IdStg;
            break;
        case 3:
//            ProductId=IdStg;
            ProductsId = IdStg;
            break;
        case 4:
            ColId=IdStg;
//            ColourId=IdStg;
            break;
        case 5:
            PacCountryId = IdStg;
//            ColId=IdStg;
            break;
        case 6:
//            ApplicatorId=IdStg;
            DesignerId = IdStg;
            break;
        case 7:
            ApplicatorId=IdStg;
            break;
        /*case 8:
            PmuCountryId=IdStg;
            break;
        case 9:
            ColId=IdStg;
        case 10:
            ApplicatorId=IdStg;*/
        default:
            break;
    }
    [_SearchTableView setHidden:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self IsIPad]) {
        return 70;
    }
    else
        return 45;
}

-(void)clearField:(id) sender
{
    UILabel *LabelText = (UILabel *) [self.view viewWithTag:3000+ListSection];
    LabelText.text = @"";
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return listArray.count+1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == listArray.count) {
        SearchButtonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchCellIdentifier" forIndexPath:indexPath];
        if (![self IsIPad])
            [cell.searchButton setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:10]];
        return cell;
    }
    else if (indexPath.row == 0)
    {
        SearchCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EntryCellIdentifier" forIndexPath:indexPath];
        if (![self IsIPad]) {
            [cell.KeywordText setFont:[UIFont fontWithName:@"FrutigerLTStd-Light" size:10]];
            [cell.TitleLabel setFont:[UIFont fontWithName:@"FrutigerLTStd-Light" size:9]];
        }
        [cell.KeywordText setHidden:NO];
        [cell.DisplayLabel setHidden:YES];
        [cell.arrowPng setHidden:YES];
        cell.KeywordText.tag = 4001;
        cell.KeywordText.delegate=self;
        _keyWordHolder = cell.KeywordText.text;
        cell.TitleLabel.text=[listArray objectAtIndex:indexPath.row];
        return cell;

    }
    else
    {
        SearchCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EntryCellIdentifier" forIndexPath:indexPath];
    
        if (![self IsIPad]) {
            [cell.DisplayLabel setFont:[UIFont fontWithName:@"FrutigerLTStd-Light" size:10]];
            [cell.TitleLabel setFont:[UIFont fontWithName:@"FrutigerLTStd-Light" size:9]];
        }
        cell.DisplayLabel.tag=3000+indexPath.row;
        cell.DisplayLabel.text=@"";
        [cell.KeywordText setHidden:YES];
        [cell.DisplayLabel setHidden:NO];
        [cell.arrowPng setHidden:NO];
        
        cell.TitleLabel.text=[listArray objectAtIndex:indexPath.row];
        return cell;
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width =  CGRectGetWidth(collectionView.frame)/2-10;
    CGFloat height = CGRectGetHeight(collectionView.frame)/4;
    return CGSizeMake(width, height);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   [_NoMatchLabel setHidden:YES];
    BOOL isTableView = YES;
    
    NSMutableArray *dataArray;
    NSMutableArray *iteratedDataArray = [[NSMutableArray alloc]init];
    
    if (![menuDict isKindOfClass:[NSDictionary class]])
    {
        _NoMatchLabel.text=@"No records found";
        [_NoMatchLabel setHidden:NO];
        return;
    }
    switch (indexPath.row) {
        case 0:
            isTableView=NO;
           break;
        case 1:
            dataArray = [menuDict valueForKey:@"company_details"];
            for (NSDictionary *dict in dataArray) {
                if(![[dict valueForKey:@"name"] isEqualToString:@"N/A"]) {
                    [iteratedDataArray addObject:dict];
                }
            }
            MenuArray = [[NSArray alloc]initWithArray: iteratedDataArray];
//            MenuArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"company_details"]];
             break;
        case 2:
        /*{
            if (CountryId) {
                NSArray *CountryArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"countrydetails"]];
                NSDictionary *Item = [CountryArray objectAtIndex:CountryIndex];
                MenuArray = [[NSArray alloc]initWithArray:[Item valueForKey:@"citydetails"]];
            }
            else
            {
                _NoMatchLabel.text=@"Please choose a country first";
                [_NoMatchLabel setHidden:NO];
                [_SearchTableView setHidden:YES];
                 isTableView = NO;
            }
        }*/
            dataArray = [menuDict valueForKey:@"component_details"];
            for (NSDictionary *dict in dataArray) {
                if(![[dict valueForKey:@"name"] isEqualToString:@"N/A"]) {
                    [iteratedDataArray addObject:dict];
                }
            }
            MenuArray = [[NSArray alloc]initWithArray: iteratedDataArray];
//            MenuArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"component_details"]];
            break;
        case 3:
            dataArray = [menuDict valueForKey:@"products_details"];
            for (NSDictionary *dict in dataArray) {
                if(![[dict valueForKey:@"name"] isEqualToString:@"N/A"]) {
                    [iteratedDataArray addObject:dict];
                }
            }
            MenuArray = [[NSArray alloc]initWithArray: iteratedDataArray];
//            MenuArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"products_details"]];

            break;
        case 4:
            dataArray = [menuDict valueForKey:@"collection_details"];
            for (NSDictionary *dict in dataArray) {
                if(![[dict valueForKey:@"name"] isEqualToString:@"N/A"]) {
                    [iteratedDataArray addObject:dict];
                }
            }
            MenuArray = [[NSArray alloc]initWithArray: iteratedDataArray];
            //            MenuArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"collection_details"]];

            break;
        case 5:
            dataArray = [menuDict valueForKey:@"pac_country"];
            for (NSDictionary *dict in dataArray) {
                if(![[dict valueForKey:@"name"] isEqualToString:@"N/A"]) {
                    [iteratedDataArray addObject:dict];
                }
            }
            MenuArray = [[NSArray alloc]initWithArray: iteratedDataArray];
//            MenuArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"pac_country"]];
            break;
        case 6:
            dataArray = [menuDict valueForKey:@"designer_details"];
            for (NSDictionary *dict in dataArray) {
                if(![[dict valueForKey:@"name"] isEqualToString:@"N/A"]) {
                    [iteratedDataArray addObject:dict];
                }
            }
            MenuArray = [[NSArray alloc]initWithArray: iteratedDataArray];
//              MenuArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"designer_details"]];
            break;
        case 7:
            dataArray = [menuDict valueForKey:@"applicator_details"];
            for (NSDictionary *dict in dataArray) {
                if(![[dict valueForKey:@"name"] isEqualToString:@"N/A"]) {
                    [iteratedDataArray addObject:dict];
                }
            }
            MenuArray = [[NSArray alloc]initWithArray: iteratedDataArray];
//             MenuArray = [[NSArray alloc]initWithArray:[menuDict valueForKey:@"applicator_details"]];
            break;
        default:
             isTableView = NO;
            break;
    }
    ListSection=(int) indexPath.row;
    [_SearchTableView reloadData];
    if (isTableView)
        [self animateTableView:_SearchTableView];
    
}
-(void) animateTableView :(UITableView *)tableview
{
    if ([tableview isHidden]) {
        [tableview setHidden:NO];
    CGSize sourceSize = self.view.bounds.size;
    CGSize popupSize = tableview.bounds.size;
    CGRect popupStartRect = CGRectMake(sourceSize.width,
                                       tableview.frame.origin.y,
                                       popupSize.width,
                                       popupSize.height);
    CGRect popupEndRect = tableview.frame;
    tableview.frame=popupStartRect;
    [UIView animateWithDuration:0.25 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        //[self.menuTableView viewWillAppear:NO];
        //    self.mj_popupBackgroundView.alpha = 1.0f;
        tableview.frame = popupEndRect;
    } completion:^(BOOL finished) {
        // [self.mj_popupViewController viewDidAppear:NO];
    }];
    }
}

-(void) animateView :(UIView *)view
{
    CGSize sourceSize = self.view.bounds.size;
    CGSize popupSize = view.bounds.size;
    CGRect popupStartRect = CGRectMake(sourceSize.width,
                                       view.frame.origin.y,
                                       popupSize.width,
                                       popupSize.height);
    CGRect popupEndRect = view.frame;
    view.frame=popupStartRect;
    [UIView animateWithDuration:0.4 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        //[self.menuTableView viewWillAppear:NO];
        //    self.mj_popupBackgroundView.alpha = 1.0f;
        view.frame = popupEndRect;
    } completion:^(BOOL finished) {
        // [self.mj_popupViewController viewDidAppear:NO];
    }];
}
- (IBAction)searchMenu:(id)sender {
    if (_menuPopped) {
        [self.view removeFromSuperview];
    }
}

- (IBAction)ProfileMenu:(id)sender {
    if (_menuPopped) {
        [self.view removeFromSuperview];
    }

}

- (IBAction)sideMenu:(id)sender {
    if (_menuPopped) {
        [self.view removeFromSuperview];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SearchAction:(id)sender {
    [_SearchTableView setHidden:YES];

    UITextField *keyword =nil;
    //keyword =cell.KeywordText.text;
    keyword = (UITextField*)[self.view viewWithTag:4001];
    
    ProjectManager *mngr = [[ProjectManager alloc]init];
    SearchParams *search = [[SearchParams alloc]init];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *usrID = [defaults valueForKey:@"USER_ID"];
    NSString *session = [defaults valueForKey:@"SESSION_ID"];
    search.sessionId = session;
    search.internalBaseClassIdentifier = usrID;

    //search.country=[CountryId doubleValue];
    //search.city=[CityId doubleValue];
    search.productsDetails=[ProductId doubleValue];
    search.collection=[ColId doubleValue];
    //search.building=[TypeId doubleValue];
    //search.architect=[ArchitecId doubleValue];
    search.items=[ItemId doubleValue];
    search.client=[CustomerId doubleValue];
    search.colour=[ColourId doubleValue];
    search.component=[ComponentId doubleValue];
    search.designer=[DesignerId doubleValue];
    search.pacCountry=[PacCountryId doubleValue];
    search.pmuCountry=[PmuCountryId doubleValue];
    search.applicator=[ApplicatorId doubleValue];
  ///
    search.company = [CompanyId doubleValue];
    search.products = [ProductsId doubleValue];

    
   
    NSNumber *offline = [defaults valueForKey:@"OFFLINE_STATUS"];
    NSNumber *data = [defaults valueForKey:@"GETDATA_STATUS"];
    Reachability *reach =[Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus status = [reach currentReachabilityStatus];
    if (status == NotReachable&&[offline boolValue]&&[data boolValue]) {
        
        
            DBManager *mngr=[[DBManager alloc]init];
        
            NSArray *projectArray=[mngr GetProjectsWithSearchParams:search andKeyword:keyword.text];
            if (projectArray.count>0) {
                HomeViewController *homeView =[self.storyboard instantiateViewControllerWithIdentifier:@"HomeView"];
                homeView.projectArray = projectArray;
                [self.navigationController pushViewController:homeView animated:NO];
            }
        else
        {
            _NoMatchLabel.text=@"No matches to that search criteria. Search again?";
            [_NoMatchLabel setHidden:NO];
        }
    }
    else
    {
        //SearchCollectionViewCell *cell = [[SearchCollectionViewCell alloc]init];
        NSMutableDictionary *ParamsDic=[[NSMutableDictionary alloc] initWithDictionary:[search dictionaryRepresentation]];
        //keyword = cell.KeywordText;
        if (keyword.text.length>0)
            [ParamsDic setObject:keyword.text forKey:@"keyword"];
        else
            [ParamsDic setObject:@"" forKey:@"keyword"];

    
    [SVProgressHUD showWithStatus:@"Loading..."];
    [mngr ListProjectWithSearchParams:ParamsDic andCompetionHandler:^(id object) {
        
        if ([object isKindOfClass:[Response class]]) {
            
            Response *response = (Response *)object;
            NSLog(@"Response error: %@", response.message);
            [SVProgressHUD showErrorWithStatus:@"Failed to load Items!"];
            _NoMatchLabel.text=@"No matches to that search criteria. Search again?";
            [_NoMatchLabel setHidden:NO];
        }
        else{
           
            Projects *projects = object;
            if (projects.data.count>0) {
                 HomeViewController *homeView =[self.storyboard instantiateViewControllerWithIdentifier:@"HomeView"];
                homeView.projectArray = projects.data;
                 [self.navigationController pushViewController:homeView animated:NO];
            }
            else
            {
                 _NoMatchLabel.text=@"No matches to that search criteria. Search again?";
                [_NoMatchLabel setHidden:NO];
            }
            
            [SVProgressHUD dismiss];
           

        }
    }];
    
    }
}
@end
