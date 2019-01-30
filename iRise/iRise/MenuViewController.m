//
//  MenuViewController.m
//  iRise
//
//  Created by Mobile Developer on 26/04/16.
//  Copyright © 2016 Febin. All rights reserved.
//

#import "MenuViewController.h"
#import "DataModels.h"
#import "HomeViewController.h"
#import "LoginViewController.h"
#import "NavigationController.h"
#import "LoginManager.h"
#import "ProjectManager.h"
#import "Menu.h"
#import "MenuManager.h"
#import "Response.h"
#import "SearchParams.h"
#import <MessageUI/MFMailComposeViewController.h>


typedef NS_ENUM(NSInteger, kSelectedMenu) {
    kProjectSelected,
    kCountrySelected,
    kBuildingTypeSelected,
    kObjectsCoatedSelected,
    kProductSelected,
    kArchitectSelected,
    kCollectionSelected,
    KColourName,
    kCollectionName,
    kPowderApplicationCountry,
    kPowderManufacturingUnit,
    kDesigner,
    kApplicator,
    kClientDetails,
    kcomponentDetails,
    kCompanyDetails,
    kProductsDetails,
};

@interface MenuViewController ()<UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate>
{
    Menu *menuData;
    NSDictionary *menuDict;
    kSelectedMenu selectedmenu;
    SearchParams *searchKey;
}

@end



@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    searchKey = [[SearchParams alloc]init];
    menuDict = [[NSUserDefaults standardUserDefaults] valueForKey:@"MENU"];
    
    if (![menuDict isKindOfClass:[NSDictionary class]]) {
        return;
    }
   
    if ([menuDict allKeys].count>0)
        [self animateTableView:_menuTableView];
    else
        [self getMenu];
    
}


-(void)ConfigureView{
    if (![self IsIPad]) {
        [self.TUserProfileLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self.TNameLabel setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightLight]];
        [self.UsernameLabel setFont:[UIFont systemFontOfSize:12]];
        [self.TCityLabel setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightLight]];
        [self.CityLabel setFont:[UIFont systemFontOfSize:12]];
        [self.TCountryLabel setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightLight]];
        [self.CountryLabel setFont:[UIFont systemFontOfSize:12]];
        [self.TEmailLabel setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightLight]];
        [self.EmailLabel setFont:[UIFont systemFontOfSize:12]];
        [self.TSettingsLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self.TDownloadLabel setFont:[UIFont systemFontOfSize:12]];
        [self.contactHeadinf setFont:[UIFont boldSystemFontOfSize:14]];
        [self.contactDetails setFont:[UIFont systemFontOfSize:12]];
        [self.contactEmail.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [self.ContactButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    }
}
-(void) getMenu
{
    [SVProgressHUD showWithStatus:@"Attaching menu..."];
    MenuManager *mngr = [[MenuManager alloc]init];
    NSDictionary *userDict = [[NSUserDefaults standardUserDefaults] valueForKey:@"USER"];
    User *user = [[User alloc]initWithDictionary:userDict];
    [mngr attachMenuDetailsWith:user CompletionHandler:^(id object) {
         [SVProgressHUD dismiss];
        if ([object isKindOfClass:[Response class]]) {
            NSLog(@"Error: ");
            
            [SVProgressHUD showErrorWithStatus:@"Failed to download menu"];
        }
        else{
            NSDictionary *menuDictionary = object;
            [[NSUserDefaults standardUserDefaults] setValue:menuDictionary forKey:@"MENU"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [SVProgressHUD showSuccessWithStatus:@"Menu attached successfully"];
            [self animateTableView:_menuTableView];
        }
    }];

}
-(void) animateTableView :(UITableView *)tableview
{
//    CGSize sourceSize = self.view.frame.size;
//    CGSize popupSize = tableview.bounds.size;
    CGRect popupStartRect;
    CGRect popupEndRect = tableview.frame;
    
    if (tableview.tag == 21) {
        popupStartRect = CGRectOffset(popupEndRect, CGRectGetMaxY(popupEndRect), popupEndRect.origin.y);
    }
    else if (tableview.tag == 22) {
        
        popupStartRect = _menuTableView.frame;
    }
    else {
        popupStartRect = _subMenuTableView.frame;
    }
    
        tableview.frame=popupStartRect;

        [UIView animateWithDuration:0.25 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
            //[self.menuTableView viewWillAppear:NO];
            //    self.mj_popupBackgroundView.alpha = 1.0f;
            tableview.frame = popupEndRect;
        } completion:^(BOOL finished) {
            // [self.mj_popupViewController viewDidAppear:NO];
            [tableview reloadData];
        }];

}



-(void) openViewAnimate :(UIView *)view
{
//        CGSize sourceSize = self.view.bounds.size;
            CGSize popupSize = view.bounds.size;
            CGRect popupStartRect = CGRectMake(_menuTableView.frame.origin.x,
                                               _menuTableView.frame.origin.y,
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

-(void) hideViewAnimate :(UIView *)view
{
    //        CGSize sourceSize = self.view.bounds.size;
    CGSize popupSize = view.bounds.size;
    CGRect popupEndRect = CGRectMake(_menuTableView.frame.origin.x,
                                       _menuTableView.frame.origin.y,
                                       popupSize.width,
                                       popupSize.height);
    CGRect popupStartRect = view.frame;
    
    [UIView animateWithDuration:0.4 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        //[self.menuTableView viewWillAppear:NO];
        //    self.mj_popupBackgroundView.alpha = 1.0f;
        view.frame = popupEndRect;
    } completion:^(BOOL finished) {
        view.frame=popupStartRect;
        view.hidden = YES;
    }];
}

//-(void) DismissAnimateTableview :(UITableView *)tableview
//{
//    CGSize sourceSize = self.view.bounds.size;
//    CGSize popupSize = tableview.bounds.size;
//    CGRect popupStartRect = tableview.frame;
//    
//    CGRect popupEndRect = CGRectMake(sourceSize.width,
//                                     tableview.frame.origin.y,
//                                     popupSize.width,
//                                     popupSize.height);
//    [UIView animateWithDuration:0.35 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
//        //[self.menuTableView viewWillAppear:NO];
//        //    self.mj_popupBackgroundView.alpha = 1.0f;
//        tableview.frame = popupEndRect;
//    } completion:^(BOOL finished) {
//        [tableview setHidden:YES];
//        tableview.frame = popupStartRect;
//    }];
//}

-(void)reloadTableViews
{
    [_menuTableView reloadData];
    [_subMenuTableView reloadData];
    [_subSubMenuTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource and UITableViewDelegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 21) {
        return _menu.count;
    }
    if (tableView.tag == 22) {
        
        return _subMenu.count;
    }
    if (tableView.tag == 23) {
        return _subSubMenu.count+1;
    }
    else{
        return 0;
    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if([view isKindOfClass:[UITableViewHeaderFooterView class]]){
        UITableViewHeaderFooterView *tableViewHeaderFooterView = (UITableViewHeaderFooterView *) view;
        tableViewHeaderFooterView.textLabel.text = [tableViewHeaderFooterView.textLabel.text capitalizedString];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MenuCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel *label = [cell viewWithTag:100];
    label.preferredMaxLayoutWidth = label.frame.size.width;
    [self viewDidLayoutSubviews];
    
    if (![self IsIPad]) {
        [label setFont:[UIFont systemFontOfSize:13]];
    }
    if (tableView.tag == 21) {
        label.text = [_menu objectAtIndex:indexPath.row];
        // change background color of selected cell
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView setBackgroundColor:[UIColor colorWithRed:65.0/255.0 green:65.0/255.0 blue:67.0/255.0 alpha:1]];
        [cell setSelectedBackgroundView:bgColorView];
        
    }
    else if (tableView.tag == 22){
     
        NSDictionary *subMenuItem = [_subMenu objectAtIndex:indexPath.row];
        
        NSString *subMenuValue = [subMenuItem valueForKey:@"name"];
        if (![subMenuValue isEqualToString:@"N/A"]) {
            label.text = subMenuValue;
        }
        else{
            label.text = nil;
        }
        // change background color of selected cell
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView setBackgroundColor:[UIColor colorWithRed:77.0/255.0 green:77.0/255.0 blue:77.0/255.0 alpha:1]];
        [cell setSelectedBackgroundView:bgColorView];
        
        
    }
    else if(tableView == _subSubMenuTableView)
    {
        if (indexPath.row == 0) {
            label.text = @"All";
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor darkGrayColor]];
            [cell setSelectedBackgroundView:bgColorView];
            
        }
        else{
            NSDictionary *subMenuItem = [_subSubMenu objectAtIndex:indexPath.row -1];
            NSString *subMenuValue = [subMenuItem valueForKey:@"name"];
            if (![subMenuValue isEqualToString:@"N/A"]) {
                label.text = subMenuValue;
            }
            else{
                label.text = nil;
            }
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor darkGrayColor]];
            [cell setSelectedBackgroundView:bgColorView];
        }
        
        
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    Calling delegate method
    //    [self.view removeFromSuperview ];
    if (_userMenuPopped) {
        
        if (_menuTableView.indexPathForSelectedRow.row==1)
        {
            [self userGuideClicked];
            return;
        }
        if (_menuTableView.indexPathForSelectedRow.row==2)
        {
            [self settingsClicked];
            return;
        }
        else if (_menuTableView.indexPathForSelectedRow.row==3)
        {
            [self contactUsclicked];
            return;
            
        }
        else if (_menuTableView.indexPathForSelectedRow.row==4)
        {
            
            [self logout];
        }
        else if (_menuTableView.indexPathForSelectedRow.row==0)
        {
            [self userInfoClicked];
            return;
        }
        else
        {
            [_SettingsView setHidden:YES];
            [_UserInfoView setHidden:YES];
            [_contactView setHidden:YES];
        }
    }
    if (tableView.tag == 21) {
        if (_menuDisplayed) {
            int row = (int)indexPath.row;
            if (![menuDict isKindOfClass:[NSDictionary class]]&&(row != 0)) {
                [SVProgressHUD showErrorWithStatus:@"No records found"];
                return;
            }
            switch (row) {
                case 0:
                    //                    Projects selected
                    [self displayProjects];
                    break;
                case 1:
                    
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu = kCompanyDetails;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"company_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 2:
                    //                country selected
//                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu = kClientDetails;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"client_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 3:
                    //                building type selected
//                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu = kcomponentDetails;
                    //_subMenu = [menuDict valueForKey:@"buildingtype"];
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"component_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 4:
                    //                Objects coated selected
//                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu=kProductSelected;
                   // _subMenu = [menuDict valueForKey:@"objects_coated"];
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"product_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }

                    [self reloadTbleView:_subMenuTableView];
                    break;
                    
                case 5:
                    //                Objects coated selected
                    //                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu=KColourName;
                    // _subMenu = [menuDict valueForKey:@"objects_coated"];
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"colour_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 6:
                    
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu = kProductsDetails;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"products_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                    
                case 7:
                    //                Product used selected
//                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu=kCollectionName;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"collection_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 8:
                    //                Architect
//                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu=kPowderApplicationCountry;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"pac_country"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 9:
                    // Collection
//                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu=kPowderManufacturingUnit;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"pmu_country"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 10:
                    // Collection
                    //                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu=kDesigner;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"designer_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;
                case 11:
                    // Collection
                    //                    _subMenuTableView.hidden = NO;
                    _subSubMenuTableView.hidden = YES;
                    selectedmenu=kApplicator;
                    _subMenu = [NSArray arrayWithArray:[self subMenuArray:[menuDict valueForKey:@"applicator_details"]]];
                    if ([_subMenu count] == 0){
                        [self displayProjects];
                    }
                    [self reloadTbleView:_subMenuTableView];
                    break;

                default:
                    break;
            }
            
        }
    }
    else if (tableView.tag == 22) {
        if (_menuDisplayed) {
            /*if (_menuTableView.indexPathForSelectedRow.row==1) {
//                _subSubMenuTableView.hidden = NO;
             
            NSDictionary *Item = [_subMenu objectAtIndex:indexPath.row];
                _subSubMenu = [Item valueForKey:@"citydetails"];
                searchKey.country = [[Item valueForKey:@"id"] doubleValue];
                [self reloadTbleView:_subSubMenuTableView];
            }
            else
            {*/
                NSDictionary *Item = [_subMenu objectAtIndex:indexPath.row];
                NSNumber *idNum = [Item valueForKey:@"id"];
            
                NSLog(@"%@", idNum);
                
                switch (selectedmenu) {
                    case kClientDetails:{
                        searchKey.client = [idNum doubleValue];
                    }
                        break;
                    case kCompanyDetails:{
                        searchKey.company = [idNum doubleValue];
                    }
                        break;
                    case kProductsDetails:{
                        searchKey.products= [idNum doubleValue];
                    }
                        break;
                    case kcomponentDetails:{
                        searchKey.component = [idNum doubleValue];
                    }
                        break;
                    case kProductSelected:{
                        searchKey.productsDetails = [idNum doubleValue];
                    }
                        break;
                    case KColourName:{
                        searchKey.colour = [idNum doubleValue];
                    }
                        break;
                    case kCollectionName:{
                        searchKey.collection = [idNum doubleValue];
                    }
                        break;
                    case kPowderApplicationCountry:{
                        searchKey.pacCountry= [idNum doubleValue];
                    }
                        break;
                    case kPowderManufacturingUnit:{
                        searchKey.pmuCountry= [idNum doubleValue];
                    }
                        break;
                    case kDesigner:{
                        searchKey.designer= [idNum doubleValue];
                    }
                        break;
                    case kApplicator:{
                        searchKey.applicator= [idNum doubleValue];
                    }
                        break;
                    default:
                        break;
                }
                [self displayProjects];
            }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(void)reloadTbleView:(UITableView*)tableview{

    double delayInSeconds = 0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [tableview reloadData];
        tableview.hidden = NO;
        [self animateTableView:tableview];
    });
}

-(void) userInfoClicked
{
    [self ConfigureView];
    if (!_UserInfoView.hidden) {
        [self hideViewAnimate:_UserInfoView];
        return;
    }
    
    [_UserInfoView setHidden:NO];
    [_SettingsView setHidden:YES];
    [_contactView setHidden:YES];
    DataModels *data =[[DataModels alloc]init];
    _menu = [data getUserMenu];
    User *usr=[data getProfile];
    self.UsernameLabel.text = [NSString stringWithFormat:@"%@ %@",usr.firstName,usr.lastName];
    self.CountryLabel.text=usr.countryId;
    self.CityLabel.text=usr.cityId;
    self.EmailLabel.text = usr.email;
    
    [self openViewAnimate:_UserInfoView];
}

-(void) contactUsclicked
{
    [self ConfigureView];
    if (!_contactView.hidden) {
        [self hideViewAnimate:_contactView];
        return;
    }
    [_UserInfoView setHidden:YES];
    [_SettingsView setHidden:YES];
    [_contactView setHidden:NO];
    DataModels *data =[[DataModels alloc]init];
    _menu = [data getUserMenu];
    User *usr=[data getProfile];
    self.UsernameLabel.text = [NSString stringWithFormat:@"%@ %@",usr.firstName,usr.lastName];
    self.CountryLabel.text=usr.countryId;
    self.CityLabel.text=usr.cityId;
    self.EmailLabel.text = usr.email;
    
    [self openViewAnimate:_contactView];
}

-(void) settingsClicked
{
    [self ConfigureView];
    if (!_SettingsView.hidden) {
        [self hideViewAnimate:_SettingsView];
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *offline = [defaults valueForKey:@"OFFLINE_STATUS"];
    [_SwitchButton setSelected:[offline boolValue]];
    [_UserInfoView setHidden:YES];
    [_SettingsView setHidden:NO];
    [_contactView setHidden:YES];
    [self openViewAnimate:_SettingsView];
    
}

- (void) userGuideClicked
{
    UIViewController *login= [self.storyboard instantiateViewControllerWithIdentifier:@"userGuide"];
    [self.navigationController pushViewController:login animated:YES];
}
-(void) logout
{
    UIViewController *login= [self.storyboard instantiateViewControllerWithIdentifier:@"LoginNav"];
    [[UIApplication sharedApplication] keyWindow].rootViewController = login;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSNumber numberWithBool:NO] forKey:@"LOGIN_STATUS"];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    NSString *usrID = [defaults valueForKey:@"USER_ID"];
    NSDictionary *userDictionary = [defaults valueForKey:@"USER"];
    User *user = [[User alloc]initWithDictionary:userDictionary];
    [tracker set:kGAIUserId
           value:usrID];
    
    // This hit will be sent with the User ID value and be visible in User-ID-enabled views (profiles).
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Log out"            // Event category (required)
                                                          action:@"iOS Log out"  // Event action (required)
                                                           label:[NSString stringWithFormat:@"%@ %@",user.firstName, user.lastName]             // Event label
                                                           value:nil] build]];    // Event value
    [defaults synchronize];
}

- (IBAction)ProfileMenu:(id)sender {
    
//    if (_userMenuPopped) {
        [self.view removeFromSuperview];
//    }
//    if (_mainMenuPooped) {
//        DataModels *data =[[DataModels alloc]init];
//        _menu = [data getUserMenu];
//        
//        self.menuDisplayed = NO;
//        self.subMenuTableView.hidden =YES;
//        self.subSubMenuTableView.hidden=YES;
//        self.sideMenuPopped = YES;
//        self.userMenuPopped = YES;
//        self.mainMenuPooped = NO;
//        [_menuTableView reloadData];
//    }
    
}

- (IBAction)searchMenu:(id)sender {
//    if (_mainMenuPooped||_userMenuPopped) {
        [self.view removeFromSuperview];
//    }
    //    UIStoryboard *storyboard = self.storyboard;
    //    SearchViewController *searchview = [storyboard instantiateViewControllerWithIdentifier:@"SearchView"];
    //
    //    searchview.menuPopped=YES;
    //    [self addChildViewController:searchview];
    //    [self.view addSubview:searchview.view];
    //    [searchview didMoveToParentViewController:self];
    
}

- (IBAction)sideMenu:(id)sender {
//    if (_mainMenuPooped) {
        [self.view removeFromSuperview];
//    }
//    if (_userMenuPopped) {
//        [_SettingsView setHidden:YES];
//        [_UserInfoView setHidden:YES];
//        DataModels *data =[[DataModels alloc]init];
//        _menu = [data getMainMenu];
//        self.menuDisplayed = YES;
//        self.subMenuTableView.hidden =YES;
//        self.sideMenuPopped = YES;
//        self.userMenuPopped = NO;
//        self.mainMenuPooped = YES;
//        [_menuTableView reloadData];
//    }
}

-(void)displayProjects
{
    HomeViewController *homeView =[self.storyboard instantiateViewControllerWithIdentifier:@"HomeView"];
    homeView.search  = searchKey;
    if (selectedmenu==kProjectSelected) {
        homeView.isProjects=YES;
    }
    [self.navigationController pushViewController:homeView animated:NO];
}

- (NSMutableArray *)subMenuArray:(NSArray *) recievedItem {
    
    NSMutableArray *subMenuItems = [[NSMutableArray alloc] init];
    for (NSDictionary *item in recievedItem) {
        if ([item isKindOfClass:[NSDictionary class]] && ![[item valueForKey:@"name"] isEqualToString:@"N/A"]){
            [subMenuItems addObject:item];
        }
    }
    return subMenuItems;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}


- (IBAction)SwitchAction:(id)sender {
    _SwitchButton.selected=!_SwitchButton.selected;
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSNumber numberWithBool:_SwitchButton.selected] forKey:@"OFFLINE_STATUS"];
    [defaults synchronize];
}
- (IBAction)ContactUsAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.jotun.com"]];
}

- (IBAction)emailAction:(id)sender {
    
    [self openMailComposer];
    
}

#pragma mark - open mail composer
-(void) openMailComposer
{
    // Email Subject
    NSString *emailTitle =@"";
    // Email Content
    NSString *messageBody = nil;
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"specificationspowder@jotun.com"];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    if (mc) {
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
    }
    
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            [SVProgressHUD showSuccessWithStatus:@"Discarded email"];
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            [SVProgressHUD showSuccessWithStatus:@"Saved email"];
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            [SVProgressHUD showSuccessWithStatus:@"sent email"];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            [SVProgressHUD showErrorWithStatus:@"Failed to send email"];
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
