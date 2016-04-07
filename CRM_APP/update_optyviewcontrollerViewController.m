//
//  ViewController.m
//  testapp
//
//  Created by Admin on 04/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "update_optyviewcontrollerViewController.h"
#import "RequestDelegate.h"
#import "TBXML.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "DEMOCustomAutoCompleteCell.h"
#import "DEMOCustomAutoCompleteObject.h"
#import "Address.h"
#import "accountdetails.h"
#import "Opportunity_List.h"
#import "GeoCoderObject.h"

@interface update_optyviewcontrollerViewController ()
{
    NSString *statusbutton1,*uCampaignID;
    NSString *statusbutton2;
    const CGFloat BoardHeight;
    UIAlertView* alert;
    NSMutableArray *uGetAllstates_Arr,*uGetLOB_Arr,*Micromarket_Arr,*Financier_List_PickerArr,*Getsourceofcontact_arr,*shostates,*uGetPPL_Arr,*uGetPL_Arr,*uQuantityData,*uTMLfleetSize,*uFleetsize,*uGetsourceofcontact_arr,*uGetAppType_Arr,*uGetbodytype_Arr,*uGetusagecatagory_Arr,*uGetVCnumberArray,*uLinkCampaignList,*uLinkcampaignname,*uLinkcampaignID,*uGetAlldistricts_Arr,*uGetAlltaluka_Arr,*uGetAllcities_Arr,*ugetcustomertypearr,*uGetAllPincode,*uGetAllAccountPincode;
    UIActionSheet *actionSheet;
    Reachability* internetReachable;
    Reachability* hostReachable;
    NSPredicate *pantest;
    NetworkStatus internetActive, hostActive;
    NSString *integrationIdvalue;
    NSString *uProduct_namestring,*uProduct_IDstring;
    NSString *accountaddressID;
    
    NSString *gps_District,*gps_state,*gps_city,*gps_taluka;
    NSString *CONTACT_ID,*ADDRESS_ID,*OPTY_ID,*ACCOUNT_ID;
    
    NSString *updatefirecount;
    NSString *accountactionStatus;
    NSString *accountContactIDs;
    NSString *createaccountfirecount;
    NSString *integrationidvalue1;
    NSString *newAccountID;
    
    // New WebService //Abhi
    
    NSString *TMLOB_,*TMSorceOfContact_,*CustomerType ,*OptyFinancier_ ,*PPL_ ,*PL_, *VehicleApplication,*CustomerType_ ,*TMBodyType_,
    *TMMMGeography_ ,*Organization_;
    
    
}
@end

@implementation update_optyviewcontrollerViewController


//////////////////////////////////view switch methods for section/////////////////////////////////////


- (IBAction)button1:(id)sender {
    
    if ([statusbutton1 isEqualToString:@"open"]) {
        
        UIImage *buttonImage = [UIImage imageNamed:@"plus-5-64.png"];
        [self.button1 setImage:buttonImage forState:UIControlStateNormal];
        if ([statusbutton2 isEqualToString:@"open"]) {
            
            _DETAILS1.hidden=YES;
            _texttitle2.frame = CGRectMake(0, 48, self.view.layer.frame.size.width, 46);
            
            _DETAILS2.hidden=NO;
            _DETAILS2.frame=CGRectMake(0, 95, self.view.layer.frame.size.width, 498);
            
            statusbutton1=@"close";
            
            
        }
        
        else
        {
            
            //demo purpose needs to be changed
            _scrollvieoutlet.contentSize=CGSizeMake(self.view.layer.frame.size.width,400);            //scrollvieoutlet
            _DETAILS1.hidden = YES;
            _texttitle2.frame = CGRectMake(0, 48, self.view.layer.frame.size.width, 46);
            _DETAILS1.hidden = YES;
            statusbutton1 = @"close";
            
        }
    }
    else{
        
        UIImage *buttonImage = [UIImage imageNamed:@"minus-5-64.png"];
        [self.button1 setImage:buttonImage forState:UIControlStateNormal];
        if ([statusbutton2 isEqualToString:@"close"]) {
            
            _DETAILS1.hidden=NO;
            _texttitle2.frame = CGRectMake(0, 446, self.view.layer.frame.size.width, 46);
            
            _DETAILS2.hidden=YES;
            statusbutton1=@"open";
            
            
        }else
            
        {
            _DETAILS1.hidden=NO;
            
            _texttitle2.frame = CGRectMake(0, 446, self.view.layer.frame.size.width, 46);
            
            _DETAILS2.hidden=NO;
            
            _DETAILS2.frame=CGRectMake(0, 494, self.view.layer.frame.size.width, 498);
            
            statusbutton1=@"open";
            
        }
        
    }
    
    
    
}

- (IBAction)button2:(id)sender {
    
    
    
    if ([statusbutton2 isEqualToString:@"open"]) {
        
        UIImage *buttonImage = [UIImage imageNamed:@"plus-5-64.png"];
        [self.button2 setImage:buttonImage forState:UIControlStateNormal];
        
        if ([statusbutton1 isEqualToString:@"open"]) {
            
            _DETAILS2.hidden=YES;
            _texttitle2.frame = CGRectMake(0, 450, self.view.layer.frame.size.width, 46);
            _DETAILS1.hidden=NO;
            _DETAILS2.frame=CGRectMake(0, 95, self.view.layer.frame.size.width, 498);
            
            statusbutton2=@"close";
            
            
        }
        else
            
        {
            _DETAILS1.hidden=YES;
            _texttitle2.frame = CGRectMake(0, 48, self.view.layer.frame.size.width, 46);
            _DETAILS2.hidden=YES;
            statusbutton2=@"close";
            
        }
    }
    else
    {
        
        UIImage *buttonImage = [UIImage imageNamed:@"minus-5-64.png"];
        [self.button2 setImage:buttonImage forState:UIControlStateNormal];

        if ([statusbutton1 isEqualToString:@"close"]) {
            
            _DETAILS1.hidden=YES;
            _texttitle2.frame = CGRectMake(0, 48, self.view.layer.frame.size.width, 46);
            _DETAILS2.frame=CGRectMake(0, 96, self.view.layer.frame.size.width, 498);
            _DETAILS2.hidden=NO;
            statusbutton2=@"open";
            
            
        }else
            
        {
            _DETAILS1.hidden=NO;
            
            
            
            
            _texttitle2.frame = CGRectMake(0, 446, self.view.layer.frame.size.width, 46);
            
            _DETAILS2.hidden=NO;
            
            _DETAILS2.frame=CGRectMake(0, 494, self.view.layer.frame.size.width, 498);
            
            statusbutton2=@"open";
            
            
            
        }
        
    }
    
    
}
/////////////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    statusbutton1=@"open";
    statusbutton2=@"open";
    
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    userDetailsVal_ = [UserDetails_Var sharedmanager];
    
    
    uCampaignID=@"";
    
    accountaddressID=@"";
    accountContactIDs=@"";
    
    
    
    _utxt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    self.utxt_geography.layer.borderWidth = 1.0f;
    
    _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _utxt_bodytype.layer.borderWidth = 1.0f;
    
    _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
    
    _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _utxt_fleetsize.layer.borderWidth = 1.0f;
    
    _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _utxt_usagecatagory.layer.borderWidth = 1.0f;
    
    
    
    shostates = [[NSMutableArray alloc] initWithObjects:@"Andaman & Nicobar", @"Andhra Pradesh", @"Arunachal Pradesh", @"Assam", @"Bihar", @"Chattishgarh", @"Chennai", @"Daman & Diu", @"Delhi", @"Dadra, Nagarhaveli", @"Goa", @"Gujarat", @"Himachal Pradesh", @"Haryana", @"Jharkhand", @"Jammu & Kashmir", @"Karnataka", @"Kerala", @"Lakshwadeep", @"Maharashtra", @"Meghalaya", @"Manipur", @"Madhya Pradesh", @"Mizoram", @"Nagaland", @"Orrisa", @"Punjab", @"Pondicherry", @"Rajasthan", @"Sikkim", @"Telangana", @"Tamil Nadu", @"Tripura", @"Uttarkhand", @"Uttar Pradesh", @"West Bengal", nil];
    
    
    NSArray *countries =
    @[ @"AN",
       
       @"AP",
       
       @"AR",
       
       @"AS",
       
       @"BR",
       
       @"CH",
       
       @"CG",
       
       @"DN",
       
       @"DD",
       
       @"DL",
       
       @"GA",
       
       @"GJ",
       
       @"HR",
       
       @"HP",
       
       @"JK",
       
       @"JH",
       
       @"KA",
       
       @"KL",
       
       @"LD",
       
       @"MP",
       
       @"MH",
       
       @"MN",
       
       @"ML",
       
       @"MZ",
       
       @"NL",
       
       @"OR",
       
       @"PY",
       
       @"PB",
       
       @"RJ",
       
       @"SK",
       
       @"TN",
       
       @"TG",
       
       @"TR",
       
       @"UP",
       
       @"WB"];
    
    
    
    self.dict = [[NSMutableDictionary alloc]initWithCapacity:[countries  count]];
    [ self.dict setObject:[NSString stringWithFormat:@"MH"] forKey:@"Maharashtra"];
    [ self.dict setObject:[NSString stringWithFormat:@"AN"] forKey:@"Andaman and Nicobar Islands"];
    [ self.dict setObject:[NSString stringWithFormat:@"AP"] forKey:@"Andhra Pradesh"];
    [ self.dict setObject:[NSString stringWithFormat:@"AR"] forKey:@"Arunachal Pradesh"];
    [ self.dict setObject:[NSString stringWithFormat:@"AS"] forKey:@"Assam"];
    [ self.dict setObject:[NSString stringWithFormat:@"BR"] forKey:@"Bihar"];
    [ self.dict setObject:[NSString stringWithFormat:@"CG"] forKey:@"Chhattisgarh"];
    [ self.dict setObject:[NSString stringWithFormat:@"CH"] forKey:@"Chandigarh"];
    [ self.dict setObject:[NSString stringWithFormat:@"DD"] forKey:@"Daman and Diu"];
    [ self.dict setObject:[NSString stringWithFormat:@"DL"] forKey:@"Delhi"];
    [ self.dict setObject:[NSString stringWithFormat:@"DN"] forKey:@"Dadra and Nagar Haveli"];
    [ self.dict setObject:[NSString stringWithFormat:@"GA"] forKey:@"Goa"];
    [ self.dict setObject:[NSString stringWithFormat:@"GJ"] forKey:@"Gujarat"];
    [ self.dict setObject:[NSString stringWithFormat:@"HP"] forKey:@"Himachal Pradesh"];
    [ self.dict setObject:[NSString stringWithFormat:@"HR"] forKey:@"Haryana"];
    [ self.dict setObject:[NSString stringWithFormat:@"JH"] forKey:@"Jharkhand"];
    [ self.dict setObject:[NSString stringWithFormat:@"JK"] forKey:@"Jammu and Kashmir"];
    [ self.dict setObject:[NSString stringWithFormat:@"KA"] forKey:@"Karnataka"];
    [ self.dict setObject:[NSString stringWithFormat:@"KL"] forKey:@"Kerala"];
    [ self.dict setObject:[NSString stringWithFormat:@"LD"] forKey:@"Lakshadweep"];
    [ self.dict setObject:[NSString stringWithFormat:@"ML"] forKey:@"Meghalaya"];
    [ self.dict setObject:[NSString stringWithFormat:@"MN"] forKey:@"Manipur"];
    [ self.dict setObject:[NSString stringWithFormat:@"MP"] forKey:@"Madhya Pradesh"];
    [ self.dict setObject:[NSString stringWithFormat:@"MZ"] forKey:@"Mizoram"];
    [ self.dict setObject:[NSString stringWithFormat:@"NL"] forKey:@"Nagaland"];
    [ self.dict setObject:[NSString stringWithFormat:@"OD"] forKey:@"Odisha"];
    [ self.dict setObject:[NSString stringWithFormat:@"PB"] forKey:@"Punjab"];
    [ self.dict setObject:[NSString stringWithFormat:@"PY"] forKey:@"Puducherry"];
    [ self.dict setObject:[NSString stringWithFormat:@"RJ"] forKey:@"Rajasthan"];
    [ self.dict setObject:[NSString stringWithFormat:@"SK"] forKey:@"Sikkim"];
    [ self.dict setObject:[NSString stringWithFormat:@"TG"] forKey:@"Telangana"];
    [ self.dict setObject:[NSString stringWithFormat:@"TN"] forKey:@"Tamil Nadu"];
    [ self.dict setObject:[NSString stringWithFormat:@"TR"] forKey:@"Tripura"];
    [ self.dict setObject:[NSString stringWithFormat:@"UA"] forKey:@"Uttarnchal"];
    [ self.dict setObject:[NSString stringWithFormat:@"UP"] forKey:@"Uttar Pradesh"];
    [ self.dict setObject:[NSString stringWithFormat:@"WB"] forKey:@"West Bengal"];
    [ self.dict setObject:[NSString stringWithFormat:@"UK"] forKey:@"Uttarakhand"];
    NSLog(@"%@",[ self.dict description]);
    
    
    uQuantityData = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5",@"6", @"7", @"8", @"9", @"10", nil];
    
    uTMLfleetSize = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5",@"6", @"7", @"8", @"9", @"10", nil];
    
    uFleetsize = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5",@"6", @"7", @"8", @"9", @"10", nil];
    
    
    
    [self ustatelist];
    
    [self ugetLOB];
    
    [self uMMgeography];
    [self ufinancierList];
    
    [self ugetsourceofcontact];
    
    
    NSLog(@"-- Geo Coder Values :%@",geoCodiingObject.State);
    
    gps_state=geoCodiingObject.State;
    gps_District=geoCodiingObject.District;
    gps_city=geoCodiingObject.City;
    gps_taluka=geoCodiingObject.Taluka;
    
    
    [self callAddressRequest];
    
    
     ACCOUNT_ID=opportunity_list.CUSTOMER_ACCOUNT_ID;
    
    
    NSLog(@"account ID %@",ACCOUNT_ID);
    
    
    if ([ACCOUNT_ID isEqual:@""]) {
       
        
        accountactionStatus=@"createAccount";
        
        
    }
    else{
    
        
        accountactionStatus=@"updateAccount";
    
       [self accountfetch];
    
    
    }
   
    /*_utxt_LOB.text=@"Pickups";
    _utxt_ppl.text=@"Xenon Pickups";
    
    _utxt_pl.text=@"Xenon FBV";
    _utxt_Vehicleapplication.text=@"Egg";
    _utxt_customerType.text=@"First Time";
    _utxt_sourceOfcontact.text=@"Event";
    _utxt_geography.text=@"AKOLA";
    _utxt_usagecatagory.text=@"Market Load Operator";
    
    [self call_productline];
    
    
    CONTACT_ID=@"1-7LM2K3B";
    ADDRESS_ID=@"1-7LM129Y";
    OPTY_ID=@"1-7LM2K3I";
    ACCOUNT_ID=@"1-LBJK-512";
     
     
     <old>
     <TABLE xmlns="com.cordys.tatamotors.masfasiebelwsapp">
     <OPTY_NAME>1-7LEB5DC</OPTY_NAME>
     <OPTY_ID>1-7LEB5DC</OPTY_ID>
     <PRODUCT_NAME1>Xenon FBV</PRODUCT_NAME1>
     <OPTY_CREATED_DATE>10-MAR-2016</OPTY_CREATED_DATE>
     <PRODUCT_ID>1-3VIBR2L</PRODUCT_ID>
     <VC>28966431ABFRBA50</VC>
     <TGM_TKM_NAME null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <TGM_TKM_PHONE_NUMBER null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <ACCOUNT_ID null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <ACCOUNT_TYPE null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <SALES_STAGE_NAME>C1 (Quote Tendered)</SALES_STAGE_NAME>
     <SALE_STAGE_UPDATED_DATE>14-MAR-2016</SALE_STAGE_UPDATED_DATE>
     <LEAD_ASSIGNED_NAME>JIGNA JOSHI</LEAD_ASSIGNED_NAME>
     <LEAD_ASSIGNED_CELL_NUMBER>9999999999</LEAD_ASSIGNED_CELL_NUMBER>
     <LEAD_POSITION>TMCV-Sal-W-MUM-1001680-Nerul-LCV-DSE-21</LEAD_POSITION>
     <LEAD_ASSIGNED_POSITION_ID>1-1LQFGP</LEAD_ASSIGNED_POSITION_ID>
     <CONTACT_NAME>AMITABH BACHHAN</CONTACT_NAME>
     <CONTACT_FIRST_NAME>AMITABH</CONTACT_FIRST_NAME>
     <CONTACT_LAST_NAME>BACHHAN</CONTACT_LAST_NAME>
     <CONTACT_ID>1-7LEB5D5</CONTACT_ID>
     <CONTACT_ADDRESS>UIOUIOIPIUNYTNTGHH</CONTACT_ADDRESS>
     <ADDRESS_ID>1-7LEB5DA</ADDRESS_ID>
     <CONTACT_CELL_NUMBER>7665858547</CONTACT_CELL_NUMBER>
     <LAST_PENDING_ACTIVITY_TYPE>Papers Submitted</LAST_PENDING_ACTIVITY_TYPE>
     <LAST_PENDING_ACTIVITY_ID>1-7LM2KIZ</LAST_PENDING_ACTIVITY_ID>
     <LAST_PENDING_ACTIVITY_STATUS>Open</LAST_PENDING_ACTIVITY_STATUS>
     <LAST_PEND_ACTIVIY_START_DATE>15-MAR-2016 04:07:54</LAST_PEND_ACTIVIY_START_DATE>
     <LAST_PENDING_ACTIVITY_DESC null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <LAST_DONE_ACTIVITY_TYPE null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <LAST_DONE_ACTIVITY_ID null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <LAST_DONE_ACTIVITY_DATE null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <LAST_DONE_ACTIVITY_DESC null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <PRODUCT_NAME>Xenon Pickups</PRODUCT_NAME>
     <CUSTOMER_ACCOUNT_NAME null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <CUSTOMER_ACCOUNT_ID null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <CUSTOMER_PHONE_NUMBER null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <CUSTOMER_ACCOUNT_LOCATION null="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/>
     <REV_PRODUCT_ID>1-7LEB5DT</REV_PRODUCT_ID>
     <RNUM>15</RNUM>
     <RESULT_COUNT>118</RESULT_COUNT>
     </TABLE>
     </old>
     */
    
    //_utxt_LOB.text=opportunity_list.PRODUCT_ID;
    
    [self testForLOB]; //For Test Lob
    
    _utxt_ppl.text = opportunity_list.PRODUCT_NAME;
    
    _utxt_pl.text=opportunity_list.PRODUCT_NAME1;
    //_utxt_Vehicleapplication.text=opportunity_list.
    _utxt_firstname.text=opportunity_list.CONTACT_FIRST_NAME;
    _utxt_lastname.text=opportunity_list.CONTACT_LAST_NAME;
    _utxt_mobilenumber.text=opportunity_list.CONTACT_CELL_NUMBER;
    

    //_utxt_sourceOfcontact.text=@"Event";
    _utxt_geography.text=@"AKOLA";
    //_utxt_usagecatagory.text=opportunity_list
    
    [self call_productline];
    
    
    CONTACT_ID=opportunity_list.CONTACT_ID;
    ADDRESS_ID=opportunity_list.ADDRESS_ID;
    OPTY_ID=opportunity_list.OPTY_ID;
   // ACCOUNT_ID=opportunity_list.CUSTOMER_ACCOUNT_ID;
    
    
    
    if ([_utxt_LOB.text isEqualToString:@"Buses"]) {
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        
        
    }
    else if ([_utxt_LOB.text isEqualToString:@"I&MCV Trucks"]) {
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        
        
        
        
        
    }
    else if ([_utxt_LOB.text isEqualToString:@"Pickups"]) {
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        
        
        
        
    }
    
    else if ([_utxt_LOB.text isEqualToString:@"LCV"]) {
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        
        
        
    }
    else if ([_utxt_LOB.text isEqualToString:@"SCVPass"]) {
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        
    }
    
    
    else if ([_utxt_LOB.text isEqualToString:@"M&amp;HCV Const"]) {
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        
        _utxt_bodytype.layer.borderColor =[UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
    }
    else if ([_utxt_LOB.text isEqualToString:@"SCV Cargo"]) {
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        
        
        
        
    }
    
    //HCV Cargo
    
    else if ([_utxt_LOB.text isEqualToString:@"HCV Cargo"]) {
        
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 2.0f;
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
        self.utxt_bodytype.layer.borderWidth = 2.0f;
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
        self.utxt_TMLfleetsize.layer.borderWidth = 2.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
        self.utxt_fleetsize.layer.borderWidth = 2.0f;
        
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        
        
    }
    else
        
    {
        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        self.utxt_geography.layer.borderWidth = 1.0f;
        
        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_bodytype.layer.borderWidth = 1.0f;
        
        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
        
        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_fleetsize.layer.borderWidth = 1.0f;
        
        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
        _utxt_usagecatagory.layer.borderWidth = 1.0f;
        
        
        
    }
    
}



-(void)testForLOB
{
    NSLog(@"\n\n ");
    
    NSLog(@"\n\n opportunity_list.CONTACT_ID.... %@",opportunity_list.CONTACT_ID);
    
    NSLog(@"\n\n opportunity_list.CONTACT_ID.... %@",opportunity_list.ADDRESS_ID);
    
    NSLog(@"\n\n opportunity_list.CONTACT_ID.... %@",opportunity_list.OPTY_ID);
    
    NSLog(@"\n\n opportunity_list.CONTACT_ID.... %@",opportunity_list.CUSTOMER_ACCOUNT_ID);
    
    NSString*envelopeText =   [NSString stringWithFormat:
                               @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               @"<SOAP:Body>"
                               @"<SFATMCVContactQueryByExample_Input xmlns=\"http://siebel.com/asi/\">"
                               @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                               @"<Contact>"
                               @"<Id>%@</Id>"
                               @"<ListOfOpportunity>"
                               @"<Opportunity>"
                               @"<Id>%@</Id>"
                               @"</Opportunity>"
                               @"</ListOfOpportunity>"
                               @"</Contact>"
                               @"</ListOfContactInterface>"
                               @"</SFATMCVContactQueryByExample_Input>"
                               @"</SOAP:Body>"
                               @"</SOAP:Envelope>",opportunity_list.CONTACT_ID,opportunity_list.OPTY_ID];
    
    //    NSString * envelopeText2 = [NSString stringWithFormat:
    //                               @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    //                               @" <SOAP:Body>"
    //                               @" <SFATMCVContactQueryByExample_Input xmlns=\"http://siebel.com/asi/\">"
    //                               @" <ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
    //                               @" <Contact>"
    //                               @" <CellularPhone>%@</CellularPhone>"
    //                               @" </Contact>"
    //                               @" </ListOfContactInterface>"
    //                               @" </SFATMCVContactQueryByExample_Input>"
    //                               @" </SOAP:Body>"
    //                               @"</SOAP:Envelope>",self.SearchContact.text];
    
    
    
    
    NSLog(@"\n\n ..... Envelopetext %@",envelopeText);
    
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"AllDataAginstOptyIDinEditOpty"];
    
}
- (void)AllDataAginstOptyIDinEditOpty_Found:(NSNotification*)notification
{
    
    NSError* err;
    int i = 0;
    
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n List of Opportunity Response RRR%@ ", response);
    
    
    
    if ([response isEqual:@""]) {
        [self hideAlert];
        NSLog(@"Nko re..");
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alertView show];
    }
    
    else{
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"ns:SFATMCVContactQueryByExample_Output" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        
        TBXMLElement* ListOfContactInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:container];
        
        TBXMLElement* Contact = [TBXML childElementNamed:@"Contact" parentElement:ListOfContactInterface];
        
        TBXMLElement* IDC = [TBXML childElementNamed:@"Id" parentElement:Contact];
        
          TBXMLElement* ListOfOpportunity1 = [TBXML childElementNamed:@"ListOfPersonalAddress" parentElement:Contact];
        
         TBXMLElement* address1 = [TBXML childElementNamed:@"PersonalAddress" parentElement:ListOfOpportunity1];
        
        //address detail
        
        
        
        TBXMLElement* city =[TBXML childElementNamed:@"PersonalCity" parentElement:address1];
        
        NSString *city1 = [TBXML textForElement:city];
        
        TBXMLElement* PersonalPostalCode =[TBXML childElementNamed:@"PersonalPostalCode" parentElement:address1];
        
        NSString *postalcode = [TBXML textForElement:PersonalPostalCode];
        
        TBXMLElement* PersonalState =[TBXML childElementNamed:@"PersonalState" parentElement:address1];
        
        NSString *state = [TBXML textForElement:PersonalState];
        
        TBXMLElement* PersonalStreetAddress =[TBXML childElementNamed:@"PersonalStreetAddress" parentElement:address1];
        
        NSString *add1 = [TBXML textForElement:PersonalStreetAddress];
        
        TBXMLElement* PersonalStreetAddress2 =[TBXML childElementNamed:@"PersonalStreetAddress2" parentElement:address1];
        
        NSString *add2 = [TBXML textForElement:PersonalStreetAddress2];
        
        TBXMLElement* TMPanchayat =[TBXML childElementNamed:@"TMPanchayat" parentElement:address1];
        
        NSString *TMPanchayat2 = [TBXML textForElement:TMPanchayat];
        
        TBXMLElement* taluka =[TBXML childElementNamed:@"TMTaluka" parentElement:address1];
        
        NSString *taluka2 = [TBXML textForElement:taluka];
        
        TBXMLElement* district =[TBXML childElementNamed:@"TMDistrict" parentElement:address1];
        
        NSString *district2 = [TBXML textForElement:district];
        
        TBXMLElement* area =[TBXML childElementNamed:@"TMArea" parentElement:address1];
        
        NSString *area2 = [TBXML textForElement:area];
        
        
        
        
        
        //PersonalAddress
        
        TBXMLElement* ListOfOpportunity = [TBXML childElementNamed:@"ListOfOpportunity" parentElement:Contact];
        
      
     
        
        
        TBXMLElement* Opportunity = [TBXML childElementNamed:@"Opportunity" parentElement:ListOfOpportunity];
        
        
        
        TBXMLElement* OptyFinancier =[TBXML childElementNamed:@"OptyFinancier" parentElement:Opportunity];
        
        OptyFinancier_ = [TBXML textForElement:OptyFinancier];
        NSLog(@"OptyFinancier_...... %@",OptyFinancier_);
        _utxt_financier.text=OptyFinancier_;
        
        
        TBXMLElement* ParentProductLine =[TBXML childElementNamed:@"ParentProductLine" parentElement:Opportunity];
        
        PPL_ = [TBXML textForElement:ParentProductLine];
        
        _utxt_ppl.text=PPL_;
        
        NSLog(@"PPL_...... %@",PPL_);
        
        TBXMLElement* ProductLine =[TBXML childElementNamed:@"ProductLine" parentElement:Opportunity];
        
        PL_ = [TBXML textForElement:ProductLine];
        
         _utxt_pl.text=PL_;
        
        NSLog(@"PPL_...... %@",PL_);
        
        TBXMLElement* IntendedApplication =[TBXML childElementNamed:@"IntendedApplication" parentElement:Opportunity];
        
        VehicleApplication = [TBXML textForElement:IntendedApplication];
        
        _utxt_Vehicleapplication.text=VehicleApplication;
        
        
        
        NSLog(@"VehicleApplication...... %@",VehicleApplication);
        
        PL_ = [TBXML textForElement:ProductLine];
        
        
        TBXMLElement* TMLOB = [TBXML childElementNamed:@"TMLOB" parentElement:Opportunity];
        TMLOB_ = [TBXML textForElement:TMLOB];
        
          _utxt_LOB.text=TMLOB_;
        NSLog(@"TMLOB_...... %@",TMLOB_);
        
        
        TBXMLElement* TMSorceOfContact = [TBXML childElementNamed:@"TMSorceOfContact" parentElement:Opportunity];
        
        TMSorceOfContact_ = [TBXML textForElement:TMSorceOfContact];
          _utxt_sourceOfcontact.text=TMSorceOfContact_;
        
        NSLog(@"TMSorceOfContact_...... %@",TMSorceOfContact_);
        
        
        TBXMLElement* _CustomerType = [TBXML childElementNamed:@"CustomerType" parentElement:Opportunity];
        
        CustomerType_ = [TBXML textForElement:_CustomerType];
        
          _utxt_customerType.text=CustomerType_;
        
        
        NSLog(@"CustomerType_...... %@",CustomerType_);
        
        
        TBXMLElement* TMBodyType = [TBXML childElementNamed:@"TMBodyType" parentElement:Opportunity];
        
        TMBodyType_ = [TBXML textForElement:TMBodyType];
        
        
              _utxt_bodytype.text=TMBodyType_;
        
        
        NSLog(@"TMBodyType_...... %@",TMBodyType_);
        
        
        TBXMLElement* TMMMGeography = [TBXML childElementNamed:@"TMMMGeography" parentElement:Opportunity];
        
        TMMMGeography_ = [TBXML textForElement:TMMMGeography];
        
        NSLog(@"TMMMGeography...... %@",TMMMGeography_);
        
              _utxt_geography.text=TMMMGeography_;
        
        
        
        TBXMLElement* ListOfOpportunityRelatedOrganization = [TBXML childElementNamed:@"ListOfOpportunityRelatedOrganization" parentElement:Opportunity];
        
        TBXMLElement* OpportunityRelatedOrganization_IsPrimaryMVG = [TBXML childElementNamed:@"OpportunityRelatedOrganization" parentElement:ListOfOpportunityRelatedOrganization];
        
        TBXMLElement* Organization = [TBXML childElementNamed:@"Organization" parentElement:OpportunityRelatedOrganization_IsPrimaryMVG];
        
        Organization_ = [TBXML textForElement:Organization];
        
        NSLog(@"Organization_...... %@",Organization_);
      
        
        TBXMLElement* Id = [TBXML childElementNamed:@"Id" parentElement:Opportunity];
        
        OPTY_ID = [TBXML textForElement:Id];

        
        
        
        
        
        
    }
    
        [self call_productline];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_createnewopty:(id)sender {
    
    
    _Btn_createnewopty.backgroundColor=[UIColor colorWithRed:(69.0/255.0) green:(69.0/255.0) blue:(69.0/255.0) alpha:1];
    
    [_Btn_createnewopty setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _Btn_createExistingopty.backgroundColor=[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1];
    
    [_Btn_createExistingopty setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
}

- (IBAction)btn_existingcontactopty:(id)sender {
    
    
    _Btn_createExistingopty.backgroundColor=[UIColor colorWithRed:(69.0/255.0) green:(69.0/255.0) blue:(69.0/255.0) alpha:1];
    
    [_Btn_createExistingopty setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _Btn_createnewopty.backgroundColor=[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1];
    
    [_Btn_createnewopty setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}



- (void)viewWillAppear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LobListFound:) name:@"LobListFound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Activity_PPL_Found:) name:@"Activity_PPL_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Createoptyfornewcontact_found:) name:@"Createoptyfornewcontact_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Allstates_Found:) name:@"Allstates_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllDistrict_Found:) name:@"AllDistrict_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Allcities_Found:) name:@"Allcities_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Alltaluka_Found:) name:@"Alltaluka_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Finance_Data_Found:) name:@"Finance_Data_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PLUpdateOpty_Found:) name:@"PLUpdateOpty_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AppType_Data_Found:) name:@"AppType_Data_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UsageCategory_Found:) name:@"UsageCategory_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BodyTypeDSMData_Found:) name:@"BodyTypeDSMData_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ListofActiveMicroMarketDSMData_Found:) name:@"ListofActiveMicroMarketDSMData_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PL_ProductID_RequestData_Found:) name:@"PL_ProductID_RequestData_Found" object:nil];
    
    //GetALLPPLRelatedProductdata_found
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetALLPPLRelatedProductdata_found:) name:@"GetALLPPLRelatedProductdata_found" object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetCampainDetailsForDSMdata_found:) name:@"GetCampainDetailsForDSMdata_found" object:nil];
    
    //accountCreationforupdatedata_found
    
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accountCreationforupdatedata_found:) name:@"accountCreationforupdatedata_found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CreateoptyforexistingContactData_Found:) name:@"CreateoptyforexistingContactData_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ContactSelection_found:) name:@"showAlert" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactqueryfound:) name:@"contactqueryfound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(prospectupdatefound:) name:@"prospectupdatefound" object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PincodeConnectioninCreateOptyVCFound:) name:@"PincodeConnectioninCreateOptyVCFound" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sourceofcontactdata_found:) name:@"sourceofcontactdata_found" object:nil];
    
    //new changes
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accountcreation_found:) name:@"accountcreation_found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactcreationdata_found:) name:@"contactcreationdata_found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(customertype_found:) name:@"customertype_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accountcreation_found:) name:@"accountcreation_found" object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactopty_found:) name:@"contactopty_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AddressData_Found:) name:@"AddressData_Found" object:nil];
    //contactopty_found
    //getaccountdetails_found
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getaccountdetails_found:) name:@"getaccountdetails_found" object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllDataAginstOptyIDinEditOpty_Found:) name:@"AllDataAginstOptyIDinEditOpty_Found" object:nil];//Abhi

    //contactopty_found
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactopty_found:) name:@"contactopty_found" object:nil];
    
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    
    
     [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AllDataAginstOptyIDinEditOpty_Found" object:nil]; //Abhi
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LobListFound" object:nil]; //Gomzy //
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Activity_PPL_Found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Createoptyfornewcontact_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Allstates_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AllDistrict_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Allcities_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Allcities_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Alltaluka_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Finance_Data_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PLUpdateOpty_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AppType_Data_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UsageCategory_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"BodyTypeDSMData_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ListofActiveMicroMarketDSMData_Found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PL_ProductID_RequestData_Found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GetALLPPLRelatedProductdata_found" object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CreateoptyforexistingContactData_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactqueryfound" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"prospectupdatefound" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PincodeConnectioninCreateOptyVCFound" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GetCampainDetailsForDSMdata_found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactcreationdata_found" object:nil];
    //sourceofcontactdata_found
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"sourceofcontactdata_found" object:nil];
    
    
    //customertype_found
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"customertype_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"accountcreation_found" object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactopty_found" object:nil];
    //accountcreation_found
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AddressData_Found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getaccountdetails_found" object:nil];
    
       [[NSNotificationCenter defaultCenter] removeObserver:self name:@"accountcreation_found" object:nil];
    
    
    
     [[NSNotificationCenter defaultCenter] removeObserver:self name:@"accountCreationforupdatedata_found" object:nil];
    
    
    //contactopty_found
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactopty_found" object:nil];

}







-(void)ustatelist{
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                              @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
                              "@<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-faf1-0ea55009db29</DC>"
                              @"</Logger>"
                              "@</header>"
                              @"</SOAP:Header>"
                              @"<SOAP:Body>"
                              @"<GetAllIndianStates xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\"/>"
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"AllStates"];
    
    
}

- (void)Allstates_Found:(NSNotification*)notification
{
    NSError* err;
    int i = 0;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n List of Opportunity Response %@ ", response);
    
    if ([response isEqual:@""]) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something gone wrong . Please try agin" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else {
        
        
        uGetAllstates_Arr=[[NSMutableArray alloc]init];
        
        
        
        
        if (uGetAllstates_Arr) {
            [uGetAllstates_Arr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianStatesResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            
            do {
                
                TBXMLElement* table = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                
                TBXMLElement* Statecode = [TBXML childElementNamed:@"X_STATE" parentElement:table];
                
                NSString* state = [TBXML textForElement:Statecode];
                
                NSLog(@"\n State codes : %@", state);
                
                [uGetAllstates_Arr addObject:state];
                
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@"\nOpportunityListDisplayArr......%d", [uGetAllstates_Arr count]);
            if (uGetAllstates_Arr >= 0) {
                
                NSLog(@"all states%@", uGetAllstates_Arr);
            }
            else {
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
        }
        else {
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alert show];
        }
    }
}


-(void)ugetLOB{
    
    
    NSString* envelopeText = [NSString stringWithFormat:
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
    uGetLOB_Arr = [[NSMutableArray alloc] init];
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
        if (uGetLOB_Arr) {
            [uGetLOB_Arr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        NSLog(@"Which..");
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllLOBResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* S_Lst_Of_Val = [TBXML childElementNamed:@"S_LST_OF_VAL" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* NAME = [TBXML childElementNamed:@"VAL" parentElement:S_Lst_Of_Val];
                NSString *str_NAME = [TBXML textForElement:NAME];
                NSLog(@"\n str_NSE : %@", str_NAME);
       
                
                [uGetLOB_Arr addObject:str_NAME];
                
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@"Sales Stages : %@", uGetLOB_Arr);
            
            if ((uGetLOB_Arr.count) > 0) {
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
        
    }
}




-(void)uMMgeography{
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetListofActiveMicroMarketDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<type>Micromarket</type>"
                              @"</GetListofActiveMicroMarketDSM>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>"];
    
    NSLog(@"\n geography %@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS .... %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"GetListofActiveMicroMarketDSM"];
    
    
}

- (void)ListofActiveMicroMarketDSMData_Found:(NSNotification*)notification
{
    
    Micromarket_Arr=[[NSMutableArray alloc]init];
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n micromarket response....... %@ ", response);
    
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
    }
    else {
        
        if (appdelegate.geoArray) {
            [appdelegate.geoArray removeAllObjects];
        }
        if (Micromarket_Arr) {
            [Micromarket_Arr removeAllObjects];
        }
        
        
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetListofActiveMicroMarketDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"CX_MMGEOGRAPHY" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"NAME" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"usage name: %@", PPL_ID_);
                [Micromarket_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@"micro market array %@", appdelegate.geoArray);
            
            appdelegate.geoArray=Micromarket_Arr;
            
            [self hideAlert];
            
            
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        
    }
}


-(void)ufinancierList{
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                              @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-ea08-6508601457ef</DC>"
                              @"</Logger>"
                              @"</header>"
                              @"</SOAP:Header>"
                              @"<SOAP:Body>"
                              @"<GetFinancierDetailsForDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>"];
    
    NSLog(@"\n en%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS .... %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getActivityFinanceConnection"];
    
}







- (void)Finance_Data_Found:(NSNotification*)notification
{
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\nfinance  %@", response);
    
    Financier_List_PickerArr=[[NSMutableArray alloc ]init];
    
    if (Financier_List_PickerArr) {
        
        [Financier_List_PickerArr removeAllObjects];
    }
    if (appdelegate.FinanceArray) {
        
        [appdelegate.FinanceArray removeAllObjects];
    }
    TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    TBXMLElement* container = [TBXML childElementNamed:@"GetFinancierDetailsForDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
    TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
    
    if (tuple) {
        
        do {
            
            TBXMLElement* S_ORG_EXT = [TBXML childElementNamed:@"S_ORG_EXT" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
            
            TBXMLElement* ACC_NAME = [TBXML childElementNamed:@"ACC_NAME" parentElement:S_ORG_EXT];
            NSString* strACC_NAME = [TBXML textForElement:ACC_NAME];
            NSLog(@"S_Lst_Of_Val FOR  : %@", strACC_NAME);
            
            [Financier_List_PickerArr addObject:strACC_NAME];
            
        } while ((tuple = tuple->nextSibling));
    }
    if ([Financier_List_PickerArr count] > 0) {
        
        appdelegate.FinanceArray=Financier_List_PickerArr;
        
        
        [self hideAlert];
    }
}



-(void)ugetsourceofcontact{
    
    
    
    
    NSString * envelopeText = [NSString stringWithFormat: @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               @"<SOAP:Body>"
                               @"<Getsourceofcontact xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\" />"
                               @"</SOAP:Body>"
                               @"</SOAP:Envelope>"];
    
    
    
    NSLog(@"\n envlopeString CONTACT!!!!%@", envelopeText);
    
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
    NSLog(@"URL IS %@", theurl);
    NSLog(@"REQUEST IS %@", envelopeText);
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    
    NSLog(@"re done");
    [[RequestDelegate alloc] initiateRequest:request name:@"sourceofcontact"];
    
    
    
}

-(void)sourceofcontactdata_found: (NSNotification*)notification{
    
    
    Getsourceofcontact_arr = [[NSMutableArray alloc] init];
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
        if (Getsourceofcontact_arr) {
            [Getsourceofcontact_arr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        NSLog(@"Which..");
        TBXMLElement* container = [TBXML childElementNamed:@"GetsourceofcontactResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* S_Lst_Of_Val = [TBXML childElementNamed:@"S_LST_OF_VAL" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* NAME = [TBXML childElementNamed:@"VAL" parentElement:S_Lst_Of_Val];
                NSString *str_NAME = [TBXML textForElement:NAME];
                NSLog(@"\n str_NSE : %@", str_NAME);
                
                
                
                
                
                [Getsourceofcontact_arr addObject:str_NAME];
                
            } while ((tuple = tuple->nextSibling));
            
            
            // [self hideAlert];
            
            
            NSLog(@"source of contact %@", Getsourceofcontact_arr);
            
            if ((Getsourceofcontact_arr.count) > 0) {
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
        
    }
    
}



- (IBAction)txt_contactemailid:(id)sender {
}
- (IBAction)uBtn_LOB:(id)sender {
}
- (IBAction)ubtnaction_LOB:(id)sender {
    
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    // ObjC Fast Enumeration
    for (NSString* title in uGetLOB_Arr) {
        [actionSheet addButtonWithTitle:title];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [actionSheet showFromRect:[(UITextField*)sender frame] inView:self.DETAILS1 animated:YES];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    }
    else {
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 1;
    
    
}

- (IBAction)ubtnaction_PPL:(id)sender {
    
    
    [self showAlert];
    // self.btn_PL.userInteractionEnabled = YES;
    if ([_utxt_LOB.text isEqual:@""]) {
        [self hideAlert];
        if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
            NSLog(@"Newtwork not Available...");
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"Please select LOB " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
            NSLog(@"Newtwork not Available...");
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"Please select LOB " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
            NSLog(@"Newtwork not Available...");
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Please select LOB " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {
        
        
        NSString* envelopeText = [NSString stringWithFormat:
                                  @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                  @"<SOAP:Body>"
                                  @"<GetPPLFromLOB xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                  @"<LOB>%@</LOB>"
                                  @"</GetPPLFromLOB>"
                                  @"</SOAP:Body>"
                                  @"</SOAP:Envelope>",
                                  _utxt_LOB.text];
        
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
        
        [[RequestDelegate alloc] initiateRequest:request name:@"getActivityPPLConnection"];
    }
    
    
    
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
        uGetPPL_Arr=[[NSMutableArray alloc]init];
        
        
        
        if (uGetPPL_Arr) {
            [uGetPPL_Arr removeAllObjects];
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
                [uGetPPL_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", uGetPPL_Arr);
            
            if ((uGetPPL_Arr.count) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:nil
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [uGetPPL_Arr count]; i++) {
                    [actionSheet addButtonWithTitle:[uGetPPL_Arr objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[self.utxt_ppl frame] inView:self.DETAILS1 animated:YES];
                }
                else {
                    [actionSheet showInView:self.view];
                }
                actionSheet.tag = 2;
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







- (IBAction)ubtnaction_pl:(id)sender {
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    else {
        
        [self showAlert];
        if ([_utxt_LOB.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select LOB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([self.utxt_ppl.text isEqual:@""]) {
            
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select PPL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alert show];
        }
        else {
            
            
            NSString* envelopeText = [NSString stringWithFormat:
                                      @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                      @"<SOAP:Body>"
                                      @"<GetPLFromPPL xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                      @"<PPL_Name>%@</PPL_Name>"
                                      @"<LOB>%@</LOB>"
                                      @"</GetPLFromPPL>"
                                      @"</SOAP:Body>"
                                      @"</SOAP:Envelope>",
                                      _utxt_ppl.text, _utxt_LOB.text];
            
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
            
            [[RequestDelegate alloc] initiateRequest:request name:@"getActivityPLConnection"];
        }
    }
    
}

- (void)PLUpdateOpty_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    
    
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
    
    uGetPL_Arr=[[NSMutableArray alloc]init];
    
    
    // [self Call_Product_Name];
    //NSString *response=[[notification userInfo]objectForKey:@"response"];
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        //[self hideAlert];
    }
    else {
        
        if (uGetPL_Arr) {
            [uGetPL_Arr removeAllObjects];
            // [activityPPLNamePickerArr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetPLFromPPLResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"s_prod_int" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"PL" parentElement:S_PROD_LN];
                NSString* PPL = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL);
                
                
                [uGetPL_Arr addObject:PPL];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", uGetPL_Arr);
            
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        if ((uGetPL_Arr.count) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [uGetPL_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[uGetPL_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.utxt_pl frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 3;
            
            
        }
    }
}

-(void)call_productline{
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                              @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/testtool/testtool.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/methodsetsmanager/methodsetexplorer.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/sysresourcemgr/sysresourcemgr.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"XForms\">/com/cordys/cusp/cusp.caf</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"hopCount\">0</DC>"
                              @"<DC xmlns=\"http://schemas.cordys.com/General/1.0/\" name=\"correlationID\">00215ef7-d846-11e4-e719-d95a1a869db9</DC>"
                              @"</Logger>"
                              @"</header>"
                              @"</SOAP:Header>"
                              @"<SOAP:Body>"
                              @"<GetProductfromPLDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<PLName>%@</PLName>"
                              @"</GetProductfromPLDSM>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",
                              _utxt_pl.text];
    
    NSLog(@"\n envlopeString Of user pl production  details....!!!!%@", envelopeText);
    
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    
    NSLog(@"URL IS %@", theurl);
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
    
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    
    [[RequestDelegate alloc] initiateRequest:request name:@"PL_ProductID_Request"];
    
    
}


- (void)PL_ProductID_RequestData_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"product response %@", response);
    
    if ([response isEqual:@""]) {
        [self hideAlert];
        NSLog(@"Nko re..");
        alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    
    else if ([response rangeOfString:@"S_PROD_LN"].location != NSNotFound) {
        
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetProductfromPLDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        TBXMLElement* old = [TBXML childElementNamed:@"old" parentElement:tuple];
        
        TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_PROD_LN" parentElement:old];
        //TBXMLElement *PersonalAddress = [TBXML childElementNamed:@"PersonalAddress" parentElement:ListOfPersonalAddress];
        TBXMLElement* PRODUCT = [TBXML childElementNamed:@"PRODUCT" parentElement:S_PROD_LN];
        TBXMLElement* PRODUCT_ID = [TBXML childElementNamed:@"PRODUCT_ID" parentElement:S_PROD_LN];
        
        uProduct_namestring = [TBXML textForElement:PRODUCT];
        
        uProduct_IDstring = [TBXML textForElement:PRODUCT_ID];
        
        
        _utxt_vcnumber.text=uProduct_namestring;
        
    }
    
    else {
        
        
        alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No product ID found for selected pl" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
        
        
        
    }
}



- (IBAction)ubtnaction_qty:(id)sender {
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    else {
        if (![self connected]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else {
            
            
            
            if ((uQuantityData) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:@" "
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [uQuantityData count]; i++) {
                    [actionSheet addButtonWithTitle:[uQuantityData objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[_utxt_quantity frame] inView:self.DETAILS1 animated:YES];
                }
                else {
                    [actionSheet showInView:self.view];
                }
                actionSheet.tag = 5;
            }
            else {
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Not data Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
        }
    }
    
}

- (IBAction)ubtnaction_application:(id)sender {
    
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else {
        
        [self showAlert];
        if ([_utxt_LOB.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Select LOB field ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        else if ([_utxt_ppl.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Select PPL field ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        else if ([_utxt_pl.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Select PL field ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        else {
            
            NSString* envelopeText = [NSString stringWithFormat:
                                      @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                      @"<SOAP:Body>"
                                      @"<GetTMCVIndentAppsNeev xmlns=\"com.cordys.tatamotors.Neevsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                      @"<lob>%@</lob>"
                                      @"</GetTMCVIndentAppsNeev>"
                                      @"</SOAP:Body>"
                                      @"</SOAP:Envelope>",
                                      _utxt_LOB.text];
            
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
            
            [[RequestDelegate alloc] initiateRequest:request name:@"getApplicationTypeConnection"];
        }
    }
    
    
    
}

- (void)AppType_Data_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
    
    
    uGetAppType_Arr=[[NSMutableArray alloc]init];
    
    
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Select LOB First ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
    }
    else {
        
        if (uGetAppType_Arr) {
            [uGetAppType_Arr removeAllObjects];
            
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetTMCVIndentAppsNeevResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_Lst_Of_Val" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"NAME" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);
                [uGetAppType_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", uGetAppType_Arr);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        if ((uGetAppType_Arr) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [uGetAppType_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[uGetAppType_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.utxt_Vehicleapplication frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 6;
            
            
        }
    }
}






- (IBAction)ubtnaction_customertype:(id)sender {
    
    
    if ([_utxt_LOB.text isEqual:@""]) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select LOB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
    }
    else{
        
        
        
        
        NSString * envelopeText = [NSString stringWithFormat:
                                   @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                   @"<SOAP:Body>"
                                   @"<GetCustomerType xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                   @"<SubType>%@</SubType>"
                                   @"</GetCustomerType>"
                                   @"</SOAP:Body>"
                                   @"</SOAP:Envelope>",_utxt_LOB.text];
        
        
        
        
        
        
        
        NSLog(@"\n envlopeString CONTACT!!!!%@", envelopeText);
        
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        // NSLog(@"URL IS %@",[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]);
        NSLog(@"URL IS %@", theurl);
        NSLog(@"REQUEST IS %@", envelopeText);
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        
        NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
        
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        
        NSLog(@"re done");
        [[RequestDelegate alloc] initiateRequest:request name:@"getcustomerType"];
        
        
    }
    
}

-(void)customertype_found:(NSNotification*)notification
{
    
    
    ugetcustomertypearr = [[NSMutableArray alloc] init];
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
        if (ugetcustomertypearr) {
            [ugetcustomertypearr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        NSLog(@"Which..");
        TBXMLElement* container = [TBXML childElementNamed:@"GetCustomerTypeResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* S_Lst_Of_Val = [TBXML childElementNamed:@"S_LST_OF_VAL" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* NAME = [TBXML childElementNamed:@"VAL" parentElement:S_Lst_Of_Val];
                NSString *str_NAME = [TBXML textForElement:NAME];
                NSLog(@"\n str_NSE : %@", str_NAME);
                
                
                
                
                
                [ugetcustomertypearr addObject:str_NAME];
                
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@"source of contact %@", ugetcustomertypearr);
            
            if ((ugetcustomertypearr.count) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:nil
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [ugetcustomertypearr count]; i++) {
                    [actionSheet addButtonWithTitle:[ugetcustomertypearr objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[_utxt_customerType frame] inView:self.DETAILS1 animated:YES];
                }
                else {
                    [actionSheet showInView:self.view];
                }
                actionSheet.tag = 19;
            }
            
        }
        else {
            if ([userDetailsVal_.POSTN isEqual:@"NDRM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSE"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert setTag:0];
                
                [alert show];
            }
            else if ([userDetailsVal_.POSTN isEqual:@"DSM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                
                [alert setTag:0];
                
                
                
                [alert show];
            }
        }
        
    }
    
    
}

- (IBAction)ubtnaction_sourceofcontact:(id)sender {
    
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    
    else {
        if (![self connected]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else {
            
            
            
            if ((Getsourceofcontact_arr) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:@" "
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [Getsourceofcontact_arr count]; i++) {
                    [actionSheet addButtonWithTitle:[Getsourceofcontact_arr objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[_utxt_sourceOfcontact frame] inView:self.DETAILS1 animated:YES];
                }
                else {
                    [actionSheet showInView:self.view];
                }
                actionSheet.tag = 4;
            }
            else {
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Not data Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
        }
    }
    
    
    
    
    
    
    
}

- (IBAction)ubtnaction_VCnumber:(id)sender {
    
    
    if (![self connected])
    {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    else {
        
        [self showAlert];
        if ([_utxt_pl.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select PL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        else {
            
            
            NSString* envelopeText = [NSString stringWithFormat:
                                      @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                      @"<SOAP:Body>"
                                      @"<GetALLPPLRelatedProduct xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                      @"<PL>%@</PL>"
                                      @"</GetALLPPLRelatedProduct>"
                                      @"</SOAP:Body>"
                                      @"</SOAP:Envelope>",_utxt_pl.text];
            
            
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
            
            [[RequestDelegate alloc] initiateRequest:request name:@"GetALLPPLRelatedProduct"];
        }
    }
    
    
}

-(void)GetALLPPLRelatedProductdata_found:(NSNotification*)notification
{
    
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
    
    
    uGetVCnumberArray=[[NSMutableArray alloc]init];
    
    
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
    }
    else {
        
        if (uGetVCnumberArray) {
            [uGetVCnumberArray removeAllObjects];
            
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetALLPPLRelatedProductResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_PROD_LN" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"PROD_NAME" parentElement:S_PROD_LN];
                NSString* VCnumber = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", VCnumber);
                [uGetVCnumberArray addObject:VCnumber];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", uGetVCnumberArray);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        if ((uGetVCnumberArray) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [uGetVCnumberArray count]; i++) {
                [actionSheet addButtonWithTitle:[uGetVCnumberArray objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.utxt_vcnumber frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 13;
            
            
        }
    }
    
    
    
}










- (IBAction)ubtnaction_geography:(id)sender {
    
    
    if ((Micromarket_Arr) > 0) {
        NSLog(@"In..");
        [self hideAlert];
        
        actionSheet = [[UIActionSheet alloc]
                       initWithTitle:@" "
                       delegate:self
                       cancelButtonTitle:nil
                       destructiveButtonTitle:nil
                       otherButtonTitles:nil];
        
        for (int i = 0; i < [Micromarket_Arr count]; i++) {
            [actionSheet addButtonWithTitle:[Micromarket_Arr objectAtIndex:i]];
        }
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            [actionSheet showFromRect:[self.utxt_geography frame] inView:self.DETAILS1 animated:YES];
        }
        else {
            [actionSheet showInView:self.view];
        }
        actionSheet.tag = 7;
    }
    else{
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"No Data Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
        
        
    }
    
}

- (IBAction)ubtnactaction_bodytype:(id)sender {
    
    
    if ([_utxt_Vehicleapplication.text isEqual:@""]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Select vehicle application." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    else
    {
        
        
        NSString* envelopeText = [NSString stringWithFormat:
                                  @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                  @"<SOAP:Body>"
                                  @"<GetBodyTypeDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                  @"<subtype>%@</subtype>"
                                  @"</GetBodyTypeDSM>"
                                  @"</SOAP:Body>"
                                  @"</SOAP:Envelope>",
                                  _utxt_Vehicleapplication.text];
        
        NSLog(@"\n body type%@", envelopeText);
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS .... %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"GetBodyTypeDSM"];
        
    }
    
}



- (void)BodyTypeDSMData_Found:(NSNotification*)notification
{
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
    
    uGetbodytype_Arr=[[NSMutableArray alloc]init];
    
    
    
    //NSString *response=[[notification userInfo]objectForKey:@"response"];
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        //[appdelegate hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        [self hideAlert];
    }
    else {
        
        if (uGetbodytype_Arr) {
            [uGetbodytype_Arr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetBodyTypeDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_LST_OF_VAL" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"NAME" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"usage name: %@", PPL_ID_);
                [uGetbodytype_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@"body type array %@", uGetbodytype_Arr);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        if ((uGetbodytype_Arr) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [uGetbodytype_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[uGetbodytype_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[_utxt_bodytype frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 8;
        }
    }
}







- (IBAction)ubtnaction_usagecatagory:(id)sender {
    
    
    
    [self showAlert];
    
    if ([_utxt_LOB.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select LOB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else {
        
        NSString* envelopeText = [NSString stringWithFormat:
                                  @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                  @"<SOAP:Body>"
                                  @"<GetUsageCategoryDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                  @"<subtype>%@</subtype>"
                                  @"</GetUsageCategoryDSM>"
                                  @"</SOAP:Body>"
                                  @"</SOAP:Envelope>",
                                  _utxt_LOB.text];
        
        NSLog(@"\n en%@", envelopeText);
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS .... %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"GetUsageCategoryDSMconnection"];
        
        
    }
    
    
}


- (void)UsageCategory_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    
    uGetusagecatagory_Arr=[[NSMutableArray alloc]init];
    
    
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        [self hideAlert];
    }
    else {
        
        if (uGetusagecatagory_Arr) {
            [uGetusagecatagory_Arr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetUsageCategoryDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_LST_OF_VAL" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"NAME" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"usage name: %@", PPL_ID_);
                [uGetusagecatagory_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@"usage array %@", uGetusagecatagory_Arr);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        if ((uGetusagecatagory_Arr) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [uGetusagecatagory_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[uGetusagecatagory_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.utxt_usagecatagory frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 9;
        }
    }
}


- (IBAction)ubtnaction_fleetsize:(id)sender {
    [self hideAlert];
    
    actionSheet = [[UIActionSheet alloc]
                   initWithTitle:@" "
                   delegate:self
                   cancelButtonTitle:nil
                   destructiveButtonTitle:nil
                   otherButtonTitles:nil];
    
    for (int i = 0; i < [uFleetsize count]; i++) {
        [actionSheet addButtonWithTitle:[uFleetsize objectAtIndex:i]];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [actionSheet showFromRect:[_utxt_fleetsize frame] inView:self.DETAILS1 animated:YES];
    }
    else {
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 10;
    
    
}

- (IBAction)ubtnaction_TMLfleetsize:(id)sender {
    
    [self hideAlert];
    
    actionSheet = [[UIActionSheet alloc]
                   initWithTitle:@" "
                   delegate:self
                   cancelButtonTitle:nil
                   destructiveButtonTitle:nil
                   otherButtonTitles:nil];
    
    for (int i = 0; i < [uTMLfleetSize count]; i++) {
        [actionSheet addButtonWithTitle:[uTMLfleetSize objectAtIndex:i]];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [actionSheet showFromRect:[_utxt_TMLfleetsize frame] inView:self.DETAILS1 animated:YES];
    }
    else {
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 11;
    
    
}

- (IBAction)ubtn_financier:(id)sender {
    
    if ((Financier_List_PickerArr) > 0) {
        NSLog(@"In..");
        [self hideAlert];
        
        actionSheet = [[UIActionSheet alloc]
                       initWithTitle:@" "
                       delegate:self
                       cancelButtonTitle:nil
                       destructiveButtonTitle:nil
                       otherButtonTitles:nil];
        
        for (int i = 0; i < [Financier_List_PickerArr count]; i++) {
            [actionSheet addButtonWithTitle:[Financier_List_PickerArr objectAtIndex:i]];
        }
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            [actionSheet showFromRect:[self.utxt_financier frame] inView:self.DETAILS2 animated:YES];
        }
        else {
            [actionSheet showInView:self.view];
        }
        actionSheet.tag = 12;
    }
    else{
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"No Data Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
        
        
    }
    
    
    
    
}



- (IBAction)ubtnaction_linkcampaign:(id)sender {
    
    
    [self showAlert];
    
    if ([_utxt_pl.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select Pl" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else {
        
        NSString* envelopeText2 = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                   @"<SOAP:Body>"
                                   @"<GetCampainDetailsForDSM xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                   @"<plname>%@</plname>"
                                   @"</GetCampainDetailsForDSM>"
                                   @"</SOAP:Body>"
                                   @"</SOAP:Envelope>",
                                   _utxt_pl.text];
        
        NSLog(@"\n en%@", envelopeText2);
        NSData* envelope = [envelopeText2 dataUsingEncoding:NSUTF8StringEncoding];
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS .... %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText2 length]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"GetCampainDetailsForDSM"];
        
        
    }
    
}


- (void)GetCampainDetailsForDSMdata_found:(NSNotification*)notification // Activity Response
{
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    
    NSLog(@"\n PendingActivityDetails_Connection response... %@ ", response);
    NSError* err;
    TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    
    TBXMLElement* soapBody = [TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement];
    TBXMLElement* container = [TBXML childElementNamed:@"GetCampainDetailsForDSMResponse" parentElement:soapBody];
    if (container) {
        uLinkCampaignList = [[NSMutableArray alloc] init];
        
        uLinkcampaignname =[[NSMutableArray alloc] init];
        uLinkcampaignID =[[NSMutableArray alloc] init];
        
        
        
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        ///  NSLog(@"Tuple..%@",tuple);
        if (tuple) {
            do {
                
                
                TBXMLElement* S_SRC = [TBXML childElementNamed:@"S_SRC" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                
                TBXMLElement* CAM_NAME = [TBXML childElementNamed:@"CAM_NAME" parentElement:S_SRC];
                NSString *campaignname= [TBXML textForElement:CAM_NAME];
                
                
                
                
                
                if (![TBXML textForElement:CAM_NAME]) {
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Campaign list not found." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alertView show];
                }
                TBXMLElement* CAM_ID = [TBXML childElementNamed:@"CAM_ID" parentElement:S_SRC];
                NSString *campaignID = [TBXML textForElement:CAM_ID];
                
                
                
                
                TBXMLElement* CAMPAIGN_DESCRIPTION = [TBXML childElementNamed:@"CAMPAIGN_DESCRIPTION" parentElement:S_SRC];
                NSString *campaignDesscription = [TBXML textForElement:CAMPAIGN_DESCRIPTION];
                
                [uLinkcampaignname addObject:campaignname];
                [uLinkcampaignID addObject:campaignID];
                [uLinkCampaignList addObject:campaignDesscription];
                
                
                
            } while ((tuple = tuple->nextSibling));
            
        }
        else {
            
            [self hideAlert];
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Campaign list not found." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            
            
            [alertView show];
            
        }
        
        
        if ((uLinkCampaignList) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:nil
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [uLinkcampaignname count]; i++) {
                [actionSheet addButtonWithTitle:[uLinkcampaignname objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.utxt_campaign frame] inView:self.DETAILS2 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 14;
        }
        else {
            NSLog(@"failed");
        }
        
        
    }
}


- (IBAction)ubtnaction_accountpickgromgps:(id)sender {
}

- (IBAction)ubtnaction_contactpickfromgps:(id)sender {
}

- (IBAction)ubtnaction_sameasaccount:(id)sender {
}

- (void)actionSheet:(UIActionSheet*)popup clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSLog(@"button click ....%ld", (long)buttonIndex);
    if (_utxt_LOB) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 1:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.utxt_LOB.text = NSLocalizedString([uGetLOB_Arr objectAtIndex:buttonIndex], @"");
                    
                    
                    self.utxt_ppl.text = @"";
                    self.utxt_pl.text = @"";
                    self.utxt_Vehicleapplication.text=@"";
                    self.utxt_bodytype.text=@"";
                    self.utxt_usagecatagory.text=@"";
                    self.utxt_quantity.text=@"";
                    
                    self.utxt_geography.text=@"";
                    self.utxt_fleetsize.text=@"";
                    self.utxt_TMLfleetsize.text=@"";
                    
                    
                    
                    /*
                     Buses = vehicle application,customer type;
                     I&MCV Trucks= geo,body type, accountname ,tml fleetsize, fleet size,vehicleapps , customer type
                     Pickups = geo,usage,vehicle app ,customer type
                     LCV = body type, vehicle application,customer type
                     SCVPass=geo,usage,vehicle application,customer type
                     M&hcv constant= geo,body,account name,tml fleet,fleet,vehicle application, customer type
                     SCV Cargo = geo,usage,body type,vehicle app,customer type
                     HCV Cargo = geo,body type, account name, tmlfleet,fleet,vehicle appli,customer type
                     
                     */
                    
                    
                    if ([_utxt_LOB.text isEqualToString:@"Buses"]) {
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                    }
                    else if ([_utxt_LOB.text isEqualToString:@"I&MCV Trucks"]) {
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                        
                        
                    }
                    else if ([_utxt_LOB.text isEqualToString:@"Pickups"]) {
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                        
                    }
                    
                    else if ([_utxt_LOB.text isEqualToString:@"LCV"]) {
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                    }
                    else if ([_utxt_LOB.text isEqualToString:@"SCVPass"]) {
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        
                    }
                    
                    
                    else if ([_utxt_LOB.text isEqualToString:@"M&amp;HCV Const"]) {
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        _utxt_bodytype.layer.borderColor =[UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                    }
                    else if ([_utxt_LOB.text isEqualToString:@"SCV Cargo"]) {
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                        
                    }
                    
                    //HCV Cargo
                    
                    else if ([_utxt_LOB.text isEqualToString:@"HCV Cargo"]) {
                        
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 2.0f;
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.utxt_bodytype.layer.borderWidth = 2.0f;
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.utxt_TMLfleetsize.layer.borderWidth = 2.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.utxt_fleetsize.layer.borderWidth = 2.0f;
                        
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                    }
                    else
                        
                    {
                        _utxt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        self.utxt_geography.layer.borderWidth = 1.0f;
                        
                        _utxt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_bodytype.layer.borderWidth = 1.0f;
                        
                        _utxt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _utxt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _utxt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                
                
                
        }
    }
    if (_utxt_ppl) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 2:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_ppl.text = NSLocalizedString([uGetPPL_Arr objectAtIndex:buttonIndex], @"");
                }
                _utxt_pl.text = @"";
                self.utxt_Vehicleapplication.text=@"";
                self.utxt_bodytype.text=@"";
                self.utxt_usagecatagory.text=@"";
                self.utxt_quantity.text=@"";
                
                self.utxt_geography.text=@"";
                self.utxt_fleetsize.text=@"";
                self.utxt_TMLfleetsize.text=@"";
                
        }
    }
    if (_utxt_pl) {
        NSLog(@"... in");
        switch (popup.tag) {
                
            case 3:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_pl.text = NSLocalizedString([uGetPL_Arr objectAtIndex:buttonIndex], @"");
                    
                    self.utxt_Vehicleapplication.text = @"";
                    
                    self.utxt_bodytype.text=@"";
                    self.utxt_usagecatagory.text=@"";
                    self.utxt_quantity.text=@"";
                    
                    self.utxt_geography.text=@"";
                    self.utxt_fleetsize.text=@"";
                    self.utxt_TMLfleetsize.text=@"";
                    
                }
                
            
                
                
        }
    }
    if (_utxt_sourceOfcontact) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 4:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.utxt_sourceOfcontact.text = NSLocalizedString([Getsourceofcontact_arr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_utxt_quantity) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 5:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.utxt_quantity.text = NSLocalizedString([uQuantityData objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    if (_utxt_Vehicleapplication) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 6:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.utxt_Vehicleapplication.text = NSLocalizedString([uGetAppType_Arr objectAtIndex:buttonIndex], @"");
                    
                    _utxt_bodytype.text=@"";
                    
                }
        }
    }
    
    if (_utxt_geography) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 7:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.utxt_geography.text = NSLocalizedString([Micromarket_Arr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    if (_utxt_bodytype) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 8:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_bodytype.text = NSLocalizedString([uGetbodytype_Arr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    
    if (_utxt_usagecatagory) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 9:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_usagecatagory.text = NSLocalizedString([uGetusagecatagory_Arr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_utxt_fleetsize) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 10:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_fleetsize.text = NSLocalizedString([uFleetsize objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_utxt_TMLfleetsize) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 11:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_TMLfleetsize.text = NSLocalizedString([uTMLfleetSize objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_utxt_financier) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 12:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_financier.text = NSLocalizedString([Financier_List_PickerArr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    if (_utxt_vcnumber) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 13:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_vcnumber.text = NSLocalizedString([uGetVCnumberArray objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_utxt_campaign) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 14:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _utxt_campaign.text = NSLocalizedString([uLinkcampaignname objectAtIndex:buttonIndex], @"");
                    uCampaignID= NSLocalizedString([uLinkcampaignID objectAtIndex:buttonIndex], @"");
                    NSLog(@"campaign ID %@",uCampaignID);
                    
                    
                    
                }
        }
    }
    if (_utxt_customerType) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 19:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
                    
                    
                    _utxt_customerType.text = NSLocalizedString([ugetcustomertypearr objectAtIndex:buttonIndex], @"");
                    // [self.account_pickfromgps setOn:NO animated:YES];
                    //  [self.contact_pickfromgpps setOn:NO animated:YES];
                    
                    
                    
                }
        }
    }
    
    if (_utxt_accountpincode) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 25:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
                    
                    
                    
                    _utxt_accountpincode.text = NSLocalizedString([uGetAllAccountPincode objectAtIndex:buttonIndex], @"");
                    // [self.account_pickfromgps setOn:NO animated:YES];
                    // [self.contact_pickfromgpps setOn:NO animated:YES];
                    
                    
                    
                }
        }
    }
    
    if (_utxt_contactpincode) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 26:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
                    
                    
                    
                    _utxt_contactpincode.text = NSLocalizedString([uGetAllPincode objectAtIndex:buttonIndex], @"");
                    //[self.account_pickfromgps setOn:NO animated:YES];
                    // [self.contact_pickfromgpps setOn:NO animated:YES];
                    
                    
                    
                }
        }
    }
    
    
    //    if (_txt_accountstate) {
    //        NSLog(@"... in");
    //        switch (popup.tag) {
    //            case 15:
    //                if (buttonIndex == actionSheet.cancelButtonIndex) {
    //                    NSLog(@"ek..");
    //                    return;
    //                }
    //                else {
    //                    NSLog(@"Button index %ld", (long)buttonIndex);
    //                    statestring = [GetAllstates_Arr objectAtIndex:buttonIndex];
    //                    NSLog(@"Sates : %@", statestring);
    //                    self.txt_accountstate.text = NSLocalizedString([shostates objectAtIndex:buttonIndex], @"");
    //                    self.txt_accountdistrict.text = @"";
    //                    self.txt_accountcity.text = @"";
    //                    self.txt_accounttaluka.text = @"";
    //                    //self.textpostalcode.text=@"";
    //
    //                    [self.account_pickfromgps setOn:NO animated:YES];
    //                    [self.contact_sameasaccount setOn:NO animated:YES];
    //                    NSLog(@"state code %@", statestring);
    //                }
    //        }
    //    }
    //
    //    if (_txt_accountdistrict) {
    //        NSLog(@"... in");
    //        switch (popup.tag) {
    //            case 16:
    //                if (buttonIndex == actionSheet.cancelButtonIndex) {
    //                    NSLog(@"ek..");
    //                    return;
    //                }
    //                else {
    //                    NSLog(@"Button index %ld", (long)buttonIndex);
    //                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
    //                    NSLog(@"Sates : %@", statestring);
    //                    _txt_accountdistrict.text = NSLocalizedString([GetAlldistricts_Arr objectAtIndex:buttonIndex], @"");
    //                    self.txt_accountcity.text = @"";
    //                    self.txt_accounttaluka.text = @"";
    //                    //self.textpostalcode.text=@"";
    //
    //                    NSLog(@"state code %@", statestring);
    //
    //                    [self.account_pickfromgps setOn:NO animated:YES];
    //                    [self.contact_sameasaccount setOn:NO animated:YES];
    //                }
    //        }
    //    }
    //    if (_txt_accountcity) {
    //        NSLog(@"... in");
    //        switch (popup.tag) {
    //            case 17:
    //                if (buttonIndex == actionSheet.cancelButtonIndex) {
    //                    NSLog(@"ek..");
    //                    return;
    //                }
    //                else {
    //                    NSLog(@"Button index %ld", (long)buttonIndex);
    //                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
    //                    NSLog(@"Sates : %@", statestring);
    //                    _txt_accountcity.text = NSLocalizedString([GetAllcities_Arr objectAtIndex:buttonIndex], @"");
    //                    [self.account_pickfromgps setOn:NO animated:YES];
    //                    [self.contact_sameasaccount setOn:NO animated:YES];
    //                    self.txt_accounttaluka.text = @"";
    //                    //self.textpostalcode.text=@"";
    //
    //                    NSLog(@"state code %@", statestring);
    //                }
    //        }
    //    }
    //    if (_txt_accounttaluka) {
    //        NSLog(@"... in");
    //        switch (popup.tag) {
    //            case 18:
    //                if (buttonIndex == actionSheet.cancelButtonIndex) {
    //                    NSLog(@"ek..");
    //                    return;
    //                }
    //                else {
    //                    NSLog(@"Button index %ld", (long)buttonIndex);
    //                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
    //
    //
    //                    _txt_accounttaluka.text = NSLocalizedString([GetAlltaluka_Arr objectAtIndex:buttonIndex], @"");
    //                    [self.account_pickfromgps setOn:NO animated:YES];
    //                    [self.contact_pickfromgpps setOn:NO animated:YES];
    //
    //
    //
    //                }
    //        }
    //    }
    //    if (_txt_customerType) {
    //        NSLog(@"... in");
    //        switch (popup.tag) {
    //            case 19:
    //                if (buttonIndex == actionSheet.cancelButtonIndex) {
    //                    NSLog(@"ek..");
    //                    return;
    //                }
    //                else {
    //                    NSLog(@"Button index %ld", (long)buttonIndex);
    //                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
    //
    //
    //                    _txt_customerType.text = NSLocalizedString([getcustomertypearr objectAtIndex:buttonIndex], @"");
    //                    [self.account_pickfromgps setOn:NO animated:YES];
    //                    [self.contact_pickfromgpps setOn:NO animated:YES];
    //
    //
    //
    //                }
    //        }
    //    }
}
/////////////////////////////////////////////////////////////////////////////////////////


- (BOOL)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
          shouldConfigureCell:(UITableViewCell *)cell
       withAutoCompleteString:(NSString *)autocompleteString
         withAttributedString:(NSAttributedString *)boldedString
        forAutoCompleteObject:(id<MLPAutoCompletionObject>)autocompleteObject
            forRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    
    //    for(UIView *v in [self.view subviews])
    //    {
    //        if([v isKindOfClass:[UITableView class]])
    //        {
    //            ((UITableView*)v).userInteractionEnabled=YES;
    //        }
    //    }
    
    cell.userInteractionEnabled=YES;
    return YES;
    
}











-(BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    //    [[self.view subviews] makeObjectsPerformSelector:@selector(setUserInteractionEnabled:) withObject:[NSNumber numberWithBool:TRUE]];
    //    self.txt_geography.userInteractionEnabled = TRUE;
    //    MLPAutoCompleteTextField *tb=[[MLPAutoCompleteTextField alloc] init];
    //    tb.autoCompleteTableView.userInteractionEnabled=YES;
    if(textField ==self.utxt_geography)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        //self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = TRUE;
    }
    else if (textField==self.utxt_financier)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        // self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = TRUE;
        
    }
    
    else if (textField==self.utxt_accountstate)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        // self.txt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=YES;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.utxt_accountdistrict)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        //  self.txt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=YES;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.utxt_accountcity)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        // self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=YES;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.utxt_accounttaluka)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        // self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=YES;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    
    else if (textField==self.utxt_contactstate)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        //self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=YES;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.utxt_contactdistrict)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        //self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=YES;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.utxt_contactcity)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        // self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=YES;
        self.utxt_contacttaluka.userInteractionEnabled=NO;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.utxt_contacttaluka)
    {
        self.utxt_mobilenumber.userInteractionEnabled=NO;
        self.utxt_mainphonenumber.userInteractionEnabled=NO;
        self.utxt_firstname.userInteractionEnabled=NO;
        self.utxt_lastname.userInteractionEnabled=NO;
        self.utxt_accountName.userInteractionEnabled=NO;
        self.utxt_site.userInteractionEnabled=NO;
        self.utxt_financier.userInteractionEnabled=NO;
        self.utxt_LOB.userInteractionEnabled=NO;
        self.utxt_ppl.userInteractionEnabled=NO;
        self.utxt_pl.userInteractionEnabled=NO;
        self.utxt_quantity.userInteractionEnabled=NO;
        self.utxt_Vehicleapplication.userInteractionEnabled=NO;
        self.utxt_customerType.userInteractionEnabled=NO;
        self.utxt_sourceOfcontact.userInteractionEnabled=NO;
        self.utxt_vcnumber.userInteractionEnabled=NO;
        self.utxt_bodytype.userInteractionEnabled=NO;
        self.utxt_usagecatagory.userInteractionEnabled=NO;
        self.utxt_TMLfleetsize.userInteractionEnabled=NO;
        self.utxt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=NO;
        // self.utxt_contactemailid.userInteractionEnabled=NO;
        self.utxt_campaign.userInteractionEnabled=NO;
        self.utxt_contactstate.userInteractionEnabled=NO;
        self.utxt_contactdistrict.userInteractionEnabled=NO;
        self.utxt_contactcity.userInteractionEnabled=NO;
        self.utxt_contacttaluka.userInteractionEnabled=YES;
        self.utxt_contactarea.userInteractionEnabled=NO;
        self.utxt_contactpanchayat.userInteractionEnabled=NO;
        self.utxt_contactpincode.userInteractionEnabled=NO;
        
        self.utxt_contactAddressline1.userInteractionEnabled=NO;
        self.utxt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=NO;
        self.utxt_accounttaluka.userInteractionEnabled=NO;
        self.utxt_accountcity.userInteractionEnabled=NO;
        self.utxt_accountdistrict.userInteractionEnabled=NO;
        self.utxt_accountarea.userInteractionEnabled=NO;
        self.utxt_accountpanchayat.userInteractionEnabled=NO;
        self.utxt_accountpincode.userInteractionEnabled=NO;
        self.utxt_accountaddressline1.userInteractionEnabled=NO;
        self.utxt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.utxt_geography.userInteractionEnabled = false;
        
        self.utxt_financier.userInteractionEnabled = false;
        
    }
    
    
    NSRange backspaceEndRange = NSMakeRange(0, 1);
    
    
    if (NSEqualRanges(range, backspaceEndRange)){
        NSLog(@"finished writing");
        self.utxt_mobilenumber.userInteractionEnabled=YES;
        self.utxt_mainphonenumber.userInteractionEnabled=YES;
        self.utxt_firstname.userInteractionEnabled=YES;
        self.utxt_lastname.userInteractionEnabled=YES;
        self.utxt_accountName.userInteractionEnabled=YES;
        self.utxt_site.userInteractionEnabled=YES;
        self.utxt_financier.userInteractionEnabled=YES;
        self.utxt_LOB.userInteractionEnabled=YES;
        self.utxt_ppl.userInteractionEnabled=YES;
        self.utxt_pl.userInteractionEnabled=YES;
        self.utxt_quantity.userInteractionEnabled=YES;
        self.utxt_Vehicleapplication.userInteractionEnabled=YES;
        self.utxt_customerType.userInteractionEnabled=YES;
        self.utxt_sourceOfcontact.userInteractionEnabled=YES;
        self.utxt_vcnumber.userInteractionEnabled=YES;
        self.utxt_bodytype.userInteractionEnabled=YES;
        self.utxt_usagecatagory.userInteractionEnabled=YES;
        self.utxt_TMLfleetsize.userInteractionEnabled=YES;
        self.utxt_fleetsize.userInteractionEnabled=YES;
        
        
        //contact
        self.utxt_contactpannumber.userInteractionEnabled=YES;
        // self.utxt_contactemailid.userInteractionEnabled=YES;
        self.utxt_campaign.userInteractionEnabled=YES;
        self.utxt_contactstate.userInteractionEnabled=YES;
        self.utxt_contactdistrict.userInteractionEnabled=YES;
        self.utxt_contactcity.userInteractionEnabled=YES;
        self.utxt_contacttaluka.userInteractionEnabled=YES;
        self.utxt_contactarea.userInteractionEnabled=YES;
        self.utxt_contactpanchayat.userInteractionEnabled=YES;
        self.utxt_contactpincode.userInteractionEnabled=YES;
        
        self.utxt_contactAddressline1.userInteractionEnabled=YES;
        self.utxt_addressline2.userInteractionEnabled=YES;
        
        
        //account
        self.utxt_accountstate.userInteractionEnabled=YES;
        self.utxt_accounttaluka.userInteractionEnabled=YES;
        self.utxt_accountcity.userInteractionEnabled=YES;
        self.utxt_accountdistrict.userInteractionEnabled=YES;
        self.utxt_accountarea.userInteractionEnabled=YES;
        self.utxt_accountpanchayat.userInteractionEnabled=YES;
        self.utxt_accountpincode.userInteractionEnabled=YES;
        self.utxt_accountaddressline1.userInteractionEnabled=YES;
        self.utxt_accountaddressline2.userInteractionEnabled=YES;
        
        self.utxt_geography.userInteractionEnabled = TRUE;
        
    }
    return YES;
}




- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
  didSelectAutoCompleteString:(NSString *)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.utxt_mobilenumber.userInteractionEnabled=YES;
    self.utxt_mainphonenumber.userInteractionEnabled=YES;
    self.utxt_firstname.userInteractionEnabled=YES;
    self.utxt_lastname.userInteractionEnabled=YES;
    self.utxt_accountName.userInteractionEnabled=YES;
    self.utxt_site.userInteractionEnabled=YES;
    self.utxt_financier.userInteractionEnabled=YES;
    // self.utxt_LOB.userInteractionEnabled=YES;
    //self.utxt_ppl.userInteractionEnabled=YES;
    //self.utxt_pl.userInteractionEnabled=YES;
    //self.utxt_quantity.userInteractionEnabled=YES;
    //self.utxt_Vehicleapplication.userInteractionEnabled=YES;
    //self.utxt_customerType.userInteractionEnabled=YES;
    // self.utxt_sourceOfcontact.userInteractionEnabled=YES;
    //self.utxt_vcnumber.userInteractionEnabled=YES;
    // self.utxt_bodytype.userInteractionEnabled=YES;
    //self.utxt_usagecatagory.userInteractionEnabled=YES;
    //self.utxt_TMLfleetsize.userInteractionEnabled=YES;
    // self.utxt_fleetsize.userInteractionEnabled=YES;
    
    
    //contact
    self.utxt_contactpannumber.userInteractionEnabled=YES;
    //  self.utxt_contactemailid.userInteractionEnabled=YES;
    //self.utxt_campaign.userInteractionEnabled=YES;
    self.utxt_contactstate.userInteractionEnabled=YES;
    self.utxt_contactdistrict.userInteractionEnabled=YES;
    self.utxt_contactcity.userInteractionEnabled=YES;
    self.utxt_contacttaluka.userInteractionEnabled=YES;
    self.utxt_contactarea.userInteractionEnabled=YES;
    self.utxt_contactpanchayat.userInteractionEnabled=YES;
    self.utxt_contactpincode.userInteractionEnabled=YES;
    
    self.utxt_contactAddressline1.userInteractionEnabled=YES;
    self.utxt_addressline2.userInteractionEnabled=YES;
    
    
    //account
    self.utxt_accountstate.userInteractionEnabled=YES;
    self.utxt_accounttaluka.userInteractionEnabled=YES;
    self.utxt_accountcity.userInteractionEnabled=YES;
    self.utxt_accountdistrict.userInteractionEnabled=YES;
    self.utxt_accountarea.userInteractionEnabled=YES;
    self.utxt_accountpanchayat.userInteractionEnabled=YES;
    self.utxt_accountpincode.userInteractionEnabled=YES;
    self.utxt_accountaddressline1.userInteractionEnabled=YES;
    self.utxt_accountaddressline2.userInteractionEnabled=YES;
    
    self.utxt_geography.userInteractionEnabled = TRUE;
    
    
    if(selectedObject)
    {
        NSLog(@"selected object from autocomplete menu %@ with string %@", selectedObject, [selectedObject autocompleteString]);
    }
    else
    {
        if (textField.tag==1) {
            
            
            _utxt_accountdistrict.text=@"";
            _utxt_accountcity.text=@"";
            _utxt_accounttaluka.text=@"";
            
            
            
            NSString * envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                       @"<SOAP:Body>"
                                       @"<GetAllIndianDistricts xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                       @"<state>%@</state>"
                                       @"</GetAllIndianDistricts>"
                                       @"</SOAP:Body>"
                                       @"</SOAP:Envelope>",[self.dict valueForKey:selectedString]];
            
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS .... %@",theurl);
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
            NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            [[RequestDelegate alloc]initiateRequest:request name:@"getAllDistrictConnection"];
            
        }
        
        
        else if (textField.tag ==2)
        {
            
            _utxt_accountcity.text=@"";
            _utxt_accounttaluka.text=@"";
            
            NSString * envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                       @"<SOAP:Body>"
                                       @"<GetAllIndianCity xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                       @"<state>%@</state>"
                                       @"<dist>%@</dist>"
                                       @"</GetAllIndianCity>"
                                       @"</SOAP:Body>"
                                       @"</SOAP:Envelope>",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]] ,[(UITextField *)[self.view viewWithTag:2] text]];
            
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS .... %@",theurl);
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
            NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            [[RequestDelegate alloc]initiateRequest:request name:@"Allcities"];
            
        }
        else if (textField.tag ==3)
        {
            
            _utxt_accounttaluka.text=@"";
            NSLog(@"state & district values %@,%@",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],[(UITextField *)[self.view viewWithTag:2] text]);
            
            NSString * envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                       @"<SOAP:Body>"
                                       @"<GetAllIndianTaluka xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                       @"<state>%@</state>"
                                       @"<dist>%@</dist>"
                                       @"<city>%@</city>"
                                       @"</GetAllIndianTaluka>"
                                       @"</SOAP:Body>"
                                       @"</SOAP:Envelope>",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]] ,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:3] text]];
            
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS .... %@",theurl);
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
            NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            [[RequestDelegate alloc]initiateRequest:request name:@"Alltaluka"];
            
        }
        
        if (textField.tag==5) {
            
            _utxt_contactdistrict.text=@"";
            _utxt_contactcity.text=@"";
            _utxt_contacttaluka.text=@"";
            
            
            NSLog(@"test opty%@",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]]);
            
            NSString * envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                       @"<SOAP:Body>"
                                       @"<GetAllIndianDistricts xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                       @"<state>%@</state>"
                                       @"</GetAllIndianDistricts>"
                                       @"</SOAP:Body>"
                                       @"</SOAP:Envelope>",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]]];
            
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS .... %@",theurl);
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
            NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            [[RequestDelegate alloc]initiateRequest:request name:@"getAllDistrictConnection"];
            
        }
        
        
        else if (textField.tag ==6)
        {
            
            _utxt_contactcity.text=@"";
            _utxt_contacttaluka.text=@"";
            
            NSString * envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                       @"<SOAP:Body>"
                                       @"<GetAllIndianCity xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                       @"<state>%@</state>"
                                       @"<dist>%@</dist>"
                                       @"</GetAllIndianCity>"
                                       @"</SOAP:Body>"
                                       @"</SOAP:Envelope>",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]] ,[(UITextField *)[self.view viewWithTag:6] text]];
            
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS .... %@",theurl);
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
            NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            [[RequestDelegate alloc]initiateRequest:request name:@"Allcities"];
            
        }
        else if (textField.tag ==7)
        {
            
            
            _utxt_contacttaluka.text=@"";
            
            
            
            NSLog(@"state & district values%@%@",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],[(UITextField *)[self.view viewWithTag:6] text]);
            
            NSString * envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                       @"<SOAP:Body>"
                                       @"<GetAllIndianTaluka xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                       @"<state>%@</state>"
                                       @"<dist>%@</dist>"
                                       @"<city>%@</city>"
                                       @"</GetAllIndianTaluka>"
                                       @"</SOAP:Body>"
                                       @"</SOAP:Envelope>",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]] ,[(UITextField *)[self.view viewWithTag:6] text],[(UITextField *)[self.view viewWithTag:7] text]];
            
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS .... %@",theurl);
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
            NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            [[RequestDelegate alloc]initiateRequest:request name:@"Alltaluka"];
            
        }
        
        
        
    }
}

- (void)AllDistrict_Found:(NSNotification*)notification

{
    
    NSError* err;
    int i = 0;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n District Response %@ ", response);
    
    if ([response isEqual:@""]) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        
        [alert show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something gone wrong . Please try agin" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
    }
    else {
        
        uGetAlldistricts_Arr=[[NSMutableArray alloc]init];
        
        
        if (uGetAlldistricts_Arr) {
            [uGetAlldistricts_Arr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianDistrictsResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            
            do {
                
                TBXMLElement* table = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                
                TBXMLElement* districtcode = [TBXML childElementNamed:@"X_DISTRICT" parentElement:table];
                
                NSString* district = [TBXML textForElement:districtcode];
                
                NSLog(@"\n State codes : %@", district);
                
                [uGetAlldistricts_Arr addObject:district];
                
            } while ((tuple = tuple->nextSibling));
            
            
            
            
            NSLog(@"\all districts list......%d", [uGetAlldistricts_Arr count]);
            if ((uGetAlldistricts_Arr) > 0) {
                
                
                
                appdelegate.districtArray=uGetAlldistricts_Arr;
                
                
                
                [self hideAlert];
                
                
                
                //                actionSheet = [[UIActionSheet alloc]
                //                               initWithTitle:nil
                //                               delegate:self
                //                               cancelButtonTitle:nil
                //                               destructiveButtonTitle:nil
                //                               otherButtonTitles:nil];
                //
                //                for (int i = 0; i < [GetAlldistricts_Arr count]; i++) {
                //                    [actionSheet addButtonWithTitle:[GetAlldistricts_Arr objectAtIndex:i]];
                //                }
                //                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                //                    [actionSheet showFromRect:[_txt_accountdistrict frame] inView:self.DETAILS2 animated:YES];
                //                }
                //                else {
                //                    [actionSheet showInView:self.view];
                //                }
                //                actionSheet.tag = 16;
                
                
            }
            
            else {
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert setTag:0];
                
                [alert show];
            }
        }
        else {
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alert show];
        }
    }
}



- (void)Alltaluka_Found:(NSNotification*)notification

{
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
    
    //NSString *response=[[notification userInfo]objectForKey:@"response"];
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Select LOB First ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        //[self hideAlert];
    }
    else {
        
        uGetAlltaluka_Arr=[[NSMutableArray alloc]init];
        
        if (uGetAlltaluka_Arr) {
            [uGetAlltaluka_Arr removeAllObjects];
            // [activityPPLNamePickerArr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianTalukaResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"X_TALUKA" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);
                [uGetAlltaluka_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", uGetAlltaluka_Arr);
            
            
        }
        else {
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not availbale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        if ((uGetAlltaluka_Arr) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            appdelegate.TalukaArray=uGetAlltaluka_Arr;
            
            
        }
    }
}

- (void)Allcities_Found:(NSNotification*)notification

{
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
    
    //NSString *response=[[notification userInfo]objectForKey:@"response"];
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Select LOB First ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
        //[self hideAlert];
    }
    else {
        
        
        uGetAllcities_Arr=[[NSMutableArray alloc]init];
        
        
        if (appdelegate.CitiesArray) {
            [appdelegate.CitiesArray removeAllObjects];
            // [activityPPLNamePickerArr removeAllObjects];
        }
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianCityResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"X_CITY" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);
                [uGetAllcities_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", uGetAllcities_Arr);
        }
        else {
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not availbale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        if ((uGetAllcities_Arr) > 0) {
            
            appdelegate.CitiesArray=uGetAllcities_Arr;
            
            [self hideAlert];
            
            
        }
        else{
            
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not availbale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
            
        }
    }
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


- (void)showAlert
{
    [MBProgressHUD showHUDAddedLoading:self.view animated:YES];
}
- (void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (IBAction)account_gpsaction:(id)sender {
    
    
    
    
    
    
    if ([self.account_gpsoutlet isOn]){
        
        [self.sameasaccount_outlet setOn:NO animated:YES];
        
        _utxt_accountstate.text=gps_state;
        
        NSString *uppercase1 = [_utxt_accountstate.text uppercaseString];
        _utxt_accountstate.text =  uppercase1;
        
        _utxt_accountdistrict.text=gps_District;
        
        NSString *uppercase2 = [_utxt_accountdistrict.text uppercaseString];
        _utxt_accountdistrict.text =  uppercase2;
        
        
        
        
        _utxt_accountcity.text=gps_city;
        
        
        NSString *uppercase3 = [_utxt_accountcity.text uppercaseString];
        _utxt_accountcity.text =  uppercase3;
        
        
        _utxt_accounttaluka.text=gps_taluka;
        
        NSString *uppercase4 = [_utxt_accounttaluka.text uppercaseString];
        _utxt_accounttaluka.text =  uppercase4;
        
    }
    else{
        
        _utxt_accountstate.text=@"";
        _utxt_accountdistrict.text=@"";
        _utxt_accounttaluka.text=@"";
        _utxt_accountcity.text=@"";
        
        
    }
    
}

- (IBAction)contact_gpsaction:(id)sender {
    
    
    if ([self.contact_gpsoutlet isOn]) {
        
        [self.sameasaccount_outlet setOn:NO animated:YES];
        
        _utxt_contactstate.text=gps_state;
        
        NSString *uppercase1 = [_utxt_contactstate.text uppercaseString];
        _utxt_contactstate.text =  uppercase1;
        
        _utxt_contactdistrict.text=gps_District;
        
        NSString *uppercase2 = [_utxt_contactdistrict.text uppercaseString];
        _utxt_contactdistrict.text =uppercase2;
        
        
        
        
        _utxt_contactcity.text=gps_city;
        
        
        NSString *uppercase3 = [_utxt_contactcity.text uppercaseString];
        _utxt_contactcity.text =  uppercase3;
        
        
        _utxt_contacttaluka.text=gps_taluka;
        
        NSString *uppercase4 = [_utxt_contacttaluka.text uppercaseString];
        _utxt_contacttaluka.text =  uppercase4;
    }
    
    else{
        
        _utxt_contactstate.text=@"";
        _utxt_contactdistrict.text=@"";
        _utxt_contacttaluka.text=@"";
        _utxt_contactcity.text=@"";
        
    }
    
}
- (IBAction)sameasaccountaction:(id)sender {
    
    
    
    if ([self.sameasaccount_outlet isOn]) {
        
        
        NSString *statecopy;
        NSString *districtcopy;
        NSString *citycopy;
        NSString *talukacopy;
        
        
        [self.contact_gpsoutlet setOn:NO animated:YES];
        
        if ([_utxt_contactcity.text isEqualToString:@""]) {
            
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Complete account address not found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [_sameasaccount_outlet setOn:NO animated:YES];
            [alertView show];
            
            
        }
        
        else{
            
            statecopy=_utxt_accountstate.text;
            districtcopy=_utxt_accountdistrict.text;
            talukacopy =_utxt_accounttaluka.text;
            citycopy=_utxt_accountcity.text;
            
            
            _utxt_contactstate.text=statecopy;
            _utxt_contactdistrict.text=districtcopy;
            _utxt_contacttaluka.text=talukacopy;
            _utxt_contactcity.text=citycopy;
            _utxt_contactarea.text=_utxt_accountarea.text;
            _utxt_contactpanchayat.text=_utxt_accountpanchayat.text;
            _utxt_contactpincode.text=_utxt_accountpincode.text;
            _utxt_contactAddressline1.text=_utxt_accountaddressline1.text;
            _utxt_addressline2.text=_utxt_accountaddressline2.text;
            
        }
        
    } else {
        
        
        
        _utxt_contactstate.text=@"";
        _utxt_contactdistrict.text=@"";
        _utxt_contacttaluka.text=@"";
        _utxt_contactcity.text=@"";
        
        
        
        
    }
    
}

- (IBAction)btnactionSbmit:(id)sender {
    
    
    if ([_utxt_firstname.text isEqual:@""]) {
        
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter FIRST NAME" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
    }
    else if ([_utxt_lastname.text isEqual:@""])
        
    {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter LAST NAME" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
        
    }
    else if ([_utxt_mobilenumber.text isEqual:@""])
        
    {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter MOBILE NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
    }
    
    else if ([_utxt_LOB.text isEqual:@""])
        
    {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter LOB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
        
        
    }
    else if ([_utxt_ppl.text isEqual:@""])
        
    {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter PPL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
        
    }
    else if ([_utxt_pl.text isEqual:@""])
        
    {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter PL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
        
        
    }
    else if ([_utxt_quantity.text isEqual:@""])
        
    {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter QUANTITY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
        
    }
    else if ([_utxt_Vehicleapplication.text isEqual:@""])
        
    {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter VEHICLE APPLICATION" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
        
        
    }
    else if ([_utxt_sourceOfcontact.text isEqual:@""])
        
    {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter SOURCE OF CONTACT" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
    }
    else if ([_utxt_Vehicleapplication.text isEqual:@""])
        
    {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter VEHICLE APPLICATION" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
        
    }
    else if ([_utxt_sourceOfcontact.text isEqual:@""])
        
    {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter SOURCE OF CONTACT" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        
        [alert show];
        
        
        
    }
    
    else{
        
        
        [self updatepreopty];
        
        
        
        
        
    }
    
    
    
}

-(void)updatepreopty{
    
    
    
    
    [self updateopty];
    
    
    
}





-(void)callAddressRequest

{
    
    CONTACT_ID=opportunity_list.CONTACT_ID;
    
    [self showAlert];
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Header xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                              @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\"/>"
                              @"</header>"
                              @"</SOAP:Header>"
                              @"<SOAP:Body>"
                              @"<SFATMCVContactQueryById_Input xmlns=\"http://siebel.com/asi/\">"
                              @"<PrimaryRowId>%@</PrimaryRowId>"
                              @"</SFATMCVContactQueryById_Input>"
                              @"</SOAP:Body>"
                              "</SOAP:Envelope>",CONTACT_ID];
    
    NSLog(@"\n envlopeString Of user details....%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    
    NSLog(@"URL IS %@", theurl);
    
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"getAddressConnection"];
}

-(void) AddressData_Found:(NSNotification*)notification{
    
    // int i = 0;
    // int i = 0; //for test loop
    GetAddressData_Arr = [[NSMutableArray alloc] init];
    //Activities_Customer_list=[[NSMutableArray alloc] init];
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    
    NSLog(@"\n Response.. Address Data %@", response);
    
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
        [self hideAlert];
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"Contact" parentElement:[TBXML childElementNamed:@"ListOfContactInterface" parentElement:[TBXML childElementNamed:@"ns:SFATMCVContactQueryById_Output" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]]]];
        
        if (GetAddressData_Arr) {
            [GetAddressData_Arr removeAllObjects];
        }
        if (container) {
            
            // do {
            
            address = nil;
            address = [[Address alloc] init];
            
            
            TBXMLElement* CellularPhone = [TBXML childElementNamed:@"CellularPhone" parentElement:container];
            address.CellularPhone = [TBXML textForElement:CellularPhone];
            
            
            TBXMLElement* EmailAddress = [TBXML childElementNamed:@"EmailAddress" parentElement:container];
            address.TMEmailAddress = [TBXML textForElement:EmailAddress];
            
            
            
            TBXMLElement* FirstName = [TBXML childElementNamed:@"FirstName" parentElement:container];
            address.firstname = [TBXML textForElement:FirstName];
            
            
            
            TBXMLElement* LastName = [TBXML childElementNamed:@"LastName" parentElement:container];
            address.lastname = [TBXML textForElement:LastName];
            
            
            
            
            
            TBXMLElement* SocialSecurityNumber = [TBXML childElementNamed:@"SocialSecurityNumber" parentElement:container];
            address.SocialSecurityNumber = [TBXML textForElement:SocialSecurityNumber];
            
            
            
            TBXMLElement* Opportunity1 = [TBXML childElementNamed:@"ListOfPersonalAddress" parentElement:container];
            
            
            TBXMLElement* table = [TBXML childElementNamed:@"PersonalAddress" parentElement:Opportunity1];
            TBXMLElement* OPTY_ID = [TBXML childElementNamed:@"PersonalAddressName" parentElement:table];
            address.PersonalAddressName = [TBXML textForElement:OPTY_ID];
            NSString* s = [TBXML textForElement:OPTY_ID];
            NSLog(@"NAme : %@", s);
            
            TBXMLElement* PersonalCity = [TBXML childElementNamed:@"PersonalCity" parentElement:table];
            address.PersonalCity = [TBXML textForElement:PersonalCity];
            
            TBXMLElement* PersonalCountry = [TBXML childElementNamed:@"PersonalCountry" parentElement:table];
            address.PersonalCountry = [TBXML textForElement:PersonalCountry];
            
            TBXMLElement* PersonalPostalCode = [TBXML childElementNamed:@"PersonalPostalCode" parentElement:table];
            address.PersonalPostalCode = [TBXML textForElement:PersonalPostalCode];
            
            TBXMLElement* PersonalState = [TBXML childElementNamed:@"PersonalState" parentElement:table];
            address.PersonalState = [TBXML textForElement:PersonalState];
            
            TBXMLElement* PersonalStreetAddress = [TBXML childElementNamed:@"PersonalStreetAddress" parentElement:table];
            address.PersonalAddressName = [TBXML textForElement:PersonalStreetAddress];
            
            TBXMLElement* PersonalStreetAddress2 = [TBXML childElementNamed:@"PersonalStreetAddress2" parentElement:table];
            address.PersonalStreetAddress2 = [TBXML textForElement:PersonalStreetAddress2];
            
            TBXMLElement* AddressId = [TBXML childElementNamed:@"AddressId" parentElement:table];
            address.AddressId = [TBXML textForElement:AddressId];
            
            TBXMLElement* TMPanchayat = [TBXML childElementNamed:@"TMPanchayat" parentElement:table];
            address.TMPanchayat = [TBXML textForElement:TMPanchayat];
            
            TBXMLElement* TMTaluka = [TBXML childElementNamed:@"TMTaluka" parentElement:table];
            address.TMTaluka = [TBXML textForElement:TMTaluka];
            
            TBXMLElement* TMDistrict = [TBXML childElementNamed:@"TMDistrict" parentElement:table];
            address.TMDistrict = [TBXML textForElement:TMDistrict];
            
            TBXMLElement* TMArea = [TBXML childElementNamed:@"TMArea" parentElement:table];
            address.TMArea = [TBXML textForElement:TMArea];
            
            
            
            [GetAddressData_Arr addObject:address];
            NSLog(@"\nOpportunityListDisplayArr...... Print %@", GetAddressData_Arr);
            
            NSLog(@"\nOpportunityListDisplayArr......%d", [GetAddressData_Arr count]);
            
            if (GetAddressData_Arr >= 0) {
                
                [self hideAlert];
            }
            else {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            
            _utxt_contactstate.text = address.PersonalState;
            NSLog(@"States dsdfsd: %@", address.PersonalState);
            _utxt_firstname.text=address.firstname;
            _utxt_lastname.text=address.lastname;
            _utxt_mobilenumber.text=address.CellularPhone;
            
            
            _txt_contactemailid.text=address.TMEmailAddress;
            _utxt_contactdistrict.text = address.TMDistrict;
            _utxt_contactcity.text = address.PersonalCity;
            _utxt_contacttaluka.text = address.TMTaluka;
            _utxt_contactpincode.text = address.PersonalPostalCode;
            _utxt_contactpanchayat.text = address.TMPanchayat;
            _utxt_contactAddressline1.text = address.PersonalAddressName;
            _utxt_addressline2.text = address.PersonalStreetAddress2;
            _utxt_contactpannumber.text=address.SocialSecurityNumber;
            _utxt_contactarea.text=address.TMArea;
            
            
            
            
        }
        /*else
         {
         
         alert=[[UIAlertView alloc]initWithTitle:@"NEEV" message :@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         [alert show];
         }*/
    }
    
    
    
}

-(void)accountfetch{
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\">"
                              @"<soapenv:Header/>"
                              @"<soapenv:Body>"
                              @"<asi:SFATMCVAccountQueryById_Input>"
                              @"<asi:PrimaryRowId>%@</asi:PrimaryRowId>"
                              @"</asi:SFATMCVAccountQueryById_Input>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",ACCOUNT_ID];
    
    
    
    
    
    
    
    
    
    NSLog(@"\n envlopeString Of user details....%@", envelopeText);
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    
    NSLog(@"URL IS %@", theurl);
    
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    
    [[RequestDelegate alloc] initiateRequest:request name:@"getaccountdetails"];
    
    
}

-(void) getaccountdetails_found:(NSNotification*)notification
{
    
    // int i = 0;
    // int i = 0; //for test loop
    accountsarray = [[NSMutableArray alloc] init];
    //Activities_Customer_list=[[NSMutableArray alloc] init];
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    
    NSLog(@"\n Response.. account Data %@", response);
    
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
    else if ([response rangeOfString:@"soapenv:Fault"].location != NSNotFound) {
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
        [self hideAlert];
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"Account" parentElement:[TBXML childElementNamed:@"ListOfAccountInterface" parentElement:[TBXML childElementNamed:@"ns:SFATMCVAccountQueryById_Output" parentElement:[TBXML childElementNamed:@"soapenv:Body" parentElement:tbxml.rootXMLElement]]]];
        
        if (accountsarray) {
            [accountsarray removeAllObjects];
        }
        if (container) {
            
            // do {
            
            accounts = nil;
            accounts = [[accountdetails alloc] init];
            
            
            TBXMLElement*AccountId = [TBXML childElementNamed:@"AccountId" parentElement:container];
            accounts.accountaddressID = [TBXML textForElement:AccountId];
            
            TBXMLElement*Location = [TBXML childElementNamed:@"Location" parentElement:container];
            accounts.accountlocation = [TBXML textForElement:Location];
            
            TBXMLElement*MainPhoneNumber = [TBXML childElementNamed:@"MainPhoneNumber" parentElement:container];
            accounts.accountmainmobilenumber = [TBXML textForElement:MainPhoneNumber];
           
            
            TBXMLElement*Name = [TBXML childElementNamed:@"Name" parentElement:container];
            accounts.accountname = [TBXML textForElement:Name];
            
            
          
            
            
            if ([response rangeOfString:@"<ListOfBusinessAddress/>"].location != NSNotFound) {
            
                
                accountaddressID=@"";
                
            }
            
            else
            {
            
            TBXMLElement* Opportunity1 = [TBXML childElementNamed:@"ListOfBusinessAddress" parentElement:container];
            
            
            TBXMLElement* table = [TBXML childElementNamed:@"BusinessAddress" parentElement:Opportunity1];
            
            
            
            
            TBXMLElement* Address = [TBXML childElementNamed:@"AddressId" parentElement:table];
            accounts.accountaddressID = [TBXML textForElement:Address];
            
            
            
            accountaddressID=accounts.accountaddressID;
                
            
                
            
            
            TBXMLElement* City = [TBXML childElementNamed:@"City" parentElement:table];
            accounts.accountPersonalCity = [TBXML textForElement:City];
            
            TBXMLElement* PostalCode = [TBXML childElementNamed:@"PostalCode" parentElement:table];
            accounts.accountPersonalPostalCode = [TBXML textForElement:PostalCode];
            
            TBXMLElement* State = [TBXML childElementNamed:@"State" parentElement:table];
            accounts.accountPersonalState = [TBXML textForElement:State];
            
            TBXMLElement* StreetAddress = [TBXML childElementNamed:@"StreetAddress" parentElement:table];
            accounts.accountPersonalStreetAddress = [TBXML textForElement:StreetAddress];
            
            
            TBXMLElement* StreetAddress2 = [TBXML childElementNamed:@"StreetAddress2" parentElement:table];
            accounts.accountPersonalStreetAddress2 = [TBXML textForElement:StreetAddress2];
            
            
            TBXMLElement* TMDistrict = [TBXML childElementNamed:@"TMDistrict" parentElement:table];
            accounts.accountTMDistrict = [TBXML textForElement:TMDistrict];
            
            
            
            
            TBXMLElement* TMTaluka = [TBXML childElementNamed:@"TMTaluka" parentElement:table];
            accounts.accountTMTaluka = [TBXML textForElement:TMTaluka];
            
            }
            
            
            TBXMLElement* Opportunity2 = [TBXML childElementNamed:@"ListOfRelatedContact" parentElement:container];
            
            
            TBXMLElement* table2 = [TBXML childElementNamed:@"RelatedContact" parentElement:Opportunity2];
            
            
            //ContactId
            
            
            TBXMLElement* ContactId = [TBXML childElementNamed:@"ContactId" parentElement:table2];
            accounts.accountContactId = [TBXML textForElement:ContactId];
            
            accountContactIDs=accounts.accountContactId;
            
            
            
            TBXMLElement* CellularPhone = [TBXML childElementNamed:@"CellularPhone" parentElement:table2];
            accounts.accountcellnumber = [TBXML textForElement:CellularPhone];
            
            TBXMLElement* FirstName = [TBXML childElementNamed:@"FirstName" parentElement:table2];
            accounts.accountfirstname = [TBXML textForElement:FirstName];
            
            
            TBXMLElement* LastName = [TBXML childElementNamed:@"LastName" parentElement:table2];
            accounts.accountlastname = [TBXML textForElement:LastName];
            
            
            
            [accountsarray addObject:accounts];
            NSLog(@"\nOpportunityListDisplayArr...... Print %@", accountsarray);
            
            NSLog(@"\nOpportunityListDisplayArr......%d", [accountsarray count]);
            
            if (accountsarray >= 0) {
                // [self.tableViewData setHidden:NO];
                [self hideAlert];
            }
            else {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            
            // _utxt_firstname.text = accounts.accountfirstname;
            // _utxt_lastname.text = accounts.accountlastname;
            // _utxt_mobilenumber.text = accounts.accountcellnumber;
            
            
            
            _utxt_accountName.text = accounts.accountname;
            _utxt_site.text = accounts.accountlocation;
            _utxt_mainphonenumber.text = accounts.accountmainmobilenumber;
            
            _utxt_accountstate.text = accounts.accountPersonalState;
            NSLog(@"States dsdfsd: %@", accounts.accountPersonalState);
            //   SelectedStateCode = [ objectForKey:address.PersonalState];
            //   NSLog(@"States Found :%@", SelectedStateCode);
            //  NSLog(@"Sates Code : %@", [GetAllStateCodes objectForKey:@"Maharashtra"]);
            
            _utxt_accountdistrict.text = accounts.accountTMDistrict;
            _utxt_accountcity.text = accounts.accountPersonalCity;
            _utxt_accounttaluka.text = accounts.accountTMTaluka;
            _utxt_accountpincode.text = accounts.accountPersonalPostalCode;
            
            _utxt_accountaddressline1.text = accounts.accountPersonalStreetAddress;
            _utxt_accountaddressline2.text = accounts.accountPersonalStreetAddress2;
            
            
        }
        
    }
    
    
    
}

-(void)updateopty{
    
    
    [self showAlert];
    
    
    
    
    if ([_utxt_contactcity.text isEqual:address.PersonalCity]) {
        
        updatefirecount=@"first";
        
        integrationIdvalue= [NSString stringWithFormat:@"%ld", (long)[[NSDate date]timeIntervalSince1970]];
        
        
        
//        
//        NSString * envelopeText3 = [NSString stringWithFormat:
//                                    @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
//                                    @"<SOAP:Body>"
//                                    @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
//                                    @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
//                                    @"<Contact>"
//                                    @"<Id>%@</Id>"
//                                    @"<CellularPhone>%@</CellularPhone>"
//                                    @"<EmailAddress>%@/EmailAddress>"
//                                    @"<FirstName>%@</FirstName>"
//                                    @"<IntegrationId>%@</IntegrationId>"
//                                    @"<LastName>%@</LastName>"
//                                    @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
//                                    @"<ListOfRelatedSalesRep>"
//                                    @"<RelatedSalesRep>"
//                                    @"<Position>TMCV-Sal-W-MUM-1001680-Nerul-LCV-DSE-21</Position>"
//                                    @"<Id>1-1LQFGP</Id>"
//                                    @"</RelatedSalesRep>"
//                                    @"</ListOfRelatedSalesRep>"
//                                    @"<ListOfRelatedOrganization>"
//                                    @"<RelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
//                                    @"<Organization>BAFNA Motors (Mumbai) Pvt. Ltd.</Organization>"
//                                    @"</RelatedOrganization>"
//                                    @"</ListOfRelatedOrganization>"
//                                    @"<ListOfPersonalAddress>"
//                                    @"<PersonalAddress IsPrimaryMVG=\"Y\">"
//                                    @"<Id>%@</Id>"
//                                    @"<IntegrationId>%@</IntegrationId>"
//                                    @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
//                                    @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
//                                    @"<PersonalCountry>India</PersonalCountry>"
//                                    @"<PersonalState>%@</PersonalState>"
//                                    @"<TMDistrict>%@</TMDistrict>"
//                                    @"<PersonalCity>%@</PersonalCity>"
//                                    @"<TMTaluka>%@</TMTaluka>"
//                                    @"<TMPanchayat>%@</TMPanchayat>"
//                                    @"<TMArea>%@</TMArea>"
//                                    @"<PersonalPostalCode></PersonalPostalCode>"
//                                    @"</PersonalAddress>"
//                                    @"</ListOfPersonalAddress>"
//                                    @"<ListOfOpportunity>"
//                                    @"<Opportunity operation="">"
//                                    @"<Id>%@</Id>"
//                                    @"<IntegrationId>%@</IntegrationId>"
//                                    @"<OptyFinancier>%@</OptyFinancier>"
//                                    @"<ParentProductLine>%@</ParentProductLine>"
//                                    @"<ProductLine>%@</ProductLine>"
//                                    @"<TMSorceOfContact>%@</TMSorceOfContact>"
//                                    @"<Channel>MOBILE</Channel>"
//                                    @"<TMCVCustomerType>%@</TMCVCustomerType>"
//                                    @"<IntendedApplication>%@</IntendedApplication>"
//                                    @"<TMLOB>%@</TMLOB>"
//                                    @"<ProductId>%@</ProductId>"
//                                    @"<TMBodyType>%@</TMBodyType>"
//                                    @"<TMCustomerSegment>%@</TMCustomerSegment>"
//                                    @"<TMFleetSize>%@</TMFleetSize>"
//                                    @"<TMMMGeography>%@</TMMMGeography>"
//                                    @"<TMNonFleetSize>%@</TMNonFleetSize>"
//                                    @"<ListOfOpportunityRelatedOrganization>"
//                                    @"<OpportunityRelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
//                                    @"<Organization>BAFNA Motors (Mumbai) Pvt. Ltd.</Organization>"
//                                    @"</OpportunityRelatedOrganization>"
//                                    @"</ListOfOpportunityRelatedOrganization>"
//                                    @"<ListOfOpportunityRelatedSalesRep>"
//                                    @"<OpportunityRelatedSalesRep IsPrimaryMVG=\"Y\" operation=\"\">"
//                                    @"<Position>TMCV-Sal-W-MUM-1001680-Nerul-LCV-DSE-21</Position>"
//                                    @"<Id>1-1LQFGP</Id>"
//                                    @"</OpportunityRelatedSalesRep>"
//                                    @"</ListOfOpportunityRelatedSalesRep>"
//                                    @"<ListOfOpportunityRelatedProducts>"
//                                    @"<OpportunityRelatedProducts operation="">"
//                                    @"<Product>%@</Product>"
//                                    @"<ProductQuantity>%@</ProductQuantity>"
//                                    @"<ParentProductLine>%@</ParentProductLine>"
//                                    @"<ProductLine>%@</ProductLine>"
//                                    @"</OpportunityRelatedProducts>"
//                                    @"</ListOfOpportunityRelatedProducts>"
//                                    @"<ListOfOpportunityRelatedCampaigns>"
//                                    @"<OpportunityRelatedCampaigns operation="">"
//                                    @"<Id>%@</Id>"
//                                    @"</OpportunityRelatedCampaigns>"
//                                    @"</ListOfOpportunityRelatedCampaigns>"
//                                    @"</Opportunity>"
//                                    @"</ListOfOpportunity>"
//                                    @"</Contact>"
//                                    @"</ListOfContactInterface>"
//                                    @"</SFATMCVContactInsertOrUpdate_Input>"
//                                    @"</SOAP:Body>"
//                                    @"</SOAP:Envelope>",CONTACT_ID,_utxt_mobilenumber.text,_txt_contactemailid.text,_utxt_firstname.text,integrationIdvalue,_utxt_lastname.text ,_utxt_contactpannumber.text,ADDRESS_ID,integrationIdvalue,_utxt_contactAddressline1.text,_utxt_addressline2.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_utxt_contactdistrict.text,_utxt_contactcity.text,_utxt_contacttaluka.text,_utxt_contactpanchayat.text,_utxt_contactarea.text,OPTY_ID,integrationIdvalue,_utxt_financier.text,_utxt_ppl.text,_utxt_pl.text,_utxt_sourceOfcontact.text,_utxt_customerType.text,_utxt_Vehicleapplication.text,_utxt_LOB.text,uProduct_IDstring,_utxt_bodytype.text,_utxt_usagecatagory.text,_utxt_TMLfleetsize.text,_utxt_geography.text,_utxt_fleetsize.text,_utxt_vcnumber.text,_utxt_quantity.text,_utxt_ppl.text,_utxt_pl.text,_utxt_campaign.text];
//        
//        
//        
       
        
        
        
        
        
        
        NSString* envelopeText3;
        envelopeText3 = [NSString stringWithFormat:
                         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                         @"<SOAP:Body>"
                         @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                         @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                         @"<Contact>"
                         @"<Id>%@</Id>"
                         @"<CellularPhone>%@</CellularPhone>"
                         @"<EmailAddress>%@</EmailAddress>"
                         @"<FirstName>%@</FirstName>"
                         @"<IntegrationId>%@</IntegrationId>"
                         @"<LastName>%@</LastName>"
                         @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                         @"<ListOfRelatedSalesRep>"
                         @"<RelatedSalesRep>"
                         @"<Position>%@</Position>"
                         @"<Id>%@</Id>"
                         @"</RelatedSalesRep>"
                         @"</ListOfRelatedSalesRep>"
                         @"<ListOfRelatedOrganization>"
                         @"<RelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                         @"<Organization>%@</Organization>"
                         @"</RelatedOrganization>"
                         @"</ListOfRelatedOrganization>"
                         @"<ListOfPersonalAddress>"
                         @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                         @"<Id>%@</Id>"
                         @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                         @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                         @"<PersonalCountry>India</PersonalCountry>"
                         @"<PersonalState>%@</PersonalState>"
                         @"<TMDistrict>%@</TMDistrict>"
                         @"<PersonalCity>%@</PersonalCity>"
                         @"<TMTaluka>%@</TMTaluka>"
                         @"<TMPanchayat>%@</TMPanchayat>"
                         @"<TMArea>%@</TMArea>"
                         @"<PersonalPostalCode/>"
                         @"</PersonalAddress>"
                         @"</ListOfPersonalAddress>"
                         @"<ListOfOpportunity>"
                         @"<Opportunity operation=\"\">"
                         @"<Id>%@</Id>"
                         @"<IntegrationId>%@</IntegrationId>"
                         @"<OptyFinancier>%@</OptyFinancier>"
                         @"<ParentProductLine>%@</ParentProductLine>"
                         @"<ProductLine>%@</ProductLine>"
                         @"<TMSorceOfContact>%@</TMSorceOfContact>"
                         @"<Channel>MOBILE</Channel>"
                         @"<TMCVCustomerType>%@</TMCVCustomerType>"
                         @"<IntendedApplication>%@</IntendedApplication>"
                         @"<TMLOB>%@</TMLOB>"
                         @"<ProductId>%@</ProductId>"
                         @"<TMBodyType/>"
                         @"<TMCustomerSegment>%@</TMCustomerSegment>"
                         @"<TMFleetSize/>"
                         @"<TMMMGeography>%@</TMMMGeography>"
                         @"<TMNonFleetSize/>"
                         @"<ListOfOpportunityRelatedOrganization>"
                         @"<OpportunityRelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                         @"<Organization>%@</Organization>"
                         @"</OpportunityRelatedOrganization>"
                         @"</ListOfOpportunityRelatedOrganization>"
                         @"<ListOfOpportunityRelatedSalesRep>"
                         @"<OpportunityRelatedSalesRep IsPrimaryMVG=\"Y\" operation=\"\">"
                         @"<Position>%@</Position>"
                         @"<Id>%@</Id>"
                         @"</OpportunityRelatedSalesRep>"
                         @"</ListOfOpportunityRelatedSalesRep>"
                         @"<ListOfOpportunityRelatedProducts>"
                         @"<OpportunityRelatedProducts operation=\"\">"
                         @"<Product>%@</Product>"
                         @"<ProductQuantity>%@</ProductQuantity>"
                         @"<ParentProductLine>%@</ParentProductLine>"
                         @"<ProductLine>%@</ProductLine>"
                         @"</OpportunityRelatedProducts>"
                         @"</ListOfOpportunityRelatedProducts>"
                         @"<ListOfOpportunityRelatedCampaigns>"
                         @"<OpportunityRelatedCampaigns operation=\"\">"
                         @"<Id>%@</Id>"
                         @"</OpportunityRelatedCampaigns>"
                         @"</ListOfOpportunityRelatedCampaigns>"
                         @"</Opportunity>"
                         @"</ListOfOpportunity>"
                         @"</Contact>"
                         @"</ListOfContactInterface>"
                         @"</SFATMCVContactInsertOrUpdate_Input>"
                         @"</SOAP:Body>"
                         @"</SOAP:Envelope>",CONTACT_ID,_utxt_mobilenumber.text,_txt_contactemailid.text,_utxt_firstname.text,integrationIdvalue,_utxt_lastname.text,_utxt_contactpannumber.text,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,userDetailsVal_.ORGNAME,ADDRESS_ID,_utxt_contactAddressline1.text,_utxt_addressline2.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_utxt_contactdistrict.text,_utxt_contactcity.text,_utxt_contacttaluka.text,_utxt_contactpanchayat.text,_utxt_contactarea.text,OPTY_ID,integrationIdvalue,_utxt_financier.text,_utxt_ppl.text,_utxt_pl.text,_utxt_sourceOfcontact.text,_utxt_customerType.text,_utxt_Vehicleapplication.text,_utxt_LOB.text,uProduct_IDstring,_utxt_usagecatagory.text,_utxt_geography.text,userDetailsVal_.ORGNAME,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,_utxt_vcnumber.text,_utxt_quantity.text,_utxt_ppl.text,_utxt_pl.text,@"1-7FDWNPL"];
        
        
        
        
        
        NSData* envelope = [envelopeText3 dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText3);
        
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSLog(@"Request.... %@", request);
        NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText3 length]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"Createoptyfornewcontact"];
        
        
    }
    else
    {
             updatefirecount=@"first";
        
        integrationIdvalue= [NSString stringWithFormat:@"%ld", (long)[[NSDate date]timeIntervalSince1970]];
        
        NSString* envelopeText3;
        envelopeText3 = [NSString stringWithFormat:
                         @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                         @"<SOAP:Body>"
                         @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                         @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                         @"<Contact>"
                         @"<Id>%@</Id>"
                         @"<CellularPhone>%@</CellularPhone>"
                         @"<EmailAddress>%@</EmailAddress>"
                         @"<FirstName>%@</FirstName>"
                         @"<IntegrationId>%@</IntegrationId>"
                         @"<LastName>%@</LastName>"
                         @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                         @"<ListOfRelatedSalesRep>"
                         @"<RelatedSalesRep>"
                         @"<Position>%@</Position>"
                         @"<Id>%@</Id>"
                         @"</RelatedSalesRep>"
                         @"</ListOfRelatedSalesRep>"
                         @"<ListOfRelatedOrganization>"
                         @"<RelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                         @"<Organization>%@</Organization>"
                         @"</RelatedOrganization>"
                         @"</ListOfRelatedOrganization>"
                         @"<ListOfPersonalAddress>"
                         @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                         @"<Id>%@</Id>"
                         @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                         @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                         @"<PersonalCountry>India</PersonalCountry>"
                         @"<PersonalState>%@</PersonalState>"
                         @"<TMDistrict>%@</TMDistrict>"
                         @"<TMTaluka>%@</TMTaluka>"
                         @"<TMPanchayat>%@</TMPanchayat>"
                         @"<TMArea>%@</TMArea>"
                         @"<PersonalPostalCode/>"
                         @"</PersonalAddress>"
                         @"</ListOfPersonalAddress>"
                         @"<ListOfOpportunity>"
                         @"<Opportunity operation=\"\">"
                         @"<Id>%@</Id>"
                         @"<IntegrationId>%@</IntegrationId>"
                         @"<OptyFinancier>%@</OptyFinancier>"
                         @"<ParentProductLine>%@</ParentProductLine>"
                         @"<ProductLine>%@</ProductLine>"
                         @"<TMSorceOfContact>%@</TMSorceOfContact>"
                         @"<Channel>MOBILE</Channel>"
                         @"<TMCVCustomerType>%@</TMCVCustomerType>"
                         @"<IntendedApplication>%@</IntendedApplication>"
                         @"<TMLOB>%@</TMLOB>"
                         @"<ProductId>%@</ProductId>"
                         @"<TMBodyType/>"
                         @"<TMCustomerSegment>%@</TMCustomerSegment>"
                         @"<TMFleetSize/>"
                         @"<TMMMGeography>%@</TMMMGeography>"
                         @"<TMNonFleetSize/>"
                         @"<ListOfOpportunityRelatedOrganization>"
                         @"<OpportunityRelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                         @"<Organization>%@</Organization>"
                         @"</OpportunityRelatedOrganization>"
                         @"</ListOfOpportunityRelatedOrganization>"
                         @"<ListOfOpportunityRelatedSalesRep>"
                         @"<OpportunityRelatedSalesRep IsPrimaryMVG=\"Y\" operation=\"\">"
                         @"<Position>%@</Position>"
                         @"<Id>%@</Id>"
                         @"</OpportunityRelatedSalesRep>"
                         @"</ListOfOpportunityRelatedSalesRep>"
                         @"<ListOfOpportunityRelatedProducts>"
                         @"<OpportunityRelatedProducts operation=\"\">"
                         @"<Product>%@</Product>"
                         @"<ProductQuantity>%@</ProductQuantity>"
                         @"<ParentProductLine>%@</ParentProductLine>"
                         @"<ProductLine>%@</ProductLine>"
                         @"</OpportunityRelatedProducts>"
                         @"</ListOfOpportunityRelatedProducts>"
                         @"<ListOfOpportunityRelatedCampaigns>"
                         @"<OpportunityRelatedCampaigns operation=\"\">"
                         @"<Id>%@</Id>"
                         @"</OpportunityRelatedCampaigns>"
                         @"</ListOfOpportunityRelatedCampaigns>"
                         @"</Opportunity>"
                         @"</ListOfOpportunity>"
                         @"</Contact>"
                         @"</ListOfContactInterface>"
                         @"</SFATMCVContactInsertOrUpdate_Input>"
                         @"</SOAP:Body>"
                         @"</SOAP:Envelope>",CONTACT_ID,_utxt_mobilenumber.text,_txt_contactemailid.text,_utxt_firstname.text,integrationIdvalue,_utxt_lastname.text,_utxt_contactpannumber.text,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,userDetailsVal_.ORGNAME,ADDRESS_ID,_utxt_contactAddressline1.text,_utxt_addressline2.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_utxt_contactdistrict.text,_utxt_contacttaluka.text,_utxt_contactpanchayat.text,_utxt_contactarea.text,OPTY_ID,integrationIdvalue,_utxt_financier.text,_utxt_ppl.text,_utxt_pl.text,_utxt_sourceOfcontact.text,_utxt_customerType.text,_utxt_Vehicleapplication.text,_utxt_LOB.text,uProduct_IDstring,_utxt_usagecatagory.text,_utxt_geography.text,userDetailsVal_.ORGNAME,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,_utxt_vcnumber.text,_utxt_quantity.text,_utxt_ppl.text,_utxt_pl.text,@"1-7FDWNPL"];
        
        
        
        
        
        NSData* envelope = [envelopeText3 dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText3);
        
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSLog(@"Request.... %@", request);
        NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText3 length]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        [[RequestDelegate alloc] initiateRequest:request name:@"Createoptyfornewcontact"];
        
     
        
        
    }
    
    
    
}


- (void)Createoptyfornewcontact_found:(NSNotification*)notification

{
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n List of Opportunity Response %@ ", response);
    
    NSError* err;
    
    if ([response isEqual:@""]) {
        [self hideAlert];
        NSLog(@"Nko re..");
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        
        if ([response rangeOfString:@"in the bounded picklist for the field 'TM MM Geography' in integration component"].location != NSNotFound) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"selected geography not found in bounded pick list" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
        }
        
        else if ([response rangeOfString:@"in the bounded picklist for the field 'TM MM Geography"].location != NSNotFound) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Cannot find entry for selected geography in the bounded picklist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
            
            
        }
        
        
        
        else if ([response rangeOfString:@"returned the following error:&quot;An error has occurred writing to a record"].location != NSNotFound) {
            [self hideAlert];
            
          //  [self optyupdatewithoutcity];
            
        }
        
        else
            
            
        {
            
            
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
            
            
        }
    }
    
    else {
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"ns:SFATMCVContactInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* ListOfContactInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:container];
        
        TBXMLElement* Contact = [TBXML childElementNamed:@"Contact" parentElement:ListOfContactInterface];
        
        TBXMLElement* IDC = [TBXML childElementNamed:@"Id" parentElement:Contact];
        
        TBXMLElement* ListOfOpportunity = [TBXML childElementNamed:@"ListOfOpportunity" parentElement:Contact];
        
        TBXMLElement* Opportunity = [TBXML childElementNamed:@"Opportunity" parentElement:ListOfOpportunity];
        
        TBXMLElement* Id = [TBXML childElementNamed:@"Id" parentElement:Opportunity];
        
        NSString *ID = [TBXML textForElement:Id];
        
        NSLog(@"ID%@",ID);
        
        
        
        if (ID) {
            
            
            
            if ([updatefirecount isEqual:@"first"])
            {
 
                if ([_utxt_contactcity.text isEqual:address.PersonalCity])
                    
                {
                    
                    [self callsame];
                    
                }
                else
                {
                    
                    [self calldifferent];
                    
                }
                
                
                
            }
            else
                
            {
                
                
                
                if ([accountactionStatus isEqual:@"updateAccount"]) {
                    
                       [self updateAccount];
                }
                else
                {
                
                    if (_utxt_accountName.text && _utxt_mainphonenumber.text.length && _utxt_site.text == 0)
                    {
                        
                        [self hideAlert];
                        
                        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Opportunity updated successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [alert setTag:0];
                        
                        [alertView show];
                      
                    }
                    else
                    {
                    
                        [self createaccount];
                        
                        
                    }
                
                }
            
            }

        }
     
    }
    
}

-(void)optyupdatewithoutcity

{
    
    
    updatefirecount=@"second";
    
    NSString* envelopeText3;
    envelopeText3 = [NSString stringWithFormat:
                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                     @"<SOAP:Body>"
                     @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                     @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                     @"<Contact>"
                     @"<Id>%@</Id>"
                     @"<CellularPhone>%@</CellularPhone>"
                     @"<EmailAddress>%@</EmailAddress>"
                     @"<FirstName>%@</FirstName>"
                     @"<IntegrationId>%@</IntegrationId>"
                     @"<LastName>%@</LastName>"
                     @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                     @"<ListOfRelatedSalesRep>"
                     @"<RelatedSalesRep>"
                     @"<Position>%@</Position>"
                     @"<Id>%@</Id>"
                     @"</RelatedSalesRep>"
                     @"</ListOfRelatedSalesRep>"
                     @"<ListOfRelatedOrganization>"
                     @"<RelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Organization>%@</Organization>"
                     @"</RelatedOrganization>"
                     @"</ListOfRelatedOrganization>"
                     @"<ListOfPersonalAddress>"
                     @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                     @"<Id>%@</Id>"
                     @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                     @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                     @"<PersonalCountry>India</PersonalCountry>"
                     @"<PersonalState>%@</PersonalState>"
                     @"<TMDistrict>%@</TMDistrict>"
                     @"<PersonalCity>%@</PersonalCity>"
                     @"<TMTaluka>%@</TMTaluka>"
                     @"<TMPanchayat>%@</TMPanchayat>"
                     @"<TMArea>%@</TMArea>"
                     @"<PersonalPostalCode/>"
                     @"</PersonalAddress>"
                     @"</ListOfPersonalAddress>"
                     @"<ListOfOpportunity>"
                     @"<Opportunity operation=\"\">"
                     @"<Id>%@</Id>"
                     @"<IntegrationId>%@</IntegrationId>"
                     @"<OptyFinancier>%@</OptyFinancier>"
                     @"<ParentProductLine>%@</ParentProductLine>"
                     @"<ProductLine>%@</ProductLine>"
                     @"<TMSorceOfContact>%@</TMSorceOfContact>"
                     @"<Channel>MOBILE</Channel>"
                     @"<TMCVCustomerType>%@</TMCVCustomerType>"
                     @"<IntendedApplication>%@</IntendedApplication>"
                     @"<TMLOB>%@</TMLOB>"
                     @"<ProductId>%@</ProductId>"
                     @"<TMBodyType/>"
                     @"<TMCustomerSegment>%@</TMCustomerSegment>"
                     @"<TMFleetSize/>"
                     @"<TMMMGeography>%@</TMMMGeography>"
                     @"<TMNonFleetSize/>"
                     @"<ListOfOpportunityRelatedOrganization>"
                     @"<OpportunityRelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Organization>%@</Organization>"
                     @"</OpportunityRelatedOrganization>"
                     @"</ListOfOpportunityRelatedOrganization>"
                     @"<ListOfOpportunityRelatedSalesRep>"
                     @"<OpportunityRelatedSalesRep IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Position>%@</Position>"
                     @"<Id>%@</Id>"
                     @"</OpportunityRelatedSalesRep>"
                     @"</ListOfOpportunityRelatedSalesRep>"
                     @"<ListOfOpportunityRelatedProducts>"
                     @"<OpportunityRelatedProducts operation=\"\">"
                     @"<Product>%@</Product>"
                     @"<ProductQuantity>%@</ProductQuantity>"
                     @"<ParentProductLine>%@</ParentProductLine>"
                     @"<ProductLine>%@</ProductLine>"
                     @"</OpportunityRelatedProducts>"
                     @"</ListOfOpportunityRelatedProducts>"
                     @"<ListOfOpportunityRelatedCampaigns>"
                     @"<OpportunityRelatedCampaigns operation=\"\">"
                     @"<Id>%@</Id>"
                     @"</OpportunityRelatedCampaigns>"
                     @"</ListOfOpportunityRelatedCampaigns>"
                     @"</Opportunity>"
                     @"</ListOfOpportunity>"
                     @"</Contact>"
                     @"</ListOfContactInterface>"
                     @"</SFATMCVContactInsertOrUpdate_Input>"
                     @"</SOAP:Body>"
                     @"</SOAP:Envelope>",CONTACT_ID,_utxt_mobilenumber.text,_txt_contactemailid.text,_utxt_firstname.text,integrationIdvalue,_utxt_lastname.text,_utxt_contactpannumber.text,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,userDetailsVal_.ORGNAME,ADDRESS_ID,_utxt_contactAddressline1.text,_utxt_addressline2.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_utxt_contactdistrict.text,_utxt_contactcity.text,_utxt_contacttaluka.text,_utxt_contactpanchayat.text,_utxt_contactarea.text,OPTY_ID,integrationIdvalue,_utxt_financier.text,_utxt_ppl.text,_utxt_pl.text,_utxt_sourceOfcontact.text,_utxt_customerType.text,_utxt_Vehicleapplication.text,_utxt_LOB.text,uProduct_IDstring,_utxt_usagecatagory.text,_utxt_geography.text,userDetailsVal_.ORGNAME,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,_utxt_vcnumber.text,_utxt_quantity.text,_utxt_ppl.text,_utxt_pl.text,@"1-7FDWNPL"];
    
    
    
    
    
    NSData* envelope = [envelopeText3 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText3);
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSLog(@"Request.... %@", request);
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText3 length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"Createoptyfornewcontact"];

    
}



- (IBAction)uacccount_pincodeaction:(id)sender {
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetAllIndianPostalCode xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<state>%@</state>"
                              @"<dist>%@</dist>"
                              @"<city>%@</city>"
                              @"<taluka>%@</taluka>"
                              @"</GetAllIndianPostalCode>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],_utxt_accountdistrict.text,_utxt_accountcity.text,_utxt_accounttaluka.text];
    
    
    
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"getallaccountpincode"];
    
    
    
    
}

- (IBAction)ucontact_pincodeaction:(id)sender {
    
    
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetAllIndianPostalCode xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<state>%@</state>"
                              @"<dist>%@</dist>"
                              @"<city>%@</city>"
                              @"<taluka>%@</taluka>"
                              @"</GetAllIndianPostalCode>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_utxt_contactdistrict.text,_utxt_accountcity.text,_utxt_contacttaluka.text];
    
    
    
    
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"getAllPincodeConnection"];
    
    
}
- (void)AllPincode_Found:(NSNotification*)notification
{
    
    
    
    
    uGetAllPincode=[[NSMutableArray alloc]init];
    
    
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
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
    else {
        
        if (uGetAllPincode) {
            [uGetAllPincode removeAllObjects];
        }
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianPostalCodeResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"X_POSTAL_CODE" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);
                [uGetAllPincode addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@" PPL %@", uGetAllPincode);
            
            
            if ([uGetAllPincode count]>0) {
                
                
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:nil
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [uGetAllPincode count]; i++) {
                    [actionSheet addButtonWithTitle:[uGetAllPincode objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[self.utxt_contactpincode frame] inView:self.DETAILS2 animated:YES];
                }
                else {
                    [actionSheet showInView:self.view];
                }
                actionSheet.tag = 26;
                
                
                
                
                
                
                
                
                
                
            }
            else{
                
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                alert.tag=0;
                
                [alert show];
                
                
                
            }
            
            
            
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

-(void)getallaccountpincode_found:(NSNotification*)notification{
    
    
    uGetAllAccountPincode=[[NSMutableArray alloc]init];
    
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
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
    else {
        
        if (uGetAllAccountPincode) {
            [uGetAllAccountPincode removeAllObjects];
        }
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianPostalCodeResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        if (tuple) {
            do {
                TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"X_POSTAL_CODE" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);
                [uGetAllAccountPincode addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            
            
            if ([uGetAllAccountPincode count]>0) {
                
                
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:nil
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [uGetAllAccountPincode count]; i++) {
                    [actionSheet addButtonWithTitle:[uGetAllAccountPincode objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[self.utxt_accountpincode frame] inView:self.DETAILS2 animated:YES];
                }
                else {
                    [actionSheet showInView:self.view];
                }
                actionSheet.tag = 25;
                
                
                
                
                
            }
            else{
                
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                alert.tag=0;
                
                [alert show];
                
                
                
            }
            
            
            
            
            
            NSLog(@" PPL %@", uGetAllAccountPincode);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
    
    
    
}

-(void)callsame{
    
    
    updatefirecount=@"second";
    
    
    NSString* envelopeText3;
    envelopeText3 = [NSString stringWithFormat:
                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                     @"<SOAP:Body>"
                     @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                     @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                     @"<Contact>"
                     @"<Id>%@</Id>"
                     @"<CellularPhone>%@</CellularPhone>"
                     @"<EmailAddress>%@</EmailAddress>"
                     @"<FirstName>%@</FirstName>"
                     @"<IntegrationId>%@</IntegrationId>"
                     @"<LastName>%@</LastName>"
                     @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                     @"<ListOfRelatedSalesRep>"
                     @"<RelatedSalesRep>"
                     @"<Position>%@</Position>"
                     @"<Id>%@</Id>"
                     @"</RelatedSalesRep>"
                     @"</ListOfRelatedSalesRep>"
                     @"<ListOfRelatedOrganization>"
                     @"<RelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Organization>%@</Organization>"
                     @"</RelatedOrganization>"
                     @"</ListOfRelatedOrganization>"
                     @"<ListOfPersonalAddress>"
                     @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                     @"<Id>%@</Id>"
                     @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                     @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                     @"<PersonalCountry>India</PersonalCountry>"
                     @"<PersonalState>%@</PersonalState>"
                     @"<TMDistrict>%@</TMDistrict>"
                     @"<PersonalCity>%@</PersonalCity>"
                     @"<TMTaluka>%@</TMTaluka>"
                     @"<TMPanchayat>%@</TMPanchayat>"
                     @"<TMArea>%@</TMArea>"
                     @"<PersonalPostalCode/>"
                     @"</PersonalAddress>"
                     @"</ListOfPersonalAddress>"
                     @"<ListOfOpportunity>"
                     @"<Opportunity operation=\"\">"
                     @"<Id>%@</Id>"
                     @"<IntegrationId>%@</IntegrationId>"
                     @"<OptyFinancier>%@</OptyFinancier>"
                     @"<ParentProductLine>%@</ParentProductLine>"
                     @"<ProductLine>%@</ProductLine>"
                     @"<TMSorceOfContact>%@</TMSorceOfContact>"
                     @"<Channel>MOBILE</Channel>"
                     @"<TMCVCustomerType>%@</TMCVCustomerType>"
                     @"<IntendedApplication>%@</IntendedApplication>"
                     @"<TMLOB>%@</TMLOB>"
                     @"<ProductId>%@</ProductId>"
                     @"<TMBodyType/>"
                     @"<TMCustomerSegment>%@</TMCustomerSegment>"
                     @"<TMFleetSize/>"
                     @"<TMMMGeography>%@</TMMMGeography>"
                     @"<TMNonFleetSize/>"
                     @"<ListOfOpportunityRelatedOrganization>"
                     @"<OpportunityRelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Organization>%@</Organization>"
                     @"</OpportunityRelatedOrganization>"
                     @"</ListOfOpportunityRelatedOrganization>"
                     @"<ListOfOpportunityRelatedSalesRep>"
                     @"<OpportunityRelatedSalesRep IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Position>%@</Position>"
                     @"<Id>%@</Id>"
                     @"</OpportunityRelatedSalesRep>"
                     @"</ListOfOpportunityRelatedSalesRep>"
                     @"<ListOfOpportunityRelatedProducts>"
                     @"<OpportunityRelatedProducts operation=\"\">"
                     @"<Product>%@</Product>"
                     @"<ProductQuantity>%@</ProductQuantity>"
                     @"<ParentProductLine>%@</ParentProductLine>"
                     @"<ProductLine>%@</ProductLine>"
                     @"</OpportunityRelatedProducts>"
                     @"</ListOfOpportunityRelatedProducts>"
                     @"<ListOfOpportunityRelatedCampaigns>"
                     @"<OpportunityRelatedCampaigns operation=\"\">"
                     @"<Id>%@</Id>"
                     @"</OpportunityRelatedCampaigns>"
                     @"</ListOfOpportunityRelatedCampaigns>"
                     @"</Opportunity>"
                     @"</ListOfOpportunity>"
                     @"</Contact>"
                     @"</ListOfContactInterface>"
                     @"</SFATMCVContactInsertOrUpdate_Input>"
                     @"</SOAP:Body>"
                     @"</SOAP:Envelope>",CONTACT_ID,_utxt_mobilenumber.text,_txt_contactemailid.text,_utxt_firstname.text,integrationIdvalue,_utxt_lastname.text,_utxt_contactpannumber.text,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,userDetailsVal_.ORGNAME,ADDRESS_ID,_utxt_contactAddressline1.text,_utxt_addressline2.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_utxt_contactdistrict.text,_utxt_contactcity.text,_utxt_contacttaluka.text,_utxt_contactpanchayat.text,_utxt_contactarea.text,OPTY_ID,integrationIdvalue,_utxt_financier.text,_utxt_ppl.text,_utxt_pl.text,_utxt_sourceOfcontact.text,_utxt_customerType.text,_utxt_Vehicleapplication.text,_utxt_LOB.text,uProduct_IDstring,_utxt_usagecatagory.text,_utxt_geography.text,userDetailsVal_.ORGNAME,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,_utxt_vcnumber.text,_utxt_quantity.text,_utxt_ppl.text,_utxt_pl.text,@"1-7FDWNPL"];
    
    
    
    
    
    NSData* envelope = [envelopeText3 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText3);
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSLog(@"Request.... %@", request);
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText3 length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"Createoptyfornewcontact"];
    
    
    
}

-(void)calldifferent{
    
    
    
    updatefirecount=@"second";
    
    integrationIdvalue= [NSString stringWithFormat:@"%ld", (long)[[NSDate date]timeIntervalSince1970]];
    NSString* envelopeText3;
    envelopeText3 = [NSString stringWithFormat:
                     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                     @"<SOAP:Body>"
                     @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                     @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                     @"<Contact>"
                     @"<Id>%@</Id>"
                     @"<CellularPhone>%@</CellularPhone>"
                     @"<EmailAddress>%@</EmailAddress>"
                     @"<FirstName>%@</FirstName>"
                     @"<IntegrationId>%@</IntegrationId>"
                     @"<LastName>%@</LastName>"
                     @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                     @"<ListOfRelatedSalesRep>"
                     @"<RelatedSalesRep>"
                     @"<Position>%@</Position>"
                     @"<Id>%@</Id>"
                     @"</RelatedSalesRep>"
                     @"</ListOfRelatedSalesRep>"
                     @"<ListOfRelatedOrganization>"
                     @"<RelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Organization>%@</Organization>"
                     @"</RelatedOrganization>"
                     @"</ListOfRelatedOrganization>"
                     @"<ListOfPersonalAddress>"
                     @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                     @"<Id>%@</Id>"
                     @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                     @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                     @"<PersonalCountry>India</PersonalCountry>"
                     @"<PersonalState>%@</PersonalState>"
                     @"<TMDistrict>%@</TMDistrict>"
                     @"<PersonalCity>%@</PersonalCity>"
                     @"<TMTaluka>%@</TMTaluka>"
                     @"<TMPanchayat>%@</TMPanchayat>"
                     @"<TMArea>%@</TMArea>"
                     @"<PersonalPostalCode/>"
                     @"</PersonalAddress>"
                     @"</ListOfPersonalAddress>"
                     @"<ListOfOpportunity>"
                     @"<Opportunity operation=\"\">"
                     @"<Id>%@</Id>"
                     @"<IntegrationId>%@</IntegrationId>"
                     @"<OptyFinancier>%@</OptyFinancier>"
                     @"<ParentProductLine>%@</ParentProductLine>"
                     @"<ProductLine>%@</ProductLine>"
                     @"<TMSorceOfContact>%@</TMSorceOfContact>"
                     @"<Channel>MOBILE</Channel>"
                     @"<TMCVCustomerType>%@</TMCVCustomerType>"
                     @"<IntendedApplication>%@</IntendedApplication>"
                     @"<TMLOB>%@</TMLOB>"
                     @"<ProductId>%@</ProductId>"
                     @"<TMBodyType/>"
                     @"<TMCustomerSegment>%@</TMCustomerSegment>"
                     @"<TMFleetSize/>"
                     @"<TMMMGeography>%@</TMMMGeography>"
                     @"<TMNonFleetSize/>"
                     @"<ListOfOpportunityRelatedOrganization>"
                     @"<OpportunityRelatedOrganization IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Organization>%@</Organization>"
                     @"</OpportunityRelatedOrganization>"
                     @"</ListOfOpportunityRelatedOrganization>"
                     @"<ListOfOpportunityRelatedSalesRep>"
                     @"<OpportunityRelatedSalesRep IsPrimaryMVG=\"Y\" operation=\"\">"
                     @"<Position>%@</Position>"
                     @"<Id>%@</Id>"
                     @"</OpportunityRelatedSalesRep>"
                     @"</ListOfOpportunityRelatedSalesRep>"
                     @"<ListOfOpportunityRelatedProducts>"
                     @"<OpportunityRelatedProducts operation=\"\">"
                     @"<Product>%@</Product>"
                     @"<ProductQuantity>%@</ProductQuantity>"
                     @"<ParentProductLine>%@</ParentProductLine>"
                     @"<ProductLine>%@</ProductLine>"
                     @"</OpportunityRelatedProducts>"
                     @"</ListOfOpportunityRelatedProducts>"
                     @"<ListOfOpportunityRelatedCampaigns>"
                     @"<OpportunityRelatedCampaigns operation=\"\">"
                     @"<Id>%@</Id>"
                     @"</OpportunityRelatedCampaigns>"
                     @"</ListOfOpportunityRelatedCampaigns>"
                     @"</Opportunity>"
                     @"</ListOfOpportunity>"
                     @"</Contact>"
                     @"</ListOfContactInterface>"
                     @"</SFATMCVContactInsertOrUpdate_Input>"
                     @"</SOAP:Body>"
                     @"</SOAP:Envelope>",CONTACT_ID,_utxt_mobilenumber.text,_txt_contactemailid.text,_utxt_firstname.text,integrationIdvalue,_utxt_lastname.text,_utxt_contactpannumber.text,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,userDetailsVal_.ORGNAME,ADDRESS_ID,_utxt_contactAddressline1.text,_utxt_addressline2.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_utxt_contactdistrict.text,_utxt_contactcity.text,_utxt_contacttaluka.text,_utxt_contactpanchayat.text,_utxt_contactarea.text,OPTY_ID,integrationIdvalue,_utxt_financier.text,_utxt_ppl.text,_utxt_pl.text,_utxt_sourceOfcontact.text,_utxt_customerType.text,_utxt_Vehicleapplication.text,_utxt_LOB.text,uProduct_IDstring,_utxt_usagecatagory.text,_utxt_geography.text,userDetailsVal_.ORGNAME,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,_utxt_vcnumber.text,_utxt_quantity.text,_utxt_ppl.text,_utxt_pl.text,@"1-7FDWNPL"];
    
    
    
    
    
    NSData* envelope = [envelopeText3 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText3);
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSLog(@"Request.... %@", request);
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText3 length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"Createoptyfornewcontact"];
    
    
    
}

-(void)updateAccount{


    
    if ([_utxt_accountcity.text isEqual:accounts.accountPersonalCity])
       
        {
            if ([accountaddressID isEqual:@""]) {
               
                
                updatefirecount=@"first";
                
                
                NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
                
                
                NSString * envelopeText = [NSString stringWithFormat:
                                           @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                                           @"<soapenv:Header />"
                                           @"<soapenv:Body>"
                                           @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                                           @"<ListOfAccountInterface>"
                                           @"<Account operation=\"\">"
                                           @"<AccountId>%@</AccountId>"
                                           @"<IntegrationId>%ld</IntegrationId>"
                                           @"<Location>sdfsdfvs</Location>"
                                           @"<MainPhoneNumber>%@</MainPhoneNumber>"
                                           @"<Name>%@</Name>"
                                           @"<ListOfBusinessAddress>"
                                           @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                                           @"<AddressIntegrationId>%ld</AddressIntegrationId>"
                                           @"<City>%@</City>"
                                           @"<Country>India</Country>"
                                           @"<PostalCode>%@</PostalCode>"
                                           @"<State>%@</State>"
                                           @"<StreetAddress>%@</StreetAddress>"
                                           @"<StreetAddress2>%@</StreetAddress2>"
                                           @"<TMDistrict>%@</TMDistrict>"
                                           @"<TMTaluka>%@</TMTaluka>"
                                           @"</BusinessAddress>"
                                           @"</ListOfBusinessAddress>"
                                           @"<ListOfRelatedContact>"
                                           @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"\">"
                                           @"<ContactId>%@</ContactId>"
                                           @"</RelatedContact>"
                                           @"</ListOfRelatedContact>"
                                           @"<ListOfRelatedSalesRep>"
                                           @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                                           @"<Position>%@</Position>"
                                           @"<PositionId>%@</PositionId>"
                                           @"</RelatedSalesRep>"
                                           @"</ListOfRelatedSalesRep>"
                                           @"<ListOfRelatedOrganization>"
                                           @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                                           @"<Organization>%@</Organization>"
                                           @"</RelatedOrganization>"
                                           @"</ListOfRelatedOrganization>"
                                           @"</Account>"
                                           @"</ListOfAccountInterface>"
                                           @"<asi:StatusObject>?</asi:StatusObject>"
                                           @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                                           @"</soapenv:Body>"
                                           @"</soapenv:Envelope>",ACCOUNT_ID,
                                           (long)[[NSDate date]timeIntervalSince1970],
                                           _utxt_mainphonenumber.text,
                                           _utxt_accountName.text,(long)[[NSDate date] timeIntervalSince1970],[(UITextField *)[self.view viewWithTag:3] text],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               accountContactIDs,
                                           userDetailsVal_.POSITION_NAME,
                                           userDetailsVal_.POSTN,
                                           userDetailsVal_.ORGNAME];
                
                NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
                
                NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
                NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
                NSLog(@"URL IS %@",theurl);
                
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
                NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
                
                [request setHTTPMethod:@"POST"];
                [request setHTTPBody:envelope];
                [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
                [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
                
                
                
                [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation"];
                
                
            }
            else{
            
            updatefirecount=@"first";
            
            
            NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
            
            
            NSString * envelopeText = [NSString stringWithFormat:
                                       @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                                       @"<soapenv:Header />"
                                       @"<soapenv:Body>"
                                       @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                                       @"<ListOfAccountInterface>"
                                       @"<Account operation=\"\">"
                                       @"<AccountId>%@</AccountId>"
                                       @"<IntegrationId>%ld</IntegrationId>"
                                       @"<Location>sdfsdfvs</Location>"
                                       @"<MainPhoneNumber>%@</MainPhoneNumber>"
                                       @"<Name>%@</Name>"
                                       @"<ListOfBusinessAddress>"
                                       @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                                       @"<AddressId>%@</AddressId>"
                                       @"<AddressIntegrationId>%ld</AddressIntegrationId>"
                                       @"<City>%@</City>"
                                       @"<Country>India</Country>"
                                       @"<PostalCode>%@</PostalCode>"
                                       @"<State>%@</State>"
                                       @"<StreetAddress>%@</StreetAddress>"
                                       @"<StreetAddress2>%@</StreetAddress2>"
                                       @"<TMDistrict>%@</TMDistrict>"
                                       @"<TMTaluka>%@</TMTaluka>"
                                       @"</BusinessAddress>"
                                       @"</ListOfBusinessAddress>"
                                       @"<ListOfRelatedContact>"
                                       @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"\">"
                                       @"<ContactId>%@</ContactId>"
                                       @"</RelatedContact>"
                                       @"</ListOfRelatedContact>"
                                       @"<ListOfRelatedSalesRep>"
                                       @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                                       @"<Position>%@</Position>"
                                       @"<PositionId>%@</PositionId>"
                                       @"</RelatedSalesRep>"
                                       @"</ListOfRelatedSalesRep>"
                                       @"<ListOfRelatedOrganization>"
                                       @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                                       @"<Organization>%@</Organization>"
                                       @"</RelatedOrganization>"
                                       @"</ListOfRelatedOrganization>"
                                       @"</Account>"
                                       @"</ListOfAccountInterface>"
                                       @"<asi:StatusObject>?</asi:StatusObject>"
                                       @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                                       @"</soapenv:Body>"
                                       @"</soapenv:Envelope>",ACCOUNT_ID,
                                       (long)[[NSDate date]timeIntervalSince1970],
                                       _utxt_mainphonenumber.text,
                                       _utxt_accountName.text,accountaddressID,(long)[[NSDate date] timeIntervalSince1970],[(UITextField *)[self.view viewWithTag:3] text],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               accountContactIDs,
                                       userDetailsVal_.POSITION_NAME,
                                       userDetailsVal_.POSTN,
                                       userDetailsVal_.ORGNAME];
            
            NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS %@",theurl);
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
            NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
            
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            
            
            
            [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation"];
            
            }
        
        }
        else
        {
            
               if ([accountaddressID isEqual:@""]) {
                   
                   
                   updatefirecount=@"first";
                   
                   
                   NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
                   
                   
                   NSString * envelopeText = [NSString stringWithFormat:
                                              @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                                              @"<soapenv:Header />"
                                              @"<soapenv:Body>"
                                              @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                                              @"<ListOfAccountInterface>"
                                              @"<Account operation=\"\">"
                                              @"<AccountId>%@</AccountId>"
                                              @"<IntegrationId>%ld</IntegrationId>"
                                              @"<Location>sdfsdfvs</Location>"
                                              @"<MainPhoneNumber>%@</MainPhoneNumber>"
                                              @"<Name>%@</Name>"
                                              @"<ListOfBusinessAddress>"
                                              @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                                              @"<AddressIntegrationId>%ld</AddressIntegrationId>"
                                              @"<Country>India</Country>"
                                              @"<PostalCode>%@</PostalCode>"
                                              @"<State>%@</State>"
                                              @"<StreetAddress>%@</StreetAddress>"
                                              @"<StreetAddress2>%@</StreetAddress2>"
                                              @"<TMDistrict>%@</TMDistrict>"
                                              @"<TMTaluka>%@</TMTaluka>"
                                              @"</BusinessAddress>"
                                              @"</ListOfBusinessAddress>"
                                              @"<ListOfRelatedContact>"
                                              @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"\">"
                                              @"<ContactId>%@</ContactId>"
                                              @"</RelatedContact>"
                                              @"</ListOfRelatedContact>"
                                              @"<ListOfRelatedSalesRep>"
                                              @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                                              @"<Position>%@</Position>"
                                              @"<PositionId>%@</PositionId>"
                                              @"</RelatedSalesRep>"
                                              @"</ListOfRelatedSalesRep>"
                                              @"<ListOfRelatedOrganization>"
                                              @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                                              @"<Organization>%@</Organization>"
                                              @"</RelatedOrganization>"
                                              @"</ListOfRelatedOrganization>"
                                              @"</Account>"
                                              @"</ListOfAccountInterface>"
                                              @"<asi:StatusObject>?</asi:StatusObject>"
                                              @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                                              @"</soapenv:Body>"
                                              @"</soapenv:Envelope>",ACCOUNT_ID,
                                              (long)[[NSDate date]timeIntervalSince1970],
                                              _utxt_mainphonenumber.text,
                                              _utxt_accountName.text,(long)[[NSDate date] timeIntervalSince1970],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               accountContactIDs,
                                              userDetailsVal_.POSITION_NAME,
                                              userDetailsVal_.POSTN,
                                              userDetailsVal_.ORGNAME];
                   
                   NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
                   
                   NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
                   NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
                   NSLog(@"URL IS %@",theurl);
                   
                   NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
                   NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
                   
                   [request setHTTPMethod:@"POST"];
                   [request setHTTPBody:envelope];
                   [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
                   [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
                   
                   
                   
                   [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation"];
                   

                   
                   
                   
                   
               }
               else{
            
            
        
            updatefirecount=@"first";
        
        
            NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
            
            
            NSString * envelopeText = [NSString stringWithFormat:
                                       @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                                       @"<soapenv:Header />"
                                       @"<soapenv:Body>"
                                       @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                                       @"<ListOfAccountInterface>"
                                       @"<Account operation=\"\">"
                                       @"<AccountId>%@</AccountId>"
                                       @"<IntegrationId>%ld</IntegrationId>"
                                       @"<Location>sdfsdfvs</Location>"
                                       @"<MainPhoneNumber>%@</MainPhoneNumber>"
                                       @"<Name>%@</Name>"
                                       @"<ListOfBusinessAddress>"
                                       @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                                       @"<AddressId>%@</AddressId>"
                                       @"<AddressIntegrationId>%ld</AddressIntegrationId>"
                                       @"<Country>India</Country>"
                                       @"<PostalCode>%@</PostalCode>"
                                       @"<State>%@</State>"
                                       @"<StreetAddress>%@</StreetAddress>"
                                       @"<StreetAddress2>%@</StreetAddress2>"
                                       @"<TMDistrict>%@</TMDistrict>"
                                       @"<TMTaluka>%@</TMTaluka>"
                                       @"</BusinessAddress>"
                                       @"</ListOfBusinessAddress>"
                                       @"<ListOfRelatedContact>"
                                       @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"\">"
                                       @"<ContactId>%@</ContactId>"
                                       @"</RelatedContact>"
                                       @"</ListOfRelatedContact>"
                                       @"<ListOfRelatedSalesRep>"
                                       @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                                       @"<Position>%@</Position>"
                                       @"<PositionId>%@</PositionId>"
                                       @"</RelatedSalesRep>"
                                       @"</ListOfRelatedSalesRep>"
                                       @"<ListOfRelatedOrganization>"
                                       @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                                       @"<Organization>%@</Organization>"
                                       @"</RelatedOrganization>"
                                       @"</ListOfRelatedOrganization>"
                                       @"</Account>"
                                       @"</ListOfAccountInterface>"
                                       @"<asi:StatusObject>?</asi:StatusObject>"
                                       @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                                       @"</soapenv:Body>"
                                       @"</soapenv:Envelope>",ACCOUNT_ID,
                                       (long)[[NSDate date]timeIntervalSince1970],
                                       _utxt_mainphonenumber.text,
                                       _utxt_accountName.text,accountaddressID,(long)[[NSDate date] timeIntervalSince1970],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               accountContactIDs,
                                       userDetailsVal_.POSITION_NAME,
                                       userDetailsVal_.POSTN,
                                       userDetailsVal_.ORGNAME];
            
            NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
            
            NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
            NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
            NSLog(@"URL IS %@",theurl);
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
            NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
            
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:envelope];
            [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
            
            
            
            [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation"];
            
        
        
               }
        }
    
}


-(void)accountcreation_found:(NSNotification*)notification{

    NSError *err;
    NSString *response = [[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse. CreateAccountAgainst_ContactFound...%@",response);
    
    if ([response isEqual:@""])
    {
        [self hideAlert];
        NSLog(@"Nko re..");
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else if ([response rangeOfString:@"soapenv:Fault"].location != NSNotFound )
    {
        
        if ([response rangeOfString:@"with identical values already exists in the Siebel database."].location != NSNotFound) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Account Creation Failed" message:@"Record with identical values already exists" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
        }
        
        else
            
            
        {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
            
        }
    }
    else{
        
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement *container = [TBXML childElementNamed:@"ns:SFATMCVAccountInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"soapenv:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement *ListOfAccountInterface = [TBXML childElementNamed:@"ListOfAccountInterface" parentElement:container];
        TBXMLElement *Account = [TBXML childElementNamed:@"Account" parentElement:ListOfAccountInterface];
        
        TBXMLElement *AccountId = [TBXML childElementNamed:@"AccountId" parentElement:Account];
        //TBXMLElement *PersonalAddress = [TBXML childElementNamed:@"PersonalAddress" parentElement:ListOfPersonalAddress];
        //TBXMLElement *Id = [TBXML childElementNamed:@"Id" parentElement:PersonalAddress];
      NSString * iNTEGRATIONACCOUNTID = [TBXML textForElement:AccountId];
        
        NSLog(@"account ID %@",iNTEGRATIONACCOUNTID);
        
    if (iNTEGRATIONACCOUNTID) {
        
        if ([_utxt_accountcity.text isEqual:accounts.accountPersonalCity])
        {
        
               [self hideAlert];
        
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Opportunity updated successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
            
            
        
        }
        else{
        
        
            if ([updatefirecount isEqual:@"first"]) {
           
             
                [self updateaccountaddressdetails];
                
                
                
            }
            
            else
            {
            
                
                [self hideAlert];
            
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Opportunity updated successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert setTag:0];
                
                [alertView show];
            
            
            
            }
        }

    }
        
    }
}



-(void)updateaccountaddressdetails{
    
    
    if ([accountaddressID isEqual:@""]) {
        
        
        updatefirecount=@"second";
        
        

        
        
        NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
        
        
        NSString * envelopeText = [NSString stringWithFormat:
                                   @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                                   @"<soapenv:Header />"
                                   @"<soapenv:Body>"
                                   @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                                   @"<ListOfAccountInterface>"
                                   @"<Account operation=\"\">"
                                   @"<AccountId>%@</AccountId>"
                                   @"<IntegrationId>%ld</IntegrationId>"
                                   @"<Location>sdfsdfvs</Location>"
                                   @"<MainPhoneNumber>%@</MainPhoneNumber>"
                                   @"<Name>%@</Name>"
                                   @"<ListOfBusinessAddress>"
                                   @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                                   @"<AddressIntegrationId>%ld</AddressIntegrationId>"
                                   @"<City>%@</City>"
                                   @"<Country>India</Country>"
                                   @"<PostalCode>%@</PostalCode>"
                                   @"<State>%@</State>"
                                   @"<StreetAddress>%@</StreetAddress>"
                                   @"<StreetAddress2>%@</StreetAddress2>"
                                   @"<TMDistrict>%@</TMDistrict>"
                                   @"<TMTaluka>%@</TMTaluka>"
                                   @"</BusinessAddress>"
                                   @"</ListOfBusinessAddress>"
                                   @"<ListOfRelatedContact>"
                                   @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"\">"
                                   @"<ContactId>%@</ContactId>"
                                   @"</RelatedContact>"
                                   @"</ListOfRelatedContact>"
                                   @"<ListOfRelatedSalesRep>"
                                   @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                                   @"<Position>%@</Position>"
                                   @"<PositionId>%@</PositionId>"
                                   @"</RelatedSalesRep>"
                                   @"</ListOfRelatedSalesRep>"
                                   @"<ListOfRelatedOrganization>"
                                   @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                                   @"<Organization>%@</Organization>"
                                   @"</RelatedOrganization>"
                                   @"</ListOfRelatedOrganization>"
                                   @"</Account>"
                                   @"</ListOfAccountInterface>"
                                   @"<asi:StatusObject>?</asi:StatusObject>"
                                   @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                                   @"</soapenv:Body>"
                                   @"</soapenv:Envelope>",ACCOUNT_ID,
                                   (long)[[NSDate date]timeIntervalSince1970],
                                   _utxt_mainphonenumber.text,
                                   _utxt_accountName.text,(long)[[NSDate date] timeIntervalSince1970],[(UITextField *)[self.view viewWithTag:3] text],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               accountContactIDs,
                                   userDetailsVal_.POSITION_NAME,
                                   userDetailsVal_.POSTN,
                                   userDetailsVal_.ORGNAME];
        
        NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
        
        NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
        NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
        NSLog(@"URL IS %@",theurl);
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
        NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
        
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:envelope];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation"];
        
        
      
        
    
    }
    else{
    
    
    
    
    


    updatefirecount=@"second";
    
    
    NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
    
    
    NSString * envelopeText = [NSString stringWithFormat:
                               @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                               @"<soapenv:Header />"
                               @"<soapenv:Body>"
                               @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"<ListOfAccountInterface>"
                               @"<Account operation=\"\">"
                               @"<AccountId>%@</AccountId>"
                               @"<IntegrationId>%ld</IntegrationId>"
                               @"<Location>sdfsdfvs</Location>"
                               @"<MainPhoneNumber>%@</MainPhoneNumber>"
                               @"<Name>%@</Name>"
                               @"<ListOfBusinessAddress>"
                               @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                               @"<AddressId>%@</AddressId>"
                               @"<AddressIntegrationId>%ld</AddressIntegrationId>"
                               @"<City>%@</City>"
                               @"<Country>India</Country>"
                               @"<PostalCode>%@</PostalCode>"
                               @"<State>%@</State>"
                               @"<StreetAddress>%@</StreetAddress>"
                               @"<StreetAddress2>%@</StreetAddress2>"
                               @"<TMDistrict>%@</TMDistrict>"
                               @"<TMTaluka>%@</TMTaluka>"
                               @"</BusinessAddress>"
                               @"</ListOfBusinessAddress>"
                               @"<ListOfRelatedContact>"
                               @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"\">"
                               @"<ContactId>%@</ContactId>"
                               @"</RelatedContact>"
                               @"</ListOfRelatedContact>"
                               @"<ListOfRelatedSalesRep>"
                               @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                               @"<Position>%@</Position>"
                               @"<PositionId>%@</PositionId>"
                               @"</RelatedSalesRep>"
                               @"</ListOfRelatedSalesRep>"
                               @"<ListOfRelatedOrganization>"
                               @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                               @"<Organization>%@</Organization>"
                               @"</RelatedOrganization>"
                               @"</ListOfRelatedOrganization>"
                               @"</Account>"
                               @"</ListOfAccountInterface>"
                               @"<asi:StatusObject>?</asi:StatusObject>"
                               @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"</soapenv:Body>"
                               @"</soapenv:Envelope>",ACCOUNT_ID,
                               (long)[[NSDate date]timeIntervalSince1970],
                               _utxt_mainphonenumber.text,
                               _utxt_accountName.text,accountaddressID,(long)[[NSDate date] timeIntervalSince1970],[(UITextField *)[self.view viewWithTag:3] text],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               accountContactIDs,
                               userDetailsVal_.POSITION_NAME,
                               userDetailsVal_.POSTN,
                               userDetailsVal_.ORGNAME];
    
    NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
    NSLog(@"URL IS %@",theurl);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
    NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    
    
    
    [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation"];
    }
}


-(void)createaccount{

    
    createaccountfirecount=@"first";
    
     integrationidvalue1= [NSString stringWithFormat:@"%ld", (long)[[NSDate date]timeIntervalSince1970]];

    NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
    
    
    NSString * envelopeText = [NSString stringWithFormat:
                               @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                               @"<soapenv:Header />"
                               @"<soapenv:Body>"
                               @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"<ListOfAccountInterface>"
                               @"<Account operation=\"?\">"
                               @"<IntegrationId>%@</IntegrationId>"
                               @"<Location>sdfsdfvs</Location>"
                               @"<MainPhoneNumber>%@</MainPhoneNumber>"
                               @"<Name>%@</Name>"
                               @"<ListOfBusinessAddress>"
                               @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                               @"<AddressId>?</AddressId>"
                               @"<AddressIntegrationId>%@</AddressIntegrationId>"
                               @"<City>%@</City>"
                               @"<Country>India</Country>"
                               @"<PostalCode>%@</PostalCode>"
                               @"<State>%@</State>"
                               @"<StreetAddress>%@</StreetAddress>"
                               @"<StreetAddress2>%@</StreetAddress2>"
                               @"<TMDistrict>%@</TMDistrict>"
                               @"<TMTaluka>%@</TMTaluka>"
                               @"</BusinessAddress>"
                               @"</ListOfBusinessAddress>"
                               @"<ListOfRelatedContact>"
                               @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"?\">"
                               @"<ContactId>%@</ContactId>"
                               @"</RelatedContact>"
                               @"</ListOfRelatedContact>"
                               @"<ListOfRelatedSalesRep>"
                               @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                               @"<Position>%@</Position>"
                               @"<PositionId>%@</PositionId>"
                               @"</RelatedSalesRep>"
                               @"</ListOfRelatedSalesRep>"
                               @"<ListOfRelatedOrganization>"
                               @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                               @"<Organization>%@</Organization>"
                               @"</RelatedOrganization>"
                               @"</ListOfRelatedOrganization>"
                               @"</Account>"
                               @"</ListOfAccountInterface>"
                               @"<asi:StatusObject>?</asi:StatusObject>"
                               @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"</soapenv:Body>"
                               @"</soapenv:Envelope>",
                               integrationidvalue1,
                               _utxt_mainphonenumber.text,
                               _utxt_accountName.text,integrationidvalue1,[(UITextField *)[self.view viewWithTag:3] text],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               CONTACT_ID,
                               userDetailsVal_.POSITION_NAME,
                               userDetailsVal_.POSITION_ID,
                               userDetailsVal_.ORGNAME];
    
    NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
    NSLog(@"URL IS %@",theurl);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
    NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    
    
    
    [[RequestDelegate alloc]initiateRequest:request name:@"accountCreationforupdate"];


}




-(void)accountCreationforupdatedata_found:(NSNotification*)notification

{
  
    
    NSError *err;
    NSString *response = [[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse. CreateAccountAgainst_ContactFound...%@",response);
    if ([response isEqual:@""])
    {
        [self hideAlert];
        NSLog(@"Nko re..");
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else if ([response rangeOfString:@"soapenv:Fault"].location != NSNotFound )
    {
        
        if ([response rangeOfString:@"with identical values already exists in the Siebel database."].location != NSNotFound) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Account Creation Failed" message:@"Record with identical values already exists" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
        }
        
        else
            
            
        {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
            
        }
    }
    else{
        
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement *container = [TBXML childElementNamed:@"ns:SFATMCVAccountInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"soapenv:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement *ListOfAccountInterface = [TBXML childElementNamed:@"ListOfAccountInterface" parentElement:container];
        TBXMLElement *Account = [TBXML childElementNamed:@"Account" parentElement:ListOfAccountInterface];
        
        TBXMLElement *AccountId = [TBXML childElementNamed:@"AccountId" parentElement:Account];
        //TBXMLElement *PersonalAddress = [TBXML childElementNamed:@"PersonalAddress" parentElement:ListOfPersonalAddress];
        //TBXMLElement *Id = [TBXML childElementNamed:@"Id" parentElement:PersonalAddress];
        NSString *newAccount = [TBXML textForElement:AccountId];
        
        NSLog(@"account ID %@",newAccount);
        
        newAccountID=newAccount;
        
        if(![newAccount length] == 0)
        {
            
            
            if ([createaccountfirecount isEqual:@"first"]) {
                [self fireagain];
                
            }
            else
            {
            
                [self hideAlert];
              
                
                [self accountOptylinking];
                
                
                
//                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Opportunity updated successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                
//                [alert setTag:0];
//                
//                [alertView show];
                
            
            
            }
            
            
          
            
        }
        
        
        
        
    }
    

    
    
}


-(void)fireagain{



    createaccountfirecount=@"second";
    
    
    NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _utxt_accountaddressline1.text, @"."];
    
    
    NSString * envelopeText = [NSString stringWithFormat:
                               @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                               @"<soapenv:Header />"
                               @"<soapenv:Body>"
                               @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"<ListOfAccountInterface>"
                               @"<Account operation=\"?\">"
                               @"<IntegrationId>%@</IntegrationId>"
                               @"<Location>sdfsdfvs</Location>"
                               @"<MainPhoneNumber>%@</MainPhoneNumber>"
                               @"<Name>%@</Name>"
                               @"<ListOfBusinessAddress>"
                               @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                               @"<AddressIntegrationId>%@</AddressIntegrationId>"
                               @"<City>%@</City>"
                               @"<Country>India</Country>"
                               @"<PostalCode>%@</PostalCode>"
                               @"<State>%@</State>"
                               @"<StreetAddress>%@</StreetAddress>"
                               @"<StreetAddress2>%@</StreetAddress2>"
                               @"<TMDistrict>%@</TMDistrict>"
                               @"<TMTaluka>%@</TMTaluka>"
                               @"</BusinessAddress>"
                               @"</ListOfBusinessAddress>"
                               @"<ListOfRelatedContact>"
                               @"<RelatedContact IsPrimaryMVG=\"Y\" operation=\"?\">"
                               @"<ContactId>%@</ContactId>"
                               @"</RelatedContact>"
                               @"</ListOfRelatedContact>"
                               @"<ListOfRelatedSalesRep>"
                               @"<RelatedSalesRep IsPrimaryMVG=\"Y\">"
                               @"<Position>%@</Position>"
                               @"<PositionId>%@</PositionId>"
                               @"</RelatedSalesRep>"
                               @"</ListOfRelatedSalesRep>"
                               @"<ListOfRelatedOrganization>"
                               @"<RelatedOrganization IsPrimaryMVG=\"Y\">"
                               @"<Organization>%@</Organization>"
                               @"</RelatedOrganization>"
                               @"</ListOfRelatedOrganization>"
                               @"</Account>"
                               @"</ListOfAccountInterface>"
                               @"<asi:StatusObject>?</asi:StatusObject>"
                               @"</asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"</soapenv:Body>"
                               @"</soapenv:Envelope>",
                               integrationidvalue1,
                               _utxt_mainphonenumber.text,
                               _utxt_accountName.text,integrationidvalue1,[(UITextField *)[self.view viewWithTag:3] text],_utxt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_utxt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               CONTACT_ID,
                               userDetailsVal_.POSITION_NAME,
                               userDetailsVal_.POSITION_ID,
                               userDetailsVal_.ORGNAME];
    
    NSLog(@"\n envlopeString Of user details....!!!!%@",envelopeText);
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
    NSLog(@"URL IS %@",theurl);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
    NSString * msglength = [NSString stringWithFormat:@"%i",[envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    
    
    
    [[RequestDelegate alloc]initiateRequest:request name:@"accountCreationforupdate"];

    

}





-(void)accountOptylinking{
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                              @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<Contact>"
                              @"<Id>%@</Id>"
                              @"<ListOfOpportunity>"
                              @"<Opportunity operation=\"\">"
                              @"<Id>%@</Id>"
                              @"<AccountId>%@</AccountId>"
                              @"</Opportunity>"
                              @"</ListOfOpportunity>"
                              @"</Contact>"
                              @"</ListOfContactInterface>"
                              @"</SFATMCVContactInsertOrUpdate_Input>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",CONTACT_ID,OPTY_ID,newAccountID];
    
    
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    
    NSLog(@"URL IS %@", theurl);
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:150];
    
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    
    [[RequestDelegate alloc] initiateRequest:request name:@"contactoptylink"];
    
    
    
}


- (void)contactopty_found:(NSNotification*)notification
{
    
    
    NSError *err;
    NSString *response = [[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse. CreateAccountAgainst_ContactFound...%@",response);
    if ([response isEqual:@""])
    {
        [self hideAlert];
        NSLog(@"Nko re..");
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else if ([response rangeOfString:@"soapenv:Fault"].location != NSNotFound )
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        
        
        
        
        
        
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement *container = [TBXML childElementNamed:@"ns:SFATMCVContactInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement *ListOfAccountInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:container];
        
        TBXMLElement *ListOfAccountInterface1 = [TBXML childElementNamed:@"Contact" parentElement:ListOfAccountInterface];
        
        
        TBXMLElement *IntegrationId = [TBXML childElementNamed:@"Id" parentElement:ListOfAccountInterface1];
        
        
        
        NSString* Integration = [TBXML textForElement:IntegrationId];
        
        NSLog(@"account ID %@",Integration);
        
        
        
        if(![Integration length] == 0)
        {
            
           [self hideAlert];
            
                            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Opportunity updated successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
                            [alert setTag:0];
            
                            [alertView show];
      
        }
        
        
    }
    
    
    
    
}
























@end