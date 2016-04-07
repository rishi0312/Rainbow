//
//  OpportunitySearchResultController.m
//  CRM_APP
//
//  Created by admin on 24/11/15.
//  Copyright © 2015 TataTechnologies. All rights reserved.
//

#import "MBProgressHUD.h"
#import "ManageOpportunity_ViewCell.h"
#import "OpportunityDetailsViewController.h"
#import "OpportunitySearchResultController.h"
#import "Opportunity_List.h"
#import "Reachability.h"
#import "RequestDelegate.h"
#import "TBXML+HTTP.h"
#import "TBXML.h"

@interface OpportunitySearchResultController () {
    Reachability* internetReachable;
    Reachability* hostReachable;
    NetworkStatus internetActive, hostActive;
    UIAlertView* alert;
    NSArray* datearray;
    NSString *optycreationdate, *date, *time, *stringdate;
    NSMutableArray *optydate, *datens;
    NSString* customerName;
    NSMutableArray* searchnsedsearray;
    NSString* searchinputid;
}
@end

@implementation OpportunitySearchResultController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView setHidden:YES];
    [self showAlert];

    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //AppDelegate instance
    NSLog(@"Samlp Art Master: %@", appdelegate.artifact);
    userDetailsVal_ = [UserDetails_Var sharedmanager]; // usedetails instance
    NSLog(@"Samlp Art Master: %@", userDetailsVal_.ROW_ID);
    appdelegate.flagget = 1;
    self.tableView.separatorColor = [UIColor clearColor];
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

        ;
        NSLog(@"Network not Available...");
    }
    else {
    }
    customerName = [self.txtCustomerName uppercaseString];
    NSLog(@"%@", customerName);
    NSLog(@"text pass fromadate %@", _txtPassFromDate);

    _txtPassFromDate = [_txtPassFromDate uppercaseString];
    _txtPassToDate = [_txtPassToDate uppercaseString];

    NSLog(@"from date %@,%@", _txtPassFromDate, _txtPassToDate);

    searchnsedsearray = [[NSMutableArray alloc] init];
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

    cell.lbl_customername.text = opportunity_list.CONTACT_NAME;
    cell.lbl_customercellno.text = opportunity_list.CONTACT_CELL_NUMBER;
    cell.lbl_lastpendingactivity.text = opportunity_list.LAST_PENDING_ACTIVITY_TYPE;
    cell.lbl_optycreationdate.text = opportunity_list.OPTY_CREAT_DATE;
    cell.lbl_productname.text = opportunity_list.PRODUCT_NAME;
    cell.lbl_salesstage.text = opportunity_list.SALE_STAGE_NAME;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"searchopty_found" object:nil]; //Gomzy // For

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ListOfNseOrDseForDSM_Found" object:nil]; //Gomzy // For opportunity Count
}
- (void)viewWillAppear:(BOOL)animated
{
    [self callsearchresultlist];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchopty_found:) name:@"searchopty_found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ListOfNseOrDseForDSM_Found:) name:@"ListOfNseOrDseForDSM_Found" object:nil];

    //ListOfNseOrDseForDSM_Found
}

- (void)viewWillDisappear:(BOOL)animated
{
}

- (void)callsearchresultlist
{

    NSLog(@"inside...List of opportunity %@", userDetailsVal_.POSTN);
    NSString* envelopeText;
    if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {
        NSLog(@"NDRM Opportunuty List");

        envelopeText = [NSString stringWithFormat:
                                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                     @"<SOAP:Body>"
                                     @"<SearchOpptyBasedOnCriteria xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\"preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                     @"<positionid>%@</positionid>"
                                     @"<fromdate>%@</fromdate>"
                                     @"<todate>%@</todate>"
                                     @"<salestagename>%@</salestagename>"
                                     @"<pplname>%@</pplname>"
                                     @"<tehsilname>%@</tehsilname>"
                                     @"<tgmname>TKM</tgmname>"
                                     @"<tkmname></tkmname>"
                                     @"<assignname>NSE</assignname>"
                                     @"<customercellnumber>%@</customercellnumber>"
                                     @"<contactfirstname>%@</contactfirstname>"
                                     @"<attr1></attr1>"
                                     @"<attr2></attr2>"
                                     @"<attr3></attr3>"
                                     @"</SearchOpptyBasedOnCriteria>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 userDetailsVal_.POSITION_ID, _txtPassFromDate, _txtPassToDate, _txtPassSalesStages, _txtPPL, _txtTaluka, _txtCustomerMobile, _txtCustomerName];

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
        [[RequestDelegate alloc] initiateRequest:request name:@"getListofsearchOpportunity"];
    }
    else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"])
    {
        [self getlobnsedse];
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
                                     @"<salestagename>%@</salestagename>"
                                     @"<pplname>%@</pplname>"
                                     @"<tehsilname>%@</tehsilname>"
                                     @"<assignname></assignname>"
                                     @"<customercellnumber>%@</customercellnumber>"
                                     @"<contactfirstname></contactfirstname>"
                                     @"<attr1></attr1>"
                                     @"<attr2></attr2>"
                                     @"<attr3></attr3>"
                                     @"<dsepositionid></dsepositionid>"
                                     @"<contactlastname>%@</contactlastname>"
                                     @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                     @"<Campainid>%@</Campainid>"
                                     @"<Buid>%@</Buid>"
                                     @"</SearchOpptyBasedOnCriteriaForDsm>"
                                     @"</SOAP:Body>"
                                     @"</SOAP:Envelope>",
                                 _txtPassFromDate, _txtPassToDate, _txtPassSalesStages, _txtPPL, _txtTaluka, self.txtCustomerMobile, customerName, userDetailsVal_.PRIMARY_EMP, @"", userDetailsVal_.ORGID];

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
        [[RequestDelegate alloc] initiateRequest:request name:@"getListofsearchOpportunity"];
    }
}
- (void)searchopty_found:(NSNotification*)notification
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
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Something gone wrong . Please try agin" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([@"SearchOpptyBasedOnCriteriaResponse" isEqual:@""]) {
    }
    else {
        //[userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]

        if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"SearchOpptyBasedOnCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (OpportunityList_ArrList) {
                [OpportunityList_ArrList removeAllObjects];
            }
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self.tableView setHidden:NO];

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
                    [self.tableView reloadData];
                }
            }
            else {
                [self hideAlert];
                [self.tableView setHidden:YES];
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No opportunities found for last 7 days" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

                [alert show];
            }
        }

        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"SearchOpptyBasedOnCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (OpportunityList_ArrList) {
                [OpportunityList_ArrList removeAllObjects];
            }
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self.tableView setHidden:NO];

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
                    [self.tableView reloadData];
                }
            }
            else {
                [self hideAlert];
                [self.tableView setHidden:YES];
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No opportunities found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

                [alert show];
            }
        }
        else {

            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* container = [TBXML childElementNamed:@"SearchOpptyBasedOnCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
            if (OpportunityList_ArrList) {
                [OpportunityList_ArrList removeAllObjects];
            }
            TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
            if (tuple) {
                [self.tableView setHidden:NO];

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
                    [self.tableView reloadData];
                }
            }
            else {
                [self hideAlert];
                [self.tableView setHidden:YES];
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No opportunities found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

                [alert show];
            }
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

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pushoptysearchdetail"]) {

        OpportunityDetailsViewController* detailViewController =
            [segue destinationViewController];
    }
}

- (void)getlobnsedse
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
                    [searchnsedsearray addObject:employeeID];
                    
                }
            }

            while ((tuple = tuple->nextSibling));
            if ([searchnsedsearray count] > 0) {
                
                   [searchnsedsearray addObject:userDetailsVal_.PRIMARY_EMP];                

                NSLog(@"nsearray %@", searchnsedsearray);

                NSArray* array = [searchnsedsearray copy];

                NSString* joinedComponents = [array componentsJoinedByString:@"','"];

                NSLog(@"values %@", joinedComponents);
                searchinputid = joinedComponents;

                [self CallsearchOpportunityList];
            }
        }
    }
}

- (void)CallsearchOpportunityList
{

    NSLog(@"-- ");
    
    NSString* envelopeText = [NSString stringWithFormat:
                                           @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                           @"<SOAP:Body>"
                                           @"<SearchOpptyBasedOnCriteriaForDsm xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                           @"<fromdate>%@</fromdate>"
                                           @"<todate>%@</todate>"
                                           @"<salestagename>%@</salestagename>"
                                           @"<pplname>%@</pplname>"
                                           @"<tehsilname>%@</tehsilname>"
                                           @"<assignname></assignname>"
                                           @"<customercellnumber>%@</customercellnumber>"
                                           @"<contactfirstname></contactfirstname>"
                                           @"<attr1></attr1>"
                                           @"<attr2></attr2>"
                                           @"<attr3></attr3>"
                                           @"<dsepositionid></dsepositionid>"
                                           @"<contactlastname>%@</contactlastname>"
                                           @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                                           @"<Campainid>%@</Campainid>"
                                           @"<Buid>%@</Buid>"
                                           @"</SearchOpptyBasedOnCriteriaForDsm>"
                                           @"</SOAP:Body>"
                                           @"</SOAP:Envelope>",
                                       _txtPassFromDate, _txtPassToDate, _txtPassSalesStages, _txtPPL, _txtTaluka, self.txtCustomerMobile, customerName, searchinputid, @"", userDetailsVal_.ORGID];

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
    [[RequestDelegate alloc] initiateRequest:request name:@"getListofsearchOpportunity"];
}

@end
