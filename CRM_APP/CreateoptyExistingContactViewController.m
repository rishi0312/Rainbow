//
//  CreateoptyExistingContactViewController.m
//  testapp
//
//  Created by Admin on 05/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//


#import "CreateoptyExistingContactViewController.h"
#import "Contacts_table.h"
#import "OpportunityTableViewCell.h"
#import "CreateNewOpportunityViewController.h"
#import "RequestDelegate.h"
#import "TBXML.h"
#import "TBXML+HTTP.h"
#import "MBProgressHUD.h"
#import "NewContactLists.h"
#import "Opportunity_List.h"
#import "OpportunityDetailsViewController.h"



@interface CreateoptyExistingContactViewController ()
{

    NSPredicate* mobileNumberPred;
    NSString* mobileNumberPattern;

    NSString *flagset;
    NSMutableArray *ShowStates1;
     NSString *sr_Pass,*selected,*newOutput,*str_State;
    
    

}
@end

@implementation CreateoptyExistingContactViewController
@synthesize GetAllStateCodes;
- (void)viewDidLoad {
    [super viewDidLoad];

    _tableview1.layer.borderWidth=1.0;
    _tableview1.layer.borderColor=[UIColor grayColor].CGColor;
    
    
    
    _tableview2.layer.borderWidth=1.0;
    _tableview2.layer.borderColor=[UIColor grayColor].CGColor;
    
    
    
    _label_contact.hidden=YES;
    _label_opportunity.hidden=YES;
    
    
    flagset=@"";
    
    
    
    mobileNumberPattern = @"[789][0-9]{9}";
    mobileNumberPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileNumberPattern];
    _ContactList=[[NSMutableArray alloc]init];
    
    
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    userDetailsVal_ = [UserDetails_Var sharedmanager];
    
    
    
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nback.png"] forBarMetrics:UIBarMetricsDefault];
    
    self.tableview1.separatorColor = [UIColor clearColor];
    self.tableview2.separatorColor =[UIColor clearColor];
    
    self.tableview1.hidden=YES;
    self.tableview2.hidden=YES;
    
    GetAllStateCodes = [[NSMutableDictionary alloc] init];

    ShowStates1 = [[NSMutableArray alloc] initWithObjects:@"Andaman and Nicobar Island", @"Andhra Pradesh", @"Arunachal Pradesh", @"Assam", @"Bihar", @"Chandigarh", @"Chattishgarh", @"Daman and Diu", @"Delhi", @"Dadra and Nagar Haveli", @"Goa", @"Gujarat", @"Himachal Pradesh", @"Haryana", @"Jharkhand", @"Jammu & Kashmir", @"Karnataka", @"Kerala", @"Lakshwadeep", @"Maharashtra", @"Meghalaya", @"Manipur", @"Madhya Pradesh", @"Mizoram", @"Nagaland", @"Orissa", @"Punjab", @"Pondicherry", @"Rajasthan", @"Sikkim", @"Telangana", @"Tamil Nadu", @"Tripura", @"Uttarakhand", @"Uttar Pradesh", @"West Bengal", nil];
    
    [GetAllStateCodes setObject:@"AN" forKey:@"Andaman and Nicobar Island"];
    [GetAllStateCodes setObject:@"AP" forKey:@"Andhra Pradesh"];
    [GetAllStateCodes setObject:@"AR" forKey:@"Arunachal Pradesh"];
    [GetAllStateCodes setObject:@"AS" forKey:@"Assam"];
    [GetAllStateCodes setObject:@"BR" forKey:@"Bihar"];
    [GetAllStateCodes setObject:@"CG" forKey:@"Chandigarh"];
    [GetAllStateCodes setObject:@"CH" forKey:@"Chhattisgarh"];
    [GetAllStateCodes setObject:@"DD" forKey:@"Daman and Diu"];
    [GetAllStateCodes setObject:@"DL" forKey:@"Delhi"];
    [GetAllStateCodes setObject:@"DN" forKey:@"Dadra and Nagar Haveli"];
    [GetAllStateCodes setObject:@"GA" forKey:@"Goa"];
    [GetAllStateCodes setObject:@"GJ" forKey:@"Gujarat"];
    [GetAllStateCodes setObject:@"HP" forKey:@"Himachal Pradesh"];
    [GetAllStateCodes setObject:@"HR" forKey:@"Haryana"];
    [GetAllStateCodes setObject:@"JH" forKey:@"Jharkhand"];
    [GetAllStateCodes setObject:@"JK" forKey:@"Jammu and Kashmir"];
    [GetAllStateCodes setObject:@"KA" forKey:@"Karnataka"];
    [GetAllStateCodes setObject:@"KL" forKey:@"Kerala"];
    [GetAllStateCodes setObject:@"LD" forKey:@"Lakshadweep"];
    [GetAllStateCodes setObject:@"MH" forKey:@"Maharashtra"];
    [GetAllStateCodes setObject:@"ML" forKey:@"Meghalaya"];
    [GetAllStateCodes setObject:@"MN" forKey:@"Manipur"];
    [GetAllStateCodes setObject:@"MP" forKey:@"Madhya Pradesh"];
    [GetAllStateCodes setObject:@"MZ" forKey:@"Mizoram"];
    [GetAllStateCodes setObject:@"NL" forKey:@"Nagaland"];
    [GetAllStateCodes setObject:@"OR" forKey:@"Orissa"];
    [GetAllStateCodes setObject:@"PB" forKey:@"Punjab"];
    [GetAllStateCodes setObject:@"PY" forKey:@"Pondicherry"];
    [GetAllStateCodes setObject:@"RJ" forKey:@"Rajasthan"];
    [GetAllStateCodes setObject:@"SK" forKey:@"Sikkim"];
    [GetAllStateCodes setObject:@"TG" forKey:@"Telangana"];
    [GetAllStateCodes setObject:@"TN" forKey:@"Tamil Nadu"];
    [GetAllStateCodes setObject:@"TR" forKey:@"Tripura"];
    [GetAllStateCodes setObject:@"UA" forKey:@"Uttarakhand"];
    [GetAllStateCodes setObject:@"UP" forKey:@"Uttar Pradesh"];
    [GetAllStateCodes setObject:@"WB" forKey:@"West Bengal"];

    //str_States = [GetAllStateCodes objectForKey:self.txt_State.text];
    //[self call_AllStates];

//    [GetAllStateCodes setObject:C0_value forKey:@"OPTY_ID"];
    
//    self.splitViewController.delegate = self;
//    self.masterPopoverController.delegate = self;
    UIBarButtonItem* barButtonItem = self.splitViewController.displayModeButtonItem;
    barButtonItem.title = @"Show master";
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
    NSString *knownObject = @"UP";
    NSArray *temp = [GetAllStateCodes allKeysForObject:knownObject];
    NSString *key = [temp lastObject];
    
    NSLog(@"--- Key Data :%@",key);

    NSString* ProductName1 = [GetAllStateCodes objectForKey:@"AN"];
    
    NSLog(@"--- Fault data :%@",ProductName1);
    
    NSLog(@"Sates Code : %@",[GetAllStateCodes objectForKey:@"Maharashtra"]);

}


-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(contactsearchdata_found:) name:@"contactsearchdata_found" object:nil];
    
    
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(optycontactsearchdata_found:) name:@"optycontactsearchdata_found" object:nil];
    
    //optycontactsearchdata_found


}
- (void)viewDidDisappear:(BOOL)animated
{
    
       [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactsearchdata_found" object:nil];
    
    
      [[NSNotificationCenter defaultCenter] removeObserver:self name:@"optycontactsearchdata_found" object:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
     if(tableView == self.tableview1)
     {
    return [_ContactList count];
     }
     else{
         
       return [searchoptycontactarray count];
     }
         
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.tableview1)
    {
        selectedcontact1 = nil;
        selectedcontact1 = [[NewContactLists alloc]init];
        selectedcontact1 = [_ContactList objectAtIndex:indexPath.row];

        static NSString *MyIdentifier = @"TableIdentifier1";
        
         Contacts_table *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
            cell.btn_CrateOptyShow.tag = indexPath.row;

        
         [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
         [cell.contentView.layer setBorderColor:[UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1].CGColor];
        [cell.contentView.layer setBorderWidth:1.0f];
        cell.contentView.layer.cornerRadius=4;
        
        [self.tableview1 setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 15)];
        if (cell == nil)
        {
             cell = [[Contacts_table alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        NSLog(@"firstname %@",selectedcontact1.CONTACT_FIRST_NAME);
        cell.lbl_fullname.text=selectedcontact1.CONTACT_FIRST_NAME;
        cell.lbl_lastname.text=selectedcontact1.CONTACT_LAST_NAME;
        cell.lbl_customerno.text=selectedcontact1.MOBILE_NO;
         [cell.btn_CrateOptyShow addTarget:self action:@selector(CallCreateOptyFromSearchContact:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    else{
        
        
        opportunity_list = nil;
        opportunity_list = [[Opportunity_List alloc]init];
        opportunity_list = [searchoptycontactarray objectAtIndex:indexPath.row];
        
        
        
        static NSString *MyIdentifier = @"TableIdentifier2";
        
        OpportunityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell.contentView.layer setBorderColor:[UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1].CGColor];
        [cell.contentView.layer setBorderWidth:1.0f];
        cell.contentView.layer.cornerRadius=4;
  [self.tableview2 setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 15)];
        
        if (cell == nil)
        {
            cell = [[OpportunityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        cell.lbl_optyfirstname.text=opportunity_list.CONTACT_FIRST_NAME;
        cell.lbl_optylastname.text=opportunity_list.CONTACT_LAST_NAME;
        cell.lbl_mobilenumber.text=opportunity_list.CONTACT_CELL_NUMBER;
        cell.lbl_optyppl.text=opportunity_list.PRODUCT_NAME1;
        cell.lbl_salesstage.text=opportunity_list.SALE_STAGE_NAME;
        cell.lbl_optycreateddate.text=opportunity_list.OPTY_CREAT_DATE;
        return cell;
    }
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{

    NSLog(@"Row Selected ... %ld", (long)indexPath.row);
    // activity_list = [Activities_ListArr objectAtIndex:indexPath.row];
    if(tableView == self.tableview1)
    {
        NSLog(@"Row Selected Table 1... %ld", (long)indexPath.row);
    }
    else
    {
        NSLog(@"Row Selected  Table 2... %ld", (long)indexPath.row);
        OpportunityDetailsViewController* EditOpty = [self.storyboard instantiateViewControllerWithIdentifier:@"updateOptyNew"];
        //  searchOpportunityResult_VC1.flagset=flagset;
        [self.navigationController pushViewController:EditOpty animated:YES];
    }
}






- (void)CallCreateOptyFromSearchContact:(UIButton*)sender
{
    
    flagset=@"fromsearchcontact";
    
    
    NSLog(@"--- Push to Create Opty --- %ld",(long)sender.tag);
     //activityPending_list = [pendingActivities_ListArr objectAtIndex:sender.tag];
    selectedcontact1 = [_ContactList objectAtIndex:sender.tag];
     //NSLog(@"Test Pass %@", activityPending_list.ACTIVITY_PLAN_START_TM);
     CreateNewOpportunityViewController* searchOpportunityResult_VC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createnewopportunity"];
     searchOpportunityResult_VC1.flagset=flagset;
     [self.navigationController pushViewController:searchOpportunityResult_VC1 animated:YES];
}



- (IBAction)btn_search:(id)sender {
   
  

 if ([mobileNumberPred evaluateWithObject:_txt_contactsearch.text] != YES && [_txt_contactsearch.text length] != 0)
    {
        [self hideAlert];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([_txt_contactsearch.text isEqual:@""] )
    {
    
        [self hideAlert];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    
    
    
    }
    else{
    
    
    
    [self searchContact];
    [self searchopty];
    }
   
    
}

-(void)searchContact{

    
    [self showAlert];
    

    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SearchOnlyContact xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<Mobileno>%@</Mobileno>"
                              @"<BUID>%@</BUID>"
                              @"</SearchOnlyContact>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",_txt_contactsearch.text,userDetailsVal_.ORGID];
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"contactsearch"];
 
}

- (void)contactsearchdata_found:(NSNotification*)notification
{

    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....%@",response);
    
    
    
    
    if ([response isEqual:@""])
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound )
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message :@"Something gone wrong . Please try agin" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else{
        
        
        
        
        if (_ContactList)
        {
            
            [_ContactList removeAllObjects];
            
        }
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement *container = [TBXML childElementNamed:@"SearchOnlyContactResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement *ListOfContactInterface =[TBXML childElementNamed:@"tuple" parentElement:container];
    
        
        
        if (ListOfContactInterface)
        {
            
            do {
                
                TBXMLElement *Contact  = [TBXML childElementNamed:@"old" parentElement:ListOfContactInterface];
                
                TBXMLElement *SContact  = [TBXML childElementNamed:@"S_CONTACT" parentElement:Contact];
                
            
                selectedcontact1 = nil;
                selectedcontact1 = [[NewContactLists alloc]init];
                
               
                
                TBXMLElement *MOBILE_NO = [TBXML childElementNamed:@"MOBILE_NO" parentElement:SContact];
                selectedcontact1.MOBILE_NO = [TBXML textForElement:MOBILE_NO];
                
                
          
                TBXMLElement *ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:SContact];
                selectedcontact1.ADDRESS_ID = [TBXML textForElement:ADDRESS_ID];
                
        
                TBXMLElement *CONTACT_FIRST_NAME = [TBXML childElementNamed:@"CONTACT_FIRST_NAME" parentElement:SContact];
                selectedcontact1.CONTACT_FIRST_NAME = [TBXML textForElement:CONTACT_FIRST_NAME];
                
            
                TBXMLElement *CONTACT_LAST_NAME = [TBXML childElementNamed:@"CONTACT_LAST_NAME" parentElement:SContact];
                
                selectedcontact1.CONTACT_LAST_NAME = [TBXML textForElement:CONTACT_LAST_NAME];
                
                
                TBXMLElement *CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:SContact];
                selectedcontact1.CONTACT_ID = [TBXML textForElement:CONTACT_ID];
                
                
                
                TBXMLElement *CONTACT_EMAIL_ID = [TBXML childElementNamed:@"CONTACT_EMAIL_ID" parentElement:SContact];
                selectedcontact1.CONTACT_EMAIL_ID = [TBXML textForElement:CONTACT_EMAIL_ID];
                
                
                
                
                TBXMLElement *ADDLINE_ONE = [TBXML childElementNamed:@"ADDLINE_ONE" parentElement:SContact];
                selectedcontact1.ADDLINE_ONE = [TBXML textForElement:ADDLINE_ONE];
                
                
                
                TBXMLElement *ADDLINE_TWO = [TBXML childElementNamed:@"ADDLINE_TWO" parentElement:SContact];
                selectedcontact1.ADDLINE_TWO = [TBXML textForElement:ADDLINE_TWO];
                
                
                
                
                TBXMLElement *STATE = [TBXML childElementNamed:@"STATE" parentElement:SContact];
             
               selectedcontact1.STATE= [TBXML textForElement:STATE];
                
                str_State=[TBXML textForElement:STATE];
               /* NSLog(@"--- Category :%@",str_State);
                sr_Pass=@"";
                sr_Pass = [sr_Pass stringByAppendingString:str_State];
                newOutput = [NSString stringWithFormat:@"\"%@\"", sr_Pass];
                NSLog(@"--- newOutput :%@",newOutput);
                sr_Pass = [@"@" stringByAppendingString:newOutput];
                NSLog(@"--- newOutput :%@",sr_Pass);*/
                
                
               selected = [GetAllStateCodes objectForKey:str_State];
                NSLog(@"selected %@",selected);
                
                NSString *knownObject =str_State;
                NSArray *temp = [GetAllStateCodes allKeysForObject:knownObject];
                NSString *key = [temp lastObject];
                
                NSLog(@"--- Key Data :%@",key);
                
                selectedcontact1.STATE=key;
                
                
                TBXMLElement *DISTRICT = [TBXML childElementNamed:@"DISTRICT" parentElement:SContact];
                selectedcontact1.DISTRICT = [TBXML textForElement:DISTRICT];
                
                
                
                TBXMLElement *CITY = [TBXML childElementNamed:@"CITY" parentElement:SContact];
                
                selectedcontact1.CITY = [TBXML textForElement:CITY];
                
                
                
                
                TBXMLElement *TALUKA = [TBXML childElementNamed:@"TALUKA" parentElement:SContact];
                selectedcontact1.TALUKA = [TBXML textForElement:TALUKA];
                
               
                
                
                TBXMLElement *AREA = [TBXML childElementNamed:@"AREA" parentElement:SContact];
                selectedcontact1.AREA = [TBXML textForElement:AREA];
                
                
                
                TBXMLElement *PANCHAYAT = [TBXML childElementNamed:@"PANCHAYAT" parentElement:SContact];
                
                selectedcontact1.PANCHAYAT = [TBXML textForElement:PANCHAYAT];
                
                
                
                
                TBXMLElement *ZIPCODE = [TBXML childElementNamed:@"ZIPCODE" parentElement:SContact];
                selectedcontact1.ZIPCODE = [TBXML textForElement:ZIPCODE];
                
                
                [_ContactList addObject:selectedcontact1];
                
                
            }while ((ListOfContactInterface = ListOfContactInterface->nextSibling));
        }
        else
        {
            
            [self hideAlert];
            
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSE" message:@"No contact found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
            self.tableview1.hidden=YES;
            self.tableview2.hidden=YES;
            
        }

        if (_ContactList.count>0) {
           
            
            self.tableview1.hidden=NO;
            
            _label_opportunity.hidden=YES;
            _label_contact.hidden=YES;
            
            
            [self.tableview1 reloadData];
            
            NSLog(@"list array %@",_ContactList);
            
        }
        
        else  {
        
        
            self.tableview1.hidden=YES;
            
     
            
            NSLog(@"list array %@",_ContactList);
     
        
        }
        
        
        
      
        
        
    }
    

}

- (IBAction)createOptyWithNewContactAction:(id)sender {
    
    
    NSLog(@"create opprtunity in");
    
    
    CreateNewOpportunityViewController * searchOpportunityResult_VC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createnewopportunity"];
    [self.navigationController pushViewController:searchOpportunityResult_VC1 animated:YES];
   
}

- (void)showAlert
{
    [MBProgressHUD showHUDAddedLoading:self.view animated:YES];
}
- (void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)contactfetch{
    
    

    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SearchOnlyContact xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<Mobileno>%@</Mobileno>"
                              @"<BUID>%@</BUID>"
                              @"</SearchOnlyContact>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",_txt_contactsearch.text,userDetailsVal_.ORGID];
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"contactsearch"];
    


}



-(void)searchopty{

     NSString* envelopeText = [NSString stringWithFormat:
                               @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               @"<SOAP:Body>"
                               @"<SearchOpptyBasedOnCriteriaForDsm xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                               @"<fromdate></fromdate>"
                               @"<todate></todate>"
                               @"<salestagename></salestagename>"
                               @"<pplname></pplname>"
                               @"<tehsilname></tehsilname>"
                               @"<assignname></assignname>"
                               @"<customercellnumber>%@</customercellnumber>"
                               @"<attr1></attr1>"
                               @"<attr2></attr2>"
                               @"<attr3></attr3>"
                               @"<dsepositionid></dsepositionid>"
                               @"<contactlastname></contactlastname>"
                               @"<PrimaryEmployeeID></PrimaryEmployeeID>"
                               @"<Campainid></Campainid>"
                               @"<Buid>%@</Buid>"
                               @"</SearchOpptyBasedOnCriteriaForDsm>"
                               @"</SOAP:Body>"
                               @"</SOAP:Envelope>",_txt_contactsearch.text,userDetailsVal_.ORGID];
    
    
    
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"optycontactsearch"];

}




- (void)optycontactsearchdata_found:(NSNotification*)notification
{
    searchoptycontactarray=[[NSMutableArray alloc] init];
   
    
    if(searchoptycontactarray)
    {
        
    }
    NSError *err;
    int i = 0;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\n List of Opportunity Response %@ ",response);
    if ([response isEqual:@""])
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound )
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message :@"Something gone wrong . Please try agin" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else{
        
        NSLog(@"User Postion :%@",userDetailsVal_.POSTN);
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement *container = [TBXML childElementNamed:@"SearchOpptyBasedOnCriteriaForDsmResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        if (OpportunityList_ArrList)
        {
            [ OpportunityList_ArrList removeAllObjects];
        }
        TBXMLElement *tuple =[TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple)
        {
            
            do {
                opportunity_list = nil;
                opportunity_list = [[Opportunity_List alloc]init];
                
                TBXMLElement *table  = [TBXML childElementNamed:@"TABLE" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                
                TBXMLElement *OPTY_ID = [TBXML childElementNamed:@"OPTY_ID" parentElement:table];
                opportunity_list.OPTY_ID = [TBXML textForElement:OPTY_ID];
                
                
                NSLog(@"OptyID : %@",opportunity_list.OPTY_ID);
                
                
                TBXMLElement *OPTY_NAME = [TBXML childElementNamed:@"OPTY_NAME" parentElement:table];
                opportunity_list.OPTY_NAME = [TBXML textForElement:OPTY_NAME];
                
                
                TBXMLElement *PRODUCT_NAME1 = [TBXML childElementNamed:@"PRODUCT_NAME1" parentElement:table];
                opportunity_list.PRODUCT_NAME1 = [TBXML textForElement:PRODUCT_NAME1];
                
                
                TBXMLElement *OPTY_CREATED_DATE = [TBXML childElementNamed:@"OPTY_CREATED_DATE" parentElement:table];
                opportunity_list.OPTY_CREAT_DATE= [TBXML textForElement:OPTY_CREATED_DATE];
                NSLog(@"opty creation date %@",opportunity_list.OPTY_CREAT_DATE);
                
                
                
                TBXMLElement *SALES_STAGE_NAME = [TBXML childElementNamed:@"SALES_STAGE_NAME" parentElement:table];
                opportunity_list.SALE_STAGE_NAME = [TBXML textForElement:SALES_STAGE_NAME];
                
                TBXMLElement *LEAD_ASSIGNED_NAME = [TBXML childElementNamed:@"LEAD_ASSIGNED_NAME" parentElement:table];
                opportunity_list.LEAD_ASSIGNED_NAME = [TBXML textForElement:LEAD_ASSIGNED_NAME];
                
                TBXMLElement *LEAD_ASSIGNED_CELL_NUMBER = [TBXML childElementNamed:@"LEAD_ASSIGNED_CELL_NUMBER" parentElement:table];
                opportunity_list.LEAD_ASSIGNED_CELL_NUMBER = [TBXML textForElement:LEAD_ASSIGNED_CELL_NUMBER];
                
                
                TBXMLElement *CONTACT_NAME = [TBXML childElementNamed:@"CONTACT_NAME" parentElement:table];
                opportunity_list.CONTACT_NAME = [TBXML textForElement:CONTACT_NAME];
                
                TBXMLElement *CONTACT_FIRST_NAME = [TBXML childElementNamed:@"CONTACT_FIRST_NAME" parentElement:table];
                opportunity_list.CONTACT_FIRST_NAME = [TBXML textForElement:CONTACT_FIRST_NAME];
                
                TBXMLElement *CONTACT_LAST_NAME = [TBXML childElementNamed:@"CONTACT_LAST_NAME" parentElement:table];
                opportunity_list.CONTACT_LAST_NAME = [TBXML textForElement:CONTACT_LAST_NAME];
                
                
                TBXMLElement *CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:table];
                opportunity_list.CONTACT_ID = [TBXML textForElement:CONTACT_ID];
                
                //CONTACT_ID
              
                
                TBXMLElement *CONTACT_ADDRESS = [TBXML childElementNamed:@"CONTACT_ADDRESS" parentElement:table];
                opportunity_list.CONTACT_ADDRESS = [TBXML textForElement:CONTACT_ADDRESS];
                
                TBXMLElement *CONTACT_CELL_NUMBER = [TBXML childElementNamed:@"CONTACT_CELL_NUMBER" parentElement:table];
                opportunity_list.CONTACT_CELL_NUMBER = [TBXML textForElement:CONTACT_CELL_NUMBER];
                
                TBXMLElement *LAST_PENDING_ACTIVITY_TYPE = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_TYPE" parentElement:table];
                opportunity_list.LAST_PENDING_ACTIVITY_TYPE = [TBXML textForElement:LAST_PENDING_ACTIVITY_TYPE];
                
                
                TBXMLElement *LAST_PENDING_ACTIVITY_ID = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_ID" parentElement:table];
                opportunity_list.LAST_PENDING_ACTIVITY_ID = [TBXML textForElement:LAST_PENDING_ACTIVITY_ID];
                
                
                TBXMLElement *LAST_PENDING_ACTIVITY_STATUS = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_STATUS" parentElement:table];
                opportunity_list.LAST_PENDING_ACTIVITY_STATUS = [TBXML textForElement:LAST_PENDING_ACTIVITY_STATUS];
                
                
                TBXMLElement *LAST_PEND_ACTIVIY_START_DATE = [TBXML childElementNamed:@"LAST_PEND_ACTIVIY_START_DATE" parentElement:table];
                opportunity_list.LAST_PEND_ACTIVIY_START_DATE = [TBXML textForElement:LAST_PEND_ACTIVIY_START_DATE];
                
                TBXMLElement *LAST_PENDING_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_PENDING_ACTIVITY_DESC" parentElement:table];
                opportunity_list.LAST_PENDING_ACTIVITY_DESC = [TBXML textForElement:LAST_PENDING_ACTIVITY_DESC];
                
                
                
                TBXMLElement *LAST_DONE_ACTIVITY_TYPE = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_TYPE" parentElement:table];
                opportunity_list.LAST_DONE_ACTIVITY_TYPE = [TBXML textForElement:LAST_DONE_ACTIVITY_TYPE];
                
                
                TBXMLElement *LAST_DONE_ACTIVITY_ID = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_ID" parentElement:table];
                opportunity_list.LAST_DONE_ACTIVITY_ID = [TBXML textForElement:LAST_DONE_ACTIVITY_ID];
                
                
                TBXMLElement *LAST_DONE_ACTIVITY_DATE = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DATE" parentElement:table];
                opportunity_list.LAST_DONE_ACTIVITY_DATE = [TBXML textForElement:LAST_DONE_ACTIVITY_DATE];
                
                TBXMLElement *LAST_DONE_ACTIVITY_DESC = [TBXML childElementNamed:@"LAST_DONE_ACTIVITY_DESC" parentElement:table];
                opportunity_list.LAST_DONE_ACTIVITY_DESC = [TBXML textForElement:LAST_DONE_ACTIVITY_DESC];
                
                
                TBXMLElement *PRODUCT_NAME = [TBXML childElementNamed:@"PRODUCT_NAME" parentElement:table];
                opportunity_list.PRODUCT_NAME = [TBXML textForElement:PRODUCT_NAME];
                
                
                TBXMLElement *CUSTOMER_ACCOUNT_NAME = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_NAME" parentElement:table];
                opportunity_list.CUSTOMER_ACCOUNT_NAME = [TBXML textForElement:CUSTOMER_ACCOUNT_NAME];
                
                
                TBXMLElement *CUSTOMER_ACCOUNT_ID = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_ID" parentElement:table];
                opportunity_list.CUSTOMER_ACCOUNT_ID = [TBXML textForElement:CUSTOMER_ACCOUNT_ID];
                
                TBXMLElement *CUSTOMER_ACCOUNT_MOBNUMBER = [TBXML childElementNamed:@"CUSTOMER_ACCOUNT_MOBNUMBER" parentElement:table];
                opportunity_list.CUSTOMER_ACCOUNT_MOBNUMBER = [TBXML textForElement:CUSTOMER_ACCOUNT_MOBNUMBER];
                
                
                TBXMLElement *FIN_NAME = [TBXML childElementNamed:@"FIN_NAME" parentElement:table];
                opportunity_list.FIN_NAME = [TBXML textForElement:FIN_NAME];
                
                
                
                
                NSLog(@"ACCOUNT : %@",opportunity_list.CUSTOMER_ACCOUNT_NAME);
                
                
                
                
                
                NSLog(@"contact no : %@",opportunity_list.CONTACT_CELL_NUMBER);
                
                
                [searchoptycontactarray addObject:opportunity_list];
                
                
            } while ((tuple = tuple->nextSibling));
            NSLog(@"\nOpportunityListDisplayArr......%d",[searchoptycontactarray count]);
            if([searchoptycontactarray count]>0)
            {
                [self hideAlert];
                [self.tableview2 reloadData];
                
                _label_contact.hidden=NO;
                _label_opportunity.hidden=NO;
                
                
                self.tableview1.hidden=NO;
                self.tableview2.hidden=NO;
                
            }
            else{
                
                
                [self hideAlert];
             
               UIAlertView * alert=[[UIAlertView alloc]initWithTitle:nil message:@"No opportunities found"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                
                
            }
            
            
            
        }
        else
        {
            [self hideAlert];
           // [self.tableView setHidden:YES];
           UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No opportunities found"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
    

}



@end
