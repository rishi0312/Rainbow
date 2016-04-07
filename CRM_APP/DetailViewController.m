
//
//  DetailViewController.m
//  test
//
//  Created by Gautam Panpatil on 07.03.13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "ActivityAdhCustomCell.h"
#import "ActivityDSMTableViewCell.h"
#import "ActivityDashboardCollectionViewCell.h"
#import "ActivityDashboardCollectionViewCell.h"
#import "ActivityDashboardDSMCollectionViewCell.h"
#import "Activity_List.h"
#import "AppDelegate.h"
#import "Constant.h"
#import "Constants.h"
#import "DSEWisePipeLine_Object.h"
#import "DSEwisePipeLineForDSECell.h"
#import "DSewisePipeLineDSM_ViewCell.h"
#import "DashBoard_DSEPLLViewCell.h"
#import "DetailViewController.h"
#import "EventActive_NEEV.h"
#import "EventExecutiveDashboard_NEEV.h"
#import "ExpandableCustomCell.h"
#import "GeoCoderObject.h"
#import "GetMMPipeLineView_DSE.h"
#import "GetSalesPipeLineDashboardAllPL_DSM.h"
#import "GetSalesPipeLineDashboardExecutive_NEEV.h"
#import "GetSalesPipeLineDashboardNEEVPL.h"
#import "GetSalesPipeLineDashboardNEEVPPL.h"
#import "GetSalesPipeLineDashboard_DSM.h"
#import "GetSalesPipeLineDashboard_NEEV.h"
#import "LeadGeneratorwisePipelineView.h"
#import "ListOfNSE.h"
#import "LoginViewController.h"
#import "MBProgressHUD.h"
#import "MMPipeLineView_DSM.h"
#import "PPL_DSEDashboardObject.h"
#import "PPl_DashobardTableViewCell.h"
#import "PipeLineDrilforPL.h"
#import "PipeLineTableViewCell.h"
#import "PipeLineTableViewCell.h"
#import "Reachability.h"
#import "RequestDelegate.h"
#import "SalesPipelineDashboardNSE_NEEV.h"
#import "SearchActivity_List.h"
#import "SingletonClass.h"
#import "TBXML.h"
#import "mmPipelineCustomCell.h"
#import <QuartzCore/QuartzCore.h>

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface DetailViewController () {
    Reachability* internetReachable;
    Reachability* hostReachable;
    NetworkStatus internetActive, hostActive;
    NSString *envelopeText, *str_NAME;
    UIAlertView* alert;
    NSString *values, *valuesDSMPPL, *valuesDSMPPLActive, *values1, *values_DSMSales, *userPrimaryPosition;
    ;
    NSString* str_CurrentDate,*str_Data;
    NSString *FromDate, *ToDate, *MonthDate, *ThirtyMonthDate, *FirstDayofCurrentMonth;
    int flagForDril;
    CLGeocoder* geocoder;
    CLPlacemark* placemark;
    int flag_Alert;
    UILabel *lbl1;
}
@end

@implementation DetailViewController {
    int selectedIndex1;
}
@synthesize percentageLabel = _percentageLabel;
@synthesize Opty_Arr;
@synthesize GetSalesPipelineDashboard_Arr, GetLeadGeneratorwisePipelineView_Arr, GetSalesPipeLineDashboard_DSM_Arr, GetSalesPipeLineDashboard_DSM60Days_Arr;
@synthesize GetLOB_Arr, GetPPL_LOB_Arr, EventExecutiveDashboard_NEEV_Arr, EventActive_NEEV_Arr, GetSalesPipeLineDashboardNEEVPPL_Arr, GetSalesPipeLineDashboardNEEVPL_Arr, GetSalesPipeLineDashboard_NEEV_Arr, GetSalesPipelineDashboardDSM_Arr, GetSalesPipeLineDashboard_DSMPLAll_Arr, GetMMPipeLineView_DSM_Arr, GetMMPipeLineView_DSE_Arr, GetMMPipeLineView_DSEApp_Arr;
@synthesize GetPL_LOBPPL_Arr, GetPL_PPLDSM_Arr, GetPL_LOBPPLSEC_Arr, GetMMPipeLineView_DSE_60DaysArr, GetMMPipeLineView_DSECurrentMonth_Arr, GetMMApplication_DSEApp_Arr, GetMMApplication_DSEApp60_Arr;
@synthesize masterPopoverController;
@synthesize GetSalesPipeLineDashboard_DSEPLAll_Arr, GetSalesPipeLineDashboard_DSEPLArr, GetSalesStagesForPL;
;
@synthesize GetMMApplication_DSEAppCurrent_Arr;
@synthesize segmentControl;
@synthesize FlagStatus;
@synthesize locationManager;
#pragma mark - Life Cycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    lbl1 = [[UILabel alloc] init];
    [lbl1 setHidden:YES];
    self.originalCenter = self.view.center;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nback.png"] forBarMetrics:UIBarMetricsDefault];
    NSLog(@"called Detailed ");
    self.splitViewController.delegate = self;
    [self.masterPopoverController setDelegate:self];
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //AppDelegate instance
    userDetailsVal_ = [UserDetails_Var sharedmanager]; //usedetails instance
    self.segmentControl.selectedSegmentIndex = 0;
    self.view_DSEActivity.hidden = NO;
    self.view_DSEPPL.hidden = YES;
    self.View_PipeLine.hidden = YES;
    self.segmentControlDate.hidden = YES;
    self.tbl_DSE.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tbl_PipeLine.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tbl_ActivityDSM.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tbl_ForPPL.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tbl_DSEwiseDSM.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    GetSalesPipeLineDashboard_DSM_Arr = [[NSMutableArray alloc] init];
    GetSalesPipeLineDashboard_DSM60Days_Arr = [[NSMutableArray alloc] init];
    Activities_ListDashBoard30DaysArr = [[NSMutableArray alloc] init];
    GetMMPipeLineView_DSE_60DaysArr = [[NSMutableArray alloc] init];
    GetSalesPipeLineDashboard_DSM_Arr = [[NSMutableArray alloc] init];
    GetMMPipeLineView_DSE_Arr = [[NSMutableArray alloc] init];
    GetMMPipeLineView_DSECurrentMonth_Arr = [[NSMutableArray alloc] init];
    GetMMApplication_DSEApp_Arr = [[NSMutableArray alloc] init];
    GetMMApplication_DSEApp60_Arr = [[NSMutableArray alloc] init];
    GetMMApplication_DSEApp_Arr = [[NSMutableArray alloc] init];
    GetMMApplication_DSEAppCurrent_Arr = [[NSMutableArray alloc] init];
    GetSalesStagesForPL = [[NSMutableArray alloc] init];
    GetSalesStagesFromPPLtoPL = [[NSMutableArray alloc] init];
    PipeLineDrilforPL_arr = [[NSMutableArray alloc] init];
    listOfNSE_list_Arr = [[NSMutableArray alloc] init];
    listOfNSE_list_Arr1 = [[NSMutableArray alloc] init];
    DSEWisePipeLine_Object_Arr = [[NSMutableArray alloc] init];
    DSEWisePipeLine_Object_Arr1 = [[NSMutableArray alloc] init];
    listOfNSE_list_Arr2 = [[NSMutableArray alloc] init];
    listOfNSE_list_Arr30Days = [[NSMutableArray alloc] init];
    Activities_ListDashBoardArr = [[NSMutableArray alloc] init];
    listOfNSE_list_Arr_EMP = [[NSMutableArray alloc] init];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dismissPop)
                                                 name:@"MASTERROWSELECTED"
                                               object:nil];

    [self.tbl_ForPPL setHidden:YES];
    [self.tbl_DSE setHidden:YES];
    [self.view_MyActivity setHidden:NO];
    [self.view_TeamActivity setHidden:YES];

    [SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr = [[NSMutableArray alloc] init];

    selectedIndex1 = -1;
    CGRect frame = segmentControl.frame;
    [segmentControl setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 60)];

    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:segmentControl
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:36];
    [segmentControl addConstraint:constraint];

    NSLayoutConstraint* constraintWidth = [NSLayoutConstraint constraintWithItem:segmentControl
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:400];
    [segmentControl addConstraint:constraintWidth];

    [self getCurrentDate];
    if (![self connected]) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            NSLog(@"Newtwork not Available...");
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"The Internet connection appears to be offline." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            NSLog(@"Newtwork not Available...");
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"The Internet connection appears to be offline." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            NSLog(@"Newtwork not Available...");
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"The Internet connection appears to be offline." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {
        geocoder = [[CLGeocoder alloc] init];
        if (locationManager == nil) {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            locationManager.delegate = self;
            [locationManager requestAlwaysAuthorization];
        }
        [locationManager startUpdatingLocation];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"dd-MMM-yyyy";
        str_CurrentDate = [formatter stringFromDate:[NSDate date]];
        NSLog(@"-- Current Date From System Date :%@", str_CurrentDate);
        str_CurrentDate = [str_CurrentDate uppercaseStringWithLocale:[NSLocale currentLocale]];
        NSLog(@"user Details :%@", appdelegate.loginUD);
        NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_TYPE);
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            NSLog(@"NDRM call");
        }
        // DSM
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {
            [self.tbl_ActivityDSM setHidden:YES];

            [self showAlert];

            // Call DSE's for DSM
            [self CallFetchDSEForDSM];

            // Call Todays Activity for DSM

            [self CallTodaysActivitiesForDashBoard:str_CurrentDate];

            // Call Team Activity For DSM

            [self CallTodaysActivitiesForDashBoard30Days:FromDate CurrentDateFro30:ThirtyMonthDate];

            // Call DSEWise Pipeline  Current Month

            [self CallDSEwisePipeLineCurrent];

            // Call DSEWise Pipeline  Live till date

            [self CallDSEwisePipeLine60Days];

            // Call PPLWise Pipeline  Current Month

            // [self GetSalesPipeLineDashboard_DSM];

            // Call PPLWise Pipeline  Live till date

            // [self GetSalesPipeLineDashboard_DSM60Days];

        } // DSE
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

            [self.view_DSE setHidden:NO];
            [self.view_DSM setHidden:YES];

            [self showAlert];

            //  --  Call Todays Activity Funtion :  -- //
            [self CallTodaysActivitiesForDashBoard:str_CurrentDate];

            //  --  Call Todays Activity Funtion for 30 Dys Count  :  -- //
            [self CallTodaysActivitiesForDashBoard30Days:FromDate CurrentDateFro30:ThirtyMonthDate];

            // -- Call PPL   ---//
            [self GetSalesPipeLineDashboard_DSM];

            // -- Call PPL  for 60 Days  ---//
            [self GetSalesPipeLineDashboard_DSM60Days];

            // --  Call MM Geo For DSE -- //  Current Month
            [self GetMMGeoDashboard_DSE];

            // --  Call MM Geo For DSE -- //  60 Days Before

            [self GetMMGeoDashboard_DSE60Days];

            // -- Call MM Application -- // Current Month
            [self GetMMPipeLineView_DSE];

            // -- Call MM Application -- // 60 Days Before
            [self GetMMPipeLineView_DSE60days];
        }
        else {
        }
    }
}
- (void)getCurrentDate
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MMM-yyyy";
    str_CurrentDate = [formatter stringFromDate:[NSDate date]];

    str_CurrentDate = [str_CurrentDate uppercaseStringWithLocale:[NSLocale currentLocale]];
    NSLog(@"Upper Case: %@", str_CurrentDate);

    // For Last 30 Days
    NSDateFormatter* dateformate = [[NSDateFormatter alloc] init];
    //[dateformate setDateFormat:@"dd-MMM-yy"];
    dateformate.dateFormat = @"dd-MMM-yyyy";
    FromDate = [dateformate stringFromDate:[NSDate date]];
    FromDate = [FromDate uppercaseStringWithLocale:[NSLocale currentLocale]];

    ToDate = FromDate;
    NSLog(@"Current Date : %@", FromDate);
    NSDate* now = [NSDate date];
    NSLog(@"Current Date : %@", now);

    NSDate* sevenDaysAgo = [now dateByAddingTimeInterval:-60 * 24 * 60 * 60];
    NSLog(@"60 days ago: %@", sevenDaysAgo);
    MonthDate = [dateformate stringFromDate:sevenDaysAgo];
    MonthDate = [MonthDate uppercaseStringWithLocale:[NSLocale currentLocale]];

    NSLog(@"Month Date : %@", MonthDate);

    NSDate* ThirtyDaysAgo = [now dateByAddingTimeInterval:-30 * 24 * 60 * 60];
    NSLog(@"30 days ago: %@", ThirtyDaysAgo);
    ThirtyMonthDate = [dateformate stringFromDate:ThirtyDaysAgo];
    ThirtyMonthDate = [ThirtyMonthDate uppercaseStringWithLocale:[NSLocale currentLocale]];

    NSLog(@"Month Date : %@", ThirtyMonthDate);

    NSDate* date = [NSDate date];
    NSCalendar* gregorian = [NSCalendar currentCalendar];
    NSDateComponents* dateComponents = [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:date];
    NSInteger day = [dateComponents day];
    NSInteger day1 = day - 1;

    NSLog(@"Day Fina %ld", (long)day);
    NSLog(@"Day Fina %ld", (long)day1);

    NSDate* FirstDay = [now dateByAddingTimeInterval:-day1 * 24 * 60 * 60];
    NSLog(@"30 days ago: %@", FirstDay);
    FirstDayofCurrentMonth = [dateformate stringFromDate:FirstDay];
    FirstDayofCurrentMonth = [FirstDayofCurrentMonth uppercaseStringWithLocale:[NSLocale currentLocale]];
    NSLog(@"Month Date : %@", FirstDayofCurrentMonth);

    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitWeekOfMonth;
    NSDateComponents* components = [calendar components:unitFlags fromDate:[NSDate date]];

    [components setDay:1];
    date = [calendar dateFromComponents:components];
    int m = components.month;
    int y = components.year;
    int d = components.day;

    NSLog(@"-- M   Y   D  :%d %d %d", m, y, d);

    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy MM dd"];
    NSDate* firstDateOfMonth = [df dateFromString:[NSString stringWithFormat:@"%d %d 01", y, m]];
    NSDate* firstDateOfYear = [df dateFromString:[NSString stringWithFormat:@"%d 01 01", y]];
    //[self getMonthofCurrentDate];
    NSLog(@"date %@", firstDateOfMonth); // date 2013-06-20

    NSLog(@"date %@", firstDateOfYear); // date 2013-06-20

    [self returnDate:[NSDate date]];
}
- (void)returnDate:(NSDate*)date
{
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitWeekOfMonth;
    NSDateComponents* comps = [calendar components:unitFlags fromDate:date];

    NSDate* firstDateOfMonth = [self returnDateForMonth:comps.month year:comps.year day:1];
    NSDate* lastDateOfMonth = [self returnDateForMonth:comps.month + 1 year:comps.year day:0];

    NSLog(@"date %@", date); // date 2013-06-20
    NSLog(@"First %@", firstDateOfMonth); // firstDateOfMonth 2013-06-01
    NSLog(@"Last %@", lastDateOfMonth); // lastDateOfMonth  2013-06-30
}
- (NSDate*)returnDateForMonth:(NSInteger)month year:(NSInteger)year day:(NSInteger)day
{

    NSDateComponents* components = [[NSDateComponents alloc] init];

    [components setDay:day];
    [components setMonth:month];
    [components setYear:year];

    NSCalendar* gregorian = [[NSCalendar alloc]
        initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian dateFromComponents:components];
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.Collection_DSM.collectionViewLayout invalidateLayout];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.splitViewController.delegate = self;
    if ((self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay)) {
        UIBarButtonItem* barButtonItem = self.splitViewController.displayModeButtonItem;
        barButtonItem.title = @"Show master";
        self.navigationItem.leftBarButtonItem = barButtonItem;
        [masterPopoverController dismissPopoverAnimated:YES];
        DetailViewController* detailViewManager = (DetailViewController*)self.splitViewController.delegate;
        [[detailViewManager masterPopoverController] dismissPopoverAnimated:YES];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipelineDashboard_Found:) name:@"SalesPipelineDashboard_Found" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LeadGeneratorwisePipelineView_Found:) name:@"LeadGeneratorwisePipelineView_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MMPipeLineView_DSM_Found:) name:@"MMPipeLineView_DSM_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipeLineDashboard_DSMConnection_Found:) name:@"SalesPipeLineDashboard_DSMConnection_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipeLineDashboard_DSE_Found:) name:@"SalesPipeLineDashboard_DSE_Found" object:nil];

    // NEEV

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipelineDashboard_NEEV_Found:) name:@"SalesPipelineDashboard_NEEV_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipelineDashboard_NEEVPPL_Found:) name:@"SalesPipelineDashboard_NEEVPPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipelineDashboard_NEEVPL_Found:) name:@"SalesPipelineDashboard_NEEVPL_Found" object:nil];

    //SalesPipelineDashboard_NEEVPPL_Found

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EventExecutiveDashboard_NEEV_Found:) name:@"EventExecutiveDashboard_NEEV_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EventActive_NEEV_Found:) name:@"EventActive_NEEV_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LobListFound:) name:@"LobListFound" object:nil]; //For LOB

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Activity_PPL_Found:) name:@"Activity_PPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PLUpdateOpty_Found:) name:@"PLUpdateOpty_Found" object:nil];

    // DSM

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ActivityPPLConnectionDSMPPL_Found:) name:@"ActivityPPLConnectionDSMPPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ActivityPLDSMConnection_Found:) name:@"ActivityPLDSMConnection_Found" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipelineDashboard_DSMPLAll_Found:) name:@"SalesPipelineDashboard_DSMPLAll_Found" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EventDashboard_DSM_Found:) name:@"EventDashboard_DSM_Found" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EventActiveDashboard_DSMM_Found:) name:@"EventActiveDashboard_DSMM_Found" object:nil];

    //DSE
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dsepipelinefound:) name:@"dsepipelinefound" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MMGeoDashboard_DSE_Found:) name:@"MMGeoDashboard_DSE_Found" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EventActiveDashboardDSM_DSM_FOund:) name:@"EventActiveDashboardDSM_DSM_FOund" object:nil];

    //EventActiveDashboardDSM_DSM_FOund

    //   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MMPipeLineView_DSE1_Found:) name:@"MMPipeLineView_DSE1_Found" object:nil];

    //SalesStageDSEDashboardPL_FOUND

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesStageDSEDashboardPL_FOUND:) name:@"SalesStageDSEDashboardPL_FOUND" object:nil];

    // New dashboard  //SearchActivities_DataFound
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchActivities_DataFound:) name:@"SearchActivities_DataFound" object:nil];

    // 60 Days //SalesPipeLineDashboard_DSM60DaysData_Found

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipeLineDashboard_DSM60DaysData_Found:) name:@"SalesPipeLineDashboard_DSM60DaysData_Found" object:nil];
    // 30 Days //

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchActivities_Data30dysFound:) name:@"SearchActivities_Data30dysFound" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MMGeoDashboard_DSE60Days_Found:) name:@"MMGeoDashboard_DSE60Days_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MMApplicationDashboard_DSE60Days_Found:) name:@"MMApplicationDashboard_DSE60Days_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MMApplicationDashboard_DSECurrent_Found:) name:@"MMApplicationDashboard_DSECurrent_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SalesPipeLineDashboard_CallPLDrilFromPPL_Found:) name:@"SalesPipeLineDashboard_CallPLDrilFromPPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ListOfNseOrDseForDSM_Found:) name:@"ListOfNseOrDseForDSM_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ListOfTeamActivityDSM_Found:) name:@"ListOfTeamActivityDSM_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DSEwisePipeLinecurrentMonth_Found:) name:@"DSEwisePipeLinecurrentMonth_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DSEwisePipeLine30Days_Found:) name:@"DSEwisePipeLine30Days_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ListOfTeamActivityDSM30Days_Found:) name:@"ListOfTeamActivityDSM30Days_Found" object:nil];

    // MM Geo 60 Days
    //ListOfTeamActivityDSM30Days_Found
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"EventActiveDashboardDSM_DSM_FOund" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipelineDashboard_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LeadGeneratorwisePipelineView_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MMPipeLineView_DSM_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipeLineDashboard_DSMConnection_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipeLineDashboard_DSE_Found" object:nil];

    //For NEEV

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipelineDashboard_NEEV_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipelineDashboard_NEEVPPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipelineDashboard_NEEVPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"EventExecutiveDashboard_NEEV_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"EventActive_NEEV_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LobListFound" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Activity_PPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PLUpdateOpty_Found" object:nil];

    // DSM

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ActivityPPLConnectionDSMPPL_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ActivityPLDSMConnection_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipelineDashboard_DSMPLAll_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"EventDashboard_DSM_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"EventActiveDashboard_DSMM_Found" object:nil];

    //DSe
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"dsepipelinefound" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MMGeoDashboard_DSE_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesStageDSEDashboardPL_FOUND" object:nil];

    // [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MMPipeLineView_DSE1_Found" object:nil];

    // New Dashboard //SalesPipeLineDashboard_DSMConnection_Found
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SearchActivities_DataFound" object:nil];

    // 60 Days Dashboard
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipeLineDashboard_DSM60DaysData_Found" object:nil];

    // 30 Days //SearchActivities_Data30dysFound

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SearchActivities_Data30dysFound" object:nil];

    //MMGeoDashboard_DSE60Days_Found

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MMGeoDashboard_DSE60Days_Found" object:nil];

    //MMApplicationDashboard_DSE60Days_Found

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MMApplicationDashboard_DSE60Days_Found" object:nil];

    //MMApplicationDashboard_DSECurrent_Found

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MMApplicationDashboard_DSECurrent_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SalesPipeLineDashboard_CallPLDrilFromPPL_Found" object:nil];

    //SalesPipeLineDashboard_CallPLDrilFromPPL_Found

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ListOfNseOrDseForDSM_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ListOfTeamActivityDSM_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DSEwisePipeLinecurrentMonth_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DSEwisePipeLine30Days_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ListOfTeamActivityDSM30Days_Found" object:nil];

    NSLog(@" Will DIsAppear");
    //DSEwisePipeLine30Days_Found
}

- (void)viewDidAppear:(BOOL)animated
{

    NSLog(@"did appear");

    [super viewDidAppear:animated];
    //self.splitViewController.delegate = self;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"Null");
    // self.splitViewController.delegate = self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        NSLog(@"-- Flag Values Before  :%d",flag_Alert);

        if(flag_Alert==100)
        {
            flag_Alert=101;
            NSLog(@"-- Flag Values After :%d",flag_Alert);
        }
    }
}
#pragma mark - CLLocationManager delegate methods

- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations
{

    CLLocation* newLocation = [locations lastObject];

    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray* placemarks, NSError* error) {

        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];

            geoCodiingObject = nil;
            geoCodiingObject = [[GeoCoderObject alloc] init];

            //lblLat.text = [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
            //lblLong.text = [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
            //            txtState.text = placemark.administrativeArea;
            //    lblAdd.text = placemark.country;
            
        

           /* NSString* str_Data = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                           placemark.subThoroughfare, placemark.thoroughfare,
                                           placemark.postalCode, placemark.locality,
                                           placemark.administrativeArea,
                                           placemark.country];*/
            
            str_Data = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                        placemark.subThoroughfare, placemark.thoroughfare,
                        placemark.postalCode, placemark.locality,
                        placemark.administrativeArea,
                        placemark.country];
            
            NSLog(@"--- PlaceMark :%@", placemark.name);
            NSLog(@"--- PlaceMark :%@", placemark.addressDictionary);
            NSLog(@"--- PlaceMark :%@", placemark.country);
            NSLog(@"--- PlaceMark :%@", placemark.ISOcountryCode);
            NSLog(@"--- PlaceMark :%@", placemark.postalCode);
            NSLog(@"--- PlaceMark :%@", placemark.administrativeArea);
            NSLog(@"--- PlaceMark :%@", placemark.subAdministrativeArea);
            NSLog(@"--- PlaceMark :%@", placemark.locality);
            NSLog(@"--- PlaceMark :%@", placemark.subLocality);
            NSLog(@"--- PlaceMark :%@", placemark.thoroughfare);
            NSLog(@"--- PlaceMark :%@", placemark.subThoroughfare);
            NSLog(@"--- PlaceMark :%@", placemark.ocean);
            NSLog(@"--- PlaceMark :%@", placemark.inlandWater);


            NSLog(@"-- Find Data :%@", placemark.addressDictionary[@"City"]);
            geoCodiingObject.Country = placemark.addressDictionary[@"Country"];
            geoCodiingObject.District = placemark.addressDictionary[@"SubAdministrativeArea"];
            geoCodiingObject.State = placemark.addressDictionary[@"State"];
            geoCodiingObject.Taluka = placemark.addressDictionary[@"City"];
            geoCodiingObject.Pincode = placemark.addressDictionary[@"ZIP"];
            geoCodiingObject.City = placemark.addressDictionary[@"City"];
            NSString *items1 = [[[[[placemark.addressDictionary[@"FormattedAddressLines"] objectAtIndex:0]stringByAppendingString:@" "]stringByAppendingString:[placemark.addressDictionary[@"FormattedAddressLines"] objectAtIndex:1]]stringByAppendingString:@" "]stringByAppendingString:@""];
            NSLog(@"-- Items :%@",items1);
            geoCodiingObject.Address=items1;
            [GeoCodingObjecT_Arr addObject:geoCodiingObject];
        }
        else {
            NSLog(@"%@", error.debugDescription);
        }
    }];

    // Turn off the location manager to save power.
    [manager stopUpdatingLocation];
}

#pragma mark -
#pragma mark - Call Todays Activities Methods DSE
- (void)CallTodaysActivitiesForDashBoard:(NSString*)currentDate
{
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_TYPE);
    NSLog(@"-- Current Date From changeed Function :%@", currentDate);
    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetActivityBasedOnSearchCriteria xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<activitytype></activitytype>"
                                     @"<activitystatus></activitystatus>"
                                     @"<assignedperson></assignedperson>"
                                     @"<tehsilname></tehsilname>"
                                     @"<pplname></pplname>"
                                     @"<tgmname></tgmname>"
                                     @"<tkmname></tkmname>"
                                     @"</GetActivityBasedOnSearchCriteria>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID, currentDate, currentDate];

        NSLog(@"\n envlopeString Search Activity....!!!!%@", envelopeText);
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

        NSLog(@"URL IS %@", theurl);

        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

        [[RequestDelegate alloc] initiateRequest:request name:@"SearchActivities_ConnectionDashboard"];
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

        NSLog(@"-- Current Date :%@", currentDate);

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetActivityBasedOnSearchCriteriaForDsm xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<activitytype></activitytype>"
                                     @"<activitystatus></activitystatus>"
                                     @"<assignedperson></assignedperson>"
                                     @"<tehsilname></tehsilname>"
                                     @"<pplname></pplname>"
                                     @"<dsepositionid></dsepositionid>"
                                     @"<UserId>'%@'</UserId>"
                                     @"<BUID>%@</BUID>"
                                     @"</GetActivityBasedOnSearchCriteriaForDsm>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 currentDate,currentDate, userDetailsVal_.Login_Name, userDetailsVal_.ORGID];

        /*
         <SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
         <SOAP:Body>
         <GetActivityBasedOnSearchCriteriaForDsm xmlns="com.cordys.tatamotors.Dsmsiebelwsapp" preserveSpace="no" qAccess="0" qValues="">
         <fromdate>01-FEB-2016</fromdate>
         <todate>03-march-2016</todate>
         <activitytype></activitytype>
         <activitystatus></activitystatus>
         <assignedperson></assignedperson>
         <tehsilname></tehsilname>
         <pplname></pplname>
         <dsepositionid></dsepositionid>
         <UserId>SAMSONJ1001680</UserId>
         <BUID> </BUID>
         </GetActivityBasedOnSearchCriteriaForDsm>
         </SOAP:Body>
         </SOAP:Envelope>
         
         @"<fromdate>01-FEB-2016</fromdate>"
         @"<todate>03-Mar-2016</todate>"
         */
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

        NSLog(@"-- Current Date From changeed Function :%@", str_CurrentDate);

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetActivityBasedOnSearchCriteriaForDsm xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<activitytype></activitytype>"
                                     @"<activitystatus></activitystatus>"
                                     @"<assignedperson></assignedperson>"
                                     @"<tehsilname></tehsilname>"
                                     @"<pplname></pplname>"
                                     @"<dsepositionid></dsepositionid>"
                                     @"<UserId>'%@'</UserId>"
                                     @"<BUID>%@</BUID>"
                                     @"</GetActivityBasedOnSearchCriteriaForDsm>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 str_CurrentDate, str_CurrentDate, userDetailsVal_.Login_Name, userDetailsVal_.ORGID];
    }

    NSLog(@"\n envlopeString Search Activity....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

    NSLog(@"URL IS %@", theurl);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"SearchActivities_ConnectionDashboard"];
}
#pragma mark -
#pragma mark - Call Todays Activities Found Methods
- (void)SearchActivities_DataFound:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n _ActivitySearch_Found response...Data %@ ", response);
    TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {

            if (Activities_ListDashBoardArr) {
                [Activities_ListDashBoardArr removeAllObjects];
            }
            TBXMLElement* soapBody = [TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement];
            TBXMLElement* container = [TBXML childElementNamed:@"GetActivityBasedOnSearchCriteriaResponse" parentElement:soapBody];
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self hideAlert];
                do {
                    activityDashobard = nil;
                    activityDashobard = [[Activity_List alloc] init];
                    /*
                     <old>
                     <S_OPTY_POSTN xmlns="com.cordys.tatamotors.Neevsiebelwsapp">
                     <OPTY_NAME>1-7CTRELI</OPTY_NAME>
                     <OPTY_ID>1-7CTRELI</OPTY_ID>
                     <PRODUCT_NAME>207 CC FBV</PRODUCT_NAME>
                     <PARENT_PRODUCT_NAME>Xenon Pickups</PARENT_PRODUCT_NAME>
                     <OPTY_CREATED>22-APR-2015</OPTY_CREATED>
                     <TGM_TKM_NAME null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
                     <TGM_TKM_PHONE_NUMBER null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
                     <ACCOUNT_TYPE>TKM</ACCOUNT_TYPE>
                     <ACCOUNT_ID null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
                     <SALES_STAGE_NAME>C0 (Prospecting)</SALES_STAGE_NAME>
                     <SALE_STAGE_UPDATED_DATE>21-MAY-2015</SALE_STAGE_UPDATED_DATE>
                     <LEAD_ASSIGNED_NAME>AJAY PARAB</LEAD_ASSIGNED_NAME>
                     <LEAD_ASSIGNED_CELL_NUMBER>9999999999</LEAD_ASSIGNED_CELL_NUMBER>
                     <LEAD_ASSIGNED_POSITION_NAME>TMCV-Sal-W-MUM-1001680-Jogeshwari-Pickup-DSE-33</LEAD_ASSIGNED_POSITION_NAME>
                     <LEAD_ASSIGNED_POSITION_ID>1-7F0Y20</LEAD_ASSIGNED_POSITION_ID>
                     <POSTN_TYPE_CD>DSE</POSTN_TYPE_CD>
                     <CONTACT_NAME>HEMANTHA AD ADLAP</CONTACT_NAME>
                     <CONTACT_ID>1-7CTRELB</CONTACT_ID>
                     <ADDRESS_ID>1-7CTRELG</ADDRESS_ID>
                     <CONTACT_ADDRESS>OPTY ROAD 2</CONTACT_ADDRESS>
                     <CONTACT_CELL_NUMBER>8787890236</CONTACT_CELL_NUMBER>
                     <ACTIVITY_PENDING_TYPE>Visit Customer</ACTIVITY_PENDING_TYPE>
                     <ACTIVITY_ID>1-7DL072L</ACTIVITY_ID>
                     <PLANNED_START_DATE>21-MAY-2015 08:28:15</PLANNED_START_DATE>
                     <ACTIVITY_DESCRIPTION>CHANGES UPDATE</ACTIVITY_DESCRIPTION>
                     <ACTIVITY_STATUS>Done</ACTIVITY_STATUS>
                     <X_TALUKA null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
                     <X_PROSPECT_SRC>TKM</X_PROSPECT_SRC>
                     <X_DISTRICT null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
                     <INFLUENCER>TKM</INFLUENCER>
                     </S_OPTY_POSTN>
                     </old>
                     */
                    TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY_POSTN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                    TBXMLElement* X_OPTY_NAME = [TBXML childElementNamed:@"OPTY_NAME" parentElement:table];
                    activityDashobard.OPPTY_NAME = [TBXML textForElement:X_OPTY_NAME];
                    NSLog(@"OptyNAmE : %@", activityDashobard.OPPTY_NAME);

                    TBXMLElement* X_OPTY_ID = [TBXML childElementNamed:@"OPTY_ID" parentElement:table];
                    activityDashobard.OPTY_ID = [TBXML textForElement:X_OPTY_ID];
                    NSLog(@"OptyID : %@", activityDashobard.OPTY_ID);

                    TBXMLElement* X_OPTY_CREATED = [TBXML childElementNamed:@"OPTY_CREATED" parentElement:table];
                    activityDashobard.OPTY_CREAT_DATE = [TBXML textForElement:X_OPTY_CREATED];

                    TBXMLElement* X_TGM_TKM_NAME = [TBXML childElementNamed:@"TGM_TKM_NAME" parentElement:table];
                    activityDashobard.TGM_TKM_NAME = [TBXML textForElement:X_TGM_TKM_NAME];

                    TBXMLElement* X_TGM_TKM_PHONE_NUMBER = [TBXML childElementNamed:@"TGM_TKM_PHONE_NUMBER" parentElement:table];
                    activityDashobard.TGM_TKM_PHONE_NUMBER = [TBXML textForElement:X_TGM_TKM_PHONE_NUMBER];

                    TBXMLElement* X_ACCOUNT_TYPE = [TBXML childElementNamed:@"ACCOUNT_TYPE" parentElement:table];
                    activityDashobard.ACCOUNT_TYPE = [TBXML textForElement:X_ACCOUNT_TYPE];

                    TBXMLElement* X_ACCOUNT_ID = [TBXML childElementNamed:@"ACCOUNT_ID" parentElement:table];
                    activityDashobard.ACCOUNT_ID = [TBXML textForElement:X_ACCOUNT_ID];

                    TBXMLElement* X_SALES_STAGE_NAME = [TBXML childElementNamed:@"SALES_STAGE_NAME" parentElement:table];
                    activityDashobard.SALES_STAGE_NAME = [TBXML textForElement:X_SALES_STAGE_NAME];

                    TBXMLElement* X_SALE_STAGE_UPDATED_DATE = [TBXML childElementNamed:@"SALE_STAGE_UPDATED_DATE" parentElement:table];
                    activityDashobard.SALES_STAGE_DATE = [TBXML textForElement:X_SALE_STAGE_UPDATED_DATE];

                    TBXMLElement* X_LEAD_ASSIGNED_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_NAME" parentElement:table];
                    activityDashobard.LEAD_ASSIGNED_NAME = [TBXML textForElement:X_LEAD_ASSIGNED_NAME];

                    TBXMLElement* X_LEAD_ASSIGNED_CELL_NUMBER = [TBXML childElementNamed:@"LEAD_ASSIGNED_CELL_NUMBER" parentElement:table];
                    activityDashobard.LEAD_ASSIGNED_CELL_NUMBER = [TBXML textForElement:X_LEAD_ASSIGNED_CELL_NUMBER];

                    TBXMLElement* X_LEAD_ASSIGNED_POSITION_ID = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_ID" parentElement:table];
                    activityDashobard.LEAD_ASSIGNED_POSITION_ID = [TBXML textForElement:X_LEAD_ASSIGNED_POSITION_ID];

                    TBXMLElement* X_CONTACT_NAME = [TBXML childElementNamed:@"CONTACT_NAME" parentElement:table];
                    activityDashobard.CONTACT_NAME = [TBXML textForElement:X_CONTACT_NAME];

                    TBXMLElement* X_CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:table];
                    activityDashobard.CONTACT_ID = [TBXML textForElement:X_CONTACT_ID];

                    TBXMLElement* X_ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:table];
                    activityDashobard.ADDRESS_ID = [TBXML textForElement:X_ADDRESS_ID];

                    TBXMLElement* X_CONTACT_ADDRESS = [TBXML childElementNamed:@"CONTACT_ADDRESS" parentElement:table];
                    activityDashobard.CONTACT_ADDRESS = [TBXML textForElement:X_CONTACT_ADDRESS];

                    TBXMLElement* X_CONTACT_CELL_NUMBER = [TBXML childElementNamed:@"CONTACT_CELL_NUMBER" parentElement:table];
                    activityDashobard.CONTACT_CELL_NUM = [TBXML textForElement:X_CONTACT_CELL_NUMBER];

                    TBXMLElement* X_ACTIVITY_PENDING_TYPE = [TBXML childElementNamed:@"ACTIVITY_PENDING_TYPE" parentElement:table];
                    activityDashobard.ACTIVITY_PENDING_TYPE = [TBXML textForElement:X_ACTIVITY_PENDING_TYPE];

                    TBXMLElement* X_ACTIVITY_ID = [TBXML childElementNamed:@"ACTIVITY_ID" parentElement:table];
                    activityDashobard.ACTIVITY_ROW_ID = [TBXML textForElement:X_ACTIVITY_ID];

                    TBXMLElement* X_PLANNED_START_DATE = [TBXML childElementNamed:@"PLANNED_START_DATE" parentElement:table];
                    activityDashobard.ACTIVITY_PLAN_START_DATE = [TBXML textForElement:X_PLANNED_START_DATE];

                    TBXMLElement* X_ACTIVITY_DESCRIPTION = [TBXML childElementNamed:@"ACTIVITY_DESCRIPTION" parentElement:table];
                    activityDashobard.DESCRIPTION = [TBXML textForElement:X_ACTIVITY_DESCRIPTION];

                    TBXMLElement* X_ACTIVITY_STATUS = [TBXML childElementNamed:@"ACTIVITY_STATUS" parentElement:table];
                    activityDashobard.ACTIVITY_STATUS = [TBXML textForElement:X_ACTIVITY_STATUS];

                    TBXMLElement* X_PRODUCT_NAME = [TBXML childElementNamed:@"PRODUCT_NAME" parentElement:table];
                    activityDashobard.PRODUCT_LINE = [TBXML textForElement:X_PRODUCT_NAME];
                    
                    if([activityDashobard.ACTIVITY_STATUS isEqual:@"Open"])
                    {
                            [Activities_ListDashBoardArr addObject:activityDashobard];
                    }else{
                        NSLog(@"Status is DONE so No need to Add");
                    }
                } while ((tuple = tuple->nextSibling));
                //[self._tableView reloadData];
                NSLog(@"Counter.. Search %lu", (unsigned long)[Activities_ListDashBoardArr count]);
                if (Activities_ListDashBoardArr >= 0) {
                    //  [self._tableView setHidden:NO];
                    [self.Collection_DSM reloadData];
                    [self hideAlert];
                }
                else {
                    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

                        alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                    else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {

                        alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                    else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {

                        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                }
            }
            else {
                [self hideAlert];
                if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {

                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No Activities Found in Search Criteria " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                  //  [alertView show];
                }
                else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]) {

                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No Activities Found in Search Criteria " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                  //  [alertView show];
                }
                else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {

                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found in Search Criteria " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //    [alertView show];
                }
            }
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

            if (Activities_ListDashBoardArr) {
                [Activities_ListDashBoardArr removeAllObjects];
            }
            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetActivityBasedOnSearchCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];

            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {

                NSLog(@"--- / DSM My Activities for Today ");

                int i = 0;

                do {

                    activityDashobard = nil;
                    activityDashobard = [[Activity_List alloc] init];

                    TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY_POSTN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                    TBXMLElement* OPTY_NAME = [TBXML childElementNamed:@"OPTY_NAME" parentElement:table];

                    activityDashobard.OPTY_NAME = [TBXML textForElement:OPTY_NAME];
                    //NSLog(@"X_PROSPECT_SRC : %@", activityDashobard.OPTY_NAME);

                    TBXMLElement* OPTY_ID = [TBXML childElementNamed:@"OPTY_ID" parentElement:table];
                    activityDashobard.OPTY_ID = [TBXML textForElement:OPTY_ID];

                    TBXMLElement* PRODUCT_NAME = [TBXML childElementNamed:@"PRODUCT_NAME" parentElement:table];
                    activityDashobard.PRODUCT_NAME = [TBXML textForElement:PRODUCT_NAME];

                    TBXMLElement* PARENT_PRODUCT_NAME = [TBXML childElementNamed:@"PARENT_PRODUCT_NAME" parentElement:table];
                    activityDashobard.PARENT_PRODUCT_NAME = [TBXML textForElement:PARENT_PRODUCT_NAME];

                    TBXMLElement* OPTY_CREATED = [TBXML childElementNamed:@"OPTY_CREATED" parentElement:table];
                    activityDashobard.OPTY_CREATED = [TBXML textForElement:OPTY_CREATED];

                    TBXMLElement* ACCOUNT_NAME = [TBXML childElementNamed:@"ACCOUNT_NAME" parentElement:table];
                    activityDashobard.ACCOUNT_NAME = [TBXML textForElement:ACCOUNT_NAME];

                    TBXMLElement* ACCOUNT_PHONE_NUMBER = [TBXML childElementNamed:@"ACCOUNT_PHONE_NUMBER" parentElement:table];
                    activityDashobard.ACCOUNT_PHONE_NUMBER = [TBXML textForElement:ACCOUNT_PHONE_NUMBER];

                    TBXMLElement* X_ACCOUNT_TYPE = [TBXML childElementNamed:@"ACCOUNT_TYPE" parentElement:table];
                    activityDashobard.ACCOUNT_TYPE = [TBXML textForElement:X_ACCOUNT_TYPE];

                    TBXMLElement* ACCOUNT_ID = [TBXML childElementNamed:@"ACCOUNT_ID" parentElement:table];
                    activityDashobard.ACCOUNT_ID = [TBXML textForElement:ACCOUNT_ID];

                    TBXMLElement* SALES_STAGE_NAME = [TBXML childElementNamed:@"SALES_STAGE_NAME" parentElement:table];
                    activityDashobard.SALES_STAGE_NAME = [TBXML textForElement:SALES_STAGE_NAME];

                    TBXMLElement* SALES_STAGE_DATE = [TBXML childElementNamed:@"SALE_STAGE_UPDATED_DATE" parentElement:table];
                    activityDashobard.SALES_STAGE_DATE = [TBXML textForElement:SALES_STAGE_DATE];

                    TBXMLElement* LEAD_ASSIGNED_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_NAME" parentElement:table];
                    activityDashobard.LEAD_ASSIGNED_NAME = [TBXML textForElement:LEAD_ASSIGNED_NAME];

                    TBXMLElement* LEAD_ASSIGNED_CELL_NUMBER = [TBXML childElementNamed:@"LEAD_ASSIGNED_CELL_NUMBER" parentElement:table];
                    activityDashobard.LEAD_ASSIGNED_CELL_NUMBER = [TBXML textForElement:LEAD_ASSIGNED_CELL_NUMBER];

                    TBXMLElement* LEAD_ASSIGNED_POSITION_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_NAME" parentElement:table];
                    activityDashobard.LEAD_ASSIGNED_POSITION_NAME = [TBXML textForElement:LEAD_ASSIGNED_POSITION_NAME];

                    TBXMLElement* LEAD_ASSIGNED_POSITION_ID = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_ID" parentElement:table];
                    activityDashobard.LEAD_ASSIGNED_POSITION_ID = [TBXML textForElement:LEAD_ASSIGNED_POSITION_ID];

                    TBXMLElement* POSTN_TYPE_CD = [TBXML childElementNamed:@"POSTN_TYPE_CD" parentElement:table];
                    activityDashobard.POSTN_TYPE_CD = [TBXML textForElement:POSTN_TYPE_CD];

                    TBXMLElement* CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:table];
                    activityDashobard.CONTACT_ID = [TBXML textForElement:CONTACT_ID];

                    TBXMLElement* CONTACT_NAME = [TBXML childElementNamed:@"CONTACT_NAME" parentElement:table];
                    activityDashobard.CONTACT_NAME = [TBXML textForElement:CONTACT_NAME];

                    TBXMLElement* CONTACT_CELL_NUM = [TBXML childElementNamed:@"CONTACT_CELL_NUMBER" parentElement:table];
                    activityDashobard.CONTACT_CELL_NUM = [TBXML textForElement:CONTACT_CELL_NUM];

                    TBXMLElement* CONTACT_ADDRESS = [TBXML childElementNamed:@"CONTACT_ADDRESS" parentElement:table];
                    activityDashobard.CONTACT_ADDRESS = [TBXML textForElement:CONTACT_ADDRESS];

                    TBXMLElement* ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:table];
                    activityDashobard.ADDRESS_ID = [TBXML textForElement:ADDRESS_ID];

                    TBXMLElement* ACTIVITY_PENDING_TYPE = [TBXML childElementNamed:@"ACTIVITY_PENDING_TYPE" parentElement:table];
                    activityDashobard.ACTIVITY_PENDING_TYPE = [TBXML textForElement:ACTIVITY_PENDING_TYPE];

                    TBXMLElement* ACTIVITY_ID = [TBXML childElementNamed:@"ACTIVITY_ID" parentElement:table];
                    activityDashobard.ACTIVITY_ID = [TBXML textForElement:ACTIVITY_ID];
                    NSLog(@"ACTIVITY_ID  : %@", activityDashobard.ACTIVITY_ID);

                    TBXMLElement* PLANNED_START_DATE = [TBXML childElementNamed:@"PLANNED_START_DATE" parentElement:table];
                    activityDashobard.PLANNED_START_DATE = [TBXML textForElement:PLANNED_START_DATE];

                    TBXMLElement* ACTIVITY_DESCRIPTION = [TBXML childElementNamed:@"ACTIVITY_DESCRIPTION" parentElement:table];
                    activityDashobard.ACTIVITY_DESCRIPTION = [TBXML textForElement:ACTIVITY_DESCRIPTION];

                    TBXMLElement* ACTIVITY_STATUS = [TBXML childElementNamed:@"ACTIVITY_STATUS" parentElement:table];
                    activityDashobard.ACTIVITY_STATUS = [TBXML textForElement:ACTIVITY_STATUS];

                    TBXMLElement* X_TALUKA = [TBXML childElementNamed:@"X_TALUKA" parentElement:table];
                    activityDashobard.X_TALUKA = [TBXML textForElement:X_TALUKA];

                    TBXMLElement* X_PROSPECT_SRC = [TBXML childElementNamed:@"X_PROSPECT_SRC" parentElement:table];
                    activityDashobard.X_PROSPECT_SRC = [TBXML textForElement:X_PROSPECT_SRC];

                    //RESULTCOUNT = activityDashobard.RESULT_COUNT;
                    i++;
                    if([activityDashobard.ACTIVITY_STATUS isEqual:@"Open"])
                    {
                        [Activities_ListDashBoardArr addObject:activityDashobard];
                    }else{
                        NSLog(@"Status is DONE so No need to Add");
                    }

                  //  [Activities_ListDashBoardArr addObject:activityDashobard];

                } while ((tuple = tuple->nextSibling));

                NSLog(@"-- Increment varible :%d", i);
                // [self._tableView reloadData];
                NSLog(@"Counter.. Search %lu", (unsigned long)[Activities_ListDashBoardArr count]);
                // NSLog(@"\n\nshow result...... resultcount....%@",RESULTCOUNT);
                NSLog(@"\n resultcount...... %u ", (unsigned)Activities_ListDashBoardArr.count);
                if (Activities_ListDashBoardArr >= 0) {
                    [self.Collection_DSM reloadData];
                    //[self.tbl_ActivityDSM setHidden:NO];
                    //[self.tbl_ActivityDSM reloadData];
                    [self hideAlert];
                }
            }
            else {
                NSLog(@"-- No Todays Activity on Dashboard ");
                
                
                [lbl1 setHidden:NO];
                lbl1.frame = CGRectMake(self.view_DSM.frame.size.width/2.5, self.view_DSM.frame.size.height/3, 300, 80);
                lbl1.font = [UIFont fontWithName:@"Apple Gothic" size:14.0];
                lbl1.backgroundColor=[UIColor clearColor];
                lbl1.textColor=[UIColor grayColor];
                lbl1.userInteractionEnabled=YES;
                [self.view_DSM addSubview:lbl1];
                
                [UIView beginAnimations:@"animateText" context:nil];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                [UIView setAnimationDuration:2.0f];
                [lbl1 setAlpha:0];
                lbl1.text= @"No Pending activities for Today ";
                [lbl1 setAlpha:1];
                [UIView commitAnimations];
                
                if(flag_Alert==101)
                {
                    [self hideAlert];
                }else{
                 //   UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No Pending activities for Today " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //    [alertView show];
                    [self hideAlert];
                    flag_Alert=100;
                }
                [self.Collection_DSM reloadData];
            }
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

            /*
             <SOAP:Body>
             <GetActivityBasedOnSearchCriteriaForDsmResponse xmlns="com.cordys.tatamotors.Dsmsiebelwsapp" preserveSpace="no" qAccess="0">
             <tuple>
             <old>
             <S_OPTY_POSTN>
             <OPTY_NAME>1-7GOXHPC</OPTY_NAME>
             <OPTY_ID>1-7GOXHPC</OPTY_ID>
             <PRODUCT_NAME>Ace HT_Old</PRODUCT_NAME>
             <PARENT_PRODUCT_NAME>Ace HT PPL</PARENT_PRODUCT_NAME>
             <OPTY_CREATED>03-NOV-2015</OPTY_CREATED>
             <ACCOUNT_NAME>TEST RR 15.11</ACCOUNT_NAME>
             <ACCOUNT_PHONE_NUMBER>8419980020</ACCOUNT_PHONE_NUMBER>
             <ACCOUNT_TYPE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
             <ACCOUNT_ID>1-7GOVZ9T</ACCOUNT_ID>
             <SALES_STAGE_NAME>Closed Lost at C2</SALES_STAGE_NAME>
             <SALE_STAGE_UPDATED_DATE>03-NOV-2015</SALE_STAGE_UPDATED_DATE>
             <LEAD_ASSIGNED_NAME>JIGNA JOSHI</LEAD_ASSIGNED_NAME>
             <LEAD_ASSIGNED_CELL_NUMBER>9999999999</LEAD_ASSIGNED_CELL_NUMBER>
             <LEAD_ASSIGNED_POSITION_NAME>TMCV-Sal-W-MUM-1001680-Nerul-LCV-DSE-21</LEAD_ASSIGNED_POSITION_NAME>
             <LEAD_ASSIGNED_POSITION_ID>1-1LQFGP</LEAD_ASSIGNED_POSITION_ID>
             <POSTN_TYPE_CD>DSE</POSTN_TYPE_CD>
             <CONTACT_NAME>SUSHANT YADAV</CONTACT_NAME>
             <CONTACT_ID>1-7GOVZ9N</CONTACT_ID>
             <ADDRESS_ID>1-7GOVZ9R</ADDRESS_ID>
             <CONTACT_ADDRESS>A-450,SIABABAA ASHIRWAD COMPLEX SEC- 1E</CONTACT_ADDRESS>
             <CONTACT_CELL_NUMBER>9892251446</CONTACT_CELL_NUMBER>
             <ACTIVITY_PENDING_TYPE>Papers Submitted</ACTIVITY_PENDING_TYPE>
             <ACTIVITY_ID>1-7GOXHQB</ACTIVITY_ID>
             <PLANNED_START_DATE>03-NOV-2015 17:31:07</PLANNED_START_DATE>
             <ACTIVITY_DESCRIPTION xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
             <ACTIVITY_STATUS>Done</ACTIVITY_STATUS>
             <X_TALUKA xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
             <X_PROSPECT_SRC xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
             <X_DISTRICT>HYDERABAD</X_DISTRICT>
             <INFLUENCER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
             </S_OPTY_POSTN>
             </old>
             </tuple>GetActivityBasedOnSearchCriteriaForDsmResponse
             */

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetActivityBasedOnSearchCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];

            if (container) {
                TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];

                if (Activities_ListDashBoardArr) {
                    [Activities_ListDashBoardArr removeAllObjects];
                }
                //   TBXMLElement *old =[TBXML childElementNamed:@"old" parentElement:tuple];
                //       TBXMLElement *TABLE =[TBXML childElementNamed:@"TABLE" parentElement:old];
                if (tuple) {
                    //        TBXMLElement *old =[TBXML childElementNamed:@"old" parentElement:tuple];
                    //        TBXMLElement *TABLE =[TBXML childElementNamed:@"TABLE" parentElement:old];
                    int i = 0;
                    do {

                        activityDashobard = nil;
                        activityDashobard = [[Activity_List alloc] init];

                        /*
                     <tuple>
                     <old>
                     <S_OPTY_POSTN>
                     <OPTY_NAME>1-7JDO0EG</OPTY_NAME>
                     <OPTY_ID>1-7JDO0EG</OPTY_ID>
                     <PRODUCT_NAME>Ace HT_Old</PRODUCT_NAME>
                     <PARENT_PRODUCT_NAME>Ace HT PPL</PARENT_PRODUCT_NAME>
                     <OPTY_CREATED>02-FEB-2016</OPTY_CREATED>
                     <ACCOUNT_NAME xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <ACCOUNT_PHONE_NUMBER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <ACCOUNT_TYPE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <ACCOUNT_ID xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <SALES_STAGE_NAME>C0 (Prospecting)</SALES_STAGE_NAME>
                     <SALE_STAGE_UPDATED_DATE>02-FEB-2016</SALE_STAGE_UPDATED_DATE>
                     <LEAD_ASSIGNED_NAME>JAYA KONAR</LEAD_ASSIGNED_NAME>
                     <LEAD_ASSIGNED_CELL_NUMBER>9999999999</LEAD_ASSIGNED_CELL_NUMBER>
                     <LEAD_ASSIGNED_POSITION_NAME>TMCV-Sal-W-MUM-1001680-Nerul-LCV-DSE-21</LEAD_ASSIGNED_POSITION_NAME>
                     <LEAD_ASSIGNED_POSITION_ID>1-1LQFGP</LEAD_ASSIGNED_POSITION_ID>
                     <POSTN_TYPE_CD>DSE</POSTN_TYPE_CD>
                     <CONTACT_NAME>VIJAY KULAKARNI</CONTACT_NAME>
                     <CONTACT_ID>1-7JDO0E9</CONTACT_ID>
                     <ADDRESS_ID>1-7JDO0EE</ADDRESS_ID>
                     <CONTACT_ADDRESS>AASDASDCZVDFVDFVD</CONTACT_ADDRESS>
                     <CONTACT_CELL_NUMBER>8787568547</CONTACT_CELL_NUMBER>
                     <ACTIVITY_PENDING_TYPE>Test Drive</ACTIVITY_PENDING_TYPE>
                     <ACTIVITY_ID>1-7JE1KFZ</ACTIVITY_ID>
                     <PLANNED_START_DATE>04-APR-2016 16:32:20</PLANNED_START_DATE>
                     <ACTIVITY_DESCRIPTION xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <ACTIVITY_STATUS>Open</ACTIVITY_STATUS>
                     <X_TALUKA xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <X_PROSPECT_SRC xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <X_DISTRICT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     <INFLUENCER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" null="true" xsi:nil="true" />
                     </S_OPTY_POSTN>
                     </old>
                     </tuple>
                     */

                        TBXMLElement* old = [TBXML childElementNamed:@"old" parentElement:tuple];
                        TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY_POSTN" parentElement:old];

                        // TBXMLElement *table  = [TBXML childElementNamed:@"S_OPTY_POSTN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                        TBXMLElement* OPTY_NAME = [TBXML childElementNamed:@"OPTY_NAME" parentElement:table];

                        activityDashobard.OPTY_NAME = [TBXML textForElement:OPTY_NAME];
                        //NSLog(@"X_PROSPECT_SRC : %@", activityDashobard.OPTY_NAME);

                        TBXMLElement* OPTY_ID = [TBXML childElementNamed:@"OPTY_ID" parentElement:table];
                        activityDashobard.OPTY_ID = [TBXML textForElement:OPTY_ID];

                        TBXMLElement* PRODUCT_NAME = [TBXML childElementNamed:@"PRODUCT_NAME" parentElement:table];
                        activityDashobard.PRODUCT_NAME = [TBXML textForElement:PRODUCT_NAME];

                        TBXMLElement* PARENT_PRODUCT_NAME = [TBXML childElementNamed:@"PARENT_PRODUCT_NAME" parentElement:table];
                        activityDashobard.PARENT_PRODUCT_NAME = [TBXML textForElement:PARENT_PRODUCT_NAME];

                        TBXMLElement* OPTY_CREATED = [TBXML childElementNamed:@"OPTY_CREATED" parentElement:table];
                        activityDashobard.OPTY_CREATED = [TBXML textForElement:OPTY_CREATED];

                        TBXMLElement* ACCOUNT_NAME = [TBXML childElementNamed:@"ACCOUNT_NAME" parentElement:table];
                        activityDashobard.ACCOUNT_NAME = [TBXML textForElement:ACCOUNT_NAME];

                        TBXMLElement* ACCOUNT_PHONE_NUMBER = [TBXML childElementNamed:@"ACCOUNT_PHONE_NUMBER" parentElement:table];
                        activityDashobard.ACCOUNT_PHONE_NUMBER = [TBXML textForElement:ACCOUNT_PHONE_NUMBER];

                        TBXMLElement* X_ACCOUNT_TYPE = [TBXML childElementNamed:@"ACCOUNT_TYPE" parentElement:table];
                        activityDashobard.ACCOUNT_TYPE = [TBXML textForElement:X_ACCOUNT_TYPE];

                        TBXMLElement* ACCOUNT_ID = [TBXML childElementNamed:@"ACCOUNT_ID" parentElement:table];
                        activityDashobard.ACCOUNT_ID = [TBXML textForElement:ACCOUNT_ID];

                        TBXMLElement* SALES_STAGE_NAME = [TBXML childElementNamed:@"SALES_STAGE_NAME" parentElement:table];
                        activityDashobard.SALES_STAGE_NAME = [TBXML textForElement:SALES_STAGE_NAME];

                        TBXMLElement* SALES_STAGE_DATE = [TBXML childElementNamed:@"SALE_STAGE_UPDATED_DATE" parentElement:table];
                        activityDashobard.SALES_STAGE_DATE = [TBXML textForElement:SALES_STAGE_DATE];

                        TBXMLElement* LEAD_ASSIGNED_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_NAME" parentElement:table];
                        activityDashobard.LEAD_ASSIGNED_NAME = [TBXML textForElement:LEAD_ASSIGNED_NAME];

                        TBXMLElement* LEAD_ASSIGNED_CELL_NUMBER = [TBXML childElementNamed:@"LEAD_ASSIGNED_CELL_NUMBER" parentElement:table];
                        activityDashobard.LEAD_ASSIGNED_CELL_NUMBER = [TBXML textForElement:LEAD_ASSIGNED_CELL_NUMBER];

                        TBXMLElement* LEAD_ASSIGNED_POSITION_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_NAME" parentElement:table];
                        activityDashobard.LEAD_ASSIGNED_POSITION_NAME = [TBXML textForElement:LEAD_ASSIGNED_POSITION_NAME];

                        TBXMLElement* LEAD_ASSIGNED_POSITION_ID = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_ID" parentElement:table];
                        activityDashobard.LEAD_ASSIGNED_POSITION_ID = [TBXML textForElement:LEAD_ASSIGNED_POSITION_ID];

                        TBXMLElement* POSTN_TYPE_CD = [TBXML childElementNamed:@"POSTN_TYPE_CD" parentElement:table];
                        activityDashobard.POSTN_TYPE_CD = [TBXML textForElement:POSTN_TYPE_CD];

                        TBXMLElement* CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:table];
                        activityDashobard.CONTACT_ID = [TBXML textForElement:CONTACT_ID];

                        TBXMLElement* CONTACT_NAME = [TBXML childElementNamed:@"CONTACT_NAME" parentElement:table];
                        activityDashobard.CONTACT_NAME = [TBXML textForElement:CONTACT_NAME];

                        TBXMLElement* CONTACT_CELL_NUM = [TBXML childElementNamed:@"CONTACT_CELL_NUMBER" parentElement:table];
                        activityDashobard.CONTACT_CELL_NUM = [TBXML textForElement:CONTACT_CELL_NUM];

                        TBXMLElement* CONTACT_ADDRESS = [TBXML childElementNamed:@"CONTACT_ADDRESS" parentElement:table];
                        activityDashobard.CONTACT_ADDRESS = [TBXML textForElement:CONTACT_ADDRESS];

                        TBXMLElement* ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:table];
                        activityDashobard.ADDRESS_ID = [TBXML textForElement:ADDRESS_ID];

                        TBXMLElement* ACTIVITY_PENDING_TYPE = [TBXML childElementNamed:@"ACTIVITY_PENDING_TYPE" parentElement:table];
                        activityDashobard.ACTIVITY_PENDING_TYPE = [TBXML textForElement:ACTIVITY_PENDING_TYPE];

                        TBXMLElement* ACTIVITY_ID = [TBXML childElementNamed:@"ACTIVITY_ID" parentElement:table];
                        activityDashobard.ACTIVITY_ID = [TBXML textForElement:ACTIVITY_ID];
                        NSLog(@"Activity ID %@", activityDashobard.ACTIVITY_ID);

                        TBXMLElement* PLANNED_START_DATE = [TBXML childElementNamed:@"PLANNED_START_DATE" parentElement:table];
                        activityDashobard.PLANNED_START_DATE = [TBXML textForElement:PLANNED_START_DATE];

                        TBXMLElement* ACTIVITY_DESCRIPTION = [TBXML childElementNamed:@"ACTIVITY_DESCRIPTION" parentElement:table];
                        activityDashobard.ACTIVITY_DESCRIPTION = [TBXML textForElement:ACTIVITY_DESCRIPTION];

                        TBXMLElement* ACTIVITY_STATUS = [TBXML childElementNamed:@"ACTIVITY_STATUS" parentElement:table];
                        activityDashobard.ACTIVITY_STATUS = [TBXML textForElement:ACTIVITY_STATUS];

                        TBXMLElement* X_TALUKA = [TBXML childElementNamed:@"X_TALUKA" parentElement:table];
                        activityDashobard.X_TALUKA = [TBXML textForElement:X_TALUKA];

                        TBXMLElement* X_PROSPECT_SRC = [TBXML childElementNamed:@"X_PROSPECT_SRC" parentElement:table];
                        activityDashobard.X_PROSPECT_SRC = [TBXML textForElement:X_PROSPECT_SRC];
                        i++;
                        //RESULTCOUNT = activity_list.RESULT_COUNT;
                        
                        if([activityDashobard.ACTIVITY_STATUS isEqual:@"Open"])
                        {
                            [Activities_ListDashBoardArr addObject:activityDashobard];
                        }else{
                            NSLog(@"Status is DONE so No need to Add");
                        }

                       // [Activities_ListDashBoardArr addObject:activityDashobard];
                    } while ((tuple = tuple->nextSibling));
                    NSLog(@"-- Increment varible :%d", i);

                    if ([Activities_ListDashBoardArr count] > 0) {
                        NSLog(@"--- Data Found --- %lu", (unsigned long)[Activities_ListDashBoardArr count]);
                        [self.collection_View setHidden:NO];
                        [self.collection_View reloadData];
                        [self hideAlert];
                    }
                    else {
                        
                       // UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Todays Activity Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        //[alertView show];
                        [self hideAlert];
                    }
                }
                else {
                    NSLog(@"-- No Todays Activity on Dashboard ");
                    [lbl1 setHidden:NO];
                    lbl1.frame = CGRectMake(self.view_DSE.frame.size.width/2.5, self.view_DSE.frame.size.height/3, 300, 80);
                    lbl1.font = [UIFont fontWithName:@"Apple Gothic" size:14.0];
                    lbl1.backgroundColor=[UIColor clearColor];
                    lbl1.textColor=[UIColor grayColor];
                    lbl1.userInteractionEnabled=YES;
                    [self.view_DSE addSubview:lbl1];
                    lbl1.text= @"No Pending activities for Today ";
                    
                    [UIView beginAnimations:@"animateText" context:nil];
                    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                    [UIView setAnimationDuration:2.0f];
                    [lbl1 setAlpha:0];
                    lbl1.text= @"No Pending activities for Today ";
                    [lbl1 setAlpha:1];
                    [UIView commitAnimations];

                //    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Todays Activity Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 //   [alertView show];
                    [self hideAlert];
                }
            }
            else {
                NSLog(@"-- No Todays Activity on Dashboard ");
                [lbl1 setHidden:NO];
                lbl1.frame = CGRectMake(self.view_DSE.frame.size.width/2.5, self.view_DSE.frame.size.height/3, 300, 80);
                lbl1.font = [UIFont fontWithName:@"Apple Gothic" size:14.0];
                lbl1.backgroundColor=[UIColor clearColor];
                lbl1.textColor=[UIColor grayColor];
                lbl1.userInteractionEnabled=YES;
                [self.view_DSE addSubview:lbl1];
                lbl1.text= @"No Pending activities for Today ";
                
                [UIView beginAnimations:@"animateText" context:nil];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                [UIView setAnimationDuration:2.0f];
                [lbl1 setAlpha:0];
                lbl1.text= @"No Pending activities for Today ";
                [lbl1 setAlpha:1];
                [UIView commitAnimations];
                [self hideAlert];
            }
            // [self CallSearch1];
        }
    }
} // CallTodaysActivitiesForDashBoard30Days
#pragma mark -
#pragma mark - DSE Names
- (void)CallFetchDSEForDSM
{
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_ID);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_NAME);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_TYPE);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSTN);

    NSString* envelopeText_NSE = [NSString stringWithFormat:
                                               @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                               @"<SOAP:Body>"
                                               @"<GetListOfNseOrDseForDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                               @"<positionid>'%@'</positionid>"
                                               @"</GetListOfNseOrDseForDSM>"
                                               @"</SOAP:Body>"
                                               @"</SOAP:Envelope>",
                                           userDetailsVal_.POSTN];

    NSLog(@"\n envlopeString Search Activity....GetListOfNseOrDseForDSM %@", envelopeText_NSE);
    NSData* envelope = [envelopeText_NSE dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText_NSE length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getListOfNseOrDseForDSM"];
} //ListOfNseOrDseForDSM_Found
- (void)ListOfNseOrDseForDSM_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n ListOfNseOrDseForDSM_Found Found %@ ", response);
    //Connection Timed Out
    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

            if (listOfNSE_list_Arr) {
                [listOfNSE_list_Arr removeAllObjects];
                [listOfNSE_list_Arr_EMP removeAllObjects];
                [listOfNSE_list_Arr1 removeAllObjects];
            }

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetListOfNseOrDseForDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {

                do {

                    listOfNSE_list = nil;
                    listOfNSE_list = [[ListOfNSE alloc] init];
                    /*
                 <old>
                 <S_PARTY>
                 <POSTION_ID>1-49N3Q</POSTION_ID>
                 <POSTION_NAME>TMCV-Sal-W-MUM-1001680-Thane-Pickup-DSE-15</POSTION_NAME>
                 <NSE_LOBDSE_NAME>NITIN CHAUDHARY</NSE_LOBDSE_NAME>
                 <POSITION_PH_NUM>9999999999</POSITION_PH_NUM>
                 <LOBNAME>Pickups</LOBNAME>
                 <POSITION_TYPE>DSE</POSITION_TYPE>
                 <PR_EMP_ID>1-49N40</PR_EMP_ID>
                 <USERID>CHAUDHARYN-EXP-06/11/2004</USERID>
                 </S_PARTY>
                 </old>
                 */
                    TBXMLElement* table = [TBXML childElementNamed:@"S_PARTY" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                    //listOfNSE_list
                    TBXMLElement* POSTION_ID = [TBXML childElementNamed:@"POSTION_ID" parentElement:table];
                    listOfNSE_list.POSTION_ID = [TBXML textForElement:POSTION_ID];

                    TBXMLElement* POSTION_NAME = [TBXML childElementNamed:@"POSTION_NAME" parentElement:table];
                    listOfNSE_list.POSTION_NAME = [TBXML textForElement:POSTION_NAME];

                    TBXMLElement* NSE_LOBDSE_NAME = [TBXML childElementNamed:@"NSE_LOBDSE_NAME" parentElement:table];
                    listOfNSE_list.NSE_LOBDSE_NAME = [TBXML textForElement:NSE_LOBDSE_NAME];

                    TBXMLElement* POSITION_PH_NUM = [TBXML childElementNamed:@"POSITION_PH_NUM" parentElement:table];
                    listOfNSE_list.POSITION_PH_NUM = [TBXML textForElement:POSITION_PH_NUM];

                    TBXMLElement* LOBNAME = [TBXML childElementNamed:@"LOBNAME" parentElement:table];
                    listOfNSE_list.LOBNAME = [TBXML textForElement:LOBNAME];

                    TBXMLElement* POSITION_TYPE = [TBXML childElementNamed:@"POSITION_TYPE" parentElement:table];
                    listOfNSE_list.POSITION_TYPE = [TBXML textForElement:POSITION_TYPE];

                    TBXMLElement* PR_EMP_ID = [TBXML childElementNamed:@"PR_EMP_ID" parentElement:table];
                    listOfNSE_list.PR_EMP_ID = [TBXML textForElement:PR_EMP_ID];

                    TBXMLElement* USERID = [TBXML childElementNamed:@"USERID" parentElement:table];
                    listOfNSE_list.USERID = [TBXML textForElement:USERID];

                    NSLog(@"--- / DSM My Activities for Today %@ ", listOfNSE_list.NSE_LOBDSE_NAME);

                    if ([listOfNSE_list.NSE_LOBDSE_NAME isEqual:@""]) {
                        NSLog(@"-- Object Null NOw");
                    }
                    else {

                        [listOfNSE_list_Arr_EMP addObject:listOfNSE_list.PR_EMP_ID];

                        [listOfNSE_list_Arr1 addObject:listOfNSE_list.NSE_LOBDSE_NAME];

                        [listOfNSE_list_Arr addObject:listOfNSE_list];
                    }

                } while ((tuple = tuple->nextSibling));
                if ([listOfNSE_list_Arr count] > 0) {
                    NSLog(@"--- DSE::: : %@", listOfNSE_list_Arr);
                    NSLog(@"--- DSE Count  List :%lu", (unsigned long)[listOfNSE_list_Arr count]);
                    NSLog(@"--- DSE listOfNSE_list_Arr_EMP :%lu", (unsigned long)[listOfNSE_list_Arr_EMP count]);

                    //[self.tbl_ActivityDSM reloadData];
                    // Call Team Activity
                    [self CallTeamActivityDSM];
                    // [self CallTeamActivityDSM30Days];
                    [self GetSalesPipeLineDashboard_DSM];
                    [self GetSalesPipeLineDashboard_DSM60Days];
                }
            }
        }
        else {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            [self hideAlert];
        }
    }
}
#pragma mark -
#pragma mark - CallTeamActivityDSM
- (void)CallTeamActivityDSM
{
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_ID);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_NAME);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_TYPE);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSTN);
    NSString* finalString;
    finalString = @"";

    values = @"";
    for (int i = 0; i < listOfNSE_list_Arr1.count; i++) {

        NSLog(@"Valu3w %d", i);
         values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[listOfNSE_list_Arr1 objectAtIndex:i]];
          values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@","];
    }
    NSLog(@"Valu3w %@", values);
    NSLog(@"Valu3w %@", finalString);

    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set %@", values);
    //values= [values  stringByReplacingOccurrencesOfString:@",,," withString:@","];
    //NSLog(@"Valu3w Set %@", values);
    NSLog(@"-- Str Current date :%@", str_CurrentDate);

    //JIGNA JOSHI','SUHAS PATHAK','KRISHNA YADAV
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetDseWisePendingActforDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<FromDate>%@</FromDate>"
                                 @"<ToDate>%@</ToDate>"
                                 @"<AssignName>%@</AssignName>"
                                 @"<Buid>%@</Buid>"
                                 @"</GetDseWisePendingActforDSM>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>",
                             str_CurrentDate, str_CurrentDate, values, userDetailsVal_.ORGID];

    NSLog(@"\n envlopeString Search Activity....GetDseWisePendingActforDSM %@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getListOfTeamActivityDSM"];
} //ListOfTeamActivityDSM_Found
- (void)ListOfTeamActivityDSM_Found:(NSNotification*)notification
{
    NSString* finalString;
    NSMutableArray* str_Arr;
    str_Arr = [[NSMutableArray alloc] init];
    finalString = @"";
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n ListOfTeamActivityDSM_Found Found %@ ", response);

    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request Timed Out.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    } //SOAP:Fault
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something Went Wrong , Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

            if (listOfNSE_list_Arr2) {
                [listOfNSE_list_Arr2 removeAllObjects];
            }

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetDseWisePendingActforDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
           
            if (tuple) {
         

                 do {

                    listOfNSE_list = nil;
                    listOfNSE_list = [[ListOfNSE alloc] init];
                    /*
                     
                     <'DAYASHANKAR_x0020_DUBEY'>0</'DAYASHANKAR_x0020_DUBEY'>
                     
                     
                     <tuple xmlns="com.cordys.tatamotors.Dsmsiebelwsapp">
                     <old>
                     <S_OPTY xmlns="com.cordys.tatamotors.Dsmsiebelwsapp">
                     <'MITHUN_x0020_SARDAL'>0</'MITHUN_x0020_SARDAL'>
                     <'NITIN_x0020_CHAUDHARY'>0</'NITIN_x0020_CHAUDHARY'>
                     <'NIRANJAN_x0020_NAIK'>0</'NIRANJAN_x0020_NAIK'>
                     <'JITENDRA_x0020_AHIRRAO'>0</'JITENDRA_x0020_AHIRRAO'>
                     <'JIGNA_x0020_JOSHI'>0</'JIGNA_x0020_JOSHI'>
                     <'KARIM_x0020_SHAIKH'>0</'KARIM_x0020_SHAIKH'>
                     <'VISHNU_x0020_TIWARI'>0</'VISHNU_x0020_TIWARI'>
                     <'HARISH_x0020_BHANDRI'>0</'HARISH_x0020_BHANDRI'>
                     <'DAYASHANKAR_x0020_DUBEY'>0</'DAYASHANKAR_x0020_DUBEY'>
                     </S_OPTY>
                     </old>
                     </tuple>                     */

                    TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                    NSString *sr_Pass, *newOutput, *str_State;
                    for (int j = 0; j < [listOfNSE_list_Arr count]; j++) {
                        NSString* str_A;

                        listOfNSE_list = [listOfNSE_list_Arr objectAtIndex:j];
                        NSLog(@"-- DSE name From Array :%@", listOfNSE_list.NSE_LOBDSE_NAME);
                        str_A = [@"A" stringByAppendingString:listOfNSE_list.NSE_LOBDSE_NAME];
                        NSString* w = [str_A stringByReplacingOccurrencesOfString:@" " withString:@"_"];

                        NSLog(@"Postion :%@", w);

                        TBXMLElement* POSTION_ID = [TBXML childElementNamed:[NSString stringWithFormat:@"%@", w] parentElement:table];
                        listOfNSE_list.USERIDM = [TBXML textForElement:POSTION_ID];
                        NSLog(@"Postion For 30 Days :%@", listOfNSE_list.USERIDM);
                        [listOfNSE_list_Arr2 addObject:listOfNSE_list];
                    }

                    if ([listOfNSE_list_Arr2 count] > 0) {
                        [self hideAlert];
                        NSLog(@"--- DSE : %@", listOfNSE_list_Arr2);
                        NSLog(@"--- DSE Count :%lu", (unsigned long)[listOfNSE_list_Arr2 count]);
                        [self.tbl_ActivityDSM reloadData];
                    }
                }while ((tuple = tuple->nextSibling));
            }
        }
        else {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            [self hideAlert];
        }
    }
} //CallTeamActivityDSM30Days
- (void)CallTeamActivityDSM30Days
{
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_ID);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_NAME);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSITION_TYPE);
    NSLog(@"-- Position Type :%@", userDetailsVal_.POSTN);
    NSString* finalString;
    finalString = @"";

    values = @"";
    for (int i = 0; i < listOfNSE_list_Arr1.count; i++) {

        NSLog(@"Valu3w %d", i);
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[listOfNSE_list_Arr1 objectAtIndex:i]];
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@","];
    }
    NSLog(@"Valu3w %@", values);
    NSLog(@"Valu3w %@", finalString);

    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set CallTeamActivityDSM30Days %@", values);

    //JIGNA JOSHI','SUHAS PATHAK','KRISHNA YADAV
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetDseWisePendingActforDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<FromDate>%@</FromDate>"
                                 @"<ToDate>%@</ToDate>"
                                 @"<AssignName>%@</AssignName>"
                                 @"</GetDseWisePendingActforDSM>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>",
                             ThirtyMonthDate, str_CurrentDate, values];

    NSLog(@"\n envlopeString Search Activity....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

    NSLog(@"URL IS %@", theurl);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getListOfTeamActivityDSM30Days"];
} //ListOfTeamActivityDSM_Found
- (void)ListOfTeamActivityDSM30Days_Found:(NSNotification*)notification
{

    NSString* finalString;
    NSMutableArray* str_Arr;
    str_Arr = [[NSMutableArray alloc] init];
    finalString = @"";
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n ListOfTeamActivityDSM30Days_Found Found %@ ", response);

    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request Timed Out.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetDseWisePendingActforDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            do {
                if (tuple) {

                    listOfNSE_list30Days = nil;
                    listOfNSE_list30Days = [[ListOfNSE alloc] init];
                    /*
                     
                     <'DAYASHANKAR_x0020_DUBEY'>0</'DAYASHANKAR_x0020_DUBEY'>
                     
                     
                     <tuple xmlns="com.cordys.tatamotors.Dsmsiebelwsapp">
                     <old>
                     <S_OPTY xmlns="com.cordys.tatamotors.Dsmsiebelwsapp">
                     <'MITHUN_x0020_SARDAL'>0</'MITHUN_x0020_SARDAL'>
                     <'NITIN_x0020_CHAUDHARY'>0</'NITIN_x0020_CHAUDHARY'>
                     <'NIRANJAN_x0020_NAIK'>0</'NIRANJAN_x0020_NAIK'>
                     <'JITENDRA_x0020_AHIRRAO'>0</'JITENDRA_x0020_AHIRRAO'>
                     <'JIGNA_x0020_JOSHI'>0</'JIGNA_x0020_JOSHI'>
                     <'KARIM_x0020_SHAIKH'>0</'KARIM_x0020_SHAIKH'>
                     <'VISHNU_x0020_TIWARI'>0</'VISHNU_x0020_TIWARI'>
                     <'HARISH_x0020_BHANDRI'>0</'HARISH_x0020_BHANDRI'>
                     <'DAYASHANKAR_x0020_DUBEY'>0</'DAYASHANKAR_x0020_DUBEY'>
                     </S_OPTY>
                     </old>
                     </tuple>                     */

                    TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                    NSString *sr_Pass, *newOutput, *str_State;
                    for (int j = 0; j < [listOfNSE_list_Arr count]; j++) {
                        NSString* str_A;

                        listOfNSE_list30Days = [listOfNSE_list_Arr objectAtIndex:j];
                        NSLog(@"-- DSE name From Array :%@", listOfNSE_list30Days.NSE_LOBDSE_NAME);
                        str_A = [@"A" stringByAppendingString:listOfNSE_list30Days.NSE_LOBDSE_NAME];
                        NSString* w = [str_A stringByReplacingOccurrencesOfString:@" " withString:@"_"];

                        NSLog(@"Postion :%@", w);

                        TBXMLElement* POSTION_ID = [TBXML childElementNamed:[NSString stringWithFormat:@"%@", w] parentElement:table];
                        listOfNSE_list30Days.USERIDM = [TBXML textForElement:POSTION_ID];
                        NSLog(@"Postion :%@", listOfNSE_list30Days.USERIDM);
                        [listOfNSE_list_Arr30Days addObject:listOfNSE_list30Days];
                    }

                    if ([listOfNSE_list_Arr30Days count] > 0) {
                        NSLog(@"--- DSE : %@", listOfNSE_list_Arr30Days);
                        NSLog(@"--- DSE Count :%lu", (unsigned long)[listOfNSE_list_Arr30Days count]);
                        [self.tbl_ActivityDSM reloadData];
                    }
                }
            } while ((tuple = tuple->nextSibling));
        }
        else {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            [self hideAlert];
        }
    }
}
#pragma mark -
#pragma mark - Call Last 30 Days Activities Methods DSE
- (void)CallTodaysActivitiesForDashBoard30Days:(NSString*)FromDateFor30 CurrentDateFro30:(NSString*)currentDayeFor30
{
    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetActivityBasedOnSearchCriteria xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<activitytype></activitytype>"
                                     @"<activitystatus></activitystatus>"
                                     @"<assignedperson></assignedperson>"
                                     @"<tehsilname></tehsilname>"
                                     @"<pplname></pplname>"
                                     @"<tgmname></tgmname>"
                                     @"<tkmname></tkmname>"
                                     @"</GetActivityBasedOnSearchCriteria>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID, FromDateFor30, currentDayeFor30];

        NSLog(@"\n envlopeString Search Activity....GetActivityBasedOnSearchCriteria 30 days %@", envelopeText);
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

        NSLog(@"URL IS %@", theurl);

        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

        [[RequestDelegate alloc] initiateRequest:request name:@"SearchActivities_ConnectionDashboard"];
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

        /*           @"<FromDate>01-JAN-2016</FromDate>"
         @"<ToDate>28-MAR-2016</ToDate>"
         
         @"<FromDate>01-FEB-2016</FromDate>"
         @"<ToDate>28-MAR-2016</ToDate>"
         8*/

        NSLog(@"-- current Date :%@", str_CurrentDate);
        NSLog(@"-- Current Month Fist Day Date :%@", FirstDayofCurrentMonth);
        NSLog(@"-- Last 30 Days from Current day :%@", ThirtyMonthDate);
        NSLog(@"-- Last 60 Days From Current Day :%@", MonthDate);

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMissedActivity_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<Login>'%@'</Login>"
                                     @"<FromDate>%@</FromDate>"
                                     @"<ToDate>%@</ToDate>"
                                     @"<Buid>%@</Buid>"
                                     @"</GetMissedActivity_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.Login_Name, ThirtyMonthDate, str_CurrentDate, userDetailsVal_.ORGID];

        NSLog(@"\n envlopeString Of user details GetMissedActivity_DSE....!!!!%@", envelopeText);
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"SearchActivities_ConnectionDashboard30days"];
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

        /*
         @"<FromDate>01-FEB-2016</FromDate>"
         @"<ToDate>28-MAR-2016</ToDate>"
         */

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMissedActivity_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<Login>'%@'</Login>"
                                     @"<FromDate>%@</FromDate>"
                                     @"<ToDate>%@</ToDate>"
                                     @"<Buid>%@</Buid>"
                                     @"</GetMissedActivity_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.Login_Name, MonthDate, str_CurrentDate, userDetailsVal_.ORGID];

        NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"SearchActivities_ConnectionDashboard30days"];
    }
} //SearchActivities_Data30dysFound
#pragma mark -
#pragma mark - Call LAst 30  Activities Found Methods
- (void)SearchActivities_Data30dysFound:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n _ActivitySearch_Found response...Data  30 Days%@ ", response);
    TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request connection Time Out " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request connection Time Out" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request connection Time Out" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

            if (Activities_ListDashBoard30DaysArr) {
                [Activities_ListDashBoard30DaysArr removeAllObjects];
            }
            TBXMLElement* soapBody = [TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement];
            TBXMLElement* container = [TBXML childElementNamed:@"GetMissedActivity_DSEResponse" parentElement:soapBody];
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self hideAlert];

                activityDashobard = nil;
                activityDashobard = [[Activity_List alloc] init];
                TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* X_OPTY_NAME = [TBXML childElementNamed:@"PENDING_ACTIVITYS" parentElement:table];
                activityDashobard.OPPTY_NAME = [TBXML textForElement:X_OPTY_NAME];
                NSLog(@"OptyNAmEE : %@", activityDashobard.OPPTY_NAME);
                [Activities_ListDashBoard30DaysArr addObject:activityDashobard];
                NSLog(@"Counter.. Search %lu", (unsigned long)[Activities_ListDashBoard30DaysArr count]);
                if (Activities_ListDashBoard30DaysArr >= 0) {
                    [self hideAlert];
                }
                else {
                    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

                        alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                       // [alert show];
                    }
                    else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {

                        alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    //    [alert show];
                    }
                    else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {

                        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                      //  [alert show];
                    }
                }
            }
            else {
                [self hideAlert];
                if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {

                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No Activities Found in Search Criteria " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                  //  [alertView show];
                }
                else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No Activities Found in Search Criteria " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //    [alertView show];
                }
                else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found in Search Criteria " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //    [alertView show];
                }
            }
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetMissedActivity_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (container) {

                TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];

                if (tuple) {

//                    TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
//                    TBXMLElement* X_OPTY_NAME = [TBXML childElementNamed:@"PENDING_ACTIVITYS" parentElement:table];
//                    activityDashobard.OPPTY_NAME = [TBXML textForElement:X_OPTY_NAME];
//                    NSLog(@"--- / DSM My Activities for Today %@ ", activityDashobard.OPPTY_NAME);
//                    NSString* PPL_ID_ = [TBXML textForElement:X_OPTY_NAME];
//                    self.lbl_CountPending.text = PPL_ID_;
                    
                    TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY_POSTN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                    
                    TBXMLElement* MISSED = [TBXML childElementNamed:@"MISSED" parentElement:table];
                    TBXMLElement* COMPLETED = [TBXML childElementNamed:@"COMPLETED" parentElement:table];
                    TBXMLElement* CANCELLED = [TBXML childElementNamed:@"CANCELLED" parentElement:table];
                    NSString* PPL_ID_ = [TBXML textForElement:MISSED];
                    self.lbl_CountPending.text = PPL_ID_;
                }
                else {
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM1 message:@"No Pending activities Found " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //    [alertView show];
                    [self hideAlert];
                }
            }
            else {
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM1 message:@"Something went Wrong .." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
              //  [alertView show];
                [self hideAlert];
            }
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetMissedActivity_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (container) {
                TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
                if (tuple) {
//                    TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
//                    TBXMLElement* X_OPTY_NAME = [TBXML childElementNamed:@"PENDING_ACTIVITYS" parentElement:table];
//                    activityDashobard.OPPTY_NAME = [TBXML textForElement:X_OPTY_NAME];
//                    NSLog(@"--- / DSM My Activities for Today %@ ", activityDashobard.OPPTY_NAME);
//                    NSString* PPL_ID_ = [TBXML textForElement:X_OPTY_NAME];
//                    self.lbl_ActivityCount.text = PPL_ID_;
                    TBXMLElement* table = [TBXML childElementNamed:@"S_OPTY_POSTN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                    
                    TBXMLElement* MISSED = [TBXML childElementNamed:@"MISSED" parentElement:table];
                    TBXMLElement* COMPLETED = [TBXML childElementNamed:@"COMPLETED" parentElement:table];
                    TBXMLElement* CANCELLED = [TBXML childElementNamed:@"CANCELLED" parentElement:table];
                    NSString* PPL_ID_ = [TBXML textForElement:MISSED];
                    self.lbl_CountPending.text = PPL_ID_;
                }
                else {
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 //   [alertView show];
                    [self hideAlert];
                }
            }
            else {
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             //   [alertView show];
                [self hideAlert];
            }
        }
        else {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Activities Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
          //  [alertView show];
            [self hideAlert];
        }
    }
}

#pragma mark - user define Methods

- (void)createArrayForTable
{
    NSLog(@"LOB Array Data :%lu", (unsigned long)[GetLOB_Arr count]);
    NSDictionary* dTmp = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
    NSMutableDictionary* Item0DicFourthlbl1 = [[NSMutableDictionary alloc] init];
    [Item0DicFourthlbl1 setObject:@"computer" forKey:@"name"];
    [Item0DicFourthlbl1 setObject:@"0-4" forKey:@"level"];

    //[Item0DicFourthlbl setValue:"Item0DicfourthArr11" forKey:@"Objects"];

    NSMutableDictionary* Item1DicFourthlbl1 = [[NSMutableDictionary alloc] init];
    [Item1DicFourthlbl1 setObject:@"computer" forKey:@"name"];
    [Item1DicFourthlbl1 setObject:@"0-4" forKey:@"level"];

    //[Item1DicFourthlbl setValue:Item0DicfourthArr11   forKey:@"Objects"];
    //
    NSArray* Item0DicfourthArr1 = [[NSArray alloc] initWithObjects:Item0DicFourthlbl1, Item1DicFourthlbl1, nil];

    NSMutableDictionary* Item0DicFourthlbl = [[NSMutableDictionary alloc] init];
    [Item0DicFourthlbl setObject:@"computer" forKey:@"name"];
    [Item0DicFourthlbl setObject:@"0-4" forKey:@"level"];

    [Item0DicFourthlbl setValue:Item0DicfourthArr1 forKey:@"Objects"];

    NSMutableDictionary* Item1DicFourthlbl = [[NSMutableDictionary alloc] init];
    [Item1DicFourthlbl setObject:@"computer" forKey:@"name"];
    [Item1DicFourthlbl setObject:@"0-4" forKey:@"level"];

    [Item1DicFourthlbl setValue:Item0DicfourthArr1 forKey:@"Objects"];
    NSArray* Item0DicfourthArr = [[NSArray alloc] initWithObjects:Item0DicFourthlbl, Item1DicFourthlbl, nil];

    NSMutableDictionary* Item0DicThirdlbl = [[NSMutableDictionary alloc] init];
    [Item0DicThirdlbl setObject:@"computer" forKey:@"name"];
    [Item0DicThirdlbl setObject:@"0-3" forKey:@"level"];

    [Item0DicThirdlbl setValue:Item0DicfourthArr forKey:@"Objects"];

    //NSArray *Item1DicSecondArr = [[NSArray alloc]initWithObjects:Item0DicSecondlbl,Item1DicSecondlbl, nil];

    NSMutableDictionary* Item1DicThirdlbl = [[NSMutableDictionary alloc] init];
    [Item1DicThirdlbl setObject:@"phone" forKey:@"name"];
    [Item1DicThirdlbl setObject:@"0-3" forKey:@"level"];

    [Item1DicThirdlbl setValue:Item0DicfourthArr forKey:@"Objects"];

    NSArray* Item0DicSecondArr = [[NSArray alloc] initWithObjects:Item0DicThirdlbl, Item1DicThirdlbl, nil];

    NSArray* Item1DicSecondArr = [[NSArray alloc] initWithObjects:Item0DicThirdlbl, Item1DicThirdlbl, nil];

    NSMutableDictionary* Item0DicSecondlbl = [[NSMutableDictionary alloc] init];
    [Item0DicSecondlbl setObject:@"Ramlal" forKey:@"name"];
    [Item0DicSecondlbl setObject:@"0-2" forKey:@"level"];

    [Item0DicSecondlbl setValue:Item0DicSecondArr forKey:@"Objects"];

    NSMutableDictionary* Item1DicSecondlbl = [[NSMutableDictionary alloc] init];
    [Item0DicSecondlbl setObject:@"hemall" forKey:@"name"];
    [Item0DicSecondlbl setObject:@"0-2" forKey:@"level"];

    [Item0DicSecondlbl setValue:Item1DicSecondArr forKey:@"Objects"];

    NSArray* Item0Array = [[NSArray alloc] initWithObjects:Item0DicSecondlbl, Item1DicSecondlbl, nil];

    NSMutableDictionary* Item0Dic = [[NSMutableDictionary alloc] init];
    [Item0Dic setObject:@"Ramlal" forKey:@"name"];
    [Item0Dic setObject:@"0" forKey:@"level"];

    [Item0Dic setValue:Item0Array forKey:@"Objects"];

    NSMutableDictionary* Item1Dic = [[NSMutableDictionary alloc] init];
    [Item1Dic setObject:@"Rohan" forKey:@"name"];
    [Item1Dic setObject:@"1" forKey:@"level"];

    [Item1Dic setValue:Item0Array forKey:@"Objects"];

    NSMutableDictionary* RootDic = [[NSMutableDictionary alloc] init];
    NSArray* Objects0 = [[NSArray alloc] initWithObjects:Item0Dic, Item1Dic, nil];
    [RootDic setObject:Objects0 forKey:@"Objects"];

    //RootDic writeToFile:path atomically:YES];

    //
    self.arrayOriginal = [RootDic valueForKey:@"Objects"];

    self.arForTable = [[NSMutableArray alloc] init];
    [self.arForTable addObjectsFromArray:self.arrayOriginal];
}
- (void)showSalesPipeLineInLabel
{
    NSLog(@"call after WS GetSalesPipeLineDashboard_NEEV_Arr %lu", (unsigned long)[GetSalesPipeLineDashboard_NEEV_Arr count]);
    int GetSalesPipeLineDashboard_NEEV = [GetSalesPipeLineDashboard_NEEV_Arr count];
}
- (BOOL)connected
{
    Reachability* reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return !(networkStatus == NotReachable);
}
- (void)checkNetworkStatus:(NSNotification*)notice
{
    // called after network status changes
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    switch (internetStatus) {
    case NotReachable: {
        NSLog(@"The internet is down.");
        self->internetActive = NO;
        break;
    }
    case ReachableViaWiFi: {
        NSLog(@"The internet is working via WIFI.");
        self->internetActive = YES;

        break;
    }
    case ReachableViaWWAN: {
        NSLog(@"The internet is working via WWAN.");
        self->internetActive = YES;

        break;
    }
    }

    NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
    switch (hostStatus) {
    case NotReachable: {
        NSLog(@"A gateway to the host server is down.");
        self->hostActive = NO;

        break;
    }
    case ReachableViaWiFi: {
        NSLog(@"A gateway to the host server is working via WIFI.");
        self->hostActive = YES;

        break;
    }
    case ReachableViaWWAN: {
        NSLog(@"A gateway to the host server is working via WWAN.");
        self->hostActive = YES;

        break;
    }
    }
}

- (void)info_btn
{
    //  NSLog(@"Home biscuit from Sanfrancisco");
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController*)splitController
     willHideViewController:(UIViewController*)viewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController:(UIPopoverController*)popoverController
{
    NSLog(@"Will hide");
    barButtonItem.title = NSLocalizedString(@"File list", @"File list");
    [self.navigationItem setLeftBarButtonItem:barButtonItem
                                     animated:YES];

    self.masterPopoverController = popoverController;
    [self.masterPopoverController setDelegate:self];
}

- (void)splitViewController:(UISplitViewController*)splitController
     willShowViewController:(UIViewController*)viewController
  invalidatingBarButtonItem:(UIBarButtonItem*)barButtonItem
{
    NSLog(@"Will show");
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}
//
- (BOOL)splitViewController:(UISplitViewController*)svc shouldHideViewController:(UIViewController*)vc inOrientation:(UIInterfaceOrientation)orientation
{
    NSLog(@"Will ..");
    return YES;
}
- (void)splitViewController:(UISplitViewController*)svc popoverController:(UIPopoverController*)pc willPresentViewController:(UIViewController*)aViewController
{

    [masterPopoverController dismissPopoverAnimated:YES];
    if ([pc isPopoverVisible]) {
        NSLog(@"over");
    }
    else {
        NSLog(@"Over1");
    }
}
- (void)popoverControllerDidDismissPopover:(UIPopoverController*)popoverController
{
    NSLog(@"HIDING POPOVER");
}
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController*)popoverController
{
    NSLog(@"!!!111");
    return YES;
}

//  Common SW
// LOB

- (void)GetAllLOB
{
    /*
     
     <SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\"><SOAP:Body><GetLOBForNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" /></SOAP:Body></SOAP:Envelope>
     */

    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetAllLOB xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
                                 @" </SOAP:Body>"
                                 @"</SOAP:Envelope>"];

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"GetLOB"];
}
- (void)LobListFound:(NSNotification*)notification
{
    GetLOB_Arr = [[NSMutableArray alloc] init];
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Reason Lost  %@ ", response);

    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {
        if (GetLOB_Arr) {
            [GetLOB_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

        NSLog(@"Which..");
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllLOBResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* S_Lst_Of_Val = [TBXML childElementNamed:@"S_LST_OF_VAL" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* NAME = [TBXML childElementNamed:@"VAL" parentElement:S_Lst_Of_Val];
                str_NAME = [TBXML textForElement:NAME];
                NSLog(@"\n str_NSE : %@", str_NAME);
                //str_NAME=[str_NAME stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
                //NSLog(@"\n str_NSE change  : %@", str_NAME);

                // activityDashobard.OPPTY_NAME =[TBXML textForElement:X_OPTY_NAME];
                //assign_list.NSE_LOBDSE_NAME =[TBXML textForElement:NAME];
                [GetLOB_Arr addObject:str_NAME];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages : %@", GetLOB_Arr);

            if ((GetLOB_Arr.count) > 0) {

                //  [self createArrayForTable];
                //[self showSalesPipeLineInLabel];
                //  [self GetSalesPipelineDashboard_NEEV];
            }
        }
        else {
            if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
        //  [self hideAlert];
    }
}
- (void)GetAllPPL
{
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetPPLFromLOB xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<LOB>Pickups</LOB>"
                                 @"</GetPPLFromLOB>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>"];

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getActivityPPLConnection"];
}
- (void)Activity_PPL_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PPL_Found response....... %@ ", response);

    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {

        if (GetPPL_LOB_Arr) {
            [GetPPL_LOB_Arr removeAllObjects];
            // [activityPPLNamePickerArr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

        TBXMLElement* container = [TBXML childElementNamed:@"GetPPLFromLOBResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];

        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_PROD_LN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"NAME" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);
                [GetPPL_LOB_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetPPL_LOB_Arr);

            if ((GetPPL_LOB_Arr.count) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                [self GetSalesPipelineDashboard_NEEVPPL];
            }
        }
        else {
            [self hideAlert];
            if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
} //GetAllPL
- (void)GetAllPL
{
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetPLFromPPL xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<PPL_Name>Xenon Pickups</PPL_Name>"
                                 @"<LOB>Pickups</LOB>"
                                 @"</GetPLFromPPL>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>"];

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getActivityPLConnection"];
}
- (void)PLUpdateOpty_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response ....... %@ ", response);
    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {

        if (GetPL_LOBPPL_Arr) {
            [GetPL_LOBPPL_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

        TBXMLElement* container = [TBXML childElementNamed:@"GetPLFromPPLResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"s_prod_int" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"PL" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);
                [GetPL_LOBPPL_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetPL_LOBPPL_Arr);

            if ((GetPL_LOBPPL_Arr.count) > 0) {
                [self GetSalesPipelineDashboard_NEEVPL];
            }
        }
        else {
            [self hideAlert];
            if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
}
// Dashboard Webservices
- (void)GetSalesPipelineDashboard
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id :%@", position_Id);
    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipelineDashboardNSE_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<fromdate>01-AUG-2015</fromdate>"
                                     @"<todate>25-OCT-2015</todate>"
                                     @"</GetSalesPipelineDashboardNSE_NEEV>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 position_Id];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
        
        envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                        @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                        @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
                        @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
                        @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
                        @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
                        @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
                        @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
                        @"</Logger>"
                        @"</header>"
                        @"</SOAP:Header>"
                        @"<SOAP:Body>"
                        @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
                        @"</SOAP:Body>"
                        @"</SOAP:Envelope>"];
    }
    else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
        
        envelopeText = [NSString stringWithFormat:
                        @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<SOAP:Body>"
                        @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
                        @"</SOAP:Body>"
                        @"</SOAP:Envelope>"] ;    
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipelineDashboard"];
}
- (void)SalesPipelineDashboard_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get Executive SalesPipelineDashboard   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetSalesPipelineDashboard_Arr) {
            [GetSalesPipelineDashboard_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipelineDashboardNSE_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                salesPipelineDashboard = nil;
                salesPipelineDashboard = [[SalesPipelineDashboardNSE_NEEV alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"LOGIN" parentElement:table];
                salesPipelineDashboard.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* F_NAME = [TBXML childElementNamed:@"F_NAME" parentElement:table];
                salesPipelineDashboard.F_NAME = [TBXML textForElement:F_NAME];

                TBXMLElement* L_NAME = [TBXML childElementNamed:@"L_NAME" parentElement:table];
                salesPipelineDashboard.L_NAME = [TBXML textForElement:L_NAME];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipelineDashboard.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipelineDashboard.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipelineDashboard.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipelineDashboard.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipelineDashboard.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE : %@", salesPipelineDashboard);
                [GetSalesPipelineDashboard_Arr addObject:salesPipelineDashboard];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetSalesPipelineDashboard_Arr);
            // }
            if ((GetSalesPipelineDashboard_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
- (void)GetLeadGeneratorwisePipelineView_NEEV
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id :%@", position_Id);
    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetLeadGeneratorwisePipelineView_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<fromdate>01-JAN-2013</fromdate>"
                                     @"<todate>10-NOV-2015</todate>"
                                     @"</GetLeadGeneratorwisePipelineView_NEEV>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 position_Id];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getLeadGeneratorwisePipelineView"];
}
- (void)LeadGeneratorwisePipelineView_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get LeadGeneratorwisePipelineView_NEEV   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetLeadGeneratorwisePipelineView_Arr) {
            [GetLeadGeneratorwisePipelineView_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetLeadGeneratorwisePipelineView_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                leadGeneratorwisePipelineView = nil;
                leadGeneratorwisePipelineView = [[LeadGeneratorwisePipelineView alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* ACC_TYPE = [TBXML childElementNamed:@"ACC_TYPE" parentElement:table];
                leadGeneratorwisePipelineView.ACC_TYPE = [TBXML textForElement:ACC_TYPE];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                leadGeneratorwisePipelineView.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                leadGeneratorwisePipelineView.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                leadGeneratorwisePipelineView.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                leadGeneratorwisePipelineView.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                leadGeneratorwisePipelineView.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE : %@", leadGeneratorwisePipelineView);
                [GetLeadGeneratorwisePipelineView_Arr addObject:leadGeneratorwisePipelineView];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetLeadGeneratorwisePipelineView_Arr);
            // }
            if ((GetLeadGeneratorwisePipelineView_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
// NEEV Dashboard WS : First Table View

- (void)GetSalesPipelineDashboard_NEEV
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id :%@", position_Id);
    NSLog(@"LOB Count  id :%lu", (unsigned long)GetLOB_Arr.count);
    values = @"";
    for (int i = 0; i < GetLOB_Arr.count; i++) {

        NSLog(@"Valu3w %d", i);
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[GetLOB_Arr objectAtIndex:i]];
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@"e"];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", values);
    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set %@", values);

    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        /*envelopeText = [NSString stringWithFormat:
                        @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<SOAP:Body>"
                        @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                        @"<positionid>%@</positionid>"
                        @"<PPL>Xenon Pickups</PPL>"
                        @"<PL>Xenon FBV</PL>"
                        @"<LOB>Pickups</LOB>"
                        @"<fromdate>01-JAN-2015</fromdate>"
                        @"<todate>01-NOV-2015</todate>"
                        @"</GetSalesPipelineDashboard_NEEV>"
                        @"</SOAP:Body>"
                        @"</SOAP:Envelope>",position_Id];*/
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<PPL></PPL>"
                                     @"<PL></PL>"
                                     @"<LOB>%@</LOB>"
                                     @"<fromdate>01-JAN-2015</fromdate>"
                                     @"<todate>01-NOV-2015</todate>"
                                     @"</GetSalesPipelineDashboard_NEEV>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 position_Id, values];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipelineDashboard_NEEV"];
}
- (void)SalesPipelineDashboard_NEEV_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesPipelineDashboard NEEV  %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetSalesPipeLineDashboard_NEEV_Arr) {
            [GetSalesPipeLineDashboard_NEEV_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipelineDashboard_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                salesPipelineDashboardNEEV = nil;
                salesPipelineDashboardNEEV = [[GetSalesPipeLineDashboard_NEEV alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipelineDashboardNEEV.PL = [TBXML textForElement:PL];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipelineDashboardNEEV.PPL = [TBXML textForElement:PPL];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipelineDashboardNEEV.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipelineDashboardNEEV.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipelineDashboardNEEV.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipelineDashboardNEEV.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipelineDashboardNEEV.alias4 = [TBXML textForElement:alias4];

                //[urlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

                NSLog(@"\n str_NSE SalesPipeLineDashboard_DSE : %@", salesPipelineDashboardNEEV);
                [GetSalesPipeLineDashboard_NEEV_Arr addObject:salesPipelineDashboardNEEV];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetSalesPipeLineDashboard_NEEV_Arr);
            // }
            if ((GetSalesPipeLineDashboard_NEEV_Arr.count) > 0) {
                [self hideAlert];
                [self showSalesPipeLineInLabel];

                //[self GetAllPPL]; /// Call when main lob selected for drop drill
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Data not available.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

- (void)GetSalesPipelineDashboard_NEEVPPL
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id :%@", position_Id);
    NSLog(@"LOB Count  id :%lu", (unsigned long)GetPPL_LOB_Arr.count);
    values = @"";
    for (int i = 0; i < GetPPL_LOB_Arr.count; i++) {

        NSLog(@"Valu3w %d", i);
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[GetPPL_LOB_Arr objectAtIndex:i]];
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@","];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", values);
    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set %@", values);

    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        /*envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>%@</positionid>"
         @"<PPL>Xenon Pickups</PPL>"
         @"<PL>Xenon FBV</PL>"
         @"<LOB>Pickups</LOB>"
         @"<fromdate>01-JAN-2015</fromdate>"
         @"<todate>01-NOV-2015</todate>"
         @"</GetSalesPipelineDashboard_NEEV>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>",position_Id];*/
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<PPL>%@</PPL>"
                                     @"<PL></PL>"
                                     @"<LOB>'Pickups'</LOB>"
                                     @"<fromdate>01-JAN-2015</fromdate>"
                                     @"<todate>01-NOV-2015</todate>"
                                     @"</GetSalesPipelineDashboard_NEEV>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 position_Id, values];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipelineDashboard_NEEVPPL"];
}
- (void)SalesPipelineDashboard_NEEVPPL_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesPipelineDashboard NEEVPPL  %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        /*
         <tuple
         xmlns="com.cordys.tatamotors.Neevsiebelwsapp">
         <old>
         <TABLE
         xmlns="com.cordys.tatamotors.Neevsiebelwsapp">
         <PL>Xenon FBV</PL>
         <PPL>Xenon Pickups</PPL>
         <LOB>Pickups</LOB>
         <alias>1</alias>
         <alias1>1</alias1>
         <alias2>0</alias2>
         <alias3>0</alias3>
         <alias4>0</alias4>
         </TABLE>
         </old>
         </tuple>
         */

        if (GetSalesPipeLineDashboardNEEVPPL_Arr) {
            [GetSalesPipeLineDashboardNEEVPPL_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipelineDashboard_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                salesPipeLineDashboardNEEVPPL = nil;
                salesPipeLineDashboardNEEVPPL = [[GetSalesPipeLineDashboardNEEVPPL alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipeLineDashboardNEEVPPL.PL = [TBXML textForElement:PL];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipeLineDashboardNEEVPPL.PPL = [TBXML textForElement:PPL];

                TBXMLElement* LOB = [TBXML childElementNamed:@"LOB" parentElement:table];
                salesPipeLineDashboardNEEVPPL.LOB = [TBXML textForElement:LOB];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipeLineDashboardNEEVPPL.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipeLineDashboardNEEVPPL.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipeLineDashboardNEEVPPL.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipeLineDashboardNEEVPPL.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipeLineDashboardNEEVPPL.alias4 = [TBXML textForElement:alias4];

                //[urlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

                NSLog(@"\n str_NSE salesPipeLineDashboardNEEVPPL : %@", salesPipeLineDashboardNEEVPPL);
                [GetSalesPipeLineDashboardNEEVPPL_Arr addObject:salesPipeLineDashboardNEEVPPL];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetSalesPipeLineDashboardNEEVPPL_Arr);
            // }
            if ((GetSalesPipeLineDashboardNEEVPPL_Arr.count) > 0) {
                [self hideAlert];
                [self GetAllPL]; /// Call when main lob selected for drop drill-- PPL
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Data not available.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
} //
- (void)GetSalesPipelineDashboard_NEEVPL
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id :%@", position_Id);
    NSLog(@"LOB Count  id :%lu", (unsigned long)GetPL_LOBPPL_Arr.count);
    values = @"";
    for (int i = 0; i < GetPL_LOBPPL_Arr.count; i++) {

        NSLog(@"Valu3w %d", i);
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[GetPL_LOBPPL_Arr objectAtIndex:i]];
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@","];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", values);
    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set %@", values);

    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        /*envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>%@</positionid>"
         @"<PPL>Xenon Pickups</PPL>"
         @"<PL>Xenon FBV</PL>"
         @"<LOB>Pickups</LOB>"
         @"<fromdate>01-JAN-2015</fromdate>"
         @"<todate>01-NOV-2015</todate>"
         @"</GetSalesPipelineDashboard_NEEV>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>",position_Id];*/
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<PPL>'Xenon Pickups'</PPL>"
                                     @"<PL>%@</PL>"
                                     @"<LOB>'Pickups'</LOB>"
                                     @"<fromdate>01-JAN-2015</fromdate>"
                                     @"<todate>01-NOV-2015</todate>"
                                     @"</GetSalesPipelineDashboard_NEEV>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 position_Id, values];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipelineDashboard_NEEVPL"];
} //

- (void)SalesPipelineDashboard_NEEVPL_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesPipelineDashboard_NEEVPL_Found %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetSalesPipeLineDashboardNEEVPL_Arr) {
            [GetSalesPipeLineDashboardNEEVPL_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipelineDashboard_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                salesPipeLineDashboardNEEVPL = nil;
                salesPipeLineDashboardNEEVPL = [[GetSalesPipeLineDashboardNEEVPL alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipeLineDashboardNEEVPL.PL = [TBXML textForElement:PL];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipeLineDashboardNEEVPL.PPL = [TBXML textForElement:PPL];

                TBXMLElement* LOB = [TBXML childElementNamed:@"LOB" parentElement:table];
                salesPipeLineDashboardNEEVPL.LOB = [TBXML textForElement:LOB];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipeLineDashboardNEEVPL.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipeLineDashboardNEEVPL.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipeLineDashboardNEEVPL.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipeLineDashboardNEEVPL.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipeLineDashboardNEEVPL.alias4 = [TBXML textForElement:alias4];

                //[urlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

                NSLog(@"\n str_NSE salesPipeLineDashboardNEEVPPL : %@", salesPipeLineDashboardNEEVPL);
                [GetSalesPipeLineDashboardNEEVPL_Arr addObject:salesPipeLineDashboardNEEVPL];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetSalesPipeLineDashboardNEEVPL_Arr);
            // }
            if ((GetSalesPipeLineDashboardNEEVPL_Arr.count) > 0) {
                [self hideAlert];
                //[self GetAllPL]; /// Call when main lob selected for drop drill-- PPL
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Data not available.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
// NEEV Avtivity Adherence

- (void)GetEventExecutiveDashboard_NEEV
{

    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        /*envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>%@</positionid>"
         @"<PPL>Xenon Pickups</PPL>"
         @"<PL>Xenon FBV</PL>"
         @"<LOB>Pickups</LOB>"
         @"<fromdate>01-JAN-2015</fromdate>"
         @"<todate>01-NOV-2015</todate>"
         @"</GetSalesPipelineDashboard_NEEV>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>",position_Id];*/
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetEventDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<buid>1-560</buid>"
                                     @"<PPL>'ICV Buses' AS ICVBuses ,'Indica GLS' AS IndicaGLS ,'Ace_Zip' AS  Ace_Zip ,'Super_Ace' AS Super_Ace,'Xenon Pickups' AS XenonPickups</PPL>"
                                     @"</GetEventDashboard_NEEV>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getEventExecutiveDashboard_NEEV"];
}

- (void)EventExecutiveDashboard_NEEV_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get EventExecutiveDashboard_NEEV NEEV  %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (EventExecutiveDashboard_NEEV_Arr) {
            [EventExecutiveDashboard_NEEV_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetEventDashboard_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            /*
             <tuple xmlns="com.cordys.tatamotors.Neevsiebelwsapp">
             <old>
             <S_SRC xmlns="com.cordys.tatamotors.Neevsiebelwsapp">
             <FN>JAYESH KUMAR</FN>
             <LN> C V</LN>
             <DSE_NAME>JKCV3001520</DSE_NAME>
             <ICVBUSES>3</ICVBUSES>
             <INDICAGLS>0</INDICAGLS>
             <ACE_ZIP>0</ACE_ZIP>
             <SUPER_ACE>0</SUPER_ACE>
             <XENONPICKUPS>0</XENONPICKUPS>
             </S_SRC>
             </old>
             </tuple>
             */

            do {

                salesPipeLineDashboardExecutive_NEEV = nil;
                salesPipeLineDashboardExecutive_NEEV = [[GetSalesPipeLineDashboardExecutive_NEEV alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.PL = [TBXML textForElement:PL];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.PPL = [TBXML textForElement:PPL];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias4 = [TBXML textForElement:alias4];

                //[urlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

                NSLog(@"\n str_NSE SalesPipeLineDashboard_DSE : %@", salesPipeLineDashboardExecutive_NEEV);
                [EventExecutiveDashboard_NEEV_Arr addObject:salesPipeLineDashboardExecutive_NEEV];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", EventExecutiveDashboard_NEEV_Arr);
            // }
            if ((EventExecutiveDashboard_NEEV_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Data not available.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
} //GetEventActive_NEEV
- (void)GetEventActive_NEEV
{

    if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {

        /*envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>%@</positionid>"
         @"<PPL>Xenon Pickups</PPL>"
         @"<PL>Xenon FBV</PL>"
         @"<LOB>Pickups</LOB>"
         @"<fromdate>01-JAN-2015</fromdate>"
         @"<todate>01-NOV-2015</todate>"
         @"</GetSalesPipelineDashboard_NEEV>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>",position_Id];*/
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetEventActive_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<buid>1-560</buid>"
                                     @"<PPL>'ICV Buses' AS ICVBuses ,'Indica GLS' AS IndicaGLS ,'Ace_Zip' AS  Ace_Zip ,'Super_Ace' AS Super_Ace,'Xenon Pickups' AS XenonPickups</PPL>"
                                     @"</GetEventActive_NEEV>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getEventActive_NEEV"];
} //EventActive_NEEV_Found
- (void)EventActive_NEEV_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get EventActive_NEEV   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (EventActive_NEEV_Arr) {
            [EventActive_NEEV_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetEventActive_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {
                /*
                 <S_SRC
                 xmlns="com.cordys.tatamotors.Neevsiebelwsapp">
                 <FN>JAYESH KUMAR</FN>
                 <LN> C V</LN>
                 <DSE_NAME>JKCV3001520</DSE_NAME>
                 <ICVBUSES>3</ICVBUSES>
                 <INDICAGLS>0</INDICAGLS>
                 <ACE_ZIP>0</ACE_ZIP>
                 <SUPER_ACE>0</SUPER_ACE>
                 <XENONPICKUPS>0</XENONPICKUPS>
                 </S_SRC>
                 */

                eventActive = nil;
                eventActive = [[EventActive_NEEV alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"S_SRC" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* FN = [TBXML childElementNamed:@"FN" parentElement:table];
                eventActive.FN = [TBXML textForElement:FN];

                TBXMLElement* PPL = [TBXML childElementNamed:@"LN" parentElement:table];
                eventActive.LN = [TBXML textForElement:PPL];

                TBXMLElement* LN = [TBXML childElementNamed:@"DSE_NAME" parentElement:table];
                eventActive.DSE_NAME = [TBXML textForElement:LN];

                TBXMLElement* ICVBUSES = [TBXML childElementNamed:@"ICVBUSES" parentElement:table];
                eventActive.ICVBUSES = [TBXML textForElement:ICVBUSES];

                TBXMLElement* INDICAGLS = [TBXML childElementNamed:@"INDICAGLS" parentElement:table];
                eventActive.INDICAGLS = [TBXML textForElement:INDICAGLS];

                TBXMLElement* ACE_ZIP = [TBXML childElementNamed:@"ACE_ZIP" parentElement:table];
                eventActive.ACE_ZIP = [TBXML textForElement:ACE_ZIP];

                TBXMLElement* SUPER_ACE = [TBXML childElementNamed:@"SUPER_ACE" parentElement:table];
                eventActive.SUPER_ACE = [TBXML textForElement:SUPER_ACE];

                TBXMLElement* XENONPICKUPS = [TBXML childElementNamed:@"XENONPICKUPS" parentElement:table];
                eventActive.XENONPICKUPS = [TBXML textForElement:XENONPICKUPS];

                //[urlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

                NSLog(@"\n str_NSE SalesPipeLineDashboard_DSE : %@", eventActive);
                [EventActive_NEEV_Arr addObject:eventActive];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", EventActive_NEEV_Arr);
            // }
            if ((EventActive_NEEV_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Data not available.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
// DSM Dashboard WS

- (void)GetAllPPLDSM
{
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetListOfPPLForNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<buname>TMCV</buname>"
                                 @"<attr1></attr1>"
                                 @"<attr2></attr2>"
                                 @"</GetListOfPPLForNeev>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>"];

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getActivityPPLConnectionDSM"];
}
- (void)ActivityPPLConnectionDSMPPL_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found responseDSM ....... %@ ", response);
    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {

        if (GetPL_LOBPPL_Arr) {
            [GetPL_LOBPPL_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

        TBXMLElement* container = [TBXML childElementNamed:@"GetListOfPPLForNeevResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_PROD_LN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"PPL_ID" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];

                TBXMLElement* PPL_NAME = [TBXML childElementNamed:@"PPL_NAME" parentElement:S_PROD_LN];
                NSString* PPL_NAME_ = [TBXML textForElement:PPL_NAME];
                NSString* PPL_NAMESEC = PPL_NAME_;
                NSLog(@"\n PPL_ID_DSM  : %@", PPL_ID_);
                NSLog(@"\n PPL_ID_DSM  : %@", PPL_NAMESEC);

                [GetPL_LOBPPL_Arr addObject:PPL_NAME_];

                PPL_NAMESEC = [PPL_NAMESEC stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

                [GetPL_LOBPPLSEC_Arr addObject:PPL_NAMESEC];

            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetPL_LOBPPL_Arr);
            NSLog(@" PPL %lu", (unsigned long)[GetPL_LOBPPL_Arr count]);
            if ((GetPL_LOBPPL_Arr.count) > 0) {
                //shrad

                [self.ExpandableTableView reloadData];

                if ([userDetailsVal_.POSTN isEqualToString:@"DSM"]) {
                    // [self GetSalesPipeLineDashboard_DSM];
                    [self GetEventActiveDashboard_DSM];
                }
                else if ([userDetailsVal_.POSTN isEqualToString:@"DSE"]) {
                    //[self GetSalesPipeLineDashboard_DSM];

                    //call Sales stages values for DSE

                    [self GetSalesPipeLineDashboard_DSE];

                    [self GetEventActiveDashboard_DSM];
                }
                else {
                    // NEEV
                }
                //[self GetEventDashboard_DSM];
                //[self GetEventActiveDashboard_DSM];
            }
        }
        else {
            [self hideAlert];
            if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
} //CallDSEwisePipeLineCurrent
- (void)CallDSEwisePipeLineCurrent
{

    NSLog(@"--- Postion Id :%@", userDetailsVal_.PRIMARY_EMP);
    NSLog(@"--- Current date Call DSE :%@", str_CurrentDate);
    NSLog(@"-- current Date :%@", str_CurrentDate);
    NSLog(@"-- Current Month Fist Day Date :%@", FirstDayofCurrentMonth);
    NSLog(@"-- Last 30 Days from Current day :%@", ThirtyMonthDate);
    NSLog(@"-- Last 60 Days From Current Day :%@", MonthDate);
    //'1-70Z','1-70P'
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetMMPipeLineView_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<positionid>'%@'</positionid>"
                                 @"<fromdate>%@</fromdate>"
                                 @"<todate>%@</todate>"
                                 @"</GetMMPipeLineView_DSM>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>",
                             userDetailsVal_.POSITION_ID, FirstDayofCurrentMonth, str_CurrentDate];
    //1-2YY5DBR

    NSLog(@"Envelop Text DSE:%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getDSEwisePipeLinecurrentMonth_DSM"];
} //DSEwisePipeLinecurrentMonth_Found
- (void)DSEwisePipeLinecurrentMonth_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get DSEwisePipeLinecurrentMonth_Found   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request Timed Out.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {

        TBXML* tbxml;
        TBXMLElement* container;
        TBXMLElement* tuple;
        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) { //GetSalesPipeLineDashboard_DSEResponse

            if (DSEWisePipeLine_Object_Arr) {
                [DSEWisePipeLine_Object_Arr removeAllObjects];
            }
//GetMMPipeLineView_DSMResponse
            tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            container = [TBXML childElementNamed:@"GetMMPipeLineView_DSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        }
        else {
            // NEEV
        }
        if (tuple) {

            do {
                /*
                 <TABLE>
                 <LOGIN>JJOSHI1001680</LOGIN>
                 <DSE_NAME>JIGNA JOSHI</DSE_NAME>
                 <alias>65</alias>
                 <alias1>3</alias1>
                 <alias2>4</alias2>
                 <alias3>13</alias3>
                 <alias4>5</alias4>
                 </TABLE>

                 */

                dSEWisePipeLine_Object = nil;
                dSEWisePipeLine_Object = [[DSEWisePipeLine_Object alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                TBXMLElement* LOGIN = [TBXML childElementNamed:@"LOGIN" parentElement:table];
                dSEWisePipeLine_Object.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* DSE_NAME = [TBXML childElementNamed:@"DSE_NAME" parentElement:table];
                dSEWisePipeLine_Object.DSE_NAME = [TBXML textForElement:DSE_NAME];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                dSEWisePipeLine_Object.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                dSEWisePipeLine_Object.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                dSEWisePipeLine_Object.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                dSEWisePipeLine_Object.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                dSEWisePipeLine_Object.alias4 = [TBXML textForElement:alias4];

                [DSEWisePipeLine_Object_Arr addObject:dSEWisePipeLine_Object];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :DSE Current %@", DSEWisePipeLine_Object_Arr);
            // }
            if ((DSEWisePipeLine_Object_Arr.count) > 0) {
                [self.tbl_DSEwiseDSM reloadData];
                //  [self.tbl_ForPPL reloadData];
                //   [self.ExpandableTableView reloadData];
                NSLog(@"---GetSalesPipeLineDashboard_DSM_Arr Count --- %lu", (unsigned long)[DSEWisePipeLine_Object_Arr count]);
                // Reload Table data :
                // [self.tbl_PipeLine reloadData];

                [self hideAlert];
            }
            else if ([[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr count] > 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
} //CallDSEwisePipeLine60Days
- (void)CallDSEwisePipeLine60Days
{

    NSLog(@"--- Postion Id :%@", userDetailsVal_.PRIMARY_EMP);
    NSLog(@"--- Current date Call DSE 30 Dys :%@", str_CurrentDate);
    //'1-70Z','1-70P'
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetMMPipeLineView_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<positionid>'%@'</positionid>"
                                 @"<fromdate>%@</fromdate>"
                                 @"<todate>%@</todate>"
                                 @"</GetMMPipeLineView_DSM>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>",
                             userDetailsVal_.POSITION_ID, MonthDate, str_CurrentDate];
    //1-2YY5DBR

    NSLog(@"Envelop Text DSE: Extra  %@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getDSEwisePipeLineLast30Days_DSM"];
} //DSEwisePipeLine30Days_Found
- (void)DSEwisePipeLine30Days_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get DSEwisePipeLine30Days_Found   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request Timed Out.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {

        TBXML* tbxml;
        TBXMLElement* container;
        TBXMLElement* tuple;
        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) { //GetSalesPipeLineDashboard_DSEResponse

            if (DSEWisePipeLine_Object_Arr1) {
                [DSEWisePipeLine_Object_Arr1 removeAllObjects];
            }

            tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            container = [TBXML childElementNamed:@"GetMMPipeLineView_DSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        }
        else {
            // NEEV
        }
        if (tuple) {

            do {
                /*
                 <TABLE>
                 <LOGIN>JJOSHI1001680</LOGIN>
                 <DSE_NAME>JIGNA JOSHI</DSE_NAME>
                 <alias>65</alias>
                 <alias1>3</alias1>
                 <alias2>4</alias2>
                 <alias3>13</alias3>
                 <alias4>5</alias4>
                 </TABLE>
                 
                 */

                dSEWisePipeLine_Object = nil;
                dSEWisePipeLine_Object = [[DSEWisePipeLine_Object alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                TBXMLElement* LOGIN = [TBXML childElementNamed:@"LOGIN" parentElement:table];
                dSEWisePipeLine_Object.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* DSE_NAME = [TBXML childElementNamed:@"DSE_NAME" parentElement:table];
                dSEWisePipeLine_Object.DSE_NAME = [TBXML textForElement:DSE_NAME];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                dSEWisePipeLine_Object.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                dSEWisePipeLine_Object.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                dSEWisePipeLine_Object.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                dSEWisePipeLine_Object.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                dSEWisePipeLine_Object.alias4 = [TBXML textForElement:alias4];

                [DSEWisePipeLine_Object_Arr1 addObject:dSEWisePipeLine_Object];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :DSE Current %@", DSEWisePipeLine_Object_Arr1);
            // }
            if ((DSEWisePipeLine_Object_Arr1.count) > 0) {
                //  [self.tbl_DSE reloadData];
                [self.tbl_DSEwiseDSM reloadData];
                //  [self.tbl_ForPPL reloadData];
                //   [self.ExpandableTableView reloadData];
                NSLog(@"---GetSalesPipeLineDashboard_DSM_Arr Count --- %lu", (unsigned long)[DSEWisePipeLine_Object_Arr1 count]);
                // Reload Table data :
                // [self.tbl_PipeLine reloadData];

                [self hideAlert];
            }
            else if ([[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr count] > 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
//to get for PPL/PL of DSE/DSM Salestages
- (void)GetSalesPipeLineDashboard_DSM
{
    if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {

        NSLog(@"--- Postion Id GetSalesPipeLineDashboard_DSM :%@", userDetailsVal_.PRIMARY_EMP);
        NSLog(@"--- Current date Call DSE :%@", str_CurrentDate);
        NSLog(@"--- Current date Call DSE :%@", FirstDayofCurrentMonth);
        NSLog(@"--- Current date Call DSE :%@", listOfNSE_list_Arr_EMP);

        values_DSMSales = @"";
        for (int i = 0; i < listOfNSE_list_Arr_EMP.count; i++) {

            NSLog(@"Valu3w %d", i);
            values_DSMSales = [values_DSMSales stringByAppendingString:@"'"];
            values_DSMSales = [values_DSMSales stringByAppendingString:[listOfNSE_list_Arr_EMP objectAtIndex:i]];
            values_DSMSales = [values_DSMSales stringByAppendingString:@"'"];
            values_DSMSales = [values_DSMSales stringByAppendingString:@","];
        }
        NSLog(@"Valu3w %@", values_DSMSales);

        if ([values_DSMSales length] > 0) {
            values_DSMSales = [values_DSMSales substringToIndex:[values_DSMSales length] - 1];
        }
        else {
            //no characters to delete... attempting to do so will result in a crash
        }
        userPrimaryPosition = @"";
        userPrimaryPosition = [[[[userPrimaryPosition stringByAppendingString:@"'"] stringByAppendingString:userDetailsVal_.PRIMARY_EMP] stringByAppendingString:@"'"] stringByAppendingString:@","];
        NSLog(@"-- USer Primary Id GetSalesPipeLineDashboard_DSM :%@", userPrimaryPosition);
        //  values_DSMSales=[[[[[values_DSMSales stringByAppendingString:@"'"]stringByAppendingString:userDetailsVal_.PRIMARY_EMP]stringByAppendingString:@"'"]stringByAppendingString:@","]stringByAppendingString:values_DSMSales];
        NSLog(@"Valu3w Set %@", values_DSMSales);
        values_DSMSales = [userPrimaryPosition stringByAppendingString:values_DSMSales];

        NSString* envelopeText_Dashboard_DSE = [NSString stringWithFormat:
                                                             @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                                             @"<SOAP:Body>"
                                                             @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                                             @"<fromdate>%@</fromdate>"
                                                             @"<todate>%@</todate>"
                                                             @"<PrimaryEmployeeID>%@</PrimaryEmployeeID>"
                                                             @"<PPL></PPL>"
                                                             @"</GetSalesPipeLineDashboard_DSE>"
                                                             @"</SOAP:Body>"
                                                             @"</SOAP:Envelope>",
                                                         FirstDayofCurrentMonth, str_CurrentDate, values_DSMSales];
        //1-2YY5DBR

        NSLog(@"Envelop Text DSE:%@", envelopeText_Dashboard_DSE);

        NSData* envelope = [envelopeText_Dashboard_DSE dataUsingEncoding:NSUTF8StringEncoding];

        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipeLineDashboard_DSM"];
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {
        NSLog(@"--- Final for DSE");

        NSLog(@"--- Postion Id :%@", userDetailsVal_.PRIMARY_EMP);
        NSLog(@"--- Current date Call DSE :%@", str_CurrentDate);
        NSLog(@"--- Current date Call DSE :%@", FirstDayofCurrentMonth);
        NSLog(@"--- Current date Call DSE :%@", listOfNSE_list_Arr_EMP);

        NSString* envelopeText_Dashboard_DSE = [NSString stringWithFormat:
                                                             @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                                             @"<SOAP:Body>"
                                                             @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                                             @"<fromdate>%@</fromdate>"
                                                             @"<todate>%@</todate>"
                                                             @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                                             @"<PPL></PPL>"
                                                             @"</GetSalesPipeLineDashboard_DSE>"
                                                             @"</SOAP:Body>"
                                                             @"</SOAP:Envelope>",
                                                         FirstDayofCurrentMonth, str_CurrentDate, userDetailsVal_.PRIMARY_EMP];
        //1-2YY5DBR

        NSLog(@"Envelop Text DSE:%@", envelopeText_Dashboard_DSE);

        NSData* envelope = [envelopeText_Dashboard_DSE dataUsingEncoding:NSUTF8StringEncoding];

        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipeLineDashboard_DSM"];
    }
    else {
    }
} //
- (void)SalesPipeLineDashboard_DSMConnection_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesPipelineDashboardDSM/DSE   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        TBXML* tbxml;
        TBXMLElement* container;
        TBXMLElement* tuple;
        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) { //GetSalesPipeLineDashboard_DSEResponse

            if (GetSalesPipeLineDashboard_DSM_Arr) {
                [GetSalesPipeLineDashboard_DSM_Arr removeAllObjects];
            }

            tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqualToString:PostionforDSM]) {
            if (GetSalesPipeLineDashboard_DSM_Arr) {
                [GetSalesPipeLineDashboard_DSM_Arr removeAllObjects];
            }
            tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        }
        else {
            // NEEV
        }

        if (tuple) {

            do {

                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipelineDashboardDSM.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipelineDashboardDSM.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipelineDashboardDSM.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipelineDashboardDSM.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipelineDashboardDSM.alias4 = [TBXML textForElement:alias4];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipelineDashboardDSM.PPL = [TBXML textForElement:PPL];

                salesPipelineDashboardDSM.FromCheck = @"Current";

                /*   TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipelineDashboardDSM.PL = [TBXML textForElement:PL];*/

                [GetSalesPipeLineDashboard_DSM_Arr addObject:salesPipelineDashboardDSM];

                /*if ([TBXML childElementNamed:@"PPL" parentElement:table] != nil) {
                    TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                    salesPipelineDashboardDSM.PPL = [TBXML textForElement:PPL];
                    [GetSalesPipeLineDashboard_DSM_Arr addObject:salesPipelineDashboardDSM];
                }
                if ([TBXML childElementNamed:@"PL" parentElement:table] != nil) {
                    TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                    salesPipelineDashboardDSM.PL = [TBXML textForElement:PL];
                    [[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr addObject:salesPipelineDashboardDSM];
                }*/
            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :DSE Current %@", GetSalesPipeLineDashboard_DSM_Arr);
            // }
            if ((GetSalesPipeLineDashboard_DSM_Arr.count) > 0) {
                [self.tbl_DSE reloadData];
                [self.tbl_ForPPL reloadData];
                [self.ExpandableTableView reloadData];
                NSLog(@"---GetSalesPipeLineDashboard_DSM_Arr Count --- %lu", (unsigned long)[GetSalesPipeLineDashboard_DSM_Arr count]);
                // Reload Table data :
                [self.tbl_PipeLine reloadData];

                [self hideAlert];
            }
            else if ([[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr count] > 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"No Data Found .Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           // [alert show];
        }
    }
} //GetSalesPipeLineDashboard_DSM60Days
- (void)GetSalesPipeLineDashboard_DSM60Days
{
    if ([userDetailsVal_.POSITION_TYPE isEqualToString:PostionforDSM]) {

        NSLog(@"--- Postion Id :%@", userDetailsVal_.PRIMARY_EMP);
        NSLog(@"--- Current date DSE 60 Days :%@", str_CurrentDate);
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"<PPL></PPL>"
                                     @"</GetSalesPipeLineDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 MonthDate, str_CurrentDate, userDetailsVal_.PRIMARY_EMP];
    }
    else if ([appdelegate.loginUD isEqual:PostionforDSM1]) {
        NSLog(@"--- Postion Id :%@", userDetailsVal_.PRIMARY_EMP);
        NSLog(@"--- Current date DSM:%@", str_CurrentDate);
        NSLog(@"--- Current date DSM:%@", MonthDate);

        NSLog(@"--- Postion Id GetSalesPipeLineDashboard_DSM :%@", userDetailsVal_.PRIMARY_EMP);
        NSLog(@"--- Current date Call DSE :%@", str_CurrentDate);
        NSLog(@"--- Current date Call DSE :%@", FirstDayofCurrentMonth);
        NSLog(@"--- Current date Call DSE :%@", listOfNSE_list_Arr_EMP);

        values_DSMSales = @"";
        for (int i = 0; i < listOfNSE_list_Arr_EMP.count; i++) {

            NSLog(@"Valu3w %d", i);
            values_DSMSales = [values_DSMSales stringByAppendingString:@"'"];
            values_DSMSales = [values_DSMSales stringByAppendingString:[listOfNSE_list_Arr_EMP objectAtIndex:i]];
            values_DSMSales = [values_DSMSales stringByAppendingString:@"'"];
            values_DSMSales = [values_DSMSales stringByAppendingString:@","];
        }
        NSLog(@"Valu3w %@", values_DSMSales);

        if ([values_DSMSales length] > 0) {
            values_DSMSales = [values_DSMSales substringToIndex:[values_DSMSales length] - 1];
        }
        else {
            //no characters to delete... attempting to do so will result in a crash
        }
        userPrimaryPosition = @"";
        userPrimaryPosition = [[[[userPrimaryPosition stringByAppendingString:@"'"] stringByAppendingString:userDetailsVal_.PRIMARY_EMP] stringByAppendingString:@"'"] stringByAppendingString:@","];
        NSLog(@"-- USer Primary Id GetSalesPipeLineDashboard_DSM :%@", userPrimaryPosition);
        //  values_DSMSales=[[[[[values_DSMSales stringByAppendingString:@"'"]stringByAppendingString:userDetailsVal_.PRIMARY_EMP]stringByAppendingString:@"'"]stringByAppendingString:@","]stringByAppendingString:values_DSMSales];
        NSLog(@"Valu3w Set %@", values_DSMSales);
        values_DSMSales = [userPrimaryPosition stringByAppendingString:values_DSMSales];

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>%@</PrimaryEmployeeID>"
                                     @"<PPL></PPL>"
                                     @"</GetSalesPipeLineDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 MonthDate, str_CurrentDate, values_DSMSales];
    }
    NSLog(@"Envelop Text GetSalesPipeLineDashboard_DSM60Days  :%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipeLineDashboard_DSM60Days"];
} //SalesPipeLineDashboard_DSM60DaysData_Found
- (void)SalesPipeLineDashboard_DSM60DaysData_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesPipelineDashboardDSM/DSE for 60 Days  %@ ", response);
    if ([response isEqual:@""]) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        TBXML* tbxml;
        TBXMLElement* container;
        TBXMLElement* tuple;
        NSLog(@"User Positon :%@", userDetailsVal_.POSITION_TYPE);
        if ([userDetailsVal_.POSITION_TYPE isEqualToString:@"DSM"]) {

            tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqualToString:PostionforDSM]) {
            tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        }
        else {
            // NEEV
        }
        if (GetSalesPipeLineDashboard_DSM60Days_Arr) {
            [GetSalesPipeLineDashboard_DSM60Days_Arr removeAllObjects];
        }
        if (tuple) {

            do {

                salesPipelineDashboardDSM60 = nil;
                salesPipelineDashboardDSM60 = [[GetSalesPipeLineDashboard_DSM alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipelineDashboardDSM60.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipelineDashboardDSM60.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipelineDashboardDSM60.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipelineDashboardDSM60.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipelineDashboardDSM60.alias4 = [TBXML textForElement:alias4];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipelineDashboardDSM60.PPL = [TBXML textForElement:PPL];

                salesPipelineDashboardDSM60.FromCheck = @"Last60";

                [GetSalesPipeLineDashboard_DSM60Days_Arr addObject:salesPipelineDashboardDSM60];

                /*if ([TBXML childElementNamed:@"PPL" parentElement:table] != nil) {
                    TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                    salesPipelineDashboardDSM.PPL = [TBXML textForElement:PPL];
                    [GetSalesPipeLineDashboard_DSM60Days_Arr addObject:salesPipelineDashboardDSM];
                }
                if ([TBXML childElementNamed:@"PL" parentElement:table] != nil) {
                    TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                    salesPipelineDashboardDSM.PL = [TBXML textForElement:PL];
                    [[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr addObject:salesPipelineDashboardDSM];
                }*/
            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages 60 Days ::%@", GetSalesPipeLineDashboard_DSM60Days_Arr);
            // }
            if ((GetSalesPipeLineDashboard_DSM60Days_Arr.count) > 0) {
                //NSLog(@"---GetSalesPipeLineDashboard_DSM60Days_Arr  Count --- %lu", (unsigned long)[GetSalesPipeLineDashboard_DSM60Days_Arr count]);
                [self.tbl_ForPPL reloadData];
                [self.tbl_PipeLine reloadData];
                [self.tbl_DSE reloadData];
                [self hideAlert];
            }
            else if ([[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr count] > 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //    [alert show];
        }
    }
}
- (void)GetAllPLDSM
{
    //to send
    // NSString * str = self.selectedData;
    ;
    //@"<PPL_Name>ICV Buses</PPL_Name>"
    envelopeText = [NSString stringWithFormat:
                                 @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                 @"<SOAP:Body>"
                                 @"<GetPLFromPPL xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                 @"<PPL_Name>%@</PPL_Name>"
                                 @"<LOB></LOB>"
                                 @"</GetPLFromPPL>"
                                 @"</SOAP:Body>"
                                 @"</SOAP:Envelope>",
                             self.selectedData];

    /* envelopeText = [NSString stringWithFormat:
                    @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                    @"<SOAP:Body>"
                    @"<GetPLFromPPL xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                    @"<PPL_Name>ICV Buses</PPL_Name>"
                    @"<LOB></LOB>"
                    @"</GetPLFromPPL>"
                    @"</SOAP:Body>"
                    @"</SOAP:Envelope>"];*/
    //Xenon Pickups
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getActivityPLDSMConnection"];
}
- (void)ActivityPLDSMConnection_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response for PL Clecked ....... %@ ", response);
    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Noooo data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {

        if (GetPL_PPLDSM_Arr) {
            [GetPL_PPLDSM_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

        TBXMLElement* container = [TBXML childElementNamed:@"GetPLFromPPLResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"s_prod_ln" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* NAME = [TBXML childElementNamed:@"NAME" parentElement:S_PROD_LN];
                NSString* NAME_ = [TBXML textForElement:NAME];
                NSLog(@"\n PPL_ID_ : %@", NAME_);
                [GetPL_PPLDSM_Arr addObject:NAME_];
                [[SingletonClass sharedobject].GetPL_PPLDSM_SingletonArr addObject:NAME_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetPL_PPLDSM_Arr);

            if ((GetPL_PPLDSM_Arr.count) > 0) {
                //to get value from GetPL_PPLDSM_Arr
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];

                //[self.ExpandableTableView reloadData];

                // DSM
                if ([userDetailsVal_.POSTN isEqualToString:@"DSM"]) {

                    [self GetSalesPipelineDashboard_DSMPLAll];
                }
                else if ([userDetailsVal_.POSTN isEqualToString:@"DSE"]) {
                    //[self GetSalesPipeLineDashboard_DSE];

                    [self GetSalesPipeLineDashboardPL_DSE];
                }
            }
        }
        else {
            [self hideAlert];
            if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
                if ([GetSalesPipeLineDashboard_DSEPLArr count] > 0) {
                    [GetSalesPipeLineDashboard_DSEPLArr removeAllObjects];
                    [self.ExpandableTableView reloadData];
                }
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSM"])
                if ([GetSalesPipeLineDashboard_DSMPLAll_Arr count] > 0) {

                    [GetSalesPipeLineDashboard_DSMPLAll_Arr removeAllObjects];
                    [self.ExpandableTableView reloadData];
                }
            {
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
} //GetSalesPipelineDashboard_NEEVPLAll
- (void)GetSalesPipelineDashboard_DSMPLAll
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id for All PL :%@", position_Id);
    NSLog(@"LOB Count  id :%lu", (unsigned long)GetPL_PPLDSM_Arr.count);
    values = @"";
    for (int i = 0; i < GetPL_PPLDSM_Arr.count; i++) {

        NSLog(@"Valu3w %d", i);
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[GetPL_PPLDSM_Arr objectAtIndex:i]];
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@","];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", values);
    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set %@", values);
    if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<PPL></PPL>"
                                     @"<PL>%@</PL>"
                                     @"<fromdate>01-AUG-2015</fromdate>"
                                     @"<todate>25-AUG-2015</todate>"
                                     @"</GetSalesPipeLineDashboard_DSM>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID, values];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipelineDashboard_DSMPLAll"];
}
- (void)SalesPipelineDashboard_DSMPLAll_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesPipelineDashboardDSMAll   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetSalesPipeLineDashboard_DSMPLAll_Arr) {
            [GetSalesPipeLineDashboard_DSMPLAll_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                salesPipeLineDashboardAllPL_DSM = nil;
                salesPipeLineDashboardAllPL_DSM = [[GetSalesPipeLineDashboardAllPL_DSM alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipeLineDashboardAllPL_DSM.PL = [TBXML textForElement:PL];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipeLineDashboardAllPL_DSM.PPL = [TBXML textForElement:PPL];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipeLineDashboardAllPL_DSM.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipeLineDashboardAllPL_DSM.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipeLineDashboardAllPL_DSM.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipeLineDashboardAllPL_DSM.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipeLineDashboardAllPL_DSM.alias4 = [TBXML textForElement:alias4];

                [GetSalesPipeLineDashboard_DSMPLAll_Arr addObject:salesPipeLineDashboardAllPL_DSM];
                [[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr addObject:salesPipeLineDashboardAllPL_DSM];
                //               NSMutableArray * str = [[ NSMutableArray alloc]initWithArray:[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr];
                NSLog(@"\n str_NSE SalesPipeLineDashboard_DSM : %@", salesPipeLineDashboardAllPL_DSM);

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetSalesPipeLineDashboard_DSMPLAll_Arr);
            // }
            if ((GetSalesPipeLineDashboard_DSMPLAll_Arr.count && [SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr.count) > 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];

                //                [self.ExpandableTableView reloadData];

                [self hideAlert];
                //shraddha Change
                //                [self GetAllPLDSM];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

//
- (void)GetEventDashboard_DSM
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id for All PL :%@", position_Id);
    //NSMutableArray *GetPL_LOBPPLSecond_Arr=[[NSMutableArray alloc] init];
    //GetPL_LOBPPLSecond_Arr=GetPL_LOBPPL_Arr;
    NSLog(@"All PPL :%@", GetPL_LOBPPL_Arr);
    valuesDSMPPL = @"";
    for (int i = 0; i < GetPL_LOBPPL_Arr.count; i++) {

        NSLog(@"Values PPL %d", i);
        valuesDSMPPL = [valuesDSMPPL stringByAppendingString:@"'"];
        valuesDSMPPL = [valuesDSMPPL stringByAppendingString:[GetPL_LOBPPL_Arr objectAtIndex:i]];
        valuesDSMPPL = [valuesDSMPPL stringByAppendingString:@"'"];
        //valuesDSMPPL = [valuesDSMPPL stringByAppendingString:@" as "];
        //valuesDSMPPL = [valuesDSMPPL stringByAppendingString:[GetPL_LOBPPLSEC_Arr objectAtIndex:i]];
        valuesDSMPPL = [valuesDSMPPL stringByAppendingString:@","];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", valuesDSMPPL);
    if ([valuesDSMPPL length] > 0) {
        valuesDSMPPL = [valuesDSMPPL substringToIndex:[valuesDSMPPL length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }

    if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {

        /*envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>%@</positionid>"
         @"<PPL>Xenon Pickups</PPL>"
         @"<PL>Xenon FBV</PL>"
         @"<LOB>Pickups</LOB>"
         @"<fromdate>01-JAN-2015</fromdate>"
         @"<todate>01-NOV-2015</todate>"
         @"</GetSalesPipelineDashboard_NEEV>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>",position_Id];*/
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetEventDashboard_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<buid>1-560</buid>"
                                     @"<PPL>'Xenon Pickups'</PPL>"
                                     @"</GetEventDashboard_DSM>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID];
    }
    //            <PPL>'LPT MCV' as LPT MCV,'SE MCV' as SE MCV,'8 Tonne Trucks' as 8 Tonne Trucks,'697 Buses' as 697 Buses,'Cummins Buses' as Cummins Buses,'HCV Buses' as HCV Buses,'CNG Buses' as CNG Buses,'Special Purpose Buses' as Special Purpose Buses,'4 Tonne Buses' as 4 Tonne Buses,'7 Tonne Buses' as 7 Tonne Buses,  'M&amp;HCV Buses' as M&HCV Buses,'ICV Buses' as ICV Buses,'Buses1' as Buses1,'SCV Pass-Venture' as SCV Pass-Venture,'207 Pickups' as 207 Pickups,'Xenon Pickups' as Xenon Pickups,'LPT 810 old' as LPT 810 old,'ICVs' as ICVs,'4 Tonne Trucks' as 4 Tonne Trucks,'7 Tonne Trucks' as 7 Tonne Trucks,'ICV Trucks' as ICV Trucks,'4 Tonne Pickup' as 4 Tonne Pickup,'LCV Tippers' as LCV Tippers,'9 Tonne Trucks' as 9 Tonne Trucks,'ICV Tippers' as ICV Tippers,'Engine-4SP' as Engine-4SP,'Engine-497' as Engine-497,'Engine-697' as Engine-697,'Axle' as Axle,'SCV Pass-Winger test' as SCV Pass-Winger test,'SCV Pass-Magic' as SCV Pass-Magic,'SCV Pass-Magic IRIS' as SCV Pass-Magic IRIS,'MCV Tippers' as MCV Tippers,'MAV Tippers' as MAV Tippers,'Tata Ace' as Tata Ace,'Super_Ace' as Super_Ace,'Ace_Zip' as Ace_Zip,'Ace HT' as Ace HT,'Ace HT PPL' as Ace HT PPL,'Tractor Trailers' as Tractor Trailers,'LCV Buses' as LCV Buses,'MAV 25' as MAV 25,'MAV 31' as MAV 31,'MAV 37' as MAV 37</PPL>

    //      <PPL>'ICV Buses' as ICVBuses,'Indica GLS'as IndicaGLS,'Ace_Zip' as Ace_Zip,'Super_Ace' as Super_Ace,'Xenon Pickups' as XenonPickups</PPL>
    //<PPL>'LPT MCV','SE MCV','8 Tonne Trucks','697 Buses','Cummins Buses','HCV Buses','CNG Buses','Special Purpose Buses','4 Tonne Buses','7 Tonne Buses','M&amp;HCV Buses','ICV Buses','Buses1','SCV Pass-Venture','207 Pickups','Xenon Pickups','LPT 810 old','ICVs','4 Tonne Trucks','7 Tonne Trucks','ICV Trucks','4 Tonne Pickup','LCV Tippers','9 Tonne Trucks','ICV Tippers','Engine-4SP','Engine-497','Engine-697','Axle','SCV Pass-Winger test','SCV Pass-Magic','SCV Pass-Magic IRIS','MCV Tippers','MAV Tippers','Tata Ace','Super_Ace','Ace_Zip','Ace HT','Ace HT PPL','Tractor Trailers','LCV Buses','MAV 25','MAV 31','MAV 37'</PPL>
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....www!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getEventDashboard_DSM"];
}
//EventDashboard_DSM_Found

- (void)EventDashboard_DSM_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get EventExecutiveDashboard_DSM  %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        /*
        if (EventExecutiveDashboard_NEEV_Arr)
        {
            [EventExecutiveDashboard_NEEV_Arr removeAllObjects];
        }
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement *container = [TBXML childElementNamed:@"GetEventDashboard_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement *tuple =[TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple)
        {
         
            
            do {
                
                salesPipeLineDashboardExecutive_NEEV = nil;
                salesPipeLineDashboardExecutive_NEEV = [[GetSalesPipeLineDashboardExecutive_NEEV alloc]init];
                
                
                TBXMLElement *table  = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement *PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.PL = [TBXML textForElement:PL];
                
                
                TBXMLElement *PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.PPL = [TBXML textForElement:PPL];
                
                TBXMLElement *alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias = [TBXML textForElement:alias];
                
                TBXMLElement *alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias1 = [TBXML textForElement:alias1];
                
                TBXMLElement *alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias2 = [TBXML textForElement:alias2];
                
                TBXMLElement *alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias3 = [TBXML textForElement:alias3];
                
                TBXMLElement *alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipeLineDashboardExecutive_NEEV.alias4 = [TBXML textForElement:alias4];
                
                //[urlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
                
                NSLog(@"\n str_NSE SalesPipeLineDashboard_DSE : %@",salesPipeLineDashboardExecutive_NEEV);
                [EventExecutiveDashboard_NEEV_Arr addObject:salesPipeLineDashboardExecutive_NEEV];
                
            }while ((tuple = tuple->nextSibling));
            
            NSLog(@"Sales Stages :%@",EventExecutiveDashboard_NEEV_Arr);
            // }
            if ((EventExecutiveDashboard_NEEV_Arr.count) > 0)
            {
                [self hideAlert];
            }
        }
        else
        {
            [self hideAlert];
            alert=[[UIAlertView alloc]initWithTitle:@"DSE" message :@"Data not available.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }*/
    }
}
- (void)GetEventActiveDashboard_DSM
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id for All PL :%@", position_Id);
    //NSMutableArray *GetPL_LOBPPLSecond_Arr=[[NSMutableArray alloc] init];
    //GetPL_LOBPPLSecond_Arr=GetPL_LOBPPL_Arr;
    NSLog(@"All PPL :%@", GetPL_LOBPPL_Arr);
    valuesDSMPPLActive = @"";
    for (int i = 0; i < GetPL_LOBPPL_Arr.count; i++) {

        NSLog(@"Values PPL %d", i);
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:@"'"];
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:[GetPL_LOBPPL_Arr objectAtIndex:i]];
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:@"'"];
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:@" as "];
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:@"'"];
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:[GetPL_LOBPPLSEC_Arr objectAtIndex:i]];
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:@"'"];
        valuesDSMPPLActive = [valuesDSMPPLActive stringByAppendingString:@","];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", valuesDSMPPLActive);
    if ([valuesDSMPPLActive length] > 0) {
        valuesDSMPPLActive = [valuesDSMPPLActive substringToIndex:[valuesDSMPPLActive length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }

    if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {

        /*envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetSalesPipelineDashboard_NEEV xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>%@</positionid>"
         @"<PPL>Xenon Pickups</PPL>"
         @"<PL>Xenon FBV</PL>"
         @"<LOB>Pickups</LOB>"
         @"<fromdate>01-JAN-2015</fromdate>"
         @"<todate>01-NOV-2015</todate>"
         @"</GetSalesPipelineDashboard_NEEV>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>",position_Id];*/
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetEventActiveDashboard_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>1-70Z</positionid>"
                                     @"<buid>1-560</buid>"
                                     @"<PPL>%@</PPL>"
                                     @"</GetEventActiveDashboard_DSM>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 valuesDSMPPLActive];
    }
    else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {

        NSLog(@"Event activity DSE");

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetEventActiveDashboard_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>1-70Z</positionid>"
                                     @"<buid>1-560</buid>"
                                     @"<PPL>%@</PPL>"
                                     @"</GetEventActiveDashboard_DSM>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 valuesDSMPPLActive];
    }
    //      <PPL>'ICV Buses' as ICVBuses,'Indica GLS'as IndicaGLS,'Ace_Zip' as Ace_Zip,'Super_Ace' as Super_Ace,'Xenon Pickups' as XenonPickups</PPL>

    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....ACtive!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"get_DSM_EvetnDashboard"];
}

- (void)EventActiveDashboard_DSMM_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get EventActiveExecutiveDashboard_DSM  %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        /*
         if (EventExecutiveDashboard_NEEV_Arr)
         {
         [EventExecutiveDashboard_NEEV_Arr removeAllObjects];
         }
         
         TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
         TBXMLElement *container = [TBXML childElementNamed:@"GetEventDashboard_NEEVResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
         TBXMLElement *tuple =[TBXML childElementNamed:@"tuple" parentElement:container];
         if (tuple)
         {
         
         
         do {
         
         salesPipeLineDashboardExecutive_NEEV = nil;
         salesPipeLineDashboardExecutive_NEEV = [[GetSalesPipeLineDashboardExecutive_NEEV alloc]init];
         
         
         TBXMLElement *table  = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
         TBXMLElement *PL = [TBXML childElementNamed:@"PL" parentElement:table];
         salesPipeLineDashboardExecutive_NEEV.PL = [TBXML textForElement:PL];
         
         
         TBXMLElement *PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
         salesPipeLineDashboardExecutive_NEEV.PPL = [TBXML textForElement:PPL];
         
         TBXMLElement *alias = [TBXML childElementNamed:@"alias" parentElement:table];
         salesPipeLineDashboardExecutive_NEEV.alias = [TBXML textForElement:alias];
         
         TBXMLElement *alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
         salesPipeLineDashboardExecutive_NEEV.alias1 = [TBXML textForElement:alias1];
         
         TBXMLElement *alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
         salesPipeLineDashboardExecutive_NEEV.alias2 = [TBXML textForElement:alias2];
         
         TBXMLElement *alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
         salesPipeLineDashboardExecutive_NEEV.alias3 = [TBXML textForElement:alias3];
         
         TBXMLElement *alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
         salesPipeLineDashboardExecutive_NEEV.alias4 = [TBXML textForElement:alias4];
         
         //[urlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
         
         NSLog(@"\n str_NSE SalesPipeLineDashboard_DSE : %@",salesPipeLineDashboardExecutive_NEEV);
         [EventExecutiveDashboard_NEEV_Arr addObject:salesPipeLineDashboardExecutive_NEEV];
         
         }while ((tuple = tuple->nextSibling));
         
         NSLog(@"Sales Stages :%@",EventExecutiveDashboard_NEEV_Arr);
         // }
         if ((EventExecutiveDashboard_NEEV_Arr.count) > 0)
         {
         [self hideAlert];
         }
         }
         else
         {
         [self hideAlert];
         alert=[[UIAlertView alloc]initWithTitle:@"DSE" message :@"Data not available.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         [alert show];
         }*/
    }
}
- (void)GetMMPipeLineView_DSM
{
    if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMMPipeLineView_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<fromdate>01-AUG-2015</fromdate>"
                                     @"<todate>20-AUG-2015</todate>"
                                     @"</GetMMPipeLineView_DSM>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getMMPipeLineView_DSM"];
}

- (void)MMPipeLineView_DSM_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get MMPipeLineView_DSM   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetMMPipeLineView_DSEApp_Arr) {
            [GetMMPipeLineView_DSEApp_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetMMPipeLineView_DSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                mmPipeLineView_DSM = nil;
                mmPipeLineView_DSM = [[MMPipeLineView_DSM alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"LOGIN" parentElement:table];
                mmPipeLineView_DSM.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* F_NAME = [TBXML childElementNamed:@"F_NAME" parentElement:table];
                mmPipeLineView_DSM.F_NAME = [TBXML textForElement:F_NAME];

                TBXMLElement* L_NAME = [TBXML childElementNamed:@"L_NAME" parentElement:table];
                mmPipeLineView_DSM.L_NAME = [TBXML textForElement:L_NAME];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                mmPipeLineView_DSM.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                mmPipeLineView_DSM.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                mmPipeLineView_DSM.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                mmPipeLineView_DSM.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                mmPipeLineView_DSM.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE  MM : %@", mmPipeLineView_DSM);
                [GetMMPipeLineView_DSEApp_Arr addObject:mmPipeLineView_DSM];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetMMPipeLineView_DSEApp_Arr);
            // }
            if ((GetMMPipeLineView_DSEApp_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
- (void)GetSalesPipeLineDashboard_DSE
{
    //GetPL_PPLDSM_Arr

    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id :%@", position_Id);
    NSLog(@"LOB Count  id :%lu", (unsigned long)GetPL_LOBPPL_Arr.count);
    values = @"";
    for (int i = 0; i < GetPL_LOBPPL_Arr.count; i++) {

        NSLog(@"Valu3w %d", i);
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[GetPL_LOBPPL_Arr objectAtIndex:i]];
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@","];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", values);
    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set %@", values);

    if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>1-70Z</positionid>"
                                     @"<PPL>%@</PPL>"
                                     @"<PL></PL>"
                                     @"<LOB></LOB>"
                                     @"<fromdate>01-AUG-2015</fromdate>"
                                     @"<todate>25-AUG-2015</todate>"
                                     @"</GetSalesPipeLineDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 values];

        //
        //        envelopeText = [NSString stringWithFormat:
        //                        @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        //                        @"<SOAP:Body>"
        //                        @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
        //                        @"<positionid>%@</positionid>"
        //                        @"<PPL>%@</PPL>"
        //                        @"<PL></PL>"
        //                        @"<LOB></LOB>"
        //                        @"<fromdate>01-AUG-2015</fromdate>"
        //                        @"<todate>25-AUG-2015</todate>"
        //                        @"</GetSalesPipeLineDashboard_DSE>"
        //                        @"</SOAP:Body>"
        //                        @"</SOAP:Envelope>",userDetailsVal_.ROW_ID,values];
    }

    /*if([userDetailsVal_.POSTN isEqual:@"DSE"]){
        
        envelopeText = [NSString stringWithFormat:
                        @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<SOAP:Body>"
                        @"<GetSalesPipeLineDashboard_DSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                        @"<positionid>%@</positionid>"
                        @"<PPL>%@</PPL>"
                        @"<PL></PL>"
                        @"<fromdate>01-AUG-2015</fromdate>"
                        @"<todate>25-AUG-2015</todate>"
                        @"</GetSalesPipeLineDashboard_DSM>"
                        @"</SOAP:Body>"
                        @"</SOAP:Envelope>",userDetailsVal_.ROW_ID,values];
    }
    
    if([userDetailsVal_.POSTN isEqual:@"DSE"]){
        
        envelopeText = [NSString stringWithFormat:
                        @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<SOAP:Body>"
                        @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                        @"<positionid>%@</positionid>"
                        @"<PPL>Xenon Pickups</PPL>"
                        @"<PL>Xenon FBV</PL>"
                        @"<LOB>Pickups</LOB>"
                        @"<fromdate>01-AUG-2015</fromdate>"
                        @"<todate>25-AUG-2015</todate>"
                        @"</GetSalesPipeLineDashboard_DSE>"
                        @"</SOAP:Body>"
                        @"</SOAP:Envelope>",userDetailsVal_.ROW_ID];
    }
    /*else if([userDetailsVal_.POSTN isEqual:@"DSE"]){
     
     envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
     @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e7ab-229211ac173b</DC>"
     @"</Logger>"
     @"</header>"
     @"</SOAP:Header>"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"];
     }
     else if([userDetailsVal_.POSTN isEqual:@"DSM"]){
     
     envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetTMCVMakeLostTypeNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>"] ;
     }*/

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipeLineDashboard_DSE"];
} //
- (void)SalesPipeLineDashboard_DSE_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesPipelineDashboard   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetSalesPipeLineDashboard_DSEPLAll_Arr) {
            [GetSalesPipeLineDashboard_DSEPLAll_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipelineDashboardDSM.PL = [TBXML textForElement:PL];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipelineDashboardDSM.PPL = [TBXML textForElement:PPL];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipelineDashboardDSM.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipelineDashboardDSM.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipelineDashboardDSM.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipelineDashboardDSM.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipelineDashboardDSM.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE SalesPipeLineDashboard_DSE : %@", salesPipelineDashboardDSM);
                [GetSalesPipeLineDashboard_DSEPLAll_Arr addObject:salesPipelineDashboardDSM];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetSalesPipeLineDashboard_DSEPLAll_Arr);
            // }
            if ((GetSalesPipeLineDashboard_DSEPLAll_Arr.count) > 0) {

                [self hideAlert];
                [self.ExpandableTableView reloadData];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wronggggg.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
//
- (void)GetSalesPipeLineDashboardPL_DSE
{
    //GetPL_PPLDSM_Arr

    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id :%@", position_Id);
    NSLog(@"LOB Count  id :%lu", (unsigned long)GetPL_PPLDSM_Arr.count);
    values = @"";
    for (int i = 0; i < GetPL_PPLDSM_Arr.count; i++) {

        NSLog(@"Valu3w %d", i);
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:[GetPL_PPLDSM_Arr objectAtIndex:i]];
        values = [values stringByAppendingString:@"'"];
        values = [values stringByAppendingString:@","];
        // values = [values stringByAppendingString:@","];
        //values=[GetLOB_Arr objectAtIndex:i];
        //values = [values stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    }
    NSLog(@"Valu3w %@", values);
    if ([values length] > 0) {
        values = [values substringToIndex:[values length] - 1];
    }
    else {
        //no characters to delete... attempting to do so will result in a crash
    }
    NSLog(@"Valu3w Set %@", values);

    if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>1-70Z</positionid>"
                                     @"<PPL></PPL>"
                                     @"<PL>%@</PL>"
                                     @"<LOB></LOB>"
                                     @"<fromdate>01-AUG-2015</fromdate>"
                                     @"<todate>25-AUG-2015</todate>"
                                     @"</GetSalesPipeLineDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 values];
    }

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];

    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    // NSLog(@"REQUEST IS %@",envelopeText);

    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];

    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipeLineDashboardPL_DSE"];
}
// Found method :
- (void)SalesStageDSEDashboardPL_FOUND:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get SalesStageDSEDashboardPL_FOUND   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetSalesPipeLineDashboard_DSEPLArr) {
            [GetSalesPipeLineDashboard_DSEPLArr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PL = [TBXML childElementNamed:@"PL" parentElement:table];
                salesPipelineDashboardDSM.PL = [TBXML textForElement:PL];

                TBXMLElement* PPL = [TBXML childElementNamed:@"PPL" parentElement:table];
                salesPipelineDashboardDSM.PPL = [TBXML textForElement:PPL];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                salesPipelineDashboardDSM.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                salesPipelineDashboardDSM.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                salesPipelineDashboardDSM.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                salesPipelineDashboardDSM.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                salesPipelineDashboardDSM.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE SalesPipeLineDashboard_DSE : %@", salesPipelineDashboardDSM);
                [GetSalesPipeLineDashboard_DSEPLArr addObject:salesPipelineDashboardDSM];
                [[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSEPLArrSingleton addObject:salesPipelineDashboardDSM];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetSalesPipeLineDashboard_DSEPLArr);
            if ((GetSalesPipeLineDashboard_DSEPLArr.count) > 0) {

                [self hideAlert];
            }
            if ([SingletonClass sharedobject].GetSalesPipeLineDashboard_DSEPLArrSingleton.count > 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

- (void)GetMMPipeLineView_DSE
{
    //NSString *position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id GetMMPipeLineView_DSE");
    /*
     @"<fromdate>01-Mar-2016</fromdate>"
     @"<todate>09-Mar-2016</todate>"
     */

    if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMMApplicationDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"</GetMMApplicationDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 FirstDayofCurrentMonth, str_CurrentDate, userDetailsVal_.PRIMARY_EMP];

        /* envelopeText = [NSString stringWithFormat:
                        @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<SOAP:Body>"
                        @"<GetMMApplicationDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                        @"<fromdate>01-Mar-2016</fromdate>"
                        @"<todate>09-Mar-2016</todate>"
                        @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                        @"</GetMMApplicationDashboard_DSE>"
                        @"</SOAP:Body>"
                        @"</SOAP:Envelope>",userDetailsVal_.PRIMARY_EMP];*/

        /*  envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMMApplicationDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>1-70Z</positionid>"
                                     @"<fromdate>01-AUG-2013</fromdate>"
                                     @"<todate>20-AUG-2015</todate>"
                                     @"</GetMMApplicationDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>"];*/
        /*
         <SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
         <SOAP:Body>
         <GetMMApplicationDashboard_DSE xmlns="com.cordys.tatamotors.Dsmsiebelwsapp" preserveSpace="no" qAccess="0" qValues="">
         <fromdate>01-feb-2015</fromdate>
         <todate>01-feb-2016</todate>
         <PrimaryEmployeeID>1-2YY5DBR</PrimaryEmployeeID>
         </GetMMApplicationDashboard_DSE>
         </SOAP:Body>
         </SOAP:Envelope>
         */
    }
    NSLog(@"\n envlopeString Of user details....MM!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getMMApplicationDashboard_DSECurrent"];
} //
- (void)MMApplicationDashboard_DSECurrent_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get MMPipeLineView_DSE   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetMMApplication_DSEAppCurrent_Arr) {
            [GetMMApplication_DSEAppCurrent_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetMMApplicationDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                getMMPipeLineView_DSE = nil;
                getMMPipeLineView_DSE = [[GetMMPipeLineView_DSE alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"VEH_APPLICATION" parentElement:table];
                getMMPipeLineView_DSE.LOGIN = [TBXML textForElement:LOGIN];

                /*TBXMLElement* F_NAME = [TBXML childElementNamed:@"F_NAME" parentElement:table];
                getMMPipeLineView_DSE.F_NAME = [TBXML textForElement:F_NAME];

                TBXMLElement* L_NAME = [TBXML childElementNamed:@"L_NAME" parentElement:table];
                getMMPipeLineView_DSE.L_NAME = [TBXML textForElement:L_NAME];*/

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                getMMPipeLineView_DSE.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                getMMPipeLineView_DSE.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                getMMPipeLineView_DSE.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                getMMPipeLineView_DSE.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                getMMPipeLineView_DSE.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE  MM : %@", getMMPipeLineView_DSE);
                [GetMMApplication_DSEAppCurrent_Arr addObject:getMMPipeLineView_DSE];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetMMApplication_DSEApp_Arr);
            NSLog(@"Sales Stages  GetMMApplication_DSEApp_Arr: %lu", (unsigned long)[GetMMApplication_DSEAppCurrent_Arr count]);

            // }
            if ((GetMMApplication_DSEAppCurrent_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           // [alert show];
        }
    }
} //GetMMPipeLineView_DSE
- (void)GetMMPipeLineView_DSE60days
{
    //NSString *position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.ROW_ID];
    NSLog(@"Position id GetMMPipeLineView_DSE60days");
    /*
     @"<fromdate>09-Jan-2015</fromdate>"
     @"<todate>09-Mar-2016</todate>"
     */

    if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMMApplicationDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"</GetMMApplicationDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 MonthDate, str_CurrentDate, userDetailsVal_.PRIMARY_EMP];

        /* envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetMMApplicationDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<fromdate>01-Mar-2016</fromdate>"
         @"<todate>09-Mar-2016</todate>"
         @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
         @"</GetMMApplicationDashboard_DSE>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>",userDetailsVal_.PRIMARY_EMP];*/

        /*  envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetMMApplicationDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>1-70Z</positionid>"
         @"<fromdate>01-AUG-2013</fromdate>"
         @"<todate>20-AUG-2015</todate>"
         @"</GetMMApplicationDashboard_DSE>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>"];*/
        /*
         <SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
         <SOAP:Body>
         <GetMMApplicationDashboard_DSE xmlns="com.cordys.tatamotors.Dsmsiebelwsapp" preserveSpace="no" qAccess="0" qValues="">
         <fromdate>01-feb-2015</fromdate>
         <todate>01-feb-2016</todate>
         <PrimaryEmployeeID>1-2YY5DBR</PrimaryEmployeeID>
         </GetMMApplicationDashboard_DSE>
         </SOAP:Body>
         </SOAP:Envelope>
         */
    }
    NSLog(@"\n envlopeString Of user details....MM!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getMMApplicationDashboard_DSE60"];
} //MMApplicationDashboard_DSE60Days_Found
- (void)MMApplicationDashboard_DSE60Days_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get MMApplicationDashboard_DSE60Days_Found   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetMMApplication_DSEApp_Arr) {
            [GetMMApplication_DSEApp_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetMMApplicationDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                getMMPipeLineView_DSE = nil;
                getMMPipeLineView_DSE = [[GetMMPipeLineView_DSE alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"VEH_APPLICATION" parentElement:table];
                getMMPipeLineView_DSE.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                getMMPipeLineView_DSE.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                getMMPipeLineView_DSE.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                getMMPipeLineView_DSE.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                getMMPipeLineView_DSE.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                getMMPipeLineView_DSE.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE  MM : %@", getMMPipeLineView_DSE);
                [GetMMApplication_DSEApp60_Arr addObject:getMMPipeLineView_DSE];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetMMApplication_DSEApp60_Arr);
            NSLog(@"Sales Stages  GetMMApplication_DSEApp_Arr: %lu", (unsigned long)[GetMMApplication_DSEApp60_Arr count]);

            // }
            if ((GetMMApplication_DSEApp60_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           // [alert show];
        }
    }
}

- (void)dsepipelinefound:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get MMPipeLineView_DSE   %@ ", response);

    if ([response isEqual:@""]) {

        [self hideAlert];

        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetMMPipeLineView_DSE_Arr) {
            [GetMMPipeLineView_DSE_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetMMPipeLineView_DSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                getMMPipeLineView_DSE = nil;
                getMMPipeLineView_DSE = [[GetMMPipeLineView_DSE alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"LOGIN" parentElement:table];
                getMMPipeLineView_DSE.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* F_NAME = [TBXML childElementNamed:@"F_NAME" parentElement:table];
                getMMPipeLineView_DSE.F_NAME = [TBXML textForElement:F_NAME];

                TBXMLElement* L_NAME = [TBXML childElementNamed:@"L_NAME" parentElement:table];
                getMMPipeLineView_DSE.L_NAME = [TBXML textForElement:L_NAME];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                getMMPipeLineView_DSE.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                getMMPipeLineView_DSE.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                getMMPipeLineView_DSE.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                getMMPipeLineView_DSE.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                getMMPipeLineView_DSE.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE  MM : %@", getMMPipeLineView_DSE);
                [GetMMPipeLineView_DSE_Arr addObject:getMMPipeLineView_DSE];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages :%@", GetMMPipeLineView_DSE_Arr);
            // }
            if ((GetMMPipeLineView_DSE_Arr.count) > 0) {
                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         //   [alert show];
        }
    }
}
- (void)GetMMGeoDashboard_DSE
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.POSITION_TYPE];
    NSLog(@"Position id :%@", position_Id);

    if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

        /* envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMMGeoDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>1-70Z</positionid>"
                                     @"<PPL></PPL>"
                                     @"<PL></PL>"
                                     @"<LOB></LOB>"
                                     @"<fromdate>01-SEP-2013</fromdate>"
                                     @"<todate>20-SEP-2015</todate>"
                                     @"</GetMMGeoDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>"];*/
        /*
         @"<fromdate>01-MAR-2015</fromdate>"
         @"<todate>09-MAR-2016</todate>"
         */

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMMGeoDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<PPL></PPL>"
                                     @"<PL></PL>"
                                     @"<LOB></LOB>"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"</GetMMGeoDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 FirstDayofCurrentMonth, str_CurrentDate, userDetailsVal_.PRIMARY_EMP];
    }
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getMMGeoDashboard_DSE"];
}
- (void)MMGeoDashboard_DSE_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get MMGeoDashboard_DSE Current   %@ ", response);

    if ([response isEqual:@""]) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetMMPipeLineView_DSE_Arr) {
            [GetMMPipeLineView_DSE_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetMMGeoDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {
                /*
                 <TABLE xmlns="com.cordys.tatamotors.Dsmsiebelwsapp">
                 <PPL>4 Tonne Pickup</PPL>
                 <alias>2</alias>
                 <alias1>0</alias1>
                 <alias2>0</alias2>
                 <alias3>0</alias3>
                 <alias4>0</alias4>
                 </TABLE>
                 */

                getMMPipeLineView_DSE = nil;
                getMMPipeLineView_DSE = [[GetMMPipeLineView_DSE alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"MM_MKT" parentElement:table];
                getMMPipeLineView_DSE.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                getMMPipeLineView_DSE.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                getMMPipeLineView_DSE.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                getMMPipeLineView_DSE.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                getMMPipeLineView_DSE.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                getMMPipeLineView_DSE.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE  MM : %@", getMMPipeLineView_DSE);
                [GetMMPipeLineView_DSE_Arr addObject:getMMPipeLineView_DSE];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages GetMMPipeLineView_DSE_Arr:%lu", (unsigned long)[GetMMPipeLineView_DSE_Arr count]);
            // }
            if ((GetMMPipeLineView_DSE_Arr.count) > 0) {

                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         //   [alert show];
        }
    }
}
- (void)GetMMGeoDashboard_DSE60Days
{
    NSString* position_Id = [NSString stringWithFormat:@"'%@'", userDetailsVal_.POSITION_TYPE];
    NSLog(@"Position id :%@", position_Id);

    if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {

        /* envelopeText = [NSString stringWithFormat:
         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
         @"<SOAP:Body>"
         @"<GetMMGeoDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
         @"<positionid>1-70Z</positionid>"
         @"<PPL></PPL>"
         @"<PL></PL>"
         @"<LOB></LOB>"
         @"<fromdate>01-SEP-2013</fromdate>"
         @"<todate>20-SEP-2015</todate>"
         @"</GetMMGeoDashboard_DSE>"
         @"</SOAP:Body>"
         @"</SOAP:Envelope>"];*/
        /*
         @"<fromdate>09-JAN-2016</fromdate>"
         @"<todate>09-MAR-2016</todate>"
         */
        /*
         @"<fromdate>09-JAN-2016</fromdate>"
         @"<todate>09-MAR-2016</todate>"

         */

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetMMGeoDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<PPL></PPL>"
                                     @"<PL></PL>"
                                     @"<LOB></LOB>"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"</GetMMGeoDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 MonthDate, str_CurrentDate, userDetailsVal_.PRIMARY_EMP];
    }
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getMMGeoDashboard_DSE60Days"];
} //MMGeoDashboard_DSE60Days_Found
- (void)MMGeoDashboard_DSE60Days_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get MMGeoDashboard_DSE  60 Days %@ ", response);

    if ([response isEqual:@""]) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        if (GetMMPipeLineView_DSECurrentMonth_Arr) {
            [GetMMPipeLineView_DSECurrentMonth_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetMMGeoDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {
                /*
                 <TABLE xmlns="com.cordys.tatamotors.Dsmsiebelwsapp">
                 <PPL>4 Tonne Pickup</PPL>
                 <alias>2</alias>
                 <alias1>0</alias1>
                 <alias2>0</alias2>
                 <alias3>0</alias3>
                 <alias4>0</alias4>
                 </TABLE>
                 */

                getMMPipeLineView_DSE = nil;
                getMMPipeLineView_DSE = [[GetMMPipeLineView_DSE alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"MM_MKT" parentElement:table];
                getMMPipeLineView_DSE.LOGIN = [TBXML textForElement:LOGIN];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                getMMPipeLineView_DSE.alias = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                getMMPipeLineView_DSE.alias1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                getMMPipeLineView_DSE.alias2 = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                getMMPipeLineView_DSE.alias3 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                getMMPipeLineView_DSE.alias4 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE  MM : %@", getMMPipeLineView_DSE);
                [GetMMPipeLineView_DSECurrentMonth_Arr addObject:getMMPipeLineView_DSE];

            } while ((tuple = tuple->nextSibling));

            NSLog(@"Sales Stages GetMMPipeLineView_DSECurrentMonth_Arr:%lu", (unsigned long)[GetMMPipeLineView_DSECurrentMonth_Arr count]);
            // }
            if ((GetMMPipeLineView_DSECurrentMonth_Arr.count) > 0) {

                [self hideAlert];
            }
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         //   [alert show];
        }
    }
}
- (void)showAlert
{
    [MBProgressHUD showHUDAddedLoading:self.view animated:YES];
}
- (void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - TableView Delegate and Data source methods- shraddha

/*- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}*/

/*- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.ActivityAdherenceTableView)

    {
        return 1;
    }
    else if (tableView == self.MMPipeLineTableView) {
        //        return [GetMMPipeLineView_DSE_Arr count];
        return 1;
    }
    else if (tableView == self.ExpandableTableView) {
        //return  [self.titleArray count];

        return [GetPL_LOBPPL_Arr count];
    }
    else
        return [self.arForTable count];
}
*/
// Customize the appearance of table view cells.
/*
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{

    if (tableView == self.ActivityAdherenceTableView) {

        static NSString* cellIdentifier = @"ActivityAdhCustomCell";

        ActivityAdhCustomCell* activityAdhCustomCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

        if (activityAdhCustomCell == nil) {
            NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"ActivityAdhCustomCell" owner:self options:nil];

            activityAdhCustomCell = [nib objectAtIndex:0];
        }
        return activityAdhCustomCell;
    }
    else if (tableView == self.MMPipeLineTableView) {

        static NSString* cellIdentifier = @"mmPipelineCustomCell";

        mmPipelineCustomCell* mmPipelineCustomCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

        if (mmPipelineCustomCell == nil) {
            NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"mmPipelineCustomCell" owner:self options:nil];

            mmPipelineCustomCell = [nib objectAtIndex:0];
        }
        if (GetMMPipeLineView_DSE_Arr.count > 0 && senderTagFrButton == 1) {

            //            int rowc = indexPath.row;
            mmPipelineCustomCell.C0Lbl.text = [[GetMMPipeLineView_DSE_Arr objectAtIndex:indexPath.row] alias];
            mmPipelineCustomCell.C1ALbl.text = [[GetMMPipeLineView_DSE_Arr objectAtIndex:indexPath.row] alias1];
            mmPipelineCustomCell.C3Lbl.text = [[GetMMPipeLineView_DSE_Arr objectAtIndex:indexPath.row] alias2];
        }
        if (GetMMPipeLineView_DSEApp_Arr.count > 0 && senderTagFrButton == 2)

        {

            //          int rowc = indexPath.row;
            mmPipelineCustomCell.C0Lbl.text = [[GetMMPipeLineView_DSEApp_Arr objectAtIndex:indexPath.row] alias];
            mmPipelineCustomCell.C1ALbl.text = [[GetMMPipeLineView_DSEApp_Arr objectAtIndex:indexPath.row] alias1];
            mmPipelineCustomCell.C3Lbl.text = [[GetMMPipeLineView_DSEApp_Arr objectAtIndex:indexPath.row] alias2];
        }

        return mmPipelineCustomCell;
    }
    else {
        static NSString* cellIdentifier = @"ExpandableCustomCell";

        ExpandableCustomCell* ExpandableCustomCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

        if (ExpandableCustomCell == nil) {
            NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"ExpandableCustomCell" owner:self options:nil];

            ExpandableCustomCell = [nib objectAtIndex:0];
        }
        if (selectedIndex == indexPath.row) {
            //do expandable row work here
        }
        else {
            //do closing stuff here
        }
        //                [GetSalesPipeLineDashboard_DSM_Arr addObject:salesPipelineDashboardDSM];

        //GetLOB_Arr
        
        ExpandableCustomCell.title.text = [GetPL_LOBPPL_Arr objectAtIndex:indexPath.row];
        self.selectedData = [GetPL_LOBPPL_Arr objectAtIndex:indexPath.row];
        ExpandableCustomCell.title.textColor = [UIColor blackColor];
        // NSLog(@"GetSalesPipeLineDashboard_DSMPLAll_Arr count value :%d",[ GetSalesPipeLineDashboard_DSMPLAll_Arr count]);
        //if no data i sthr in array to show nill in other array

        //salesPipeLineDashboardAllPL_DSM.alias3 = [TBXML textForElement:alias3];
        if (GetSalesPipeLineDashboard_DSM_Arr.count > 0) {
            //        int str  = indexPath.row;
            if (GetSalesPipeLineDashboard_DSM_Arr.count > indexPath.row) {
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];

                ExpandableCustomCell.subtitleAlis.text = salesPipelineDashboardDSM.alias;
                ExpandableCustomCell.subtitleAlis1.text = salesPipelineDashboardDSM.alias1;

                ExpandableCustomCell.subtitleAlis2.text = salesPipelineDashboardDSM.alias2;

                ExpandableCustomCell.subtitleAlis3.text = salesPipelineDashboardDSM.alias3;

                ExpandableCustomCell.subtitleAlis4.text = salesPipelineDashboardDSM.alias4;
            }
        }
        if (GetSalesPipeLineDashboard_DSEPLAll_Arr.count > 0) {

            if (GetSalesPipeLineDashboard_DSEPLAll_Arr.count > indexPath.row) {
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSEPLAll_Arr objectAtIndex:indexPath.row];

                ExpandableCustomCell.subtitleAlis.text = salesPipelineDashboardDSM.alias;
                ExpandableCustomCell.subtitleAlis1.text = salesPipelineDashboardDSM.alias1;

                ExpandableCustomCell.subtitleAlis2.text = salesPipelineDashboardDSM.alias2;

                ExpandableCustomCell.subtitleAlis3.text = salesPipelineDashboardDSM.alias3;

                ExpandableCustomCell.subtitleAlis4.text = salesPipelineDashboardDSM.alias4;
            }
        }

        return ExpandableCustomCell;
    }
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{

    self.selectedData = [GetPL_LOBPPL_Arr objectAtIndex:indexPath.row];
    NSLog(@"Selected index valus :%@", self.selectedData);
    if (tableView == self.ExpandableTableView) {
        //        if(selectedIndex==indexPath.row && (GetSalesPipeLineDashboard_DSM_Arr.count >0))
        if (selectedIndex == indexPath.row)

        {
            selectedIndex = -1;
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
            return;
        }
        //user tabs diff row
        if (selectedIndex != -1)

        {
            NSIndexPath* prePath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
            selectedIndex = (int)indexPath.row;
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:prePath, nil] withRowAnimation:UITableViewRowAnimationFade];
        }
        //user select new row with none expandable
        if (selectedIndex == -1) {

            [self GetAllPLDSM];

            selectedIndex = (int)indexPath.row;
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(nonnull NSIndexPath*)indexPath
{
    if (selectedIndex == indexPath.row) {
        return 260;
    }
    else {
        return 34;
    }
}*/
#pragma mark -method to collapse TableView
//To collapse table view -shraddha

#pragma mark -methid to show geo and App detail in  TableView

- (IBAction)ShowMMGeoDetails:(UIButton*)sender
{
    self.MMGeoLbl.text = @"MM Geo";
    senderTagFrButton = [sender tag];
    //tag = 1

    [self.MMPipeLineTableView reloadData];
}

- (IBAction)ShowMMAppDetails:(id)sender
{

    senderTagFrButton = [sender tag];

    self.MMGeoLbl.text = @"MM App";
    [self.MMPipeLineTableView reloadData];
}
#pragma mark - Method Segment Control DSE

- (IBAction)btn_segmentControl:(id)sender
{

    if (segmentControl.selectedSegmentIndex == 0) {
        NSLog(@"---- Segment 0");
        for (id subview in [segmentControl subviews]) {
            if ([subview isSelected]) {
                [subview setTintColor:[UIColor colorWithRed:68.0f / 255.0 green:68.0f / 255.0 blue:68.0f / 255.0 alpha:1.0]];
                self.view_DSEActivity.hidden = NO;
                self.view_DSEPPL.hidden = YES;
                self.segmentControlPPL.hidden = YES;
                [lbl1 setHidden:NO];
            }
            else
                [subview setTintColor:[UIColor lightGrayColor]];
        }
    }
    else if (segmentControl.selectedSegmentIndex == 1) {
        [lbl1 setHidden:YES];
        NSLog(@"---- Segment 1");
        for (id subview in [segmentControl subviews]) {
            if ([subview isSelected]) {
                [subview setTintColor:[UIColor colorWithRed:68.0f / 255.0 green:68.0f / 255.0 blue:68.0f / 255.0 alpha:1.0]];
                self.view_DSEActivity.hidden = YES;
                self.view_DSEPPL.hidden = NO;
                self.segmentControlPPL.hidden = NO;
                [self.tbl_DSE setHidden:NO];
                [self.tbl_ForPPL setHidden:NO];
                self.lbl_ChangeName.text = @"PPL";
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inner---- Segment 0");
                    [self.tbl_DSE reloadData];
                    [self.tbl_ForPPL reloadData];
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    NSLog(@"Inner---- Segment 1");
                    [self.tbl_DSE reloadData];
                    [self.tbl_ForPPL reloadData];
                }
                else {
                    NSLog(@"Inner---- ");
                }
                [self.tbl_DSE reloadData];
                [self.tbl_ForPPL reloadData];
            }
            else {
                [subview setTintColor:[UIColor lightGrayColor]];
            }
        }
    }
    else if (segmentControl.selectedSegmentIndex == 2) {
        NSLog(@"---- Segment 2");
        [lbl1 setHidden:YES];
        for (id subview in [segmentControl subviews]) {
            if ([subview isSelected]) {
                self.view_DSEActivity.hidden = YES;
                self.view_DSEPPL.hidden = NO;
                self.segmentControlPPL.hidden = NO;
                [self.tbl_ForPPL setHidden:YES];
                [self.tbl_DSE setHidden:NO];
                [subview setTintColor:[UIColor colorWithRed:68.0f / 255.0 green:68.0f / 255.0 blue:68.0f / 255.0 alpha:1.0]];
                self.lbl_ChangeName.text = @"MM Geo";
                self.segmentControlPPL.hidden = NO;
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inner---- Segment 2--->0");
                    [self.tbl_DSE reloadData];
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    NSLog(@"Inner---- Segment 2--->1");
                    [self.tbl_DSE reloadData];
                }
                else {
                    NSLog(@"Inner---- ");
                }
            }
            else
                [subview setTintColor:[UIColor lightGrayColor]];
        }
    }
    else if (segmentControl.selectedSegmentIndex == 3) {
        [lbl1 setHidden:YES];
        for (id subview in [segmentControl subviews]) {
            if ([subview isSelected]) {
                self.view_DSEActivity.hidden = YES;
                self.view_DSEPPL.hidden = NO;
                [self.tbl_ForPPL setHidden:YES];
                [self.tbl_DSE setHidden:NO];
                self.segmentControlPPL.hidden = NO;
                [subview setTintColor:[UIColor colorWithRed:68.0f / 255.0 green:68.0f / 255.0 blue:68.0f / 255.0 alpha:1.0]];
                self.lbl_ChangeName.text = @"MM Appliction";
                self.segmentControlPPL.hidden = NO;
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inner---- Segment 3--->0");
                    [self.tbl_DSE reloadData];
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    NSLog(@"Inner---- Segment 3--->1");
                    [self.tbl_DSE reloadData];
                }
                else {
                    NSLog(@"Inner---- ");
                }
            }
            else
                [subview setTintColor:[UIColor lightGrayColor]];
        }
    }
    else {
    }
}

- (IBAction)segmentControlPPL:(id)sender
{

    if (self.segmentControlPPL.selectedSegmentIndex == 0) {
        NSLog(@"Inner---- Segment 0");
        [self.tbl_DSE reloadData];
        [self.tbl_ForPPL reloadData];
    }
    else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
        NSLog(@"Inner---- Segment 1 Control");
        [self.tbl_DSE reloadData];
        [self.tbl_ForPPL reloadData];
    }
    else {
        NSLog(@"Inner---- ");
    }
}
- (void)setSelectedSegmentColor:(UISegmentedControl*)mySegmentedControl
{
    for (int i = 0; i < [mySegmentedControl.subviews count]; i++) {
        if ([[mySegmentedControl.subviews objectAtIndex:i] isSelected]) {
            [[mySegmentedControl.subviews objectAtIndex:i] setTintColor:[UIColor greenColor]];
        }
        else {
            [[mySegmentedControl.subviews objectAtIndex:i] setTintColor:[UIColor redColor]];
        }
    }
}
#pragma mark - Method Segment Control DSM

- (IBAction)segmentControlDSM:(id)sender
{
    if (self.segmentControlDSM.selectedSegmentIndex == 0) {
        NSLog(@"----DSM Segment 0");
        [self.segmentControlDate setHidden:YES];
        [self.segmentControlActivity setHidden:NO];
        [self.view_DSMActivity setHidden:NO];
        [self.View_PipeLine setHidden:YES];
        //  [self.tbl_ActivityDSM reloadData];
        [self.tbl_PipeLine setHidden:YES];
        [self.tbl_DSEwiseDSM setHidden:YES];
    }
    else if (self.segmentControlDSM.selectedSegmentIndex == 1) {
        NSLog(@"----DSM Segment 1");
        [lbl1 setHidden:YES];
        self.lbl_DSMStsrt.text = @"DSE NAME";
        [self.segmentControlActivity setHidden:YES];
        [self.segmentControlDate setHidden:NO];
        [self.view_DSMActivity setHidden:YES];
        [self.View_PipeLine setHidden:NO];
        [self.tbl_PipeLine reloadData];
        [self.tbl_DSEwiseDSM reloadData];
        [self.tbl_PipeLine setHidden:YES];
        [self.tbl_DSEwiseDSM setHidden:NO];
    }
    else if (self.segmentControlDSM.selectedSegmentIndex == 2) {
        NSLog(@"----DSM Segment 2");
        [lbl1 setHidden:YES];
        self.lbl_DSMStsrt.text = @"PPL";
        [self.segmentControlActivity setHidden:YES];
        [self.segmentControlDate setHidden:NO];
        [self.view_DSMActivity setHidden:YES];
        [self.View_PipeLine setHidden:NO];
        [self.tbl_PipeLine reloadData];
        [self.tbl_PipeLine setHidden:NO];
        [self.tbl_DSEwiseDSM setHidden:YES];
    }
    else {
        NSLog(@"--- else Block ----");
    }
}
- (IBAction)segmentControlActivtyDSM:(id)sender
{
    if (segmentControl.selectedSegmentIndex == 0) {
        if (self.segmentControlActivity.selectedSegmentIndex == 0) {
            NSLog(@"---- Segment 0 My Activity");
            [self.Collection_DSM setHidden:NO];
            [self.tbl_ActivityDSM setHidden:YES];
            [self.view_MyActivity setHidden:NO];
            [self.view_TeamActivity setHidden:YES];
            if ([Activities_ListDashBoardArr count] > 0) {
                [self.Collection_DSM reloadData];
            }
            else {
                NSLog(@"-- Collection No Data ");
                [lbl1 setHidden:NO];

            }

            //[self.tbl_PipeLine reloadData];
        }
        else if (self.segmentControlActivity.selectedSegmentIndex == 1) {
            [self.Collection_DSM setHidden:YES];
            [lbl1 setHidden:YES];

            //[self.tbl_ActivityDSM setHidden:NO];
            [self.view_MyActivity setHidden:YES];
            [self.view_TeamActivity setHidden:NO];
            [self.tbl_ActivityDSM setHidden:NO];
            NSLog(@"---- Segment 0 Team Activity");
            if ([listOfNSE_list_Arr2 count] > 0) {
                [self.tbl_ActivityDSM reloadData];
            }
            else {
                NSLog(@"-- Table No Data ");
            }
            //  [self.tbl_ActivityDSM reloadData];
            // [self.tbl_PipeLine reloadData];
        }
    }
    else if (segmentControl.selectedSegmentIndex == 1) {
        if (self.segmentControlActivity.selectedSegmentIndex == 0) {
            NSLog(@"---- Segment 1 My Activity");
            [self.tbl_ActivityDSM setHidden:NO];

            [self.tbl_ActivityDSM reloadData];
            [self.tbl_PipeLine reloadData];
        }
        else if (self.segmentControlActivity.selectedSegmentIndex == 1) {
            NSLog(@"---- Segment 1 My Team Activity");
            [self.tbl_ActivityDSM setHidden:NO];
            [self.tbl_ActivityDSM reloadData];
            [self.tbl_PipeLine reloadData];
        }
    }
    else {
        NSLog(@"--- else Block ----");
    }
}
- (IBAction)segmentControlDate:(id)sender
{

    if (self.segmentControlDSM.selectedSegmentIndex == 1) {
        if (self.segmentControlDate.selectedSegmentIndex == 0) {
            [self.tbl_PipeLine reloadData];
            [self.tbl_DSEwiseDSM reloadData];
        }
        else if (self.segmentControlDate.selectedSegmentIndex == 1) {
            [self.tbl_PipeLine reloadData];
            [self.tbl_DSEwiseDSM reloadData];
        }
    }
    else if (self.segmentControlDSM.selectedSegmentIndex == 2) {
        if (self.segmentControlDate.selectedSegmentIndex == 0) {
            [self.tbl_PipeLine reloadData];
            [self.tbl_DSEwiseDSM reloadData];
        }
        else if (self.segmentControlDate.selectedSegmentIndex == 1) {
            [self.tbl_PipeLine reloadData];
            [self.tbl_DSEwiseDSM reloadData];
        }
    }
}
#pragma mark - Method UICollection Delegates

#pragma mark -
#pragma mark x

/*-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 2;
}*/
- (NSInteger)collectionView:(UICollectionView*)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.collection_View) {
        return [Activities_ListDashBoardArr count];
    }
    if (collectionView == self.Collection_DSM) {
        return [Activities_ListDashBoardArr count];
    }
    return 0;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                 cellForItemAtIndexPath:(NSIndexPath*)indexPath
{

    if (collectionView == self.collection_View) {
        activity_list = nil;
        activity_list = [Activity_List alloc];
        activity_list = [Activities_ListDashBoardArr objectAtIndex:indexPath.row];

        ActivityDashboardCollectionViewCell* myCell = [collectionView
            dequeueReusableCellWithReuseIdentifier:@"ActivityCollection"
                                      forIndexPath:indexPath];

        // myCell.view_CellData.backgroundColor = [UIColor redColor];
        [myCell.view_CellData setBackgroundColor:[UIColor colorWithRed:(245 / 255.0) green:(244 / 255.0) blue:(244 / 255.0) alpha:1]];
        myCell.view_CellData.layer.cornerRadius = 8;
        myCell.view_CellData.layer.borderWidth = 3.0f;
        myCell.view_CellData.layer.borderColor = [UIColor whiteColor].CGColor;
        myCell.lbl_CustomerName.text = activity_list.CONTACT_NAME;
        myCell.lbl_CustomerNumber.text = activity_list.CONTACT_CELL_NUM;
        myCell.lbl_PPl.text = activity_list.PARENT_PRODUCT_NAME;
        myCell.lbl_SalesStage.text = activity_list.SALES_STAGE_NAME;
        myCell.lbl_ActivityType.text = activity_list.ACTIVITY_PENDING_TYPE;
        myCell.lbl_PlannedDateTime.text = activity_list.PLANNED_START_DATE;

        return myCell;
    }
    if (collectionView == self.Collection_DSM) {

        activity_list = nil;
        activity_list = [Activity_List alloc];
        activity_list = [Activities_ListDashBoardArr objectAtIndex:indexPath.row];
        ActivityDashboardDSMCollectionViewCell* myCell1 = [collectionView
            dequeueReusableCellWithReuseIdentifier:@"ActivityCollectionDSM"
                                      forIndexPath:indexPath];
        //Activities_ListDashBoardArr
        // myCell.view_CellData.backgroundColor = [UIColor redColor];
        [myCell1.View_CellDSMData setBackgroundColor:[UIColor colorWithRed:(245 / 255.0) green:(244 / 255.0) blue:(244 / 255.0) alpha:1]];
        myCell1.View_CellDSMData.layer.cornerRadius = 4;
        myCell1.View_CellDSMData.layer.borderWidth = 2.0f;
        myCell1.View_CellDSMData.layer.borderColor = [UIColor whiteColor].CGColor;
        myCell1.lbl_CustomerName.text = activity_list.CONTACT_NAME;
        myCell1.lbl_CustomerNumber.text = activity_list.CONTACT_CELL_NUM;
        myCell1.lbl_PPL.text = activity_list.PARENT_PRODUCT_NAME;
        myCell1.lbl_SalesStages.text = activity_list.SALES_STAGE_NAME;
        myCell1.lbl_ActivityType.text = activity_list.ACTIVITY_PENDING_TYPE;
        myCell1.lbl_PlannedDateTime.text = activity_list.PLANNED_START_DATE;
        return myCell1;
    }
    return 0;
}

#pragma mark -
#pragma mark UITableViewViewDataSource

- (void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0 || indexPath.row == ([indexPath length] - 1)) {
        // cell.layer.cornerRadius = 10;
    }
    //cell.layer.cornerRadius = 10;
    cell.layer.borderWidth = 2.0f;
    cell.layer.borderColor = [UIColor colorWithRed:(229 / 255.0) green:(229 / 255.0) blue:(229 / 255.0) alpha:1].CGColor;

    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }

    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }

    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (tableView == self.tbl_DSE) {
        PPl_DashobardTableViewCell* cell;
        static NSString* MyIdentifier = @"DashoBord_Cell";
        cell = [self.tbl_DSE dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil) {
            cell = [[PPl_DashobardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                     reuseIdentifier:MyIdentifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        //cell.backgroundColor=[UIColor redColor];
        cell.lbl_Name.textColor = [UIColor blackColor];
        if (self.segmentControl) {
            if (segmentControl.selectedSegmentIndex == 0) {
            }
            else if (segmentControl.selectedSegmentIndex == 1) {
                /*if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inside ");
                    salesPipelineDashboardDSM = nil;
                    salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM alloc];
                    salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];
                    cell.lbl_Name.text = salesPipelineDashboardDSM.PPL;
                    cell.lbl_C0.text = salesPipelineDashboardDSM.alias;
                    cell.lbl_C1.text = salesPipelineDashboardDSM.alias1;
                    cell.lbl_C1A.text = salesPipelineDashboardDSM.alias2;
                    cell.lbl_C2.text = salesPipelineDashboardDSM.alias3;
                    cell.lbl_C3.text = salesPipelineDashboardDSM.alias4;
                    cell.lbl_total.text=@"Today";
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    salesPipelineDashboardDSM60 = nil;
                    salesPipelineDashboardDSM60 = [GetSalesPipeLineDashboard_DSM alloc];
                    salesPipelineDashboardDSM60 = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];
                    cell.lbl_Name.text = salesPipelineDashboardDSM60.PPL;
                    cell.lbl_C0.text = salesPipelineDashboardDSM60.alias;
                    cell.lbl_C1.text = salesPipelineDashboardDSM60.alias1;
                    cell.lbl_C1A.text = salesPipelineDashboardDSM60.alias2;
                    cell.lbl_C2.text = salesPipelineDashboardDSM60.alias3;
                    cell.lbl_C3.text = salesPipelineDashboardDSM60.alias4;
                }
                else {
                }*/
            }
            else if (segmentControl.selectedSegmentIndex == 2) {
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    getMMPipeLineView_DSE = nil;
                    getMMPipeLineView_DSE = [GetMMPipeLineView_DSE alloc];
                    getMMPipeLineView_DSE = [GetMMPipeLineView_DSE_Arr objectAtIndex:indexPath.row];
                    cell.lbl_Name.text = getMMPipeLineView_DSE.LOGIN;
                    cell.lbl_C0.text = getMMPipeLineView_DSE.alias;
                    cell.lbl_C1.text = getMMPipeLineView_DSE.alias1;
                    cell.lbl_C1A.text = getMMPipeLineView_DSE.alias2;
                    cell.lbl_C2.text = getMMPipeLineView_DSE.alias3;
                    cell.lbl_C3.text = getMMPipeLineView_DSE.alias4;
                    //cell.lbl_total.text = @"-";
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    getMMPipeLineView_DSE = nil;
                    getMMPipeLineView_DSE = [GetMMPipeLineView_DSE alloc];
                    getMMPipeLineView_DSE = [GetMMPipeLineView_DSECurrentMonth_Arr objectAtIndex:indexPath.row];
                    cell.lbl_Name.text = getMMPipeLineView_DSE.LOGIN;
                    cell.lbl_C0.text = getMMPipeLineView_DSE.alias;
                    cell.lbl_C1.text = getMMPipeLineView_DSE.alias1;
                    cell.lbl_C1A.text = getMMPipeLineView_DSE.alias2;
                    cell.lbl_C2.text = getMMPipeLineView_DSE.alias3;
                    cell.lbl_C3.text = getMMPipeLineView_DSE.alias4;
                    // cell.lbl_total.text = @"-";
                }
            }
            else if (segmentControl.selectedSegmentIndex == 3) {
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inside  %@", GetMMApplication_DSEApp_Arr);
                    getMMPipeLineView_DSE = nil;
                    getMMPipeLineView_DSE = [GetMMPipeLineView_DSE alloc];
                    getMMPipeLineView_DSE = [GetMMApplication_DSEAppCurrent_Arr objectAtIndex:indexPath.row];
                    cell.lbl_Name.text = getMMPipeLineView_DSE.LOGIN;
                    cell.lbl_C0.text = getMMPipeLineView_DSE.alias;
                    cell.lbl_C1.text = getMMPipeLineView_DSE.alias1;
                    cell.lbl_C1A.text = getMMPipeLineView_DSE.alias2;
                    cell.lbl_C2.text = getMMPipeLineView_DSE.alias3;
                    cell.lbl_C3.text = getMMPipeLineView_DSE.alias4;
                    //cell.lbl_total.text = @"-";
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    getMMPipeLineView_DSE = nil;
                    getMMPipeLineView_DSE = [GetMMPipeLineView_DSE alloc];
                    getMMPipeLineView_DSE = [GetMMApplication_DSEApp60_Arr objectAtIndex:indexPath.row];
                    cell.lbl_Name.text = getMMPipeLineView_DSE.LOGIN;
                    cell.lbl_C0.text = getMMPipeLineView_DSE.alias;
                    cell.lbl_C1.text = getMMPipeLineView_DSE.alias1;
                    cell.lbl_C1A.text = getMMPipeLineView_DSE.alias2;
                    cell.lbl_C2.text = getMMPipeLineView_DSE.alias3;
                    cell.lbl_C3.text = getMMPipeLineView_DSE.alias4;
                    //cell.lbl_total.text = @"-";
                }
            }
        }

        return cell;
    }
    else if (tableView == self.tbl_DSEwiseDSM) {

        if (self.segmentControlDSM) {

            if (self.segmentControlDSM.selectedSegmentIndex == 0) {
            }
            else if (self.segmentControlDSM.selectedSegmentIndex == 1) {
                if (self.segmentControlDate.selectedSegmentIndex == 0) {

                    DSEwisePipeLineForDSECell* cell;
                    static NSString* MyIdentifier = @"DSewise_PipeLineCellDSM";
                    cell = [self.tbl_DSEwiseDSM dequeueReusableCellWithIdentifier:MyIdentifier];
                    if (cell == nil) {
                        cell = [[DSEwisePipeLineForDSECell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                reuseIdentifier:MyIdentifier];
                    }
                    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

                    dSEWisePipeLine_Object = nil;
                    dSEWisePipeLine_Object = [[DSEWisePipeLine_Object alloc] init];
                    dSEWisePipeLine_Object = [DSEWisePipeLine_Object_Arr objectAtIndex:indexPath.row];

                    cell.lbl_DSeName.text = dSEWisePipeLine_Object.DSE_NAME;
                    cell.lbl_C0.text = dSEWisePipeLine_Object.alias;
                    cell.lbl_c1.text = dSEWisePipeLine_Object.alias1;
                    cell.lbl_C2.text = dSEWisePipeLine_Object.alias2;
                    cell.lbl_C22.text = dSEWisePipeLine_Object.alias3;
                    cell.lbl_C3.text = dSEWisePipeLine_Object.alias4;
                    //cell.lbl_Total.text = @"India";
                    NSLog(@"--- DSE Name :%@", dSEWisePipeLine_Object.DSE_NAME);
                    NSLog(@"----Login NAme :%@", cell.lbl_DSeName.text);
                    //cell.backgroundColor=[UIColor redColor];

                    return cell;
                }
                else if (self.segmentControlDate.selectedSegmentIndex == 1) {

                    DSEwisePipeLineForDSECell* cell;
                    static NSString* MyIdentifier = @"DSewise_PipeLineCellDSM";
                    cell = [self.tbl_DSEwiseDSM dequeueReusableCellWithIdentifier:MyIdentifier];
                    if (cell == nil) {
                        cell = [[DSEwisePipeLineForDSECell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                reuseIdentifier:MyIdentifier];
                    }
                    //DSEWisePipeLine_Object_Arr1
                    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    dSEWisePipeLine_Object = nil;
                    dSEWisePipeLine_Object = [[DSEWisePipeLine_Object alloc] init];
                    dSEWisePipeLine_Object = [DSEWisePipeLine_Object_Arr1 objectAtIndex:indexPath.row];

                    cell.lbl_DSeName.text = dSEWisePipeLine_Object.DSE_NAME;
                    cell.lbl_C0.text = dSEWisePipeLine_Object.alias;
                    cell.lbl_c1.text = dSEWisePipeLine_Object.alias1;
                    cell.lbl_C2.text = dSEWisePipeLine_Object.alias2;
                    cell.lbl_C22.text = dSEWisePipeLine_Object.alias3;
                    cell.lbl_C3.text = dSEWisePipeLine_Object.alias4;
                    //cell.lbl_Total.text = @"MH";
                    return cell;
                }
                else {
                }
            }
            else if (self.segmentControlDSM.selectedSegmentIndex == 2) {
            }
            //   return 0;
        }
    }
    else if (tableView == self.tbl_ActivityDSM) {
        ActivityDSMTableViewCell* cell;

        listOfNSE_list2 = nil;
        listOfNSE_list2 = [ListOfNSE alloc];
        listOfNSE_list2 = [listOfNSE_list_Arr objectAtIndex:indexPath.row];

        listOfNSE_list = nil;
        listOfNSE_list = [ListOfNSE alloc];
        listOfNSE_list = [listOfNSE_list_Arr2 objectAtIndex:indexPath.row];

        /*listOfNSE_list30Days = nil;
        listOfNSE_list30Days = [ListOfNSE alloc];
        listOfNSE_list30Days = [listOfNSE_list_Arr30Days objectAtIndex:indexPath.row];*/

        static NSString* MyIdentifier = @"Dashobard_DSMActivity";
        cell = [self.tbl_ActivityDSM dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil) {
            cell = [[ActivityDSMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:MyIdentifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.lbl_DSEName.text = listOfNSE_list2.NSE_LOBDSE_NAME;
        cell.lbl_TodayActivity.text = listOfNSE_list.USERIDM;
        cell.lbl_Last30Days.text = listOfNSE_list.USERIDM;

        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    else if (tableView == self.tbl_ForPPL) {
        if (self.segmentControl) {
            if (segmentControl.selectedSegmentIndex == 0) {
            }
            else if (segmentControl.selectedSegmentIndex == 1) {

                if (self.segmentControlPPL.selectedSegmentIndex == 0) {

                    DashBoard_DSEPLLViewCell* cell;
                    static NSString* MyIdentifier = @"DashBoard_ForPPLCell";
                    cell = [self.tbl_ForPPL dequeueReusableCellWithIdentifier:MyIdentifier];
                    if (cell == nil) {
                        cell = [[DashBoard_DSEPLLViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                               reuseIdentifier:MyIdentifier];
                    }
                    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];

                    NSLog(@"Inside :%lu", (unsigned long)[GetSalesPipeLineDashboard_DSM_Arr count]);
                    salesPipelineDashboardDSM = nil;
                    salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM alloc];
                    salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];
                    cell.lbl_PPL.text = salesPipelineDashboardDSM.PPL;
                    cell.lbl_C0.text = salesPipelineDashboardDSM.alias;
                    cell.lbl_C1.text = salesPipelineDashboardDSM.alias1;
                    cell.lbl_C1A.text = salesPipelineDashboardDSM.alias2;
                    cell.lbl_C2.text = salesPipelineDashboardDSM.alias3;
                    cell.lbl_C3.text = salesPipelineDashboardDSM.alias4;
                    //cell.lbl_Total.text = @"Indian";
                    // cell.textLabel.text=@"ek";
                    //cell.backgroundColor=[UIColor redColor];
                    return cell;
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {

                    DashBoard_DSEPLLViewCell* cell;
                    static NSString* MyIdentifier = @"DashBoard_ForPPLCell";
                    cell = [self.tbl_ForPPL dequeueReusableCellWithIdentifier:MyIdentifier];
                    if (cell == nil) {
                        cell = [[DashBoard_DSEPLLViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                               reuseIdentifier:MyIdentifier];
                    }
                    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    salesPipelineDashboardDSM60 = nil;
                    salesPipelineDashboardDSM60 = [GetSalesPipeLineDashboard_DSM alloc];
                    salesPipelineDashboardDSM60 = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];
                    cell.lbl_PPL.text = salesPipelineDashboardDSM60.PPL;
                    cell.lbl_C0.text = salesPipelineDashboardDSM60.alias;
                    cell.lbl_C1.text = salesPipelineDashboardDSM60.alias1;
                    cell.lbl_C1A.text = salesPipelineDashboardDSM60.alias2;
                    cell.lbl_C2.text = salesPipelineDashboardDSM60.alias3;
                    cell.lbl_C3.text = salesPipelineDashboardDSM60.alias4;
                    //cell.lbl_Total.text = @"9";
                    return cell;
                }
                else {
                }
            }
            else if (segmentControl.selectedSegmentIndex == 2) {
            }
            else if (segmentControl.selectedSegmentIndex == 3) {
            }
        }
        return 0;
    }
    else if (tableView == self.tbl_PipeLine) {
        //PipeLine_Cell

        //        if (self.segmentControlDSM.selectedSegmentIndex == 1) {
        //           /* if (self.segmentControlDate.selectedSegmentIndex == 0) {
        //
        //                PipeLineTableViewCell* cell;
        //                salesPipelineDashboardDSM = nil;
        //                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
        //                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];
        //
        //                static NSString* MyIdentifier = @"PipeLine_Cell"; //GetSalesPipeLineDashboard_DSM_Arr
        //                cell = [self.tbl_PipeLine dequeueReusableCellWithIdentifier:MyIdentifier];
        //                if (cell == nil) {
        //                    cell = [[PipeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
        //                                                        reuseIdentifier:MyIdentifier];
        //                }
        //                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        //                //cell.textLabel.text=@"India";
        //                cell.lbl_PPL.text = salesPipelineDashboardDSM.PPL;
        //                cell.lbl_C0.text = salesPipelineDashboardDSM.alias;
        //                cell.lbl_C1.text = salesPipelineDashboardDSM.alias1;
        //                cell.lbl_C1A.text = salesPipelineDashboardDSM.alias2;
        //                cell.lbl_C2.text = salesPipelineDashboardDSM.alias3;
        //                cell.lbl_C3.text = salesPipelineDashboardDSM.alias4;
        //                cell.lbl_Total.text=@"India";
        //
        //                return cell;
        //            }
        //            else if (self.segmentControlDate.selectedSegmentIndex == 1) {
        //                PipeLineTableViewCell* cell;
        //                salesPipelineDashboardDSM = nil;
        //                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
        //                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];
        //                static NSString* MyIdentifier = @"PipeLine_Cell";
        //                cell = [self.tbl_PipeLine dequeueReusableCellWithIdentifier:MyIdentifier];
        //                if (cell == nil) {
        //                    cell = [[PipeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
        //                                                        reuseIdentifier:MyIdentifier];
        //                }
        //                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        //                //cell.textLabel.text=@"India";
        //                cell.lbl_PPL.text = salesPipelineDashboardDSM.PPL;
        //                cell.lbl_C0.text = salesPipelineDashboardDSM.alias;
        //                cell.lbl_C1.text = salesPipelineDashboardDSM.alias1;
        //                cell.lbl_C1A.text = salesPipelineDashboardDSM.alias2;
        //                cell.lbl_C2.text = salesPipelineDashboardDSM.alias3;
        //                cell.lbl_C3.text = salesPipelineDashboardDSM.alias4;
        //                cell.lbl_Total.text=@"MH";
        //                return cell;
        //            }
        //            */
        //        }
        if (self.segmentControlDSM.selectedSegmentIndex == 2) {

            if (self.segmentControlDate.selectedSegmentIndex == 0) {

                PipeLineTableViewCell* cell;
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];

                static NSString* MyIdentifier = @"PipeLine_Cell"; //GetSalesPipeLineDashboard_DSM_Arr
                cell = [self.tbl_PipeLine dequeueReusableCellWithIdentifier:MyIdentifier];
                if (cell == nil) {
                    cell = [[PipeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:MyIdentifier];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                //cell.textLabel.text=@"India";
                cell.lbl_PPL.text = salesPipelineDashboardDSM.PPL;
                cell.lbl_C0.text = salesPipelineDashboardDSM.alias;
                cell.lbl_C1.text = salesPipelineDashboardDSM.alias1;
                cell.lbl_C1A.text = salesPipelineDashboardDSM.alias2;
                cell.lbl_C2.text = salesPipelineDashboardDSM.alias3;
                cell.lbl_C3.text = salesPipelineDashboardDSM.alias4;
                //cell.lbl_Total.text = @"India";
                cell.userInteractionEnabled = YES;

                return cell;
            }
            else if (self.segmentControlDate.selectedSegmentIndex == 1) {
                PipeLineTableViewCell* cell;
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];
                static NSString* MyIdentifier = @"PipeLine_Cell";
                cell = [self.tbl_PipeLine dequeueReusableCellWithIdentifier:MyIdentifier];
                if (cell == nil) {
                    cell = [[PipeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:MyIdentifier];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                //cell.textLabel.text=@"India";
                cell.lbl_PPL.text = salesPipelineDashboardDSM.PPL;
                cell.lbl_C0.text = salesPipelineDashboardDSM.alias;
                cell.lbl_C1.text = salesPipelineDashboardDSM.alias1;
                cell.lbl_C1A.text = salesPipelineDashboardDSM.alias2;
                cell.lbl_C2.text = salesPipelineDashboardDSM.alias3;
                cell.lbl_C3.text = salesPipelineDashboardDSM.alias4;
                //cell.lbl_Total.text = @"MH";
                cell.userInteractionEnabled = YES;
                return cell;
            }
        }
    }
    return 0;
    //DashoBord_Cell
}
- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section
{

    if (tableView == self.tbl_DSE) {
        if (self.segmentControl) {
            if (segmentControl.selectedSegmentIndex == 0) {
                return [Activities_ListDashBoardArr count];
            }
            else if (segmentControl.selectedSegmentIndex == 1) {

                return 3;
                /*  if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inner---- Segment 0");//GetSalesPipeLineDashboard_DSM_Arr
                    NSLog(@" GetSalesPipeLineDashboard_DSM_Arr Count :%lu",(unsigned long)[GetSalesPipeLineDashboard_DSM_Arr count]);
                    return [GetSalesPipeLineDashboard_DSM_Arr count];
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    NSLog(@"Inner---- Segment 1");
                    NSLog(@" GetSalesPipeLineDashboard_DSM60Days_Arr Count :%lu",(unsigned long)[GetSalesPipeLineDashboard_DSM60Days_Arr count]);
                    return [GetSalesPipeLineDashboard_DSM60Days_Arr count];
                }
                else {
                    NSLog(@"Inner---- ");
                }*/
            }
            else if (segmentControl.selectedSegmentIndex == 2) {
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inner---- Segment 2<----0"); //
                    NSLog(@" GetSalesPipeLineDashboard_DSM_Arr Count :%lu", (unsigned long)[GetMMPipeLineView_DSE_Arr count]);
                    return [GetMMPipeLineView_DSE_Arr count];
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    NSLog(@"Inner---- Segment 2<---- 1");
                    NSLog(@" GetSalesPipeLineDashboard_DSM60Days_Arr Count :%lu", (unsigned long)[GetMMPipeLineView_DSECurrentMonth_Arr count]);
                    return [GetMMPipeLineView_DSECurrentMonth_Arr count];
                }
            }
            else if (self.segmentControl.selectedSegmentIndex == 3) {
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    //return   [GetMMApplication_DSEApp_Arr count];
                    return [GetMMApplication_DSEAppCurrent_Arr count];
                    //return [GetSalesPipeLineDashboard_DSM_Arr count];GetSalesPipeLineDashboard_DSM_Arr
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    return [GetMMApplication_DSEApp60_Arr count];
                    //GetMMApplication_DSEApp_Arr
                    //  return 4;
                }
            }
            /*else if (segmentControl.selectedSegmentIndex == 3) {
                return 2;
            }*/
        }
    }
    else if (tableView == self.tbl_ForPPL) {
        if (self.segmentControl) {
            if (segmentControl.selectedSegmentIndex == 0) {
                //return [Activities_ListDashBoardArr count];
            }
            else if (segmentControl.selectedSegmentIndex == 1) {
                if (self.segmentControlPPL.selectedSegmentIndex == 0) {
                    NSLog(@"Inner---- Segment 0"); //GetSalesPipeLineDashboard_DSM_Arr
                    NSLog(@" GetSalesPipeLineDashboard_DSM_Arr Count :%lu", (unsigned long)[GetSalesPipeLineDashboard_DSM_Arr count]);
                    return [GetSalesPipeLineDashboard_DSM_Arr count];
                }
                else if (self.segmentControlPPL.selectedSegmentIndex == 1) {
                    NSLog(@"Inner---- Segment 1");
                    NSLog(@" GetSalesPipeLineDashboard_DSM60Days_Arr Count :%lu", (unsigned long)[GetSalesPipeLineDashboard_DSM60Days_Arr count]);
                    return [GetSalesPipeLineDashboard_DSM60Days_Arr count];
                }
                else {
                    NSLog(@"Inner---- ");
                }
            }
        }
    }
    else if (tableView == self.tbl_ActivityDSM) {
        if (self.segmentControlActivity) {
            if (self.segmentControlActivity.selectedSegmentIndex == 0) {
                return [listOfNSE_list_Arr1 count];
            }
            else if (self.segmentControlActivity.selectedSegmentIndex == 1) {
                return [listOfNSE_list_Arr1 count];
            }
        }
    }
    else if (tableView == self.tbl_PipeLine) {

        if (self.segmentControlDSM.selectedSegmentIndex == 0) {
            //
        }
        else if (self.segmentControlDSM.selectedSegmentIndex == 1) {
        }
        else if (self.segmentControlDSM.selectedSegmentIndex == 2) {
            if (self.segmentControlDate.selectedSegmentIndex == 0) {

                return [GetSalesPipeLineDashboard_DSM_Arr count];
                //return [GetSalesPipeLineDashboard_DSM_Arr count];GetSalesPipeLineDashboard_DSM_Arr
            }
            else if (self.segmentControlDate.selectedSegmentIndex == 1) {
                return [GetSalesPipeLineDashboard_DSM60Days_Arr count];
            }
        }
    }
    else if (tableView == self.tbl_DSEwiseDSM) {
        if (self.segmentControlDSM.selectedSegmentIndex == 0) {
            //
        }
        else if (self.segmentControlDSM.selectedSegmentIndex == 1) {

            if (self.segmentControlDate.selectedSegmentIndex == 0) {
                return [DSEWisePipeLine_Object_Arr count];
                //return 2;
            }
            else if (self.segmentControlDate.selectedSegmentIndex == 1) {
                return [DSEWisePipeLine_Object_Arr1 count];
                //return 5;
            }
        }
        else if (self.segmentControlDSM.selectedSegmentIndex == 2) {
        }
    }
    return 0;
}
#pragma mark -
#pragma mark UITableViewViewDelegates

- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSLog(@"did Selectes :%ld", (long)indexPath.row);

    //PipeLineDrilforPL_arr=[[NSMutableArray alloc] init];

    if (tableView == self.tbl_PipeLine) {

        if (self.segmentControlDSM.selectedSegmentIndex == 2) {

            if (self.segmentControlDate.selectedSegmentIndex == 0) {

                //GetSalesPipeLineDashboard_DSM_Arr
                if (PipeLineDrilforPL_arr) {
                    [PipeLineDrilforPL_arr removeAllObjects];
                }

                FlagStatus = 1;
                PipeLineTableViewCell* cell;
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];

                static NSString* MyIdentifier = @"PipeLine_Cell";
                cell = [self.tbl_PipeLine dequeueReusableCellWithIdentifier:MyIdentifier];
                if (cell == nil) {
                    cell = [[PipeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:MyIdentifier];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                salesPipelineDashboardDSMForPL = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];
                if (selectedIndex1 == indexPath.row) {
                    selectedIndex1 = -1;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
                    return;
                }
                if (selectedIndex1 != -1) {
                    NSIndexPath* prePath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
                    selectedIndex1 = (int)indexPath.row;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:prePath, nil] withRowAnimation:UITableViewRowAnimationFade];
                }
                if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"] || [userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh1" object:self];

                    self.selectedData = [[GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row] PPL];
                    NSLog(@"---Selectred data for PPL for 0:%@", self.selectedData);
                    [self CallPLDrilFromPPL];
                    flagForDril = 1;
                } //For NEEV
                else {
                    self.selectedData = [GetLOB_Arr objectAtIndex:indexPath.row];
                    [self GetAllPPL];
                }
                selectedIndex1 = (int)indexPath.row;
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
            }
            else if (self.segmentControlDate.selectedSegmentIndex == 1) {

                if (PipeLineDrilforPL_arr) {
                    [PipeLineDrilforPL_arr removeAllObjects];
                }

                PipeLineTableViewCell* cell;
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [[GetSalesPipeLineDashboard_DSM alloc] init];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];
                static NSString* MyIdentifier = @"PipeLine_Cell";
                FlagStatus = 2;
                salesPipelineDashboardDSMForPL = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];
                cell = [self.tbl_PipeLine dequeueReusableCellWithIdentifier:MyIdentifier];
                if (cell == nil) {
                    cell = [[PipeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:MyIdentifier];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                if (selectedIndex1 == indexPath.row) {
                    selectedIndex1 = -1;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
                    return;
                }
                if (selectedIndex1 != -1) {
                    NSIndexPath* prePath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
                    selectedIndex1 = (int)indexPath.row;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:prePath, nil] withRowAnimation:UITableViewRowAnimationFade];
                }
                if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"] || [userDetailsVal_.POSITION_TYPE isEqual:@"DSE"])

                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh1" object:self];
                    self.selectedData = [[GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row] PPL];
                    NSLog(@"---Selectred data for PPL for 0:%@", self.selectedData);
                    [self CallPLDrilFromPPL];
                    flagForDril = 2;
                } //For NEEV
                else {
                    self.selectedData = [GetLOB_Arr objectAtIndex:indexPath.row];
                    [self GetAllPPL];
                }
                selectedIndex1 = (int)indexPath.row;
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
            }
        }
    }
    else if (tableView == self.tbl_ForPPL) {

        if (self.segmentControl.selectedSegmentIndex == 1) {

            if (self.segmentControlPPL.selectedSegmentIndex == 0) {

                /*
                 DashBoard_DSEPLLViewCell* cell;
                 static NSString* MyIdentifier = @"DashBoard_ForPPLCell";
                 cell = [self.tbl_ForPPL dequeueReusableCellWithIdentifier:MyIdentifier];
                 if (cell == nil) {
                 cell = [[DashBoard_DSEPLLViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:MyIdentifier];
                 }
                 //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                 
                 NSLog(@"Inside ");
                 salesPipelineDashboardDSM = nil;
                 salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM alloc];
                 salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];
                 cell.lbl_PPL.text=salesPipelineDashboardDSM.PPL;
                 cell.lbl_C0.text=salesPipelineDashboardDSM.alias;
                 cell.lbl_C1.text=salesPipelineDashboardDSM.alias1;
                 cell.lbl_C1A.text=salesPipelineDashboardDSM.alias2;
                 cell.lbl_C2.text=salesPipelineDashboardDSM.alias3;
                 cell.lbl_C3.text=salesPipelineDashboardDSM.alias4;
                 cell.lbl_Total.text=@"Indian";
                 // cell.textLabel.text=@"ek";
                 //cell.backgroundColor=[UIColor redColor];
                 return cell;
                 }
                 */

                if (PipeLineDrilforPL_arr) {
                    [PipeLineDrilforPL_arr removeAllObjects];
                }

                FlagStatus = 1;
                DashBoard_DSEPLLViewCell* cell;
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM alloc];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];

                static NSString* MyIdentifier = @"DashBoard_ForPPLCell";

                cell = [self.tbl_ForPPL dequeueReusableCellWithIdentifier:MyIdentifier];
                if (cell == nil) {
                    cell = [[DashBoard_DSEPLLViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                           reuseIdentifier:MyIdentifier];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                salesPipelineDashboardDSEForPL = [GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row];
                if (selectedIndex1 == indexPath.row) {
                    selectedIndex1 = -1;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
                    return;
                }
                if (selectedIndex1 != -1) {
                    NSIndexPath* prePath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
                    selectedIndex1 = (int)indexPath.row;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:prePath, nil] withRowAnimation:UITableViewRowAnimationFade];
                }
                if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"] || [userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh1" object:self];
                    self.selectedData = [[GetSalesPipeLineDashboard_DSM_Arr objectAtIndex:indexPath.row] PPL];
                    NSLog(@"---Selectred data for PPL :%@", self.selectedData);
                    flagForDril = 1;
                    [self CallPLDrilFromPPL];
                } //For NEEV
                else {
                    self.selectedData = [GetLOB_Arr objectAtIndex:indexPath.row];
                    [self GetAllPPL];
                }
                selectedIndex1 = (int)indexPath.row;
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
            }
            else if (self.segmentControlPPL.selectedSegmentIndex == 1) {

                if (PipeLineDrilforPL_arr) {
                    [PipeLineDrilforPL_arr removeAllObjects];
                }

                DashBoard_DSEPLLViewCell* cell;
                salesPipelineDashboardDSM = nil;
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM alloc];
                salesPipelineDashboardDSM = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];

                static NSString* MyIdentifier = @"DashBoard_ForPPLCell";
                FlagStatus = 2;
                salesPipelineDashboardDSEForPL = [GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row];
                cell = [self.tbl_PipeLine dequeueReusableCellWithIdentifier:MyIdentifier];
                if (cell == nil) {
                    cell = [[DashBoard_DSEPLLViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                           reuseIdentifier:MyIdentifier];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                if (selectedIndex1 == indexPath.row) {
                    selectedIndex1 = -1;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
                    return;
                }
                if (selectedIndex1 != -1) {
                    NSIndexPath* prePath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
                    selectedIndex1 = (int)indexPath.row;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:prePath, nil] withRowAnimation:UITableViewRowAnimationFade];
                }
                if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"] || [userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh1" object:self];
                    self.selectedData = [[GetSalesPipeLineDashboard_DSM60Days_Arr objectAtIndex:indexPath.row] PPL];
                    NSLog(@"---Selectred data for PPL :%@", self.selectedData);
                    flagForDril = 2;
                    [self CallPLDrilFromPPL];
                } //For NEEV
                else {
                    self.selectedData = [GetLOB_Arr objectAtIndex:indexPath.row];
                    [self GetAllPPL];
                }
                selectedIndex1 = (int)indexPath.row;
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
            }
        }
    }
}
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{

    UIScreen* mainScreen = [UIScreen mainScreen];
    NSLog(@"Screen bounds: %@, Screen resolution: %@, scale: %f, nativeScale: %f",
        NSStringFromCGRect(mainScreen.bounds), mainScreen.coordinateSpace, [UIScreen mainScreen].scale, mainScreen.nativeScale);

    if (selectedIndex1 == indexPath.row) {

        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {

            if ([UIScreen mainScreen].bounds.size.height == 667) {

                return 280;
            }
            //return 100;

            else if ([UIScreen mainScreen].scale > 2.9) {

                return 290;
            }
            else {
                return 270;
            }
        }
        else

            if ([UIScreen mainScreen].bounds.size.height == 1024) {

            return 20;
        }

        return 234;
    }

    return 38;
}
- (void)CallPLDrilFromPPL
{
    if (flagForDril == 1) {
        /*
     @"<fromdate>01-JAN-2015</fromdate>"
     @"<todate>01-JAN-2016</todate>"
     */
        NSLog(@"Selected :%@", self.selectedData);
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"<PPL>'%@'</PPL>"
                                     @"</GetSalesPipeLineDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 FirstDayofCurrentMonth, str_CurrentDate, userDetailsVal_.PRIMARY_EMP, self.selectedData];
    }
    else if (flagForDril == 2) {
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"<PPL>'%@'</PPL>"
                                     @"</GetSalesPipeLineDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 MonthDate, str_CurrentDate, userDetailsVal_.PRIMARY_EMP, self.selectedData];
    }
    else {
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"<PPL>'%@'</PPL>"
                                     @"</GetSalesPipeLineDashboard_DSE>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 MonthDate, str_CurrentDate, userDetailsVal_.PRIMARY_EMP, self.selectedData];
    }

    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getSalesPipeLineDashboard_CallPLDrilFromPPL"];
} //SalesPipeLineDashboard_CallPLDrilFromPPL_Found
- (void)SalesPipeLineDashboard_CallPLDrilFromPPL_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Get MMApplicationDashboard_DSE60Days_Found  %@ ", response);

    if (PipeLineDrilforPL_arr) {
        [PipeLineDrilforPL_arr removeAllObjects];
    }
    //Connection Timed Out
    if ([response isEqual:@""]) {

        [self hideAlert];

        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM1 message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else {
        }
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];

        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM message:@"Request Timed Out .Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM1 message:@"Request Timed Out .Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else {
        }
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];

        if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            // [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:PostionforDSM1 message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            //  [alertView show];
        }
        else {
        }
    }
    else {
        if (PipeLineDrilforPL_arr) {
            [PipeLineDrilforPL_arr removeAllObjects];
        }
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetSalesPipeLineDashboard_DSEResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                pipeLineDrilforPL = nil;
                pipeLineDrilforPL = [[PipeLineDrilforPL alloc] init];

                TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* LOGIN = [TBXML childElementNamed:@"PL" parentElement:table];
                pipeLineDrilforPL.PL = [TBXML textForElement:LOGIN];

                TBXMLElement* alias = [TBXML childElementNamed:@"alias" parentElement:table];
                pipeLineDrilforPL.C0 = [TBXML textForElement:alias];

                TBXMLElement* alias1 = [TBXML childElementNamed:@"alias1" parentElement:table];
                pipeLineDrilforPL.C1 = [TBXML textForElement:alias1];

                TBXMLElement* alias2 = [TBXML childElementNamed:@"alias2" parentElement:table];
                pipeLineDrilforPL.C1A = [TBXML textForElement:alias2];

                TBXMLElement* alias3 = [TBXML childElementNamed:@"alias3" parentElement:table];
                pipeLineDrilforPL.C2 = [TBXML textForElement:alias3];

                TBXMLElement* alias4 = [TBXML childElementNamed:@"alias4" parentElement:table];
                pipeLineDrilforPL.C3 = [TBXML textForElement:alias4];

                NSLog(@"\n str_NSE  MM : %@", pipeLineDrilforPL);
                [PipeLineDrilforPL_arr addObject:pipeLineDrilforPL];
                [[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr addObject:pipeLineDrilforPL];
            } while ((tuple = tuple->nextSibling));
            NSLog(@"Sales Stages :%@", PipeLineDrilforPL_arr);
            NSLog(@"Sales Stages  GetSalesStagesFromPPLtoPL: %lu", (unsigned long)[PipeLineDrilforPL_arr count]);
            if ((PipeLineDrilforPL_arr.count) > 0) {
                [self hideAlert];
                if ([userDetailsVal_.POSITION_TYPE isEqualToString:@"DSM"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
                }
                else {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh1" object:self];
                }
            }
            else if ([[SingletonClass sharedobject].GetSalesPipeLineDashboard_DSMPLAll_singleTonArr count] > 0) {
                if ([userDetailsVal_.POSITION_TYPE isEqualToString:@"DSM"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:self];
                }
                else {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh1" object:self];
                }
            }
        }
        else {
            if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM]) {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:PostionforDSM message:@"No Data Found .Please try another one" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
          //      [alert show];
            }
            else if ([userDetailsVal_.POSITION_TYPE isEqual:PostionforDSM1]) {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:PostionforDSM1 message:@"No Data Found .Please try another one" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            //    [alert show];
            }
        }
    }
}
- (void)dismissPop
{
    if ([self.masterPopoverController isPopoverVisible]) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

@end