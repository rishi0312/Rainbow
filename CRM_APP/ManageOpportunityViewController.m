//
//  ManageOpportunityViewController.m
//  CRM_APP
//
//  Created by admin on 23/09/15.
//  Copyright © 2015 TataTechnologies. All rights reserved.
//

#import "AppDelegate.h"
#import "DSE.h"
#import "DSM.h"
#import "MBProgressHUD.h"
#import "ManageOpportunityViewController.h"
#import "ManageOpportunity_ViewCell.h"
#import "ManageOpportunity_ViewCell.h"
#import "OpportunityDetailsViewController.h"
#import "Opportunity_List.h"
#import "Reachability.h"
#import "RequestDelegate.h"
#import "TBXML.h"

@interface ManageOpportunityViewController () {
    UIAlertView* alert;
    Reachability* internetReachable;
    Reachability* hostReachable;
    NetworkStatus internetActive, hostActive;
    NSArray* datearray;
    NSString *optycreationdate, *date, *time, *stringdate;
    NSMutableArray *optydate, *datens;
    NSArray* drafts;
    NSDateFormatter* dateFormatter;
    NSMutableArray* nsedsearray;
    NSString* primaryidstring;
    NSString* optystringfromdate;
    NSString* optystringtodate,*str_CurrentDate_Manage,*LastSevenDays_Manage;
}
@end

@implementation ManageOpportunityViewController
@synthesize tbl_opportunity;
@synthesize ResultCount;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showAlert];
    NSLog(@"Manage Opportunity :");
    [tbl_opportunity setHidden:YES];
    self.tbl_opportunity.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    primaryidstring = @"";
    NSDate* now = [NSDate date];
    NSLog(@"new date %@", now);

    NSDate* sevenDaysAgo = [now dateByAddingTimeInterval:-7 * 24 * 60 * 60];
    //   NSLog(@"7 days ago: %@", sevenDaysAgo);

    nsedsearray = [[NSMutableArray alloc] init];

    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];

    NSString* convertedString1 = [dateFormatter stringFromDate:now];
    NSLog(@"Converted String : %@", convertedString1);

    NSString* convertedString2 = [dateFormatter stringFromDate:now];
    NSLog(@"Converted String2 : %@", convertedString2);

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nback.png"] forBarMetrics:UIBarMetricsDefault];
    self.splitViewController.delegate = self;
    self.masterPopoverController.delegate = self;
    UIBarButtonItem* barButtonItem = self.splitViewController.displayModeButtonItem;
    barButtonItem.title = @"Show master";
    self.navigationItem.leftBarButtonItem = barButtonItem;
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //AppDelegate instance
    NSLog(@"Samlp Art Master: %@", appdelegate.artifact);
    userDetailsVal_ = [UserDetails_Var sharedmanager]; // usedetails instance
    NSLog(@"Samlp Art Master: %@", userDetailsVal_.ROW_ID);

    appdelegate.flagget = 0;

    if (![self connected]) {
        [tbl_opportunity setHidden:YES];
        NSLog(@"Newtwork not Available...");
        alert = [[UIAlertView alloc] initWithTitle:@"CRM" message:@"The Internet connection appears to be offline." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {

        self.tbl_opportunity.delegate = self;
        self.tbl_opportunity.dataSource = self;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    NSError* error;
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];

    NSEntityDescription* entity = [NSEntityDescription entityForName:@"DSM"
                                              inManagedObjectContext:appdelegate.managedObjectContext];
    [fetchRequest setEntity:entity];

    drafts = [appdelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];

    NSLog(@"count value %lu", (unsigned long)[drafts count]);
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MMM-yyyy";
    str_CurrentDate_Manage = [formatter stringFromDate:[NSDate date]];
    
    str_CurrentDate_Manage = [str_CurrentDate_Manage uppercaseStringWithLocale:[NSLocale currentLocale]];
    NSLog(@"Upper Case: Current Date %@", str_CurrentDate_Manage);
    
    NSDate* sevenDaysAgo_Manage = [now dateByAddingTimeInterval:-7 * 24 * 60 * 60];
    NSLog(@"60 days ago: %@", sevenDaysAgo_Manage);
    LastSevenDays_Manage = [formatter stringFromDate:sevenDaysAgo_Manage];
    LastSevenDays_Manage = [LastSevenDays_Manage uppercaseStringWithLocale:[NSLocale currentLocale]];
    NSLog(@"Upper Case: Last 7  Days  %@", LastSevenDays_Manage);
    optystringfromdate =LastSevenDays_Manage;
    optystringtodate = str_CurrentDate_Manage;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{

    if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]) {

        [self callnsedse];
    }
    else {

        [self CallOpportunityList];
    }

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(OpportunityList_Found:) name:@"OpportunityList_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ListOfNseOrDseForDSM_Found:) name:@"ListOfNseOrDseForDSM_Found" object:nil];

    [super viewWillAppear:animated];
    self.splitViewController.delegate = self;
    UIBarButtonItem* barButtonItem = self.splitViewController.displayModeButtonItem;
    barButtonItem.title = @"Show master";
    self.navigationItem.leftBarButtonItem = barButtonItem;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"OpportunityList_Found" object:nil]; //Gomzy // For opportunity Count

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ListOfNseOrDseForDSM_Found" object:nil]; //Gomzy // For opportunity Count

    NSLog(@"End1");
}
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return OpportunityList_ArrList.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1; // in your case, there are 3 cells
}
- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10; // you can have your own choice, of course
}
- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{

    opportunity_list = [OpportunityList_ArrList objectAtIndex:indexPath.row];

    NSLog(@"Row Selected ... %ld", (long)indexPath.row);
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath
{

    opportunity_list = nil;
    opportunity_list = [[Opportunity_List alloc] init];
    opportunity_list = [OpportunityList_ArrList objectAtIndex:indexPath.row];
    NSLog(@"...Print . %@", OpportunityList_ArrList);

    static NSString* MyIdentifier = @"Manage_Cell";

    ManageOpportunity_ViewCell* cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];

    if (cell == nil) {
        cell = [[ManageOpportunity_ViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.manage_main_view.layer setBorderColor:[UIColor colorWithRed:(229 / 255.0) green:(229 / 255.0) blue:(229 / 255.0) alpha:1].CGColor];
    [cell.manage_main_view.layer setBorderWidth:2.0f];
    cell.manage_main_view.layer.cornerRadius = 5;

    cell.lbl_productname.text = opportunity_list.PRODUCT_NAME;
    cell.lbl_salesstage.text = opportunity_list.SALE_STAGE_NAME;
    cell.lbl_customername.text = opportunity_list.CONTACT_NAME;
    cell.lbl_customercellno.text = opportunity_list.CONTACT_CELL_NUMBER;
    cell.lbl_optycreationdate.text = opportunity_list.OPTY_CREAT_DATE;
    cell.lbl_lastpendingactivity.text = opportunity_list.LAST_PENDING_ACTIVITY_TYPE;

    if (cell.lbl_productname.text.length == 0) {

        cell.lbl_productname.text = @"Not Available";
    }
    if (cell.lbl_salesstage.text.length == 0) {

        cell.lbl_salesstage.text = @"Not Available";
    }

    if (cell.lbl_customername.text.length == 0) {

        cell.lbl_customername.text = @"Not Available";
    }
    if (cell.lbl_customercellno.text.length == 0) {

        cell.lbl_customercellno.text = @"Not Available";
    }
    if (cell.lbl_optycreationdate.text.length == 0) {

        cell.lbl_optycreationdate.text = @"Not Available";
    }
    if (cell.lbl_lastpendingactivity.text.length == 0) {

        cell.lbl_lastpendingactivity.text = @"Not Available";
    }
    return cell;
}

// Internet check code :
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

    [self performSegueWithIdentifier:@"infoView" sender:self];
}
- (void)logOut_btn
{

    alert = [[UIAlertView alloc] initWithTitle:@""
                                       message:@"Are you sure you want to Logout ?"
                                      delegate:self
                             cancelButtonTitle:@"No"
                             otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (void)CallOpportunityList
{

    NSLog(@"inside...List of opportunity %@", userDetailsVal_.POSTN);
    NSString* envelopeText;
    if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {
        NSLog(@"NDRM Opportunuty List");

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<GetListOfOpportunityNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<position_name></position_name>"
                                     @"<businessname></businessname>"
                                     @"</GetListOfOpportunityNeev>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.ROW_ID];
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"])

    {
        NSLog(@"DSM Opportunuty List");

        NSLog(@"DSM Opportunuty List");
        NSLog(@"request%@", envelopeText);
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<SearchOpptyBasedOnCriteriaForDsm xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<salestagename>C0 (Prospecting)</salestagename>"
                                     @"<pplname></pplname>"
                                     @"<tehsilname></tehsilname>"
                                     @"<assignname></assignname>"
                                     @"<customercellnumber></customercellnumber>"
                                     @"<contactfirstname></contactfirstname>"
                                     @"<attr1></attr1>"
                                     @"<attr2></attr2>"
                                     @"<attr3></attr3>"
                                     @"<dsepositionid></dsepositionid>"
                                     @"<contactlastname></contactlastname>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"<Campainid></Campainid>"
                                     @"<Buid>%@</Buid>"
                                     @"</SearchOpptyBasedOnCriteriaForDsm>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 optystringfromdate, optystringtodate, primaryidstring, userDetailsVal_.ORGID];
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {

        NSLog(@"DSM Opportunuty List");
        NSLog(@"request%@", envelopeText);
        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<SearchOpptyBasedOnCriteriaForDsm xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<salestagename>C0 (Prospecting)</salestagename>"
                                     @"<pplname></pplname>"
                                     @"<tehsilname></tehsilname>"
                                     @"<assignname></assignname>"
                                     @"<customercellnumber></customercellnumber>"
                                     @"<contactfirstname></contactfirstname>"
                                     @"<attr1></attr1>"
                                     @"<attr2></attr2>"
                                     @"<attr3></attr3>"
                                     @"<dsepositionid></dsepositionid>"
                                     @"<contactlastname></contactlastname>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"<Campainid></Campainid>"
                                     @"<Buid>%@</Buid>"
                                     @"</SearchOpptyBasedOnCriteriaForDsm>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 optystringfromdate, optystringtodate, userDetailsVal_.PRIMARY_EMP, userDetailsVal_.ORGID];

        //
        //        envelopeText =[NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        //                       @"  <SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        //                       @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
        //                       @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
        //                       @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
        //                       @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
        //                       @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
        //                       @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
        //                       @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
        //                       @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e4a1-376f7691964d</DC>"
        //                       @"</Logger>"
        //                       @"</header>"
        //                       @"</SOAP:Header>"
        //                       @"<SOAP:Body>"
        //                       @"<GetListOfOpportunitySFA xmlns=\"com.cordys.tatamotors.masfasiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
        //                       @"<positionid>%@</positionid>"
        //                       @" <position_name />"
        //                       @"<businessname />"
        //                       @"<rang1>1</rang1>"
        //                       @"<rang2>15</rang2>"
        //                       @"</GetListOfOpportunitySFA>"
        //                       @"</SOAP:Body>"
        //                       @"</SOAP:Envelope>",userDetailsVal_.POSITION_ID];
    }
    NSLog(@"\n envlopeString Of OPP!!!!%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSLog(@"Request.... %@", request);
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getListofOpportunity"];
}
- (void)OpportunityList_Found:(NSNotification*)notification
{
    OpportunityList_ArrList = [[NSMutableArray alloc] init];
    OpportunityListDisplayArr = [[NSMutableArray alloc] init];

    if (OpportunityList_ArrList) {
    }
    NSError* err;
    int i = 0;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n List of Opportunity Response %@ ", response);
    if ([response isEqual:@""]) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Something gone wrong . Please try agin" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([@"SearchOpptyBasedOnCriteriaResponse" isEqual:@""]) {
    }
    else {

        if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"GetListOfOpportunityNeevResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (OpportunityList_ArrList) {
                [OpportunityList_ArrList removeAllObjects];
            }
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self.tbl_opportunity setHidden:NO];

                do {

                    opportunity_list = nil;
                    opportunity_list = [[Opportunity_List alloc] init];

                    TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                    TBXMLElement* OPTY_ID = [TBXML childElementNamed:@"OPTY_ID" parentElement:table];
                    opportunity_list.OPTY_ID = [TBXML textForElement:OPTY_ID];
                    NSLog(@"OptyID Opty Id : %@", opportunity_list.OPTY_ID);

                    TBXMLElement* OPTY_NAME = [TBXML childElementNamed:@"OPTY_NAME" parentElement:table];
                    opportunity_list.OPTY_NAME = [TBXML textForElement:OPTY_NAME];
                    NSLog(@"OptyNAme : %@", opportunity_list.OPTY_NAME);

                    TBXMLElement* OPTY_CREATED_DATE = [TBXML childElementNamed:@"OPTY_CREATED_DATE" parentElement:table];
                    opportunity_list.OPTY_CREAT_DATE = [TBXML textForElement:OPTY_CREATED_DATE];
                    NSLog(@"OptyNAme : %@", opportunity_list.OPTY_CREAT_DATE);

                    TBXMLElement* PRODUCT_NAME = [TBXML childElementNamed:@"PRODUCT_NAME" parentElement:table];
                    opportunity_list.PRODUCT_NAME = [TBXML textForElement:PRODUCT_NAME];
                    NSLog(@"OptyNAme : %@", opportunity_list.PRODUCT_NAME);

                    TBXMLElement* PRODUCT_ID = [TBXML childElementNamed:@"PRODUCT_ID" parentElement:table];
                    opportunity_list.PRODUCT_ID = [TBXML textForElement:PRODUCT_ID];
                    NSLog(@"OptyNAme : %@", opportunity_list.PRODUCT_ID);

                    TBXMLElement* VC = [TBXML childElementNamed:@"VC" parentElement:table];
                    opportunity_list.VC = [TBXML textForElement:VC];
                    NSLog(@"OptyNAme : %@", opportunity_list.VC);

                    TBXMLElement* TGM_TKM_NAME = [TBXML childElementNamed:@"TGM_TKM_NAME" parentElement:table];
                    opportunity_list.TGM_TKM_NAME = [TBXML textForElement:TGM_TKM_NAME];
                    NSLog(@"OptyNAme : %@", opportunity_list.TGM_TKM_NAME);

                    TBXMLElement* TGM_TKM_PHONE_NUMBER = [TBXML childElementNamed:@"TGM_TKM_PHONE_NUMBER" parentElement:table];
                    opportunity_list.TGM_TKM_PHONE_NUMBER = [TBXML textForElement:TGM_TKM_PHONE_NUMBER];
                    NSLog(@"OptyNAme : %@", opportunity_list.TGM_TKM_PHONE_NUMBER);

                    TBXMLElement* ACCOUNT_ID = [TBXML childElementNamed:@"ACCOUNT_ID" parentElement:table];
                    opportunity_list.ACCOUNT_ID = [TBXML textForElement:ACCOUNT_ID];
                    NSLog(@"OptyNAme : %@", opportunity_list.ACCOUNT_ID);

                    TBXMLElement* ACCOUNT_TYPE = [TBXML childElementNamed:@"ACCOUNT_TYPE" parentElement:table];
                    opportunity_list.ACCOUNT_TYPE = [TBXML textForElement:ACCOUNT_TYPE];
                    NSLog(@"OptyNAme : %@", opportunity_list.ACCOUNT_TYPE);

                    TBXMLElement* SALES_STAGE_DATE = [TBXML childElementNamed:@"SALE_STAGE_UPDATED_DATE" parentElement:table];
                    opportunity_list.SALES_STAGE_DATE = [TBXML textForElement:SALES_STAGE_DATE];
                    NSLog(@"OptyNAme : %@", opportunity_list.SALES_STAGE_DATE);

                    TBXMLElement* SALE_STAGE_NAME = [TBXML childElementNamed:@"SALES_STAGE_NAME" parentElement:table];
                    opportunity_list.SALE_STAGE_NAME = [TBXML textForElement:SALE_STAGE_NAME];
                    NSLog(@"OptyNAme : %@", opportunity_list.SALE_STAGE_NAME);

                    TBXMLElement* LEAD_ASSIGNED_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_NAME" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_NAME = [TBXML textForElement:LEAD_ASSIGNED_NAME];

                    TBXMLElement* LEAD_ASSIGNED_CELL_NUMBER = [TBXML childElementNamed:@"LEAD_ASSIGNED_CELL_NUMBER" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_CELL_NUMBER = [TBXML textForElement:LEAD_ASSIGNED_CELL_NUMBER];

                    TBXMLElement* LEAD_POSITION = [TBXML childElementNamed:@"LEAD_POSITION" parentElement:table];
                    opportunity_list.LEAD_POSITION = [TBXML textForElement:LEAD_POSITION];

                    TBXMLElement* LEAD_ASSIGNED_POSITION_ID = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_ID" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_POSITION_ID = [TBXML textForElement:LEAD_ASSIGNED_POSITION_ID];

                    TBXMLElement* CONTACT_NAME = [TBXML childElementNamed:@"CONTACT_NAME" parentElement:table];
                    opportunity_list.CONTACT_NAME = [TBXML textForElement:CONTACT_NAME];

                    TBXMLElement* CONTACT_FIRST_NAME = [TBXML childElementNamed:@"CONTACT_FIRST_NAME" parentElement:table];
                    opportunity_list.CONTACT_FIRST_NAME = [TBXML textForElement:CONTACT_FIRST_NAME];

                    TBXMLElement* CONTACT_LAST_NAME = [TBXML childElementNamed:@"CONTACT_LAST_NAME" parentElement:table];
                    opportunity_list.CONTACT_LAST_NAME = [TBXML textForElement:CONTACT_LAST_NAME];

                    TBXMLElement* CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:table];
                    opportunity_list.CONTACT_ID = [TBXML textForElement:CONTACT_ID];

                    TBXMLElement* CONTACT_ADDRESS = [TBXML childElementNamed:@"CONTACT_ADDRESS" parentElement:table];
                    opportunity_list.CONTACT_ADDRESS = [TBXML textForElement:CONTACT_ADDRESS];

                    TBXMLElement* ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:table];
                    opportunity_list.ADDRESS_ID = [TBXML textForElement:ADDRESS_ID];

                    TBXMLElement* CONTACT_CELL_NUMBER = [TBXML childElementNamed:@"CONTACT_CELL_NUMBER" parentElement:table];
                    opportunity_list.CONTACT_CELL_NUMBER = [TBXML textForElement:CONTACT_CELL_NUMBER];

                    TBXMLElement* LAST_PENDING_ACTIVITY_TYPE = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_TYPE" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_TYPE = [TBXML textForElement:LAST_PENDING_ACTIVITY_TYPE];

                    TBXMLElement* LAST_PENDING_ACTIVITY_ID = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_ID" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_ID = [TBXML textForElement:LAST_PENDING_ACTIVITY_ID];

                    TBXMLElement* LAST_PENDING_ACTIVITY_STATUS = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_STATUS" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_STATUS = [TBXML textForElement:LAST_PENDING_ACTIVITY_STATUS];

                    TBXMLElement* LAST_PEND_ACTIVIY_START_DATE = [TBXML childElementNamed:@"LAST_PEND_ACTIVIY_START_DATE" parentElement:table];
                    opportunity_list.LAST_PEND_ACTIVIY_START_DATE = [TBXML textForElement:LAST_PEND_ACTIVIY_START_DATE];

                    TBXMLElement* LAST_PENDING_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_DESC" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_DESC = [TBXML textForElement:LAST_PENDING_ACTIVITY_DESC];

                    TBXMLElement* LAST_DONE_ACTIVITY_ID = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_ID" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_ID = [TBXML textForElement:LAST_DONE_ACTIVITY_ID];

                    TBXMLElement* LAST_DONE_ACTIVITY_DATE = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DATE" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_DATE = [TBXML textForElement:LAST_DONE_ACTIVITY_DATE];

                    TBXMLElement* LAST_DONE_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DESC" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_DESC = [TBXML textForElement:LAST_DONE_ACTIVITY_DESC];
                    /*
                     TBXMLElement *X_TALUKA = [TBXML childElementNamed:@"X_TALUKA" parentElement:table];
                     opportunity_list.X_TALUKA = [TBXML textForElement:X_TALUKA];
                     */
                    TBXMLElement* PRODUCT_NAME1 = [TBXML childElementNamed:@"PRODUCT_NAME1" parentElement:table];
                    opportunity_list.PRODUCT_NAME1 = [TBXML textForElement:PRODUCT_NAME1];

                    TBXMLElement* CUSTOMER_ACCOUNT_NAME = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_NAME" parentElement:table];
                    opportunity_list.CUSTOMER_ACCOUNT_NAME = [TBXML textForElement:CUSTOMER_ACCOUNT_NAME];

                    TBXMLElement* CUSTOMER_ACCOUNT_ID = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_ID" parentElement:table];
                    opportunity_list.CUSTOMER_ACCOUNT_ID = [TBXML textForElement:CUSTOMER_ACCOUNT_ID];

                    TBXMLElement* REV_PRODUCT_ID = [TBXML childElementNamed:@"REV_PRODUCT_ID" parentElement:table];
                    opportunity_list.REV_PRODUCT_ID = [TBXML textForElement:REV_PRODUCT_ID];

                    [OpportunityList_ArrList addObject:opportunity_list];

                } while ((tuple = tuple->nextSibling));
                NSLog(@"\nOpportunityListDisplayArr......%lu", (unsigned long)[OpportunityList_ArrList count]);

                if ([OpportunityList_ArrList count] > 0) {
                    [self hideAlert];
                    [self.tbl_opportunity reloadData];
                }
            }
            else {
                [self hideAlert];
                [self.tbl_opportunity setHidden:YES];
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No opportunities found for last 7 days" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

                [alert show];
            }
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]) {

            NSLog(@"User Postion :%@", userDetailsVal_.POSTN);
            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"SearchOpptyBasedOnCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (OpportunityList_ArrList) {
                [OpportunityList_ArrList removeAllObjects];
            }
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self.tbl_opportunity setHidden:NO];
                do {
                    opportunity_list = nil;
                    opportunity_list = [[Opportunity_List alloc] init];

                    TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                    TBXMLElement* OPTY_NAME = [TBXML childElementNamed:@"OPTY_NAME" parentElement:table];
                    opportunity_list.OPTY_NAME = [TBXML textForElement:OPTY_NAME];
                    NSLog(@"OptyID : %@", opportunity_list.OPTY_ID);

                    TBXMLElement* OPTY_ID = [TBXML childElementNamed:@"OPTY_ID" parentElement:table];
                    opportunity_list.OPTY_ID = [TBXML textForElement:OPTY_ID];

                    TBXMLElement* PRODUCT_NAME1 = [TBXML childElementNamed:@"PRODUCT_NAME1" parentElement:table];
                    opportunity_list.PRODUCT_NAME1 = [TBXML textForElement:PRODUCT_NAME1];

                    TBXMLElement* OPTY_CREAT_DATE = [TBXML childElementNamed:@"OPTY_CREATED_DATE" parentElement:table];
                    opportunity_list.OPTY_CREAT_DATE = [TBXML textForElement:OPTY_CREAT_DATE];
                    NSLog(@"OptyID : %@", opportunity_list.OPTY_CREAT_DATE);

                    TBXMLElement* PRODUCT_ID = [TBXML childElementNamed:@"PRODUCT_ID" parentElement:table];
                    opportunity_list.PRODUCT_ID = [TBXML textForElement:PRODUCT_ID];

                    TBXMLElement* VC = [TBXML childElementNamed:@"VC" parentElement:table];
                    opportunity_list.VC = [TBXML textForElement:VC];

                    TBXMLElement* TGM_TKM_NAME = [TBXML childElementNamed:@"TGM_TKM_NAME" parentElement:table];
                    opportunity_list.TGM_TKM_NAME = [TBXML textForElement:TGM_TKM_NAME];

                    TBXMLElement* TGM_TKM_PHONE_NUMBER = [TBXML childElementNamed:@"TGM_TKM_PHONE_NUMBER" parentElement:table];
                    opportunity_list.TGM_TKM_PHONE_NUMBER = [TBXML textForElement:TGM_TKM_PHONE_NUMBER];

                    TBXMLElement* ACCOUNT_ID = [TBXML childElementNamed:@"ACCOUNT_ID" parentElement:table];
                    opportunity_list.ACCOUNT_ID = [TBXML textForElement:ACCOUNT_ID];

                    TBXMLElement* ACCOUNT_TYPE = [TBXML childElementNamed:@"ACCOUNT_TYPE" parentElement:table];
                    opportunity_list.ACCOUNT_TYPE = [TBXML textForElement:ACCOUNT_TYPE];

                    TBXMLElement* SALE_STAGE_NAME = [TBXML childElementNamed:@"SALES_STAGE_NAME" parentElement:table];
                    opportunity_list.SALE_STAGE_NAME = [TBXML textForElement:SALE_STAGE_NAME];

                    TBXMLElement* SALES_STAGE_DATE = [TBXML childElementNamed:@"SALE_STAGE_UPDATED_DATE" parentElement:table];
                    opportunity_list.SALES_STAGE_DATE = [TBXML textForElement:SALES_STAGE_DATE];

                    TBXMLElement* LEAD_ASSIGNED_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_NAME" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_NAME = [TBXML textForElement:LEAD_ASSIGNED_NAME];

                    TBXMLElement* LEAD_ASSIGNED_CELL_NUMBER = [TBXML childElementNamed:@"LEAD_ASSIGNED_CELL_NUMBER" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_CELL_NUMBER = [TBXML textForElement:LEAD_ASSIGNED_CELL_NUMBER];

                    TBXMLElement* LEAD_POSITION = [TBXML childElementNamed:@"LEAD_POSITION" parentElement:table];
                    opportunity_list.LEAD_POSITION = [TBXML textForElement:LEAD_POSITION];

                    TBXMLElement* LEAD_ASSIGNED_POSITION_ID = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_ID" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_POSITION_ID = [TBXML textForElement:LEAD_ASSIGNED_POSITION_ID];

                    TBXMLElement* CONTACT_NAME = [TBXML childElementNamed:@"CONTACT_NAME" parentElement:table];
                    opportunity_list.CONTACT_NAME = [TBXML textForElement:CONTACT_NAME];

                    TBXMLElement* CONTACT_FIRST_NAME = [TBXML childElementNamed:@"CONTACT_FIRST_NAME" parentElement:table];
                    opportunity_list.CONTACT_FIRST_NAME = [TBXML textForElement:CONTACT_FIRST_NAME];

                    TBXMLElement* CONTACT_LAST_NAME = [TBXML childElementNamed:@"CONTACT_LAST_NAME" parentElement:table];
                    opportunity_list.CONTACT_LAST_NAME = [TBXML textForElement:CONTACT_LAST_NAME];

                    TBXMLElement* CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:table];
                    opportunity_list.CONTACT_ID = [TBXML textForElement:CONTACT_ID];

                    TBXMLElement* CONTACT_ADDRESS = [TBXML childElementNamed:@"CONTACT_ADDRESS" parentElement:table];
                    opportunity_list.CONTACT_ADDRESS = [TBXML textForElement:CONTACT_ADDRESS];

                    TBXMLElement* ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:table];
                    opportunity_list.ADDRESS_ID = [TBXML textForElement:ADDRESS_ID];

                    TBXMLElement* CONTACT_CELL_NUMBER = [TBXML childElementNamed:@"CONTACT_CELL_NUMBER" parentElement:table];
                    opportunity_list.CONTACT_CELL_NUMBER = [TBXML textForElement:CONTACT_CELL_NUMBER];
                    NSLog(@"CONTACT_CELL_NUMBER:%@", opportunity_list.CONTACT_CELL_NUMBER);

                    TBXMLElement* LAST_PENDING_ACTIVITY_TYPE = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_TYPE" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_TYPE = [TBXML textForElement:LAST_PENDING_ACTIVITY_TYPE];

                    TBXMLElement* LAST_PENDING_ACTIVITY_ID = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_ID" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_ID = [TBXML textForElement:LAST_PENDING_ACTIVITY_ID];

                    TBXMLElement* LAST_PENDING_ACTIVITY_STATUS = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_STATUS" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_STATUS = [TBXML textForElement:LAST_PENDING_ACTIVITY_STATUS];

                    TBXMLElement* LAST_PEND_ACTIVIY_START_DATE = [TBXML childElementNamed:@"LAST_PEND_ACTIVIY_START_DATE" parentElement:table];
                    opportunity_list.LAST_PEND_ACTIVIY_START_DATE = [TBXML textForElement:LAST_PEND_ACTIVIY_START_DATE];

                    TBXMLElement* LAST_PENDING_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_DESC" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_DESC = [TBXML textForElement:LAST_PENDING_ACTIVITY_DESC];

                    TBXMLElement* LAST_DONE_ACTIVITY_TYPE = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_TYPE" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_TYPE = [TBXML textForElement:LAST_DONE_ACTIVITY_TYPE];

                    TBXMLElement* LAST_DONE_ACTIVITY_DATE = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DATE" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_DATE = [TBXML textForElement:LAST_DONE_ACTIVITY_DATE];

                    TBXMLElement* LAST_DONE_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DESC" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_DESC = [TBXML textForElement:LAST_DONE_ACTIVITY_DESC];

                    TBXMLElement* PRODUCT_NAME = [TBXML childElementNamed:@"PRODUCT_NAME" parentElement:table];
                    opportunity_list.PRODUCT_NAME = [TBXML textForElement:PRODUCT_NAME];

                    TBXMLElement* CUSTOMER_ACCOUNT_NAME = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_NAME" parentElement:table];
                    opportunity_list.CUSTOMER_ACCOUNT_NAME = [TBXML textForElement:CUSTOMER_ACCOUNT_NAME];
                    NSLog(@"OptyID : %@", opportunity_list.CUSTOMER_ACCOUNT_NAME);

                    TBXMLElement* CUSTOMER_ACCOUNT_ID = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_ID" parentElement:table];
                    opportunity_list.CUSTOMER_ACCOUNT_ID = [TBXML textForElement:CUSTOMER_ACCOUNT_ID];

                    TBXMLElement* CUSTOMER_PHONE_NUMBER = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_MOBNUMBER" parentElement:table];
                    opportunity_list.CUSTOMER_PHONE_NUMBER = [TBXML textForElement:CUSTOMER_PHONE_NUMBER];
                    NSLog(@"OptyID : %@", opportunity_list.CUSTOMER_PHONE_NUMBER);

                    TBXMLElement* REV_PRODUCT_ID = [TBXML childElementNamed:@"REV_PRODUCT_ID" parentElement:table];
                    opportunity_list.REV_PRODUCT_ID = [TBXML textForElement:REV_PRODUCT_ID];

                    TBXMLElement* FIN_ID = [TBXML childElementNamed:@"FIN_ID" parentElement:table];
                    opportunity_list.FIN_ID = [TBXML textForElement:FIN_ID];

                    TBXMLElement* FIN_NAME = [TBXML childElementNamed:@"FIN_NAME" parentElement:table];
                    opportunity_list.FIN_NAME = [TBXML textForElement:FIN_NAME];

                    TBXMLElement* CMP_ID = [TBXML childElementNamed:@"CMP_ID" parentElement:table];
                    opportunity_list.Campaign_ID = [TBXML textForElement:CMP_ID];

                    TBXMLElement* CMP_NAME = [TBXML childElementNamed:@"CMP_NAME" parentElement:table];
                    opportunity_list.Campaign_NAME = [TBXML textForElement:CMP_NAME];

                    i++;

                    NSLog(@"\n test opp.... %d!!!\n", i);

                    [OpportunityList_ArrList addObject:opportunity_list];

                } while ((tuple = tuple->nextSibling));
                NSLog(@"\nOpportunityListDisplayArr......%lu", (unsigned long)[OpportunityList_ArrList count]);
                if ([OpportunityList_ArrList count] > 0) {
                    [self hideAlert];
                    [self.tbl_opportunity reloadData];
                }
            }
            else {
                [self hideAlert];
                [self.tbl_opportunity setHidden:YES];
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No opportunities found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }

        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"])

        {

            [self hideAlert];
            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"SearchOpptyBasedOnCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (OpportunityList_ArrList) {
                [OpportunityList_ArrList removeAllObjects];
            }
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self.tbl_opportunity setHidden:NO];

                do {

                    opportunity_list = nil;
                    opportunity_list = [[Opportunity_List alloc] init];

                    TBXMLElement* table = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                    TBXMLElement* OPTY_NAME = [TBXML childElementNamed:@"OPTY_NAME" parentElement:table];
                    opportunity_list.OPTY_NAME = [TBXML textForElement:OPTY_NAME];
                    NSLog(@"OptyID : %@", opportunity_list.OPTY_ID);

                    TBXMLElement* OPTY_ID = [TBXML childElementNamed:@"OPTY_ID" parentElement:table];
                    opportunity_list.OPTY_ID = [TBXML textForElement:OPTY_ID];

                    TBXMLElement* PRODUCT_NAME1 = [TBXML childElementNamed:@"PRODUCT_NAME1" parentElement:table];
                    opportunity_list.PRODUCT_NAME1 = [TBXML textForElement:PRODUCT_NAME1];

                    TBXMLElement* OPTY_CREAT_DATE = [TBXML childElementNamed:@"OPTY_CREATED_DATE" parentElement:table];
                    opportunity_list.OPTY_CREAT_DATE = [TBXML textForElement:OPTY_CREAT_DATE];
                    NSLog(@"OptyID : %@", opportunity_list.OPTY_CREAT_DATE);

                    TBXMLElement* PRODUCT_ID = [TBXML childElementNamed:@"PRODUCT_ID" parentElement:table];
                    opportunity_list.PRODUCT_ID = [TBXML textForElement:PRODUCT_ID];

                    TBXMLElement* VC = [TBXML childElementNamed:@"VC" parentElement:table];
                    opportunity_list.VC = [TBXML textForElement:VC];

                    TBXMLElement* TGM_TKM_NAME = [TBXML childElementNamed:@"TGM_TKM_NAME" parentElement:table];
                    opportunity_list.TGM_TKM_NAME = [TBXML textForElement:TGM_TKM_NAME];

                    TBXMLElement* TGM_TKM_PHONE_NUMBER = [TBXML childElementNamed:@"TGM_TKM_PHONE_NUMBER" parentElement:table];
                    opportunity_list.TGM_TKM_PHONE_NUMBER = [TBXML textForElement:TGM_TKM_PHONE_NUMBER];

                    TBXMLElement* ACCOUNT_ID = [TBXML childElementNamed:@"ACCOUNT_ID" parentElement:table];
                    opportunity_list.ACCOUNT_ID = [TBXML textForElement:ACCOUNT_ID];

                    TBXMLElement* ACCOUNT_TYPE = [TBXML childElementNamed:@"ACCOUNT_TYPE" parentElement:table];
                    opportunity_list.ACCOUNT_TYPE = [TBXML textForElement:ACCOUNT_TYPE];

                    TBXMLElement* SALE_STAGE_NAME = [TBXML childElementNamed:@"SALES_STAGE_NAME" parentElement:table];
                    opportunity_list.SALE_STAGE_NAME = [TBXML textForElement:SALE_STAGE_NAME];

                    TBXMLElement* SALES_STAGE_DATE = [TBXML childElementNamed:@"SALE_STAGE_UPDATED_DATE" parentElement:table];
                    opportunity_list.SALES_STAGE_DATE = [TBXML textForElement:SALES_STAGE_DATE];

                    TBXMLElement* LEAD_ASSIGNED_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_NAME" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_NAME = [TBXML textForElement:LEAD_ASSIGNED_NAME];

                    TBXMLElement* LEAD_ASSIGNED_CELL_NUMBER = [TBXML childElementNamed:@"LEAD_ASSIGNED_CELL_NUMBER" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_CELL_NUMBER = [TBXML textForElement:LEAD_ASSIGNED_CELL_NUMBER];

                    TBXMLElement* LEAD_POSITION = [TBXML childElementNamed:@"LEAD_POSITION" parentElement:table];
                    opportunity_list.LEAD_POSITION = [TBXML textForElement:LEAD_POSITION];

                    TBXMLElement* LEAD_ASSIGNED_POSITION_ID = [TBXML childElementNamed:@"LEAD_ASSIGNED_POSITION_ID" parentElement:table];
                    opportunity_list.LEAD_ASSIGNED_POSITION_ID = [TBXML textForElement:LEAD_ASSIGNED_POSITION_ID];

                    TBXMLElement* CONTACT_NAME = [TBXML childElementNamed:@"CONTACT_NAME" parentElement:table];
                    opportunity_list.CONTACT_NAME = [TBXML textForElement:CONTACT_NAME];

                    TBXMLElement* CONTACT_FIRST_NAME = [TBXML childElementNamed:@"CONTACT_FIRST_NAME" parentElement:table];
                    opportunity_list.CONTACT_FIRST_NAME = [TBXML textForElement:CONTACT_FIRST_NAME];

                    TBXMLElement* CONTACT_LAST_NAME = [TBXML childElementNamed:@"CONTACT_LAST_NAME" parentElement:table];
                    opportunity_list.CONTACT_LAST_NAME = [TBXML textForElement:CONTACT_LAST_NAME];

                    TBXMLElement* CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:table];
                    opportunity_list.CONTACT_ID = [TBXML textForElement:CONTACT_ID];

                    TBXMLElement* CONTACT_ADDRESS = [TBXML childElementNamed:@"CONTACT_ADDRESS" parentElement:table];
                    opportunity_list.CONTACT_ADDRESS = [TBXML textForElement:CONTACT_ADDRESS];

                    TBXMLElement* ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:table];
                    opportunity_list.ADDRESS_ID = [TBXML textForElement:ADDRESS_ID];

                    TBXMLElement* CONTACT_CELL_NUMBER = [TBXML childElementNamed:@"CONTACT_CELL_NUMBER" parentElement:table];
                    opportunity_list.CONTACT_CELL_NUMBER = [TBXML textForElement:CONTACT_CELL_NUMBER];
                    NSLog(@"CONTACT_CELL_NUMBER:%@", opportunity_list.CONTACT_CELL_NUMBER);

                    TBXMLElement* LAST_PENDING_ACTIVITY_TYPE = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_TYPE" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_TYPE = [TBXML textForElement:LAST_PENDING_ACTIVITY_TYPE];

                    TBXMLElement* LAST_PENDING_ACTIVITY_ID = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_ID" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_ID = [TBXML textForElement:LAST_PENDING_ACTIVITY_ID];

                    TBXMLElement* LAST_PENDING_ACTIVITY_STATUS = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_STATUS" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_STATUS = [TBXML textForElement:LAST_PENDING_ACTIVITY_STATUS];

                    TBXMLElement* LAST_PEND_ACTIVIY_START_DATE = [TBXML childElementNamed:@"LAST_PEND_ACTIVIY_START_DATE" parentElement:table];
                    opportunity_list.LAST_PEND_ACTIVIY_START_DATE = [TBXML textForElement:LAST_PEND_ACTIVIY_START_DATE];

                    TBXMLElement* LAST_PENDING_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_DESC" parentElement:table];
                    opportunity_list.LAST_PENDING_ACTIVITY_DESC = [TBXML textForElement:LAST_PENDING_ACTIVITY_DESC];

                    TBXMLElement* LAST_DONE_ACTIVITY_TYPE = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_TYPE" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_TYPE = [TBXML textForElement:LAST_DONE_ACTIVITY_TYPE];

                    TBXMLElement* LAST_DONE_ACTIVITY_DATE = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DATE" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_DATE = [TBXML textForElement:LAST_DONE_ACTIVITY_DATE];

                    TBXMLElement* LAST_DONE_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DESC" parentElement:table];
                    opportunity_list.LAST_DONE_ACTIVITY_DESC = [TBXML textForElement:LAST_DONE_ACTIVITY_DESC];

                    TBXMLElement* PRODUCT_NAME = [TBXML childElementNamed:@"PRODUCT_NAME" parentElement:table];
                    opportunity_list.PRODUCT_NAME = [TBXML textForElement:PRODUCT_NAME];

                    TBXMLElement* CUSTOMER_ACCOUNT_NAME = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_NAME" parentElement:table];
                    opportunity_list.CUSTOMER_ACCOUNT_NAME = [TBXML textForElement:CUSTOMER_ACCOUNT_NAME];
                    NSLog(@"OptyID : %@", opportunity_list.CUSTOMER_ACCOUNT_NAME);

                    TBXMLElement* CUSTOMER_ACCOUNT_ID = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_ID" parentElement:table];
                    opportunity_list.CUSTOMER_ACCOUNT_ID = [TBXML textForElement:CUSTOMER_ACCOUNT_ID];

                    TBXMLElement* CUSTOMER_PHONE_NUMBER = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_MOBNUMBER" parentElement:table];
                    opportunity_list.CUSTOMER_PHONE_NUMBER = [TBXML textForElement:CUSTOMER_PHONE_NUMBER];
                    NSLog(@"OptyID : %@", opportunity_list.CUSTOMER_PHONE_NUMBER);

                    TBXMLElement* REV_PRODUCT_ID = [TBXML childElementNamed:@"REV_PRODUCT_ID" parentElement:table];
                    opportunity_list.REV_PRODUCT_ID = [TBXML textForElement:REV_PRODUCT_ID];

                    TBXMLElement* FIN_ID = [TBXML childElementNamed:@"FIN_ID" parentElement:table];
                    opportunity_list.FIN_ID = [TBXML textForElement:FIN_ID];

                    TBXMLElement* FIN_NAME = [TBXML childElementNamed:@"FIN_NAME" parentElement:table];
                    opportunity_list.FIN_NAME = [TBXML textForElement:FIN_NAME];

                    TBXMLElement* CMP_ID = [TBXML childElementNamed:@"CMP_ID" parentElement:table];
                    opportunity_list.Campaign_ID = [TBXML textForElement:CMP_ID];

                    TBXMLElement* CMP_NAME = [TBXML childElementNamed:@"CMP_NAME" parentElement:table];
                    opportunity_list.Campaign_NAME = [TBXML textForElement:CMP_NAME];

                    i++;

                    NSLog(@"\n test opp.... %d!!!\n", i);

                    [OpportunityList_ArrList addObject:opportunity_list];
                    //[appdelegate.OppurtunityList addObject:opportunity_list];

                } while ((tuple = tuple->nextSibling));
                NSLog(@"\nOpportunityListDisplayArr......%d", [OpportunityList_ArrList count]);
                if ([OpportunityList_ArrList count] > 0) {
                    [self hideAlert];
                    [self.tbl_opportunity reloadData];
                }
            }
            else {
                [self.tbl_opportunity setHidden:YES];
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No Opportunity Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pushoptylistdetail"]) {
        OpportunityDetailsViewController* detailViewController =
            [segue destinationViewController];
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

- (void)callnsedse
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

    NSLog(@"\n envlopeString Search Activity....!!!!%@", envelopeText_NSE);
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
}

- (void)ListOfNseOrDseForDSM_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n ListOfNseOrDseForDSM_Found Found %@ ", response);

    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetListOfNseOrDseForDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                TBXMLElement* table = [TBXML childElementNamed:@"S_PARTY" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                TBXMLElement* NSE_LOBDSE_NAME = [TBXML childElementNamed:@"NSE_LOBDSE_NAME" parentElement:table];
                NSString* NSE_LOBDSE_NAME_Manage = [TBXML textForElement:NSE_LOBDSE_NAME];
                
                TBXMLElement* PR_EMP_ID = [TBXML childElementNamed:@"PR_EMP_ID" parentElement:table];
                NSString* employeeID = [TBXML textForElement:PR_EMP_ID];

                
                if([NSE_LOBDSE_NAME_Manage isEqual:@""])
                {
                    NSLog(@"-- Object Null NOw");
                }else{
                    [nsedsearray addObject:employeeID];

                }

             /*   if ([employeeID isEqual:@""]) {
                    NSLog(@"-- Object Null NOw");
                }
                else {
                        [nsedsearray addObject:employeeID];
                }*/
            }

            while ((tuple = tuple->nextSibling));
            if ([nsedsearray count] > 0) {

                NSLog(@"nsearray %@", nsedsearray);
                
                
                   [nsedsearray addObject:userDetailsVal_.PRIMARY_EMP];
                
                
                NSArray* array = [nsedsearray copy];

                NSString* joinedComponents = [array componentsJoinedByString:@"','"];

                NSLog(@"values %@", joinedComponents);
                primaryidstring = joinedComponents;

                [self CallOpportunityList];
            }
        }
    }
}

@end
