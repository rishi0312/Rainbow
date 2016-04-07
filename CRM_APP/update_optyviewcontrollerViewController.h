//
//  update_optyviewcontrollerViewController.h
//  CRM_APP
//
//  Created by Admin on 11/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "UserDetails_Var.h"
#import "MLPAutoCompleteTextField.h"

@interface update_optyviewcontrollerViewController : UIViewController
{
    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
    
}

@property (weak, nonatomic) IBOutlet UIView *texttitle1;

@property (weak, nonatomic) IBOutlet UIView *texttitle2;

- (IBAction)button1:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *button1;


- (IBAction)button2:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UIView *DETAILS1;

@property (weak, nonatomic) IBOutlet UIView *DETAILS2;

- (IBAction)btn_createnewopty:(id)sender;

- (IBAction)btn_existingcontactopty:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *Btn_createnewopty;

@property (weak, nonatomic) IBOutlet UIButton *Btn_createExistingopty;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollvieoutlet;



//Opportunity mandatory fields


@property (weak, nonatomic) IBOutlet UITextField *utxt_firstname;

@property (weak, nonatomic) IBOutlet UITextField *utxt_lastname;
@property (weak, nonatomic) IBOutlet UITextField *utxt_mobilenumber;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountName;
@property (weak, nonatomic) IBOutlet UITextField *utxt_site;
@property (weak, nonatomic) IBOutlet UITextField *utxt_mainphonenumber;
@property (weak, nonatomic) IBOutlet UITextField *utxt_LOB;
@property (weak, nonatomic) IBOutlet UITextField *utxt_ppl;
@property (weak, nonatomic) IBOutlet UITextField *utxt_pl;
@property (weak, nonatomic) IBOutlet UITextField *utxt_quantity;
@property (weak, nonatomic) IBOutlet UITextField *utxt_Vehicleapplication;
@property (weak, nonatomic) IBOutlet UITextField *utxt_sourceOfcontact;
@property (weak, nonatomic) IBOutlet UITextField *utxt_customerType;
@property (weak, nonatomic) IBOutlet UITextField *utxt_vcnumber;

@property (weak, nonatomic) IBOutlet UITextField *utxt_geography;
@property (weak, nonatomic) IBOutlet UITextField *utxt_bodytype;

@property (weak, nonatomic) IBOutlet UITextField *utxt_usagecatagory;
@property (weak, nonatomic) IBOutlet UITextField *utxt_fleetsize;
@property (weak, nonatomic) IBOutlet UITextField *utxt_TMLfleetsize;

@property (weak, nonatomic) IBOutlet UITextField *utxt_contactpannumber;

@property (weak, nonatomic) IBOutlet UITextField *txt_contactemailid;




@property (weak, nonatomic) IBOutlet UITextField *utxt_financier;
@property (weak, nonatomic) IBOutlet UITextField *utxt_campaign;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountstate;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountdistrict;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountcity;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accounttaluka;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountarea;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountpanchayat;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountpincode;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountaddressline1;
@property (weak, nonatomic) IBOutlet UITextField *utxt_accountaddressline2;

@property (weak, nonatomic) IBOutlet UITextField *utxt_contactstate;

@property (weak, nonatomic) IBOutlet UITextField *utxt_contactdistrict;
@property (weak, nonatomic) IBOutlet UITextField *utxt_contactcity;
@property (weak, nonatomic) IBOutlet UITextField *utxt_contacttaluka;
@property (weak, nonatomic) IBOutlet UITextField *utxt_contactarea;
@property (weak, nonatomic) IBOutlet UITextField *utxt_contactpanchayat;
@property (weak, nonatomic) IBOutlet UITextField *utxt_contactpincode;

@property (weak, nonatomic) IBOutlet UITextField *utxt_contactAddressline1;

@property (weak, nonatomic) IBOutlet UITextField *utxt_addressline2;



- (IBAction)ubtnaction_LOB:(id)sender;
- (IBAction)ubtnaction_PPL:(id)sender;
- (IBAction)ubtnaction_pl:(id)sender;
- (IBAction)ubtnaction_qty:(id)sender;
- (IBAction)ubtnaction_application:(id)sender;
- (IBAction)ubtnaction_customertype:(id)sender;
- (IBAction)ubtnaction_sourceofcontact:(id)sender;
- (IBAction)ubtnaction_VCnumber:(id)sender;
- (IBAction)ubtnaction_geography:(id)sender;
- (IBAction)ubtnactaction_bodytype:(id)sender;
- (IBAction)ubtnaction_usagecatagory:(id)sender;
- (IBAction)ubtnaction_fleetsize:(id)sender;
- (IBAction)ubtnaction_TMLfleetsize:(id)sender;
- (IBAction)ubtn_financier:(id)sender;
- (IBAction)ubtnaction_linkcampaign:(id)sender;

@property (strong, nonatomic) IBOutlet NSMutableDictionary *dict;


@property (weak, nonatomic) IBOutlet UISwitch *account_gpsoutlet;

- (IBAction)account_gpsaction:(id)sender;

- (IBAction)contact_gpsaction:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *contact_gpsoutlet;

@property (weak, nonatomic) IBOutlet UISwitch *sameasaccount_outlet;

- (IBAction)sameasaccountaction:(id)sender;

- (IBAction)btnactionSbmit:(id)sender;




- (IBAction)uacccount_pincodeaction:(id)sender;

- (IBAction)ucontact_pincodeaction:(id)sender;




@end
