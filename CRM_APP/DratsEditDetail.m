//
//  DratsEditDetail.m
//  CRM_APP
//
//  Created by Rishikesh Pange on 3/12/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import "DratsEditDetail.h"
#import "RequestDelegate.h"
#import "TBXML+Compression.h"
#import "TBXML.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "DEMOCustomAutoCompleteCell.h"
#import "DEMOCustomAutoCompleteObject.h"
#import "DSE+CoreDataProperties.h"
#import "DSM+CoreDataProperties.h"
#import "PendingActivitiesViewController.h"
#import "NewContactLists.h"

@interface DratsEditDetail ()
{
    NSString *statusbutton1;
    NSString *statusbutton2;
      NSString *optyContactstatus, *str;
    
     NSDateFormatter *dateFormatter;
    const CGFloat BoardHeight;
    NSString* emailRegEx;
    NSPredicate* emailTest;
    NSPredicate* mobileNumberPred;
    NSString* mobileNumberPattern;
    UIAlertView *alert;
    UIActionSheet*actionSheet;
     NSPredicate *pantest,*pintest,*quantitytest;
    Reachability* internetReachable;
    Reachability* hostReachable;
    NetworkStatus internetActive, hostActive;
    NSString*Product_IDstring,*CampaignID;
    NSString *filterLobtext,*statestring;
    
     NSString *First_Name,*Last_Name,*CellNumber,*newactivity;
    
     NSString *OPTY_ID,*Product_namestring,*ACCOUNTID;
    
     NSString *panCardRegex,*pincodeRegx;
    NSString* OPTY_ID_;
    NSString* CONTACT_ID;
    
     NSString *ContactID, *_strAccount, *Wintgration, *Waddressid, *Wcontactid, *WpersonalName;
    
    NSMutableArray *GetLOB_Arr,*GetPPL_Arr,*GetPL_Arr,*pickerData,*QuantityData,*GetAppType_Arr,*Micromarket_Arr,*Getbodytype_Arr,*Getusagecatagory_Arr,*TMLfleetSize,*Fleetsize,*Financier_List_PickerArr,*GetVCnumberArray,*LinkCampaignList,*Linkcampaignname,*LinkcampaignID,*shostates,*GetAllstates_Arr,*GetAlldistricts_Arr,*GetAllcities_Arr,*GetAlltaluka_Arr,*getcustomertypearr;
    
    NSString *DatePass;
    
    NSString *fire;
    NSString *integrationIdvalue;
    
    NSString *firecontact;
    
    NSString *optymessage;
    
    NSString *contacttype;
    
    
}
@end


@implementation DratsEditDetail


- (IBAction)button1:(id)sender {
    
    if ([statusbutton1 isEqualToString:@"open"]) {
        
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
            _DETAILS1.hidden=YES;
            _texttitle2.frame = CGRectMake(0, 48, self.view.layer.frame.size.width, 46);
            _DETAILS1.hidden=YES;
            statusbutton1=@"close";
            
        }
    }
    else{
        
        if ([statusbutton2 isEqualToString:@"close"]) {
            
            _DETAILS1.hidden=NO;
            _texttitle2.frame = CGRectMake(0, 546, self.view.layer.frame.size.width, 46);
            
            _DETAILS2.hidden=YES;
            statusbutton1=@"open";
            
            
        }else
            
        {
            _DETAILS1.hidden=NO;
            
            _texttitle2.frame = CGRectMake(0, 546, self.view.layer.frame.size.width, 46);
            
            _DETAILS2.hidden=NO;
            
            _DETAILS2.frame=CGRectMake(0, 594, self.view.layer.frame.size.width, 498);
            
            statusbutton1=@"open";
            
        }
        
    }
    
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    
    
    if (alert.tag == 2000) {
        
        
        //  [self callactiviitydetails];
        
    }
    
    else if (alert.tag ==10000){
        
        
        
        if (buttonIndex == 0) {// 1st Other Button
            
            NSLog(@"push to update activity ");
            
            [self hideAlert];
            
            PendingActivitiesViewController * searchOpportunityResult_VC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"PendingActivity"];
            [self.navigationController pushViewController:searchOpportunityResult_VC1 animated:YES];
            
            
            searchOpportunityResult_VC1._FirstName=First_Name;
            searchOpportunityResult_VC1._LastName=Last_Name;
            searchOpportunityResult_VC1._CellularNumber=CellNumber;
            searchOpportunityResult_VC1._OptyId=OPTY_ID;
            searchOpportunityResult_VC1._ContactId=CONTACT_ID;
            searchOpportunityResult_VC1._ActivityId=newactivity;
            
            //searchOpportunityResult_VC1.optyid1=OPTY_ID_;
            //appdelegate.opty_id=@"fromcreateopty"
            
        }
        else if (buttonIndex == 1) {// 2nd Other Button
            
            [self hideAlert];
        }
    }
    
}


- (IBAction)SubmitBtn:(id)sender
{
    
    [self showAlert];
    
    
    if ([_txt_firstname.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter first name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    
    else if ([_txt_lastname.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter last name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_mobilenumber.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter phone number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if (_txt_mobilenumber.text && _txt_mobilenumber.text.length < 10) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([mobileNumberPred evaluateWithObject:_txt_mobilenumber.text] != YES && [_txt_mobilenumber.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert setTag:0];
        
        [alert show];
        
        
    }
    
    else if ([emailTest evaluateWithObject:_txt_contactemailid.text] != YES && [_txt_contactemailid.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid EMAIL ADDRESS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert setTag:0];
        [alert show];
    }
    //  pincode validation
    else if ([pintest evaluateWithObject:_txt_accountpincode.text] != YES && [_txt_accountpincode.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid pincode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert setTag:0];
        [alert show];
    }
    else if ([pintest evaluateWithObject:_txt_contactpincode.text] != YES  && [_txt_contactpincode.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid pincode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert setTag:0];
        [alert show];
    }
    //Fleet size validation
    else if (![self isNumeric:_txt_TMLfleetsize.text])
    {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"TML Fleet size Should Be Numeric" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert setTag:0];
        [alert show];
    }
    else if (![self isNumeric:_txt_fleetsize.text])
    {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Fleet size Should Be Numeric" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert setTag:0];
        [alert show];
    }

    else if ([_txt_LOB.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select LOB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_ppl.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select PPL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_pl.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select PL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_quantity.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    
    
    
    else if ([_txt_sourceOfcontact.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select SOURCE OF CONTACT" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    else if ([_txt_customerType.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CUSTOMER TYPE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_Vehicleapplication.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select VEHICLE APPLICATION" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_vcnumber.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select VC NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    else if ([_txt_contactstate.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT STATE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    else if ([_txt_contactdistrict.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT DISTRICT" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_contactcity.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT CITY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_contacttaluka.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT TALUKA" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_contactAddressline1.text isEqualToString:@""])
    {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter CONTACT ADDRESS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    
    
    
    else{
        
        if ([_txt_LOB.text isEqualToString:@"I&MCV Trucks"])
        {
            
            if ([_txt_geography.text isEqualToString:@""]) {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select GEOGRAPHY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_bodytype.text isEqualToString:@""])
                
            {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select BODYTYPE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            else if ([_txt_TMLfleetsize.text isEqualToString:@""]) {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select TML FLEET SIZE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_fleetsize.text isEqualToString:@""])
                
            {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select FLEET SIZE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            else{
                
                [self Newcontactopportunity];
                
            }
            
        }
        else if ([_txt_LOB.text isEqualToString:@"Pickups"]) {
            
            if ([_txt_geography.text isEqualToString:@""]) {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select GEOGRAPHY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_usagecatagory.text isEqualToString:@""])
                
            {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select USAGE CATAGORY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            else{
                
                
                [self Newcontactopportunity];
            }
            
            
        }
        
        else if ([_txt_LOB.text isEqualToString:@"LCV"]) {
            
            
            
            if([_txt_bodytype.text isEqualToString:@""])
                
            {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select BODYTYPE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            
            else{
                
                [self Newcontactopportunity];
                
                
            }
            
            
            
        }
        
        else if ([_txt_LOB.text isEqualToString:@"SCVPass"]) {
            
            
            
            if([_txt_usagecatagory.text isEqualToString:@""])
                
            {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select USAGE CATAGORY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            else if ([_txt_geography.text isEqualToString:@""])
            {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select MMGeography" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
                
            }
            else{
                
                
                [self Newcontactopportunity];
                
                
            }
            
            
        }
        else if ([_txt_LOB.text isEqualToString:@"M&hcv constant"]) {
            
            if ([_txt_geography.text isEqualToString:@""]) {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select GEOGRAPHY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_bodytype.text isEqualToString:@""])
                
            {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select BODYTYPE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            else if ([_txt_TMLfleetsize.text isEqualToString:@""]) {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select TML FLEET SIZE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_fleetsize.text isEqualToString:@""])
                
            {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select FLEET SIZE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            
            else{
                
                [self Newcontactopportunity];
                
                
            }
            
            
        }
        else if ([_txt_LOB.text isEqualToString:@"SCV Cargo"]) {
            
            if ([_txt_geography.text isEqualToString:@""]) {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select GEOGRAPHY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_bodytype.text isEqualToString:@""])
                
            {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select BODYTYPE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            
            else  if([_txt_usagecatagory.text isEqualToString:@""])
                
            {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select USAGE CATAGORY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            
            
            else{
                
                
                
                [self Newcontactopportunity];
                
            }
            
            
        }
        
        else if ([_txt_LOB.text isEqualToString:@"HCV Cargo"]) {
            
            if ([_txt_geography.text isEqualToString:@""]) {
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select GEOGRAPHY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_bodytype.text isEqualToString:@""])
                
            {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select BODYTYPE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            else if ([_txt_TMLfleetsize.text isEqualToString:@""]) {
                
                [self hideAlert];
                
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select TML FLEET SIZE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if([_txt_fleetsize.text isEqualToString:@""])
                
            {
                [self hideAlert];
                alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select FLEET SIZE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
                
            }
            
            else{
                
                [self Newcontactopportunity];
                
            }
            
        }
        
        
        
        else{
            
            [self Newcontactopportunity];
            
            
        }
        
        
    }
    

    
   
    
    
}

-(void)Newcontactopportunity {
    
    
    if ([_txt_contactpannumber.text isEqual:@""]) {
        
        
        
        if ([self.accountconfirmationbtnoutlet isOn]) {
            
            
            
            
            if ([_txt_accountstate.text length] != 0 || [_txt_accountdistrict.text length] != 0 || [_txt_accountcity.text length] != 0 || [_txt_accounttaluka.text length] != 0 || [_txt_accountaddressline1.text length] != 0 ||[_txt_accountaddressline2.text length] != 0 || [_txt_accountarea.text length] != 0 || [_txt_accountpanchayat.text length] != 0 || [_txt_accountpincode.text length] != 0) {
                
                if ([_txt_accountstate.text isEqual:@""]) {
                    
                    [self hideAlert];
                    alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all address fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert setTag:0];
                    [alert show];
                }
                else if ([_txt_accountdistrict.text isEqual:@""]) {
                    
                    [self hideAlert];
                    alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all address fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert setTag:0];
                    [alert show];
                }
                else if ([_txt_accountcity.text isEqual:@""]) {
                    
                    [self hideAlert];
                    
                    
                    alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all address fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert setTag:0];
                    [alert show];
                }
                else if ([_txt_accounttaluka.text isEqual:@""]) {
                    
                    
                    [self hideAlert];
                    alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all address fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert setTag:0];
                    [alert show];
                }
                
                else if ([_txt_accountaddressline1.text isEqual:@""]) {
                    
                    [self hideAlert];
                    
                    alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all  address fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert setTag:0];
                    [alert show];
                }
                else if ([_txt_accountpanchayat.text isEqual:@""]) {
                    
                    [self hideAlert];
                    
                    
                    alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all address fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert setTag:0];
                    [alert show];
                }
                
                else{
                    
                    
                    [self finalcreateopportunity];
                    
                }
                
                
            }
            
            
            else
            {
                
                
                [self finalcreateopportunity];
                
            }
            
            
        }
        else {
            
            [self finalcreateopportunity];
        }
        
        
        
    }
    else{
        
        if ([pantest evaluateWithObject:_txt_contactpannumber.text] != YES) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid PAN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert setTag:0];
            
            [alert show];
        }
        else{
            
            if ([self.accountconfirmationbtnoutlet isOn]) {
                
                
                if ([_txt_accountstate.text length] != 0 ||[_txt_accountdistrict.text length] != 0 || [_txt_accountcity.text length] != 0 || [_txt_accounttaluka.text length] != 0 || [_txt_accountaddressline1.text length] != 0 || [_txt_accountaddressline2.text length] != 0 || [_txt_accountarea.text length] != 0 || [_txt_accountpanchayat.text length] != 0 || [_txt_accountpincode.text length] != 0) {
                    
                    if ([_txt_accountstate.text isEqual:@""]) {
                        
                        [self hideAlert];
                        
                        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all mandatory address fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert setTag:0];
                        [alert show];
                    }
                    else if ([_txt_accountdistrict.text isEqual:@""]) {
                        
                        
                        [self hideAlert];
                        
                        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all mandatory fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert setTag:0];
                        [alert show];
                    }
                    else if ([_txt_accountcity.text isEqual:@""]) {
                        
                        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all mandatory fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert setTag:0];
                        [alert show];
                    }
                    else  if ([_txt_accounttaluka.text isEqual:@""]) {
                        
                        [self hideAlert];
                        
                        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all mandatory fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert setTag:0];
                        [alert show];
                    }
                    
                    else if ([_txt_accountaddressline1.text isEqual:@""]) {
                        
                        [self hideAlert];
                        
                        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all  mandatory fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert setTag:0];
                        [alert show];
                    }
                    else if ([_txt_accountpanchayat.text isEqual:@""]) {
                        
                        [self hideAlert];
                        
                        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill all mandatory fields to create account" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert setTag:0];
                        [alert show];
                    }
                    else{
                        
                        [self finalcreateopportunity];
                    }
                    
                }
                
                
                else{
                    
                    
                    [self finalcreateopportunity];
                    
                }
                
                
            }
            else {
                
                [self finalcreateopportunity];
            }
            
        }
    }
    
}





-(void)finalcreateopportunity{
    
    
    if ([_flagset isEqual:@"fromsearchcontact"])
        
    {
        
        
        
        [self updatecontact];
        
        
        
        
    }
    else{
        
        
        
        NSString* envelopeText;
        
        
        envelopeText = [NSString stringWithFormat:
                        @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        @"<SOAP:Body>"
                        @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                        @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                        @"<Contact>"
                        @"<CellularPhone>%@</CellularPhone>"
                        @"<EmailAddress>%@</EmailAddress>"
                        @"<FirstName>%@</FirstName>"
                        @"<IntegrationId>%ld</IntegrationId>"
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
                        @"<IntegrationId>%ld</IntegrationId>"
                        @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                        @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                        @"<PersonalCountry>India</PersonalCountry>"
                        @"<PersonalState>%@</PersonalState>"
                        @"<TMDistrict>%@</TMDistrict>"
                        @"<PersonalCity>%@</PersonalCity>"
                        @"<TMTaluka>%@</TMTaluka>"
                        @"<TMPanchayat>%@</TMPanchayat>"
                        @"<TMArea>%@</TMArea>"
                        @"<PersonalPostalCode>%@</PersonalPostalCode>"
                        @"</PersonalAddress>"
                        @"</ListOfPersonalAddress>"
                        @"<ListOfOpportunity>"
                        @"<Opportunity operation=\"\">"
                        @"<IntegrationId>%ld</IntegrationId>"
                        @"<OptyFinancier>%@</OptyFinancier>"
                        @"<ParentProductLine>%@</ParentProductLine>"
                        @"<ProductLine>%@</ProductLine>"
                        @"<TMSorceOfContact>%@</TMSorceOfContact>"
                        @"<Channel>MOBILE</Channel>"
                        @"<TMCVCustomerType>%@</TMCVCustomerType>"
                        @"<IntendedApplication>%@</IntendedApplication>"
                        @"<TMLOB>%@</TMLOB>"
                        @"<ProductId>%@</ProductId>"
                        @"<TMBodyType>%@</TMBodyType>"
                        @"<TMCustomerSegment>%@</TMCustomerSegment>"
                        @"<TMFleetSize>%@</TMFleetSize>"
                        @"<TMMMGeography>%@</TMMMGeography>"
                        @"<TMNonFleetSize>%@</TMNonFleetSize>"
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
                        @"</SOAP:Envelope>",
                        _txt_mobilenumber.text,_txt_contactemailid.text,_txt_firstname.text, (long)[[NSDate date] timeIntervalSince1970],_txt_lastname.text,_txt_contactpannumber.text, userDetailsVal_.POSITION_NAME, userDetailsVal_.POSITION_ID, userDetailsVal_.ORGNAME, (long)[[NSDate date] timeIntervalSince1970],_txt_contactAddressline1.text, _txt_addressline2.text, [self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],[(UITextField *)[self.view viewWithTag:6] text], [(UITextField *)[self.view viewWithTag:7] text],[(UITextField *)[self.view viewWithTag:8] text],_txt_contactpanchayat.text,_txt_contactarea.text ,_txt_contactpincode.text,(long)[[NSDate date] timeIntervalSince1970],_txt_financier.text,_txt_ppl.text,_txt_pl.text,_txt_sourceOfcontact.text,_txt_customerType.text,_txt_Vehicleapplication.text,_txt_LOB.text,self.p_id,_txt_bodytype.text,_txt_usagecatagory.text,_txt_TMLfleetsize.text,_txt_geography.text,_txt_fleetsize.text, userDetailsVal_.ORGNAME, userDetailsVal_.POSITION_NAME, userDetailsVal_.POSITION_ID,_txt_vcnumber.text,_txt_quantity.text,_txt_ppl.text,_txt_pl.text,@"1-7FDWNPL"];
        
        
        
        //userDetailsVal_.POSITION_ID
        // userDetailsVal_.POSITION_ID
        
        
        
        NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
        
        NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
        NSLog(@"URL IS %@", theurl);
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
        NSLog(@"Request.... %@", request);
        NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
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
        
        
        if ([response rangeOfString:@"a record with identical values already exists in the Siebel database."].location != NSNotFound) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Record with identical values already exists" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            
            [alertView show];
        }
        
        else if ([response rangeOfString:@"in the bounded picklist for the field 'TM MM Geography"].location != NSNotFound) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Cannot find entry for selected geography in the bounded picklist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
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
    
    else {
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"ns:SFATMCVContactInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* ListOfContactInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:container];
        
        TBXMLElement* Contact = [TBXML childElementNamed:@"Contact" parentElement:ListOfContactInterface];
        
        TBXMLElement* IDC = [TBXML childElementNamed:@"Id" parentElement:Contact];
        
        TBXMLElement* ListOfOpportunity = [TBXML childElementNamed:@"ListOfOpportunity" parentElement:Contact];
        
        TBXMLElement* Opportunity = [TBXML childElementNamed:@"Opportunity" parentElement:ListOfOpportunity];
        
        TBXMLElement* Id = [TBXML childElementNamed:@"Id" parentElement:Opportunity];
        
        OPTY_ID = [TBXML textForElement:Id];
        
        CONTACT_ID = [TBXML textForElement:IDC];
        
        
        
        
        
        if ([OPTY_ID isEqual:@""]) {
            [self hideAlert];
            
            
            self.txt_mobilenumber.text=@"";
            self.txt_mainphonenumber.text=@"";
            self.txt_firstname.text=@"";
            self.txt_lastname.text=@"";
            self.txt_accountName.text=@"";
            self.txt_site.text=@"";
            self.txt_financier.text=@"";
            self.txt_LOB.text=@"";
            self.txt_ppl.text=@"";
            self.txt_pl.text=@"";
            self.txt_quantity.text=@"";
            self.txt_Vehicleapplication.text=@"";
            self.txt_customerType.text=@"";
            self.txt_sourceOfcontact.text=@"";
            self.txt_vcnumber.text=@"";
            self.txt_bodytype.text=@"";
            self.txt_usagecatagory.text=@"";
            self.txt_TMLfleetsize.text=@"";
            self.txt_fleetsize.text=@"";
            
            
            //contact
            self.txt_contactpannumber.text=@"";
            self.txt_contactemailid.text=@"";
            self.txt_campaign.text=@"";
            self.txt_contactstate.text=@"";
            self.txt_contactdistrict.text=@"";
            self.txt_contactcity.text=@"";
            self.txt_contacttaluka.text=@"";
            self.txt_contactarea.text=@"";
            self.txt_contactpanchayat.text=@"";
            self.txt_contactpincode.text=@"";
            
            self.txt_contactAddressline1.text=@"";
            self.txt_addressline2.text=@"";
            
            
            //account
            self.txt_accountstate.text=@"";
            self.txt_accounttaluka.text=@"";
            self.txt_accountcity.text=@"";
            self.txt_accountdistrict.text=@"";
            self.txt_accountarea.text=@"";
            self.txt_accountpanchayat.text=@"";
            self.txt_accountpincode.text=@"";
            self.txt_accountaddressline1.text=@"";
            self.txt_accountaddressline2.text=@"";
            
            self.txt_geography.text=@"";
            
            
            
            
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Opportunity Creation Failed " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            
            [alertView show];
        }
        else {
            
            
            if ([self.accountconfirmationbtnoutlet isOn]) {
                
                
                [self contactByID];
                
            }else{
                
                // [self hideAlert];
                
                
                self.txt_mobilenumber.text=@"";
                self.txt_mainphonenumber.text=@"";
                self.txt_firstname.text=@"";
                self.txt_lastname.text=@"";
                self.txt_accountName.text=@"";
                self.txt_site.text=@"";
                self.txt_financier.text=@"";
                self.txt_LOB.text=@"";
                self.txt_ppl.text=@"";
                self.txt_pl.text=@"";
                self.txt_quantity.text=@"";
                self.txt_Vehicleapplication.text=@"";
                self.txt_customerType.text=@"";
                self.txt_sourceOfcontact.text=@"";
                self.txt_vcnumber.text=@"";
                self.txt_bodytype.text=@"";
                self.txt_usagecatagory.text=@"";
                self.txt_TMLfleetsize.text=@"";
                self.txt_fleetsize.text=@"";
                
                
                //contact
                self.txt_contactpannumber.text=@"";
                self.txt_contactemailid.text=@"";
                self.txt_campaign.text=@"";
                self.txt_contactstate.text=@"";
                self.txt_contactdistrict.text=@"";
                self.txt_contactcity.text=@"";
                self.txt_contacttaluka.text=@"";
                self.txt_contactarea.text=@"";
                self.txt_contactpanchayat.text=@"";
                self.txt_contactpincode.text=@"";
                
                self.txt_contactAddressline1.text=@"";
                self.txt_addressline2.text=@"";
                
                
                //account
                self.txt_accountstate.text=@"";
                self.txt_accounttaluka.text=@"";
                self.txt_accountcity.text=@"";
                self.txt_accountdistrict.text=@"";
                self.txt_accountarea.text=@"";
                self.txt_accountpanchayat.text=@"";
                self.txt_accountpincode.text=@"";
                self.txt_accountaddressline1.text=@"";
                self.txt_accountaddressline2.text=@"";
                
                self.txt_geography.text=@"";
                
                [self callactiviitydetails];
                
                
                //  alert = [[UIAlertView alloc] initWithTitle:OPTY_ID message:@"Opportunity created successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //   alert.tag=2000;
                //   [alert show];
                
            }
            
            
            
            
            
            
            
            
            
        }
        
    }
    
}

-(void)updatecontact{
    
    if ([selectedcontact1.CITY isEqual:_txt_contactcity.text]) {
        
        contacttype=@"untouch";
        
        NSString* envelopeText = [NSString stringWithFormat:
                                  @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                  @"<SOAP:Body>"
                                  @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                                  @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                                  @"<Contact operation=\"update\">"
                                  @"<Id>%@</Id>"
                                  @"<FirstName>%@</FirstName>"
                                  @"<LastName>%@</LastName>"
                                  @"<ListOfPersonalAddress operation=\"update\">"
                                  @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                                  @"<Id>%@</Id>"
                                  @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                                  @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                                  @"<TMArea>%@</TMArea>"
                                  @"<PersonalCountry>India</PersonalCountry>"
                                  @"<PersonalState>%@</PersonalState>"
                                  @"<TMDistrict>%@</TMDistrict>"
                                  @"<PersonalCity>%@</PersonalCity>"
                                  @"<TMTaluka>%@</TMTaluka>"
                                  @"<PersonalPostalCode>%@</PersonalPostalCode>"
                                  @"<TMPanchayat>%@</TMPanchayat>"
                                  @"</PersonalAddress>"
                                  @"</ListOfPersonalAddress>"
                                  @"</Contact>"
                                  @"</ListOfContactInterface>"
                                  @"</SFATMCVContactInsertOrUpdate_Input>"
                                  @"</SOAP:Body>"
                                  @"</SOAP:Envelope>",
                                  selectedcontact1.CONTACT_ID,_txt_firstname.text,_txt_lastname.text,selectedcontact1.ADDRESS_ID,_txt_contactAddressline1.text,_txt_addressline2.text,_txt_contactarea.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_txt_contactdistrict.text,_txt_contactcity.text,_txt_contacttaluka.text,_txt_contactpincode.text,_txt_contactpanchayat.text];
        
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
        [[RequestDelegate alloc] initiateRequest:request name:@"prospectupdateconnection"];
        
        
        
        
        
    }
    
    else{
        
        
        
        contacttype=@"touch";
        firecontact =@"first";
        
        integrationIdvalue= [NSString stringWithFormat:@"%ld", (long)[[NSDate date]timeIntervalSince1970]];
        
        
        
        NSString* envelopeText = [NSString stringWithFormat:
                                  @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                  @"<SOAP:Body>"
                                  @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                                  @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                                  @"<Contact operation=\"update\">"
                                  @"<Id>%@</Id>"
                                  @"<FirstName>%@</FirstName>"
                                  @"<LastName>%@</LastName>"
                                  @"<ListOfPersonalAddress operation=\"\">"
                                  @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                                  @"<Id></Id>"
                                  @"<IntegrationId>%@</IntegrationId>"
                                  @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                                  @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                                  @"<TMArea>%@</TMArea>"
                                  @"<PersonalCountry>India</PersonalCountry>"
                                  @"<PersonalState>%@</PersonalState>"
                                  @"<TMDistrict>%@</TMDistrict>"
                                  @"<PersonalCity>%@</PersonalCity>"
                                  @"<TMTaluka>%@</TMTaluka>"
                                  @"<PersonalPostalCode>%@</PersonalPostalCode>"
                                  @"<TMPanchayat>%@</TMPanchayat>"
                                  @"</PersonalAddress>"
                                  @"</ListOfPersonalAddress>"
                                  @"</Contact>"
                                  @"</ListOfContactInterface>"
                                  @"</SFATMCVContactInsertOrUpdate_Input>"
                                  @"</SOAP:Body>"
                                  @"</SOAP:Envelope>",
                                  selectedcontact1.CONTACT_ID,_txt_firstname.text,_txt_lastname.text,integrationIdvalue,_txt_contactAddressline1.text,_txt_addressline2.text,_txt_contactarea.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_txt_contactdistrict.text,_txt_contactcity.text,_txt_contacttaluka.text,_txt_contactpincode.text,_txt_contactpanchayat.text];
        
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
        [[RequestDelegate alloc] initiateRequest:request name:@"prospectupdateconnection"];
        
        
    }
    
    
}
- (void)prospectupdatefound:(NSNotification*)notification
{
    
    NSLog(@"response");
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\nResUPDATE RESPONSE%@", response);
    
    if ([response isEqual:@""]) {
        [self hideAlert];
        NSLog(@"Nko re..");
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        if ([response rangeOfString:@"Personal Address"].location != NSNotFound) {
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Contact with same personal address already exist " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else {
            
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    
    else {
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"ns:SFATMCVContactInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* ListOfContactInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:container];
        
        TBXMLElement* Contact = [TBXML childElementNamed:@"Contact" parentElement:ListOfContactInterface];
        
        TBXMLElement* Id = [TBXML childElementNamed:@"Id" parentElement:Contact];
        TBXMLElement* Integration = [TBXML childElementNamed:@"IntegrationId" parentElement:Contact];
        
        if (Id) {
            //  createcontactresult.Id_ = [TBXML textForElement:Id];
            // NSLog(@"contact id%@",createcontactresult.Id_);
            NSString* idstring = [TBXML textForElement:Id];
            
            NSString* irnt = [TBXML textForElement:Integration];
            
            NSLog(@"contact id  %@", idstring);
            
            NSLog(@"contact id  %@", irnt);
            
            if ([contacttype isEqual:@"untouch"]) {
                
                
                
                [self existingoptycreation];
                
            }
            
            else
            {
                
                
                
                if ([firecontact isEqual:@"first"]) {
                    
                    
                    
                    [self firecontactupdatetwo];
                }
                else{
                    
                    [self hideAlert];
                    
                    
                    [self existingoptycreation];
                    
                }
            }
            
            
            
        }
        else {
            [self hideAlert];
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something Went Wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            [alertView show];
        }
    }
}

-(void)firecontactupdatetwo{
    
    
    firecontact=@"two";
    
    
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                              @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<Contact operation=\"update\">"
                              @"<Id>%@</Id>"
                              @"<FirstName>%@</FirstName>"
                              @"<LastName>%@</LastName>"
                              @"<ListOfPersonalAddress operation=\"update\">"
                              @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                              @"<IntegrationId>%@</IntegrationId>"
                              @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                              @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                              @"<TMArea>%@</TMArea>"
                              @"<PersonalCountry>India</PersonalCountry>"
                              @"<PersonalState>%@</PersonalState>"
                              @"<TMDistrict>%@</TMDistrict>"
                              @"<PersonalCity>%@</PersonalCity>"
                              @"<TMTaluka>%@</TMTaluka>"
                              @"<PersonalPostalCode>%@</PersonalPostalCode>"
                              @"<TMPanchayat>%@</TMPanchayat>"
                              @"</PersonalAddress>"
                              @"</ListOfPersonalAddress>"
                              @"</Contact>"
                              @"</ListOfContactInterface>"
                              @"</SFATMCVContactInsertOrUpdate_Input>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",
                              selectedcontact1.CONTACT_ID,_txt_firstname.text,_txt_lastname.text,integrationIdvalue,_txt_contactAddressline1.text,_txt_addressline2.text,_txt_contactarea.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:5] text]],_txt_contactdistrict.text,_txt_contactcity.text,_txt_contacttaluka.text,_txt_contactpincode.text,_txt_contactpanchayat.text];
    
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
    [[RequestDelegate alloc] initiateRequest:request name:@"prospectupdateconnection"];
    
    
}

-(void)existingoptycreation{
    
    
    NSString* envelopeText;
    
    envelopeText = [NSString stringWithFormat:
                    @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                    @"<SOAP:Body>"
                    @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                    @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                    @"<Contact>"
                    @"<Id>%@</Id>"
                    @"<ListOfOpportunity>"
                    @"<Opportunity operation=\"\">"
                    @"<IntegrationId>%ld</IntegrationId>"
                    @"<OptyFinancier>%@</OptyFinancier>"
                    @"<ParentProductLine>%@</ParentProductLine>"
                    @"<ProductLine>%@</ProductLine>"
                    @"<TMSorceOfContact>%@</TMSorceOfContact>"
                    @"<Channel>MOBILE</Channel>"
                    @"<TMCVCustomerType>%@</TMCVCustomerType>"
                    @"<IntendedApplication>%@</IntendedApplication>"
                    @"<TMLOB>%@</TMLOB>"
                    @"<ProductId>%@</ProductId>"
                    @"<TMBodyType>%@</TMBodyType>"
                    @"<TMCustomerSegment>%@</TMCustomerSegment>"
                    @"<TMFleetSize>%@</TMFleetSize>"
                    @"<TMMMGeography>%@</TMMMGeography>"
                    @"<TMNonFleetSize>%@</TMNonFleetSize>"
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
                    @"<Id>1-7FDWNPL</Id>"
                    @"</OpportunityRelatedCampaigns>"
                    @"</ListOfOpportunityRelatedCampaigns>"
                    @"</Opportunity>"
                    @"</ListOfOpportunity>"
                    @"</Contact>"
                    @"</ListOfContactInterface>"
                    @"</SFATMCVContactInsertOrUpdate_Input>"
                    @"</SOAP:Body>"
                    @"</SOAP:Envelope>",selectedcontact1.CONTACT_ID,
                    (long)[[NSDate date] timeIntervalSince1970],_txt_financier.text,_txt_ppl.text,_txt_pl.text,_txt_sourceOfcontact.text,_txt_customerType.text,_txt_Vehicleapplication.text,_txt_LOB.text,Product_IDstring,_txt_bodytype.text,_txt_usagecatagory.text,_txt_TMLfleetsize.text,_txt_geography.text,_txt_fleetsize.text,userDetailsVal_.ORGNAME,userDetailsVal_.POSITION_NAME, userDetailsVal_.POSITION_ID,_txt_vcnumber.text,_txt_quantity.text,_txt_ppl.text,_txt_pl.text];
    
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"\n envlopeString Of user details....!!!!%@", envelopeText);
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSLog(@"Request.... %@", request);
    NSString* msglength = [NSString stringWithFormat:@"%i", [envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"Createoptyfornewcontact"];
    
    
    
}


- (void)Updatecontact_created1
{
    NSString *contactState=[self.dict valueForKey:_txt_contactstate.text];
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                              @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<Contact operation=\"\">"
                              @"<IntegrationId>%@</IntegrationId>"
                              @"<FirstName>%@</FirstName>"
                              @"<LastName>%@</LastName>"
                              @"<ListOfPersonalAddress operation=\"\">"
                              @"<PersonalAddress IsPrimaryMVG=\"Y\">"
                              @"<IntegrationId>%@</IntegrationId>"
                              @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                              @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                              @"<TMArea>%@</TMArea>"
                              @"<PersonalCountry>India</PersonalCountry>"
                              @"<PersonalState>%@</PersonalState>"
                              @"<TMDistrict>%@</TMDistrict>"
                              @"<PersonalCity>%@</PersonalCity>"
                              @"<TMTaluka>%@</TMTaluka>"
                              @"<PersonalPostalCode></PersonalPostalCode>"
                              @"<TMPanchayat></TMPanchayat>"
                              @"</PersonalAddress>"
                              @"</ListOfPersonalAddress>"
                              @"</Contact>"
                              @"</ListOfContactInterface>"
                              @"</SFATMCVContactInsertOrUpdate_Input>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",Wintgration,_txt_firstname.text, _txt_lastname.text, Wintgration, _txt_contactAddressline1.text, _txt_addressline2.text, _txt_contactarea.text, contactState, _txt_contactdistrict.text, _txt_contactcity.text, _txt_contacttaluka.text];
    
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
    [[RequestDelegate alloc] initiateRequest:request name:@"prospectupdateconnection"];
}

- (void)prospectupdatefound1:(NSNotification*)notification
{
    
    NSLog(@"response");
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
}

-(BOOL)isNumeric:(NSString *)s
{
    NSScanner *sc = [NSScanner scannerWithString: s];
    if ( [sc scanFloat:NULL] )
    {
        return [sc isAtEnd];
    }
    return NO;
    
}

- (void)contactByID
{
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\">"
                              @"<soapenv:Header/>"
                              @"<soapenv:Body>"
                              @"<asi:SFATMCVContactQueryById_Input>"
                              @"<asi:PrimaryRowId>%@</asi:PrimaryRowId>"
                              @"</asi:SFATMCVContactQueryById_Input>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",
                              CONTACT_ID];
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"ContactquerybyID"];
}

- (void)contactqueryfound:(NSNotification*)notification
{
    
    
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\nResponse....%@", response);
    
    if ([response isEqual:@""]) {
        [self hideAlert];
        NSLog(@"Nko re..");
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"soapenv:Fault"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"ns:SFATMCVContactQueryById_Output" parentElement:[TBXML childElementNamed:@"soapenv:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* ListOfContactInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:container];
        
        
        
        TBXMLElement* Contact = [TBXML childElementNamed:@"Contact" parentElement:ListOfContactInterface];
        
        
        TBXMLElement* CellularPhone = [TBXML childElementNamed:@"CellularPhone" parentElement:Contact];
        CellNumber=[TBXML textForElement:CellularPhone];
        
        TBXMLElement* FirstName = [TBXML childElementNamed:@"FirstName" parentElement:Contact];
        First_Name=[TBXML textForElement:FirstName];
        
        TBXMLElement* LastName = [TBXML childElementNamed:@"LastName" parentElement:Contact];
        Last_Name=[TBXML textForElement:LastName];
        
        TBXMLElement* ListOfPersonalAddress = [TBXML childElementNamed:@"ListOfPersonalAddress" parentElement:Contact];
        
        TBXMLElement* contactId = [TBXML childElementNamed:@"Id" parentElement:Contact];
        
        TBXMLElement* PersonalAddress = [TBXML childElementNamed:@"PersonalAddress" parentElement:ListOfPersonalAddress];
        
        TBXMLElement* Id = [TBXML childElementNamed:@"Id" parentElement:PersonalAddress];
        
        TBXMLElement* IntegrationId = [TBXML childElementNamed:@"IntegrationId" parentElement:PersonalAddress];
        
        TBXMLElement* AddressId = [TBXML childElementNamed:@"AddressId" parentElement:PersonalAddress];
        
        TBXMLElement* PersonalAddressName = [TBXML childElementNamed:@"PersonalAddressName" parentElement:PersonalAddress];
        
        _strAccount = [TBXML textForElement:Id];
        Wintgration = [TBXML textForElement:IntegrationId];
        Waddressid = [TBXML textForElement:AddressId];
        Wcontactid = [TBXML textForElement:contactId];
        WpersonalName = [TBXML textForElement:PersonalAddressName];
        
        /*
         CellularPhone>8585454525</CellularPhone>
         <Comment/>
         <OrganizationName>BAFNA Motors (Mumbai) Pvt. Ltd.</OrganizationName>
         <EmailAddress/>
         <Branch/>
         <FaxPhone/>
         <FirstName>ADS ASDFSADFSDF</FirstName>
         <HomePhone/>
         <Income/>
         <IncomeCurrencyCode>INR</IncomeCurrencyCode>
         <IncomeExchangeDate>03/15/2016 00:00:00</IncomeExchangeDate>
         <IntegrationId>1457993361</IntegrationId>
         <JobTitle/>
         <LastName>DFGSDFHDFGHFGGHJFGHJ</LastName>
         */
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", _strAccount);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", Wintgration);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", Waddressid);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", Wcontactid);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", WpersonalName);
        
        [self create_account];
        
        
    }
}
-(void)create_account{
    
    
    NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _txt_accountaddressline1.text, @"."];
    
    
    NSString * envelopeText = [NSString stringWithFormat:
                               @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                               @"<soapenv:Header />"
                               @"<soapenv:Body>"
                               @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"<ListOfAccountInterface>"
                               @"<Account operation=\"?\">"
                               @"<IntegrationId>%ld</IntegrationId>"
                               @"<Location>sdfsdfvs</Location>"
                               @"<MainPhoneNumber>%@</MainPhoneNumber>"
                               @"<Name>%@</Name>"
                               @"<ListOfBusinessAddress>"
                               @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                               @"<AddressId>?</AddressId>"
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
                               (long)[[NSDate date]timeIntervalSince1970],
                               _txt_mainphonenumber.text,
                               _txt_accountName.text,(long)[[NSDate date] timeIntervalSince1970],[(UITextField *)[self.view viewWithTag:3] text],_txt_accountpincode.text,[self.dict valueForKey:[(UITextField *)[self.view viewWithTag:1] text]],acoounaddressline1,_txt_accountaddressline2.text,[(UITextField *)[self.view viewWithTag:2] text],[(UITextField *)[self.view viewWithTag:4] text],                               CONTACT_ID,
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
    
    
    
    [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation"];
    
}
-(void)accountcreation_found:(NSNotification*)notification
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
        ACCOUNTID = [TBXML textForElement:AccountId];
        
        NSLog(@"account ID %@",ACCOUNTID);
        
        
        if(![ACCOUNTID length] == 0)
        {
            
            
            [self accountOptylinking];
            
            
        }
        
        
        
        
    }
    
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
                              @"</SOAP:Envelope>",CONTACT_ID,OPTY_ID,ACCOUNTID];
    
    
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
            
            // [self hideAlert];
            
            
            
            self.txt_mobilenumber.text=@"";
            self.txt_mainphonenumber.text=@"";
            self.txt_firstname.text=@"";
            self.txt_lastname.text=@"";
            self.txt_accountName.text=@"";
            self.txt_site.text=@"";
            self.txt_financier.text=@"";
            self.txt_LOB.text=@"";
            self.txt_ppl.text=@"";
            self.txt_pl.text=@"";
            self.txt_quantity.text=@"";
            self.txt_Vehicleapplication.text=@"";
            self.txt_customerType.text=@"";
            self.txt_sourceOfcontact.text=@"";
            self.txt_vcnumber.text=@"";
            self.txt_bodytype.text=@"";
            self.txt_usagecatagory.text=@"";
            self.txt_TMLfleetsize.text=@"";
            self.txt_fleetsize.text=@"";
            
            
            
            
            self.txt_contactpannumber.text=@"";
            self.txt_contactemailid.text=@"";
            self.txt_campaign.text=@"";
            self.txt_contactstate.text=@"";
            self.txt_contactdistrict.text=@"";
            self.txt_contactcity.text=@"";
            self.txt_contacttaluka.text=@"";
            self.txt_contactarea.text=@"";
            self.txt_contactpanchayat.text=@"";
            self.txt_contactpincode.text=@"";
            
            self.txt_contactAddressline1.text=@"";
            self.txt_addressline2.text=@"";
            
            
            
            self.txt_accountstate.text=@"";
            self.txt_accounttaluka.text=@"";
            self.txt_accountcity.text=@"";
            self.txt_accountdistrict.text=@"";
            self.txt_accountarea.text=@"";
            self.txt_accountpanchayat.text=@"";
            self.txt_accountpincode.text=@"";
            self.txt_accountaddressline1.text=@"";
            self.txt_accountaddressline2.text=@"";
            
            self.txt_geography.text=@"";
            
            
            
            [self callactiviitydetails];
            
            
            //         alert = [[UIAlertView alloc] initWithTitle:@"DSM"
            //                                                            message:@"Opportunity created successfully. Do you want to link a Campaign?"
            //                                                           delegate:self
            //                                                  cancelButtonTitle:nil
            //                                                  otherButtonTitles:@"YES",@"NO",nil];
            //
            //
            //
            //
            //            alert.tag=2000;
            //
            //            [alert show];
            
        }
        
        
    }
    
    
    
    
}
-(void)callactiviitydetails
{
    
    [self showAlert];
    fire =@"first";
    
    
    integrationIdvalue= [NSString stringWithFormat:@"%ld", (long)[[NSDate date]timeIntervalSince1970]];
    
    
    
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\" xmlns:con=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<soapenv:Header/>"
                              @"<soapenv:Body>"
                              @"<asi:SFATMCVContactInsertOrUpdate_Input>"
                              @"<con:ListOfContactInterface>"
                              @"<Contact>"
                              @"<Id>%@</Id>"
                              @"<ListOfOpportunity>"
                              @"<Opportunity>"
                              @"<Id>%@</Id>"
                              @"<ListOfOpportunityRelatedActivities>"
                              @"<OpportunityRelatedActivities>"
                              @"<ActivityUID>%@</ActivityUID>"
                              @"<TMIntegrationId>%@</TMIntegrationId>"
                              @"<OpportunityId>%@</OpportunityId>"
                              @"<ActivityStatus>Open</ActivityStatus>"
                              @"<NextPlannedDate/>"
                              @"<Mode>Visit</Mode>"
                              @"<ActivityType>Follow-Up</ActivityType>"
                              @"<PlannedStart>%@</PlannedStart>"
                              @"<Comments>Follow up activity for new opportunity</Comments>"
                              @"<PlannedEnd/>"
                              @"<ListOfActivitiesRelatedSalesRep>"
                              @"<ActivitiesRelatedSalesRep IsPrimaryMVG=\"N\">"
                              @"<Id>%@</Id>"
                              @"<Login>%@</Login>"
                              @"</ActivitiesRelatedSalesRep>"
                              @"</ListOfActivitiesRelatedSalesRep>"
                              @"<Description2>%@</Description2>"
                              @"</OpportunityRelatedActivities>"
                              @"</ListOfOpportunityRelatedActivities>"
                              @"</Opportunity>"
                              @"</ListOfOpportunity>"
                              @"</Contact>"
                              @"</con:ListOfContactInterface>"
                              @"<!--Optional:-->"
                              @"<asi:StatusObject>?</asi:StatusObject>"
                              @"</asi:SFATMCVContactInsertOrUpdate_Input>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",CONTACT_ID,OPTY_ID,integrationIdvalue,integrationIdvalue,OPTY_ID,DatePass,userDetailsVal_.PRIMARY_EMP,userDetailsVal_.Login_Name,userDetailsVal_.PRIMARY_EMP];
    
    NSLog(@"enevelope %@",envelopeText);
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
    NSLog(@"URL IS .... %@",theurl);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"newoptyactivity"];
    
    
    
    
}


-(void)newopty_found:(NSNotification*)notification{
    
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\n _ActivityCREATE_Found response... %@ ",response);
    TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    
    if([response isEqual:@""]){
        if([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"NEEV" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSE" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSM" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound )
    {
        [self hideAlert];
        if([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"NEEV" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSE" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSM" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }//soapenv:Fault
    else if ([response rangeOfString:@"soapenv:Fault"].location != NSNotFound )
    {
        [self hideAlert];
        if([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"NEEV" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSE" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]){
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSM" message :@"Activity creation failed.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else{
        
        TBXMLElement *container = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:[TBXML childElementNamed:@"ns:SFATMCVContactInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"soapenv:Body" parentElement:tbxml.rootXMLElement]]];
        
        TBXMLElement *Opportunity = [TBXML childElementNamed:@"Contact" parentElement:container];
        
        if (Opportunity)
        {
            [self hideAlert];
            
            TBXMLElement *Id = [TBXML childElementNamed:@"Id" parentElement:Opportunity];
            
            newactivity = [TBXML textForElement:Id];
            NSLog(@"\nListOfContactInterface.....!!!!!%@",newactivity);
            
            if ([fire isEqual:@"first"]) {
                
                [self callactivityagain];
                
            }
            else{
                
                [appdelegate.managedObjectContext deleteObject:self.draftsdetail];
                NSError * error = nil;
                if (![appdelegate.managedObjectContext save:&error])
                {
                    NSLog(@"Error ! %@", error);
                }

                
                alert = [[UIAlertView alloc] initWithTitle:OPTY_ID
                                                   message:optymessage
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"YES",@"NO",nil];
                
                
                
                
                alert.tag=10000;
                
                [alert show];
                
                
                
            }
            
        }else
        {
            [self hideAlert];
            if([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]){
                alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Activity creation failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]){
                alert=[[UIAlertView alloc]initWithTitle:@"DSM" message:@"Activity creation failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }else if([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]){
                alert=[[UIAlertView alloc]initWithTitle:@"DSE" message:@"Activity creation failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
    
    
}
-(void)callactivityagain
{
    
    
    fire=@"second";
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\" xmlns:con=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<soapenv:Header/>"
                              @"<soapenv:Body>"
                              @"<asi:SFATMCVContactInsertOrUpdate_Input>"
                              @"<con:ListOfContactInterface>"
                              @"<Contact>"
                              @"<Id>%@</Id>"
                              @"<ListOfOpportunity>"
                              @"<Opportunity>"
                              @"<Id>%@</Id>"
                              @"<ListOfOpportunityRelatedActivities>"
                              @"<OpportunityRelatedActivities>"
                              @"<ActivityUID>%@</ActivityUID>"
                              @"<TMIntegrationId>%@</TMIntegrationId>"
                              @"<OpportunityId>%@</OpportunityId>"
                              @"<ActivityStatus>Open</ActivityStatus>"
                              @"<NextPlannedDate/>"
                              @"<Mode>Visit</Mode>"
                              @"<ActivityType>Follow-Up</ActivityType>"
                              @"<PlannedStart>%@</PlannedStart>"
                              @"<Comments>Follow up activity for new opportunity</Comments>"
                              @"<PlannedEnd/>"
                              @"<ListOfActivitiesRelatedSalesRep>"
                              @"<ActivitiesRelatedSalesRep IsPrimaryMVG=\"N\">"
                              @"<Id>%@</Id>"
                              @"<Login>%@</Login>"
                              @"</ActivitiesRelatedSalesRep>"
                              @"</ListOfActivitiesRelatedSalesRep>"
                              @"<Description2>%@</Description2>"
                              @"</OpportunityRelatedActivities>"
                              @"</ListOfOpportunityRelatedActivities>"
                              @"</Opportunity>"
                              @"</ListOfOpportunity>"
                              @"</Contact>"
                              @"</con:ListOfContactInterface>"
                              @"<!--Optional:-->"
                              @"<asi:StatusObject>?</asi:StatusObject>"
                              @"</asi:SFATMCVContactInsertOrUpdate_Input>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",CONTACT_ID,OPTY_ID,integrationIdvalue,integrationIdvalue,OPTY_ID,DatePass,userDetailsVal_.PRIMARY_EMP,userDetailsVal_.Login_Name,userDetailsVal_.PRIMARY_EMP];
    
    
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
    NSLog(@"URL IS .... %@",theurl);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"newoptyactivity"];
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.editBtn.alpha = 1.0;
    // Do any additional setup after loading the view, typically from a nib.
    statusbutton1=@"open";
    statusbutton2=@"open";
    
    
    NSDate *now = [NSDate date];
    int daysToAdd = 1;
    NSDate *newDate1 = [now dateByAddingTimeInterval:60*60*24*daysToAdd];
    
    NSLog(@"new date %@",newDate1);
    
    
    CampaignID=@"";
    
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *convertedString = [dateFormatter stringFromDate:newDate1]; //here convert date in NSString
    NSLog(@"Converted String : %@",convertedString);
    
    DatePass = [NSString stringWithFormat:@"%@%@", convertedString,@" 14:00:00"];
    
    NSLog(@"date pass %@",DatePass);
    
    
    optymessage=[NSString stringWithFormat:@"%@%@", @"Opportunity created successfully!! Follow up activity is created against the opportunity . Do you want to edit the activity date ? Currently the follow up date is ", DatePass];
    
    
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    userDetailsVal_ = [UserDetails_Var sharedmanager];
    emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    
    mobileNumberPattern = @"[789][0-9]{9}";
    mobileNumberPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileNumberPattern];
    
    panCardRegex = @"[A-Z]{3}P[A-Z]{1}[0-9]{4}[A-Z]{1}";
    pantest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", panCardRegex];
    
    pincodeRegx = @"[0-9]{6}";
    pintest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pincodeRegx];
    
    
    self.title=@"Drafts Details";
    TMLfleetSize=[[NSMutableArray alloc]init];
    Fleetsize=[[NSMutableArray alloc]init];
    GetAllstates_Arr=[[NSMutableArray alloc]init];
    
    
    NSLog(@"flagset %@",_flagset);
    if ([_flagset isEqual:@"fromsearchcontact"]) {
        
        _txt_firstname.text=selectedcontact1.CONTACT_FIRST_NAME;
        _txt_lastname.text=selectedcontact1.CONTACT_LAST_NAME;
        _txt_mobilenumber.text=selectedcontact1.MOBILE_NO;
        _txt_contactemailid.text=selectedcontact1.CONTACT_EMAIL_ID;
        _txt_contactstate.text=selectedcontact1.STATE;
        _txt_contactdistrict.text=selectedcontact1.DISTRICT;
        _txt_contacttaluka.text=selectedcontact1.TALUKA;
        _txt_contactcity.text=selectedcontact1.CITY;
        _txt_contactpanchayat.text=selectedcontact1.PANCHAYAT;
        _txt_contactpincode.text=selectedcontact1.ZIPCODE;
        _txt_contactarea.text=selectedcontact1.AREA;
        _txt_contactAddressline1.text=selectedcontact1.ADDLINE_ONE;
        _txt_addressline2.text=selectedcontact1.ADDLINE_TWO;
        
        
        
        
        NSLog(@"contact, address %@,%@",selectedcontact1.CONTACT_ID,selectedcontact1.STATE);
        
    }
    else{
        
        
        
    }
    

    
//    self.txt_firstname.text=[self.draftsdetail valueForKey:@"firstname"];
//    self.txt_lastname.text=[self.draftsdetail valueForKey:@"lastname"];
//    self.Emailid.text=[self.draftsdetail valueForKey:@"email"];
//    self.Cellnumber.text=[self.draftsdetail valueForKey:@"cellnumber"];
//    self.Area.text=[self.draftsdetail valueForKey:@"area"];
//    self.State.text=[self.draftsdetail valueForKey:@"state"];
//    self.District.text=[self.draftsdetail valueForKey:@"district"];
//    self.City.text=[self.draftsdetail valueForKey:@"city"];
//    self.LOB.text=[self.draftsdetail valueForKey:@"lob"];
//    
//    self.PPL.text=[self.draftsdetail valueForKey:@"ppl"];
//    self.PL.text=[self.draftsdetail valueForKey:@"pl"];
//    self.Application.text=[self.draftsdetail valueForKey:@"application"];
//    self.Financier.text=[self.draftsdetail valueForKey:@"financier"];
    
    [self.draftsdetail valueForKey:@"accountname"];
    
    self.p_id=[self.draftsdetail valueForKey:@"productid"];
    
    self.txt_firstname.text=[self.draftsdetail valueForKey:@"firstname"];
    self.txt_lastname.text=[self.draftsdetail valueForKey:@"lastname"];
    self.txt_mobilenumber.text=[self.draftsdetail valueForKey:@"cellnumber"];
     self.txt_accountName.text=[self.draftsdetail valueForKey:@"accountname"];
    self.txt_mainphonenumber.text=[self.draftsdetail valueForKey:@"mainphnumber"];
  self.txt_site.text=[self.draftsdetail valueForKey:@"site"];
 self.txt_contactemailid.text=[self.draftsdetail valueForKey:@"email"];
    
   self.txt_LOB.text=[self.draftsdetail valueForKey:@"lob"];
    self.txt_ppl.text=[self.draftsdetail valueForKey:@"ppl"];
   self.txt_pl.text=[self.draftsdetail valueForKey:@"pl"];
    self.txt_quantity.text=[self.draftsdetail valueForKey:@"quantity"];
 self.txt_Vehicleapplication.text=[self.draftsdetail valueForKey:@"application"];
   self.txt_customerType.text=[self.draftsdetail valueForKey:@"customertype"];
   self.txt_vcnumber.text=[self.draftsdetail valueForKey:@"vc"];
    self.txt_geography.text=[self.draftsdetail valueForKey:@"mmgeography"];
   self.txt_sourceOfcontact.text=[self.draftsdetail valueForKey:@"sourceofcontact"];
    
   self.txt_bodytype.text=[self.draftsdetail valueForKey:@"bodytype"];
   self.txt_usagecatagory.text=[self.draftsdetail valueForKey:@"usagecategory"];
   self.txt_fleetsize.text=[self.draftsdetail valueForKey:@"totalfleetsize"];
    self.txt_TMLfleetsize.text=[self.draftsdetail valueForKey:@"tmlfleetsize"];
     self.txt_contactpannumber.text=[self.draftsdetail valueForKey:@"contactpan"];
  // self.txt_contactemailid.text=[self.draftsdetail valueForKey:@"contactmail"];
   self.txt_financier.text=[self.draftsdetail valueForKey:@"financier"];
    self.txt_campaign.text=[self.draftsdetail valueForKey:@"campaign"];
    
    
    self.txt_accountarea.text=[self.draftsdetail valueForKey:@"accarea"];
    self.txt_accountstate.text=[self.draftsdetail valueForKey:@"accstate"];
   self.txt_accountdistrict.text=[self.draftsdetail valueForKey:@"accdistrict"];
   self.txt_accountcity.text=[self.draftsdetail valueForKey:@"acccity"];
     self.txt_accounttaluka.text=[self.draftsdetail valueForKey:@"acctaluka"];
    self.txt_accountpanchayat.text=[self.draftsdetail valueForKey:@"accpanchayat"];
    self.txt_accountpincode.text=[self.draftsdetail valueForKey:@"accpincode"];
    self.txt_accountaddressline1.text=[self.draftsdetail valueForKey:@"accaddress1"];
    self.txt_accountaddressline2.text=[self.draftsdetail valueForKey:@"accaddress2"];
    
    self.txt_contactarea.text=[self.draftsdetail valueForKey:@"contarea"];
    self.txt_contactstate.text=[self.draftsdetail valueForKey:@"contstate"];
    self.txt_contactdistrict.text=[self.draftsdetail valueForKey:@"contdistrict"];
   self.txt_contactcity.text=[self.draftsdetail valueForKey:@"contcity"];
    self.txt_contacttaluka.text=[self.draftsdetail valueForKey:@"conttaluka"];
   self.txt_contactpanchayat.text=[self.draftsdetail valueForKey:@"contpanchayat"];
    self.txt_contactpincode.text=[self.draftsdetail valueForKey:@"contactpincode"];
   self.txt_contactAddressline1.text=[self.draftsdetail valueForKey:@"contactaddress1"];
    self.txt_addressline2.text=[self.draftsdetail valueForKey:@"conatctaddress2"];

    
    
    self.drafts =[[NSArray alloc] init];
    self.DRAFTSVIEW1.userInteractionEnabled=NO;
     self.DRATSVIEW2.userInteractionEnabled=NO;
    
    
    
   /* NSError *error;
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"DSE"
     inManagedObjectContext:appdelegate.managedObjectContext];
     [fetchRequest setEntity:entity];
     
     self.drafts = [appdelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
     
     for (DSE *info in self.drafts)
     {
         //self.txt_firstname.text=info.firstname;
     NSLog(@"firstname: %@", info.firstname);
     NSLog(@"lastname: %@", info.lastname);
     NSLog(@"cellnumber: %@", info.cellnumber);
     NSLog(@"email: %@", info.email);
     
     NSLog(@"area: %@", info.area);
     NSLog(@"state: %@", info.state);
     NSLog(@"district: %@", info.district);
     NSLog(@"city: %@", info.city);
     NSLog(@"taluka: %@", info.taluka);
     NSLog(@"pincode: %@", info.pincode);
     NSLog(@"panchayat: %@", info.panchayat);
     NSLog(@"accountname: %@", info.accountname);
     
     NSLog(@"lob: %@", info.lob);
     NSLog(@"ppl: %@", info.ppl);
     NSLog(@"pl: %@", info.pl);
     NSLog(@"application: %@", info.application);
     NSLog(@"sourceofcontact: %@", info.sourceofcontact);
     NSLog(@"financier: %@", info.financier);
     
     NSLog(@"sourceofcontact: %@", info.contactcity);
     NSLog(@"financier: %@", info.contactadress1);
     
     
     
     }
     
     //  NSError *error;
     NSFetchRequest *fetchRequest1 = [[NSFetchRequest alloc] init];
     
     NSEntityDescription *entity1 = [NSEntityDescription entityForName:@"DSM"
     inManagedObjectContext:appdelegate.managedObjectContext];
     [fetchRequest1 setEntity:entity1];
     
     self.drafts1 = [appdelegate.managedObjectContext executeFetchRequest:fetchRequest1 error:&error];
     
     for (DSM *info in self.drafts1)
     {
     NSLog(@"firstname: %@", info.firstname);
     NSLog(@"lastname: %@", info.lastname);
     NSLog(@"cellnumber: %@", info.cellnumber);
     NSLog(@"email: %@", info.email);
     
     NSLog(@"area: %@", info.area);
     NSLog(@"state: %@", info.state);
     NSLog(@"district: %@", info.district);
     NSLog(@"city: %@", info.city);
     NSLog(@"taluka: %@", info.taluka);
     NSLog(@"pincode: %@", info.pincode);
     NSLog(@"panchayat: %@", info.panchayat);
     NSLog(@"accountname: %@", info.accountname);
     
     NSLog(@"lob: %@", info.lob);
     NSLog(@"ppl: %@", info.ppl);
     NSLog(@"pl: %@", info.pl);
     NSLog(@"application: %@", info.application);
     NSLog(@"sourceofcontact: %@", info.sourceofcontact);
     NSLog(@"financier: %@", info.financier);
     
     NSLog(@"sourceofcontact: %@", info.contactcity);
     NSLog(@"financier: %@", info.contactadress1);
     
     
     
     }
    */
    
    
    
    
    
    pickerData = [[NSMutableArray alloc] initWithObjects:@"SELF", @"Showroom Walk-in", @"Event", @"Referral", @"Others", nil];
    
    QuantityData = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5",@"6", @"7", @"8", @"9", @"10", nil];
    
    TMLfleetSize = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5",@"6", @"7", @"8", @"9", @"10", nil];
    
    Fleetsize = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5",@"6", @"7", @"8", @"9", @"10", nil];
    
    
    _txt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    self.txt_geography.layer.borderWidth = 1.0f;
    
    _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _txt_bodytype.layer.borderWidth = 1.0f;
    
    _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _txt_TMLfleetsize.layer.borderWidth = 1.0f;
    
    _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _txt_fleetsize.layer.borderWidth = 1.0f;
    
    _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
    _txt_usagecatagory.layer.borderWidth = 1.0f;
    
    
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
    
    
    
    [self statelist];
    
    [self getLOB];
    
    [self MMgeography];
    [self financierList];
    
    
    
    
    
    shostates = [[NSMutableArray alloc] initWithObjects:@"Andaman & Nicobar", @"Andhra Pradesh", @"Arunachal Pradesh", @"Assam", @"Bihar", @"Chattishgarh", @"Chennai", @"Daman & Diu", @"Delhi", @"Dadra, Nagarhaveli", @"Goa", @"Gujarat", @"Himachal Pradesh", @"Haryana", @"Jharkhand", @"Jammu & Kashmir", @"Karnataka", @"Kerala", @"Lakshwadeep", @"Maharashtra", @"Meghalaya", @"Manipur", @"Madhya Pradesh", @"Mizoram", @"Nagaland", @"Orrisa", @"Punjab", @"Pondicherry", @"Rajasthan", @"Sikkim", @"Telangana", @"Tamil Nadu", @"Tripura", @"Uttarkhand", @"Uttar Pradesh", @"West Bengal", nil];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LobListFound:) name:@"LobListFound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Activity_PPL_Found:) name:@"Activity_PPL_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Createoptyfornewcontact_found:) name:@"Createoptyfornewcontact_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Allstates_Found:) name:@"Allstates_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllDistrict_Found:) name:@"Alldistricts_Found" object:nil];
    
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
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newopty_found:) name:@"newopty_found" object:nil];

    
    //GetCampainDetailsForDSMdata_found
    
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CreateoptyforexistingContactData_Found:) name:@"CreateoptyforexistingContactData_Found" object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ContactSelection_found:) name:@"showAlert" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactqueryfound:) name:@"contactqueryfound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(prospectupdatefound:) name:@"prospectupdatefound" object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PincodeConnectioninCreateOptyVCFound:) name:@"PincodeConnectioninCreateOptyVCFound" object:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LobListFound" object:nil]; //Gomzy //
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Activity_PPL_Found" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Createoptyfornewcontact_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Allstates_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Alldistricts_Found" object:nil];
    
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
    
      [[NSNotificationCenter defaultCenter] removeObserver:self name:@"newopty_found" object:nil];
    
    
    
    
}

- (IBAction)EditBtnClicked:(id)sender {
    self.editBtn.alpha = 0.4;
    self.editBtn.userInteractionEnabled=NO;
    
    self.DRATSVIEW2.userInteractionEnabled=YES;
    self.DRAFTSVIEW1.userInteractionEnabled=YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField

{
    if(textField== _txt_accountstate)
    {
        NSLog(@"%@",appdelegate.statARR);
        NSLog(@"%@",textField.text);
        if (![appdelegate.statARR containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for state" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
    }
    else if(textField== _txt_accountdistrict)
    {
        NSLog(@"%@",appdelegate.districtArray);
        NSLog(@"%@",textField.text);
        if (![appdelegate.districtArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for district" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
        
        
    }
    if(textField== _txt_accountcity)
    {
        NSLog(@"%@",appdelegate.CitiesArray);
        if (![appdelegate.CitiesArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for city" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
    }
    else if(textField== _txt_accounttaluka)
    {
        NSLog(@"%@",appdelegate.TalukaArray);
        NSLog(@"%@",textField.text);
        if (![appdelegate.TalukaArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for taluka" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
        
    }
    if(textField== _txt_contactstate)
    {
        NSLog(@"%@",appdelegate.statARR);
        NSLog(@"%@",textField.text);
        if (![appdelegate.statARR containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for state" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
        
    }
    else if(textField== _txt_contactdistrict)
    {
        NSLog(@"%@",appdelegate.districtArray);
        NSLog(@"%@",textField.text);
        if (![appdelegate.districtArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for district" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
        
    }
    if(textField== _txt_contactcity)
    {
        NSLog(@"%@",appdelegate.CitiesArray);
        if (![appdelegate.CitiesArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for city" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
    }
    else if(textField== _txt_contacttaluka)
    {
        NSLog(@"%@",appdelegate.TalukaArray);
        NSLog(@"%@",textField.text);
        if (![appdelegate.TalukaArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for taluka" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
        
    }
    else if(textField== _txt_geography)
    {
        NSLog(@"%@",appdelegate.geoArray);
        NSLog(@"%@",textField.text);
        if (![appdelegate.geoArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for mmgeography" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
        
    }
    else if(textField== _txt_financier)
    {
        NSLog(@"%@",appdelegate.FinanceArray);
        NSLog(@"%@",textField.text);
        if (![appdelegate.FinanceArray containsObject:textField.text] && [textField.text length]>0)
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please select correct value for financier" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
        else
        {
            NSLog(@"ARRAY CONTAINS THE TEXT ");
            
        }
        
    }
    
}


-(void)getLOB{
    
    
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
                NSString *str_NAME = [TBXML textForElement:NAME];
                NSLog(@"\n str_NSE : %@", str_NAME);
                
                
                
                
                
                [GetLOB_Arr addObject:str_NAME];
                
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@"Sales Stages : %@", GetLOB_Arr);
            
            if ((GetLOB_Arr.count) > 0) {
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




- (IBAction)btnaction_LOB:(id)sender {
    
    
    
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    // ObjC Fast Enumeration
    for (NSString* title in GetLOB_Arr) {
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

- (IBAction)btnaction_PPL:(id)sender {
    
    
    
    [self showAlert];
    // self.btn_PL.userInteractionEnabled = YES;
    if ([_txt_LOB.text isEqual:@""]) {
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
                                  _txt_LOB.text];
        
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
        GetPPL_Arr=[[NSMutableArray alloc]init];
        
        
        
        if (GetPPL_Arr) {
            [GetPPL_Arr removeAllObjects];
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
                [GetPPL_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetPPL_Arr);
            
            if ((GetPPL_Arr.count) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:nil
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [GetPPL_Arr count]; i++) {
                    [actionSheet addButtonWithTitle:[GetPPL_Arr objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[self.txt_ppl frame] inView:self.DETAILS1 animated:YES];
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






- (IBAction)btnaction_pl:(id)sender {
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    else {
        
        [self showAlert];
        if ([_txt_LOB.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select LOB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([self.txt_ppl.text isEqual:@""]) {
            
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
                                      _txt_ppl.text, _txt_LOB.text];
            
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
    
    GetPL_Arr=[[NSMutableArray alloc]init];
    
    
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
        
        if (GetPL_Arr) {
            [GetPL_Arr removeAllObjects];
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
                
                
                [GetPL_Arr addObject:PPL];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetPL_Arr);
            
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        if ((GetPL_Arr.count) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [GetPL_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[GetPL_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.txt_pl frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 3;
            
            
        }
    }
}



- (IBAction)btnaction_sourceofcontact:(id)sender {
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_pl.text isEqualToString:@""]) {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select pl value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
            
            // [self call_PL_ProductLine];
            
            if ((pickerData) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:@" "
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [pickerData count]; i++) {
                    [actionSheet addButtonWithTitle:[pickerData objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[_txt_sourceOfcontact frame] inView:self.DETAILS1 animated:YES];
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



- (void)call_PL_ProductLine
{
    
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
                              _txt_pl.text];
    
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
    NSLog(@"\nResponse....%@", response);
    
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
    else {
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement* container = [TBXML childElementNamed:@"GetProductfromPLDSMResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        
        TBXMLElement* old = [TBXML childElementNamed:@"old" parentElement:tuple];
        
        TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"S_PROD_LN" parentElement:old];
        //TBXMLElement *PersonalAddress = [TBXML childElementNamed:@"PersonalAddress" parentElement:ListOfPersonalAddress];
        TBXMLElement* PRODUCT = [TBXML childElementNamed:@"PRODUCT" parentElement:S_PROD_LN];
        TBXMLElement* PRODUCT_ID = [TBXML childElementNamed:@"PRODUCT_ID" parentElement:S_PROD_LN];
        
        Product_IDstring = [TBXML textForElement:PRODUCT];
        
        Product_IDstring = [TBXML textForElement:PRODUCT_ID];
        
        
    }
}



- (IBAction)btnaction_qty:(id)sender {
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_pl.text isEqualToString:@""]) {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select pl value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
            
            
            
            if ((QuantityData) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:@" "
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [QuantityData count]; i++) {
                    [actionSheet addButtonWithTitle:[QuantityData objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[_txt_quantity frame] inView:self.DETAILS1 animated:YES];
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


- (IBAction)btnaction_application:(id)sender {
    
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else {
        
        [self showAlert];
        if ([_txt_LOB.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Select LOB field ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        else if ([_txt_ppl.text isEqual:@""]) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Select PPL field ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        else if ([_txt_pl.text isEqual:@""]) {
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
                                      _txt_LOB.text];
            
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
    
    
    GetAppType_Arr=[[NSMutableArray alloc]init];
    
    
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Select LOB First ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
    }
    else {
        
        if (GetAppType_Arr) {
            [GetAppType_Arr removeAllObjects];
            
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
                [GetAppType_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetAppType_Arr);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        if ((GetAppType_Arr) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [GetAppType_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[GetAppType_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.txt_Vehicleapplication frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 6;
            
        }
    }
}



- (IBAction)btnaction_customertype:(id)sender {
    
   
    if ([_txt_LOB.text isEqual:@""]) {
        
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
                                   @"</SOAP:Envelope>",_txt_LOB.text];
        
        
        
        
        
        
        
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

//customertype_found


-(void)customertype_found:(NSNotification*)notification
{
    
    
    getcustomertypearr = [[NSMutableArray alloc] init];
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Reason Lost %@ ", response);
    
    if ([response isEqual:@""]) {
        if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]) {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else {
        if (getcustomertypearr) {
            [getcustomertypearr removeAllObjects];
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
                
                
                
                
                
                [getcustomertypearr addObject:str_NAME];
                
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@"source of contact %@", getcustomertypearr);
            
            if ((getcustomertypearr.count) > 0) {
                NSLog(@"In..");
                [self hideAlert];
                
                actionSheet = [[UIActionSheet alloc]
                               initWithTitle:nil
                               delegate:self
                               cancelButtonTitle:nil
                               destructiveButtonTitle:nil
                               otherButtonTitles:nil];
                
                for (int i = 0; i < [getcustomertypearr count]; i++) {
                    [actionSheet addButtonWithTitle:[getcustomertypearr objectAtIndex:i]];
                }
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [actionSheet showFromRect:[_txt_customerType frame] inView:self.DETAILS1 animated:YES];
                }
                else {
                    [actionSheet showInView:self.view];
                }
                actionSheet.tag = 19;
            }
            
        }
        else {
            if ([userDetailsVal_.POSITION_TYPE isEqual:@"NDRM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert setTag:0];
                [alert show];
            }
            else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSE"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSE" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert setTag:0];
                
                [alert show];
            }
            else if ([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]) {
                alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                
                [alert setTag:0];
                
                
                
                [alert show];
            }
        }
        
    }
    
    
}

- (IBAction)btnaction_VCnumber:(id)sender {
    
    
    if (![self connected])
    {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert setTag:0];
        [alert show];
    }
    else {
        
        [self showAlert];
        if ([_txt_pl.text isEqual:@""]) {
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
                                      @"</SOAP:Envelope>",_txt_pl.text];
            
            
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
    
    
    GetVCnumberArray=[[NSMutableArray alloc]init];
    
    
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        
    }
    else {
        
        if (GetVCnumberArray) {
            [GetVCnumberArray removeAllObjects];
            
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
                [GetVCnumberArray addObject:VCnumber];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetVCnumberArray);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        if ((GetVCnumberArray) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [GetVCnumberArray count]; i++) {
                [actionSheet addButtonWithTitle:[GetVCnumberArray objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.txt_vcnumber frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 13;
            
            
        }
    }
    
    
    
}

-(void)MMgeography{
    
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
            NSLog(@"micro market array %@", Micromarket_Arr);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        
    }
    appdelegate.geoArray=Micromarket_Arr;
}

- (IBAction)btnaction_geography:(id)sender {
    
    
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
            [actionSheet showFromRect:[self.txt_geography frame] inView:self.DETAILS1 animated:YES];
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

- (IBAction)btnactaction_bodytype:(id)sender {
    
    if ([_txt_Vehicleapplication.text isEqual:@""]) {
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
                                  _txt_Vehicleapplication.text];
        
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
    
    Getbodytype_Arr=[[NSMutableArray alloc]init];
    
    
    
    //NSString *response=[[notification userInfo]objectForKey:@"response"];
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        //[appdelegate hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        [self hideAlert];
    }
    else {
        
        if (Getbodytype_Arr) {
            [Getbodytype_Arr removeAllObjects];
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
                [Getbodytype_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@"body type array %@", Getbodytype_Arr);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        if ((Getbodytype_Arr) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [Getbodytype_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[Getbodytype_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[_txt_bodytype frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 8;
        }
    }
}




- (IBAction)btnaction_usagecatagory:(id)sender {
    
    
    
    [self showAlert];
    
    if ([_txt_LOB.text isEqualToString:@""]) {
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
                                  _txt_LOB.text];
        
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
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
    Getusagecatagory_Arr=[[NSMutableArray alloc]init];
    
    //NSString *response=[[notification userInfo]objectForKey:@"response"];
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        //[appdelegate hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
        [self hideAlert];
    }
    else {
        
        if (Getusagecatagory_Arr) {
            [Getusagecatagory_Arr removeAllObjects];
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
                [Getusagecatagory_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@"usage array %@", Getusagecatagory_Arr);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        if ((Getusagecatagory_Arr) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:@" "
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [Getusagecatagory_Arr count]; i++) {
                [actionSheet addButtonWithTitle:[Getusagecatagory_Arr objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.txt_usagecatagory frame] inView:self.DETAILS1 animated:YES];
            }
            else {
                [actionSheet showInView:self.view];
            }
            actionSheet.tag = 9;
        }
    }
}

- (IBAction)btnaction_fleetsize:(id)sender {
    
    
    
    [self hideAlert];
    
    actionSheet = [[UIActionSheet alloc]
                   initWithTitle:@" "
                   delegate:self
                   cancelButtonTitle:nil
                   destructiveButtonTitle:nil
                   otherButtonTitles:nil];
    
    for (int i = 0; i < [Fleetsize count]; i++) {
        [actionSheet addButtonWithTitle:[Fleetsize objectAtIndex:i]];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [actionSheet showFromRect:[_txt_fleetsize frame] inView:self.DETAILS1 animated:YES];
    }
    else {
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 11;
    
    
    
}

- (IBAction)btnaction_TMLfleetsize:(id)sender {
    
    
    NSLog(@"In..");
    [self hideAlert];
    
    actionSheet = [[UIActionSheet alloc]
                   initWithTitle:@" "
                   delegate:self
                   cancelButtonTitle:nil
                   destructiveButtonTitle:nil
                   otherButtonTitles:nil];
    
    for (int i = 0; i < [TMLfleetSize count]; i++) {
        [actionSheet addButtonWithTitle:[TMLfleetSize objectAtIndex:i]];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [actionSheet showFromRect:[_txt_TMLfleetsize frame] inView:self.DETAILS1 animated:YES];
    }
    else {
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 10;
    
    
    
}

-(void)financierList

{
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
        [self hideAlert];
    }
    appdelegate.FinanceArray=Financier_List_PickerArr;
}


- (IBAction)btn_financier:(id)sender {
    
    
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
            [actionSheet showFromRect:[self.txt_financier frame] inView:self.DETAILS2 animated:YES];
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

- (IBAction)btnaction_linkcampaign:(id)sender {
    
    
    [self showAlert];
    
    if ([_txt_pl.text isEqualToString:@""]) {
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
                                   _txt_pl.text];
        
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
        LinkCampaignList = [[NSMutableArray alloc] init];
        
        Linkcampaignname =[[NSMutableArray alloc] init];
        LinkcampaignID =[[NSMutableArray alloc] init];
        
        
        
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
                
                [Linkcampaignname addObject:campaignname];
                [LinkcampaignID addObject:campaignID];
                [LinkCampaignList addObject:campaignDesscription];
                
                
                
            } while ((tuple = tuple->nextSibling));
            
        }
        else {
            
            [self hideAlert];
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Campaign list not found." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            
            
            [alertView show];
            
        }
        
        
        if ((LinkCampaignList) > 0) {
            NSLog(@"In..");
            [self hideAlert];
            
            actionSheet = [[UIActionSheet alloc]
                           initWithTitle:nil
                           delegate:self
                           cancelButtonTitle:nil
                           destructiveButtonTitle:nil
                           otherButtonTitles:nil];
            
            for (int i = 0; i < [Linkcampaignname count]; i++) {
                [actionSheet addButtonWithTitle:[Linkcampaignname objectAtIndex:i]];
            }
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                [actionSheet showFromRect:[self.txt_campaign frame] inView:self.DETAILS2 animated:YES];
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







- (IBAction)btnaction_accountpickgromgps:(id)sender {
    
}

- (IBAction)btnaction_contactpickfromgps:(id)sender {
    
}

- (IBAction)btnaction_sameasaccount:(id)sender {
    
    
}

- (IBAction)btnaction_accountstate:(id)sender {
    
    
    
    if (![self connected]) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else {
        
        NSLog(@"Activity...Data %@", GetAllstates_Arr);
        actionSheet = [[UIActionSheet alloc] initWithTitle:@" "
                                                  delegate:self
                                         cancelButtonTitle:nil
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:nil];
        // ObjC Fast Enumeration
        for (NSString* title in shostates) {
            [actionSheet addButtonWithTitle:title];
        }
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            
            [actionSheet showFromRect:[(UITextField*)sender frame] inView:_DETAILS2 animated:YES];
            actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        }
        else {
            [actionSheet showInView:self.view];
        }
        actionSheet.tag = 15;
    }
    
    
    
    
}

- (IBAction)btnaction_accountdistrict:(id)sender {
    
    if (![self connected]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Internet Connection not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else {
        [self showAlert];
        //  self.btnSelectPL.userInteractionEnabled=YES;
        if (statestring.length == 0) {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:nil message:@" Please select state " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else {
            NSLog(@"staes Selected  ");
            
            NSString* envelopeText = [NSString stringWithFormat:
                                      @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                      @"<SOAP:Body>"
                                      @"<GetAllIndianDistricts xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                      @"<state>%@</state>"
                                      @"</GetAllIndianDistricts>"
                                      @"</SOAP:Body>"
                                      @"</SOAP:Envelope>",
                                      statestring];
            
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
            
            [[RequestDelegate alloc] initiateRequest:request name:@"getAllDistrictConnection"];
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
        
        GetAlldistricts_Arr=[[NSMutableArray alloc]init];
        
        
        if (GetAlldistricts_Arr) {
            [GetAlldistricts_Arr removeAllObjects];
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
                
                [GetAlldistricts_Arr addObject:district];
                
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@"\all districts list......%d", [GetAlldistricts_Arr count]);
            if ((GetAlldistricts_Arr) > 0) {
                NSLog(@"In..");
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
                //
                
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
    appdelegate.districtArray=GetAlldistricts_Arr;
}







- (IBAction)btnaction_accounttaluka:(id)sender {
    
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetAllIndianTaluka xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<state>%@</state>"
                              @"<dist>%@</dist>"
                              @"<city>%@</city>"
                              @"</GetAllIndianTaluka>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",statestring,_txt_accountdistrict.text,_txt_accountcity.text];
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"Alltaluka"];
    
    
    
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
        
        GetAlltaluka_Arr=[[NSMutableArray alloc]init];
        
        if (GetAlltaluka_Arr) {
            [GetAlltaluka_Arr removeAllObjects];
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
                [GetAlltaluka_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetAlltaluka_Arr);
        }
        else {
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not availbale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert setTag:0];
            [alert show];
        }
        
        //        if ((GetAlltaluka_Arr) > 0) {
        //            NSLog(@"In..");
        //            [self hideAlert];
        //
        //            actionSheet = [[UIActionSheet alloc]
        //                           initWithTitle:@" "
        //                           delegate:self
        //                           cancelButtonTitle:nil
        //                           destructiveButtonTitle:nil
        //                           otherButtonTitles:nil];
        //
        //            for (int i = 0; i < [GetAlltaluka_Arr count]; i++) {
        //                [actionSheet addButtonWithTitle:[GetAlltaluka_Arr objectAtIndex:i]];
        //            }
        //            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        //                [actionSheet showFromRect:[_txt_accounttaluka frame] inView:self.DETAILS2 animated:YES];
        //            }
        //            else {
        //                [actionSheet showInView:self.view];
        //            }
        //            actionSheet.tag = 18;
        //
        //            //[appdelegate hideAlert];
        //        }
    }
    appdelegate.TalukaArray=GetAlltaluka_Arr;
}














- (IBAction)btnaction_city:(id)sender {
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetAllIndianCity xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<state>%@</state>"
                              @"<dist>%@</dist>"
                              @"</GetAllIndianCity>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",statestring,_txt_accountdistrict.text];
    
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
    
    [[RequestDelegate alloc] initiateRequest:request name:@"Allcities"];
    
    
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
        
        
        GetAllcities_Arr=[[NSMutableArray alloc]init];
        
        
        if (GetAllcities_Arr) {
            [GetAllcities_Arr removeAllObjects];
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
                [GetAllcities_Arr addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetAllcities_Arr);
        }
        else {
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Data not availbale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        //        if ((GetAllcities_Arr) > 0) {
        //            NSLog(@"In..");
        //            [self hideAlert];
        //
        //            actionSheet = [[UIActionSheet alloc]
        //                           initWithTitle:nil
        //                           delegate:self
        //                           cancelButtonTitle:nil
        //                           destructiveButtonTitle:nil
        //                           otherButtonTitles:nil];
        //
        //            for (int i = 0; i < [GetAllcities_Arr count]; i++) {
        //                [actionSheet addButtonWithTitle:[GetAllcities_Arr objectAtIndex:i]];
        //            }
        //            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        //                [actionSheet showFromRect:[self.txt_accountcity frame] inView:self.DETAILS2 animated:YES];
        //            }
        //            else {
        //                [actionSheet showInView:self.view];
        //            }
        //            actionSheet.tag = 17;
        //
        //            //[appdelegate hideAlert];
        //        }
    }
    appdelegate.CitiesArray=GetAllcities_Arr;
}




- (void)actionSheet:(UIActionSheet*)popup clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSLog(@"button click ....%ld", (long)buttonIndex);
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    
    
       

    if (_txt_LOB) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 1:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.txt_LOB.text = NSLocalizedString([GetLOB_Arr objectAtIndex:buttonIndex], @"");
                    
                    
                    self.txt_ppl.text = @"";
                    self.txt_pl.text = @"";
                    self.txt_Vehicleapplication.text=@"";
                    self.txt_bodytype.text=@"";
                    self.txt_usagecatagory.text=@"";
                    self.txt_quantity.text=@"";
                    self.txt_vcnumber.text=@"";
                    self.txt_geography.text=@"";
                    self.txt_fleetsize.text=@"";
                    self.txt_TMLfleetsize.text=@"";
                    
                    
                    
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
                    
                    
                    if ([_txt_LOB.text isEqualToString:@"Buses"]) {
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                    }
                    else if ([_txt_LOB.text isEqualToString:@"I&MCV Trucks"]) {
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                        
                        
                    }
                    else if ([_txt_LOB.text isEqualToString:@"Pickups"]) {
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                        
                    }
                    
                    else if ([_txt_LOB.text isEqualToString:@"LCV"]) {
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                    }
                    else if ([_txt_LOB.text isEqualToString:@"SCVPass"]) {
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        
                    }
                    
                    
                    else if ([_txt_LOB.text isEqualToString:@"M&HCV Const"]) {
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        _txt_bodytype.layer.borderColor =[UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                    }
                    else if ([_txt_LOB.text isEqualToString:@"SCV Cargo"]) {
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        
                        
                        
                        
                    }
                    
                    //HCV Cargo
                    
                    else if ([_txt_LOB.text isEqualToString:@"HCV Cargo"]) {
                        
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 2.0f;
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.txt_bodytype.layer.borderWidth = 2.0f;
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.txt_TMLfleetsize.layer.borderWidth = 2.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(0 / 255.0)green:(0 / 255.0)blue:(0 / 255.0)alpha:1].CGColor;
                        self.txt_fleetsize.layer.borderWidth = 2.0f;
                        
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                    }
                    else
                        
                    {
                        _txt_geography.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        self.txt_geography.layer.borderWidth = 1.0f;
                        
                        _txt_bodytype.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_bodytype.layer.borderWidth = 1.0f;
                        
                        _txt_TMLfleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_TMLfleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_fleetsize.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_fleetsize.layer.borderWidth = 1.0f;
                        
                        _txt_usagecatagory.layer.borderColor = [UIColor colorWithRed:(102.0 / 255.0)green:(178.0 / 255.0)blue:(255.0 / 255.0)alpha:1].CGColor;
                        _txt_usagecatagory.layer.borderWidth = 1.0f;
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                
                
                
        }
    }
    if (_txt_ppl) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 2:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_ppl.text = NSLocalizedString([GetPPL_Arr objectAtIndex:buttonIndex], @"");
                }
                _txt_pl.text = @"";
                self.txt_Vehicleapplication.text=@"";
                self.txt_bodytype.text=@"";
                self.txt_usagecatagory.text=@"";
                self.txt_quantity.text=@"";
                self.txt_vcnumber.text=@"";
                self.txt_geography.text=@"";
                self.txt_fleetsize.text=@"";
                self.txt_TMLfleetsize.text=@"";
                
        }
    }
    if (_txt_pl) {
        NSLog(@"... in");
        switch (popup.tag) {
                
            case 3:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_pl.text = NSLocalizedString([GetPL_Arr objectAtIndex:buttonIndex], @"");
                    
                    self.txt_Vehicleapplication.text = @"";
                    
                    self.txt_bodytype.text=@"";
                    self.txt_usagecatagory.text=@"";
                    self.txt_quantity.text=@"";
                    self.txt_vcnumber.text=@"";
                    self.txt_geography.text=@"";
                    self.txt_fleetsize.text=@"";
                    self.txt_TMLfleetsize.text=@"";
                    
                }
        }
    }
    if (_txt_sourceOfcontact) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 4:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.txt_sourceOfcontact.text = NSLocalizedString([pickerData objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_txt_quantity) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 5:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.txt_quantity.text = NSLocalizedString([QuantityData objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    if (_txt_Vehicleapplication) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 6:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.txt_Vehicleapplication.text = NSLocalizedString([GetAppType_Arr objectAtIndex:buttonIndex], @"");
                    
                    _txt_bodytype.text=@"";
                    
                }
        }
    }
    
    if (_txt_geography) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 7:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    self.txt_geography.text = NSLocalizedString([Micromarket_Arr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    if (_txt_bodytype) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 8:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_bodytype.text = NSLocalizedString([Getbodytype_Arr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    
    if (_txt_usagecatagory) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 9:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_usagecatagory.text = NSLocalizedString([Getusagecatagory_Arr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_txt_TMLfleetsize) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 10:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_TMLfleetsize.text = NSLocalizedString([TMLfleetSize objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_txt_TMLfleetsize) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 11:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_fleetsize.text = NSLocalizedString([Fleetsize objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_txt_financier) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 12:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_financier.text = NSLocalizedString([Financier_List_PickerArr objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    
    if (_txt_vcnumber) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 13:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_vcnumber.text = NSLocalizedString([GetVCnumberArray objectAtIndex:buttonIndex], @"");
                    
                }
        }
    }
    if (_txt_campaign) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 14:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    _txt_campaign.text = NSLocalizedString([Linkcampaignname objectAtIndex:buttonIndex], @"");
                    CampaignID= NSLocalizedString([LinkcampaignID objectAtIndex:buttonIndex], @"");
                    NSLog(@"campaign ID %@",CampaignID);
                    
                    
                    
                }
        }
    }
    if (_txt_accountstate) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 15:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    statestring = [GetAllstates_Arr objectAtIndex:buttonIndex];
                    str = [GetAllstates_Arr objectAtIndex:buttonIndex];
                    NSLog(@"Sates : %@", statestring);
                    self.txt_accountstate.text = NSLocalizedString([shostates objectAtIndex:buttonIndex], @"");
                    self.txt_accountdistrict.text = @"";
                    self.txt_accountcity.text = @"";
                    self.txt_accounttaluka.text = @"";
                    //self.textpostalcode.text=@"";
                    
                    NSLog(@"state code %@", statestring);
                }
        }
    }
    
    if (_txt_accountdistrict) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 16:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
                    NSLog(@"Sates : %@", statestring);
                    _txt_accountdistrict.text = NSLocalizedString([GetAlldistricts_Arr objectAtIndex:buttonIndex], @"");
                    self.txt_accountcity.text = @"";
                    self.txt_accounttaluka.text = @"";
                    //self.textpostalcode.text=@"";
                    
                    NSLog(@"state code %@", statestring);
                }
        }
    }
    if (_txt_accountcity) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 17:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
                    NSLog(@"Sates : %@", statestring);
                    _txt_accountcity.text = NSLocalizedString([GetAllcities_Arr objectAtIndex:buttonIndex], @"");
                    
                    self.txt_accounttaluka.text = @"";
                    //self.textpostalcode.text=@"";
                    
                    NSLog(@"state code %@", statestring);
                }
        }
    }
    if (_txt_accounttaluka) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 18:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    //   statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
                    
                    
                    _txt_accounttaluka.text = NSLocalizedString([GetAlltaluka_Arr objectAtIndex:buttonIndex], @"");
                    
                    
                    //self.textpostalcode.text=@"";
                    
                    
                }
        }
    }
    
    
    
    
    if (_txt_customerType) {
        NSLog(@"... in");
        switch (popup.tag) {
            case 19:
                if (buttonIndex == actionSheet.cancelButtonIndex) {
                    NSLog(@"ek..");
                    return;
                }
                else {
                    NSLog(@"Button index %ld", (long)buttonIndex);
                    // statestring = [GetAlldistricts_Arr objectAtIndex:buttonIndex];
                    
                    
                    _txt_customerType.text = NSLocalizedString([getcustomertypearr objectAtIndex:buttonIndex], @"");
                    [self.account_pickfromgps setOn:NO animated:YES];
                    [self.contact_pickfromgpps setOn:NO animated:YES];
                    
                    
                    
                }
        }
    }
    
    
    
    
    
    
}









- (void)statelist
{
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
        
        
        GetAllstates_Arr=[[NSMutableArray alloc]init];
        
        
        
        
        if (GetAllstates_Arr) {
            [GetAllstates_Arr removeAllObjects];
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
                
                [GetAllstates_Arr addObject:state];
                
                
            } while ((tuple = tuple->nextSibling));
            
            NSLog(@"\nOpportunityListDisplayArr......%d", [GetAllstates_Arr count]);
            if (GetAllstates_Arr >= 0) {
                
                NSLog(@"all states%@", GetAllstates_Arr);
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
    appdelegate.StateArray=GetAllstates_Arr;
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



#pragma mark - MLPAutoCompleteTextField Delegate


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
    if(textField ==self.txt_geography)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = TRUE;
    }
    else if (textField==self.txt_financier)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = TRUE;
        
    }
    
    else if (textField==self.txt_accountstate)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=YES;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.txt_accountdistrict)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=YES;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.txt_accountcity)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=YES;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.txt_accounttaluka)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=YES;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    
    else if (textField==self.txt_contactstate)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=YES;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.txt_contactdistrict)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=YES;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.txt_contactcity)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=YES;
        self.txt_contacttaluka.userInteractionEnabled=NO;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    else if (textField==self.txt_contacttaluka)
    {
        self.txt_mobilenumber.userInteractionEnabled=NO;
        self.txt_mainphonenumber.userInteractionEnabled=NO;
        self.txt_firstname.userInteractionEnabled=NO;
        self.txt_lastname.userInteractionEnabled=NO;
        self.txt_accountName.userInteractionEnabled=NO;
        self.txt_site.userInteractionEnabled=NO;
        self.txt_financier.userInteractionEnabled=NO;
        self.txt_LOB.userInteractionEnabled=NO;
        self.txt_ppl.userInteractionEnabled=NO;
        self.txt_pl.userInteractionEnabled=NO;
        self.txt_quantity.userInteractionEnabled=NO;
        self.txt_Vehicleapplication.userInteractionEnabled=NO;
        self.txt_customerType.userInteractionEnabled=NO;
        self.txt_sourceOfcontact.userInteractionEnabled=NO;
        self.txt_vcnumber.userInteractionEnabled=NO;
        self.txt_bodytype.userInteractionEnabled=NO;
        self.txt_usagecatagory.userInteractionEnabled=NO;
        self.txt_TMLfleetsize.userInteractionEnabled=NO;
        self.txt_fleetsize.userInteractionEnabled=NO;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=NO;
        self.txt_contactemailid.userInteractionEnabled=NO;
        self.txt_campaign.userInteractionEnabled=NO;
        self.txt_contactstate.userInteractionEnabled=NO;
        self.txt_contactdistrict.userInteractionEnabled=NO;
        self.txt_contactcity.userInteractionEnabled=NO;
        self.txt_contacttaluka.userInteractionEnabled=YES;
        self.txt_contactarea.userInteractionEnabled=NO;
        self.txt_contactpanchayat.userInteractionEnabled=NO;
        self.txt_contactpincode.userInteractionEnabled=NO;
        
        self.txt_contactAddressline1.userInteractionEnabled=NO;
        self.txt_addressline2.userInteractionEnabled=NO;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=NO;
        self.txt_accounttaluka.userInteractionEnabled=NO;
        self.txt_accountcity.userInteractionEnabled=NO;
        self.txt_accountdistrict.userInteractionEnabled=NO;
        self.txt_accountarea.userInteractionEnabled=NO;
        self.txt_accountpanchayat.userInteractionEnabled=NO;
        self.txt_accountpincode.userInteractionEnabled=NO;
        self.txt_accountaddressline1.userInteractionEnabled=NO;
        self.txt_accountaddressline2.userInteractionEnabled=NO;
        
        
        
        self.txt_geography.userInteractionEnabled = false;
        
        self.txt_financier.userInteractionEnabled = false;
        
    }
    
    
    NSRange backspaceEndRange = NSMakeRange(0, 1);
    
    
    if (NSEqualRanges(range, backspaceEndRange)){
        NSLog(@"finished writing");
        self.txt_mobilenumber.userInteractionEnabled=YES;
        self.txt_mainphonenumber.userInteractionEnabled=YES;
        self.txt_firstname.userInteractionEnabled=YES;
        self.txt_lastname.userInteractionEnabled=YES;
        self.txt_accountName.userInteractionEnabled=YES;
        self.txt_site.userInteractionEnabled=YES;
        self.txt_financier.userInteractionEnabled=YES;
        self.txt_LOB.userInteractionEnabled=YES;
        self.txt_ppl.userInteractionEnabled=YES;
        self.txt_pl.userInteractionEnabled=YES;
        self.txt_quantity.userInteractionEnabled=YES;
        self.txt_Vehicleapplication.userInteractionEnabled=YES;
        self.txt_customerType.userInteractionEnabled=YES;
        self.txt_sourceOfcontact.userInteractionEnabled=YES;
        self.txt_vcnumber.userInteractionEnabled=YES;
        self.txt_bodytype.userInteractionEnabled=YES;
        self.txt_usagecatagory.userInteractionEnabled=YES;
        self.txt_TMLfleetsize.userInteractionEnabled=YES;
        self.txt_fleetsize.userInteractionEnabled=YES;
        
        
        //contact
        self.txt_contactpannumber.userInteractionEnabled=YES;
        self.txt_contactemailid.userInteractionEnabled=YES;
        self.txt_campaign.userInteractionEnabled=YES;
        self.txt_contactstate.userInteractionEnabled=YES;
        self.txt_contactdistrict.userInteractionEnabled=YES;
        self.txt_contactcity.userInteractionEnabled=YES;
        self.txt_contacttaluka.userInteractionEnabled=YES;
        self.txt_contactarea.userInteractionEnabled=YES;
        self.txt_contactpanchayat.userInteractionEnabled=YES;
        self.txt_contactpincode.userInteractionEnabled=YES;
        
        self.txt_contactAddressline1.userInteractionEnabled=YES;
        self.txt_addressline2.userInteractionEnabled=YES;
        
        
        //account
        self.txt_accountstate.userInteractionEnabled=YES;
        self.txt_accounttaluka.userInteractionEnabled=YES;
        self.txt_accountcity.userInteractionEnabled=YES;
        self.txt_accountdistrict.userInteractionEnabled=YES;
        self.txt_accountarea.userInteractionEnabled=YES;
        self.txt_accountpanchayat.userInteractionEnabled=YES;
        self.txt_accountpincode.userInteractionEnabled=YES;
        self.txt_accountaddressline1.userInteractionEnabled=YES;
        self.txt_accountaddressline2.userInteractionEnabled=YES;
        
        self.txt_geography.userInteractionEnabled = TRUE;
        
    }
    return YES;
}



- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
  didSelectAutoCompleteString:(NSString *)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.txt_mobilenumber.userInteractionEnabled=YES;
    self.txt_mainphonenumber.userInteractionEnabled=YES;
    self.txt_firstname.userInteractionEnabled=YES;
    self.txt_lastname.userInteractionEnabled=YES;
    self.txt_accountName.userInteractionEnabled=YES;
    self.txt_site.userInteractionEnabled=YES;
    self.txt_financier.userInteractionEnabled=YES;
    self.txt_LOB.userInteractionEnabled=YES;
    self.txt_ppl.userInteractionEnabled=YES;
    self.txt_pl.userInteractionEnabled=YES;
    self.txt_quantity.userInteractionEnabled=YES;
    self.txt_Vehicleapplication.userInteractionEnabled=YES;
    self.txt_customerType.userInteractionEnabled=YES;
    self.txt_sourceOfcontact.userInteractionEnabled=YES;
    self.txt_vcnumber.userInteractionEnabled=YES;
    self.txt_bodytype.userInteractionEnabled=YES;
    self.txt_usagecatagory.userInteractionEnabled=YES;
    self.txt_TMLfleetsize.userInteractionEnabled=YES;
    self.txt_fleetsize.userInteractionEnabled=YES;
    
    
    //contact
    self.txt_contactpannumber.userInteractionEnabled=YES;
    self.txt_contactemailid.userInteractionEnabled=YES;
    self.txt_campaign.userInteractionEnabled=YES;
    self.txt_contactstate.userInteractionEnabled=YES;
    self.txt_contactdistrict.userInteractionEnabled=YES;
    self.txt_contactcity.userInteractionEnabled=YES;
    self.txt_contacttaluka.userInteractionEnabled=YES;
    self.txt_contactarea.userInteractionEnabled=YES;
    self.txt_contactpanchayat.userInteractionEnabled=YES;
    self.txt_contactpincode.userInteractionEnabled=YES;
    
    self.txt_contactAddressline1.userInteractionEnabled=YES;
    self.txt_addressline2.userInteractionEnabled=YES;
    
    
    //account
    self.txt_accountstate.userInteractionEnabled=YES;
    self.txt_accounttaluka.userInteractionEnabled=YES;
    self.txt_accountcity.userInteractionEnabled=YES;
    self.txt_accountdistrict.userInteractionEnabled=YES;
    self.txt_accountarea.userInteractionEnabled=YES;
    self.txt_accountpanchayat.userInteractionEnabled=YES;
    self.txt_accountpincode.userInteractionEnabled=YES;
    self.txt_accountaddressline1.userInteractionEnabled=YES;
    self.txt_accountaddressline2.userInteractionEnabled=YES;
    
    self.txt_geography.userInteractionEnabled = TRUE;
    
    //self.view.userInteractionEnabled=YES;
    if(selectedObject)
    {
        NSLog(@"selected object from autocomplete menu %@ with string %@", selectedObject, [selectedObject autocompleteString]);
    }
    else
    {
        if (textField.tag==1) {
            
            
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
            [[RequestDelegate alloc]initiateRequest:request name:@"AllDistricts"];
            
        }
        
        
        else if (textField.tag ==2)
        {
            
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
            [[RequestDelegate alloc]initiateRequest:request name:@"AllDistricts"];
            
        }
        
        
        else if (textField.tag ==6)
        {
            
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
        
        
        
        // NSLog(@"selected string '%@' from autocomplete menu", [self.dict valueForKey:@"MH"]);
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
        [self.DETAILS2 setHidden:NO];
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



@end
