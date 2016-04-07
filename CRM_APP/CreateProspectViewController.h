//
//  CreateProspectViewController.h
//  ProsPectDemo
//
//  Created by admin on 05/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "UserDetails_Var.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "MLPAutoCompleteTextFieldDelegate.h"
#import "Distrcit.h"


@class DEMODataSource;
@class MLPAutoCompleteTextField;

@interface CreateProspectViewController : UIViewController<CLLocationManagerDelegate,UISplitViewControllerDelegate, UIPopoverControllerDelegate,UITextFieldDelegate, MLPAutoCompleteTextFieldDelegate>
{
    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
}
@property (strong, nonatomic) UIPopoverController* masterPopoverController;

@property(weak,nonatomic)UISplitViewController *splitController;

@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentControlProspect;

@property (nonatomic, retain) CLLocationManager *locationManager;

- (IBAction)SegmentControlProspect:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *View_ContactMain;

- (IBAction)btnShowMore:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnShowMore;

@property (weak, nonatomic) IBOutlet UIView *View_ContactChnage;

// Switch

@property (weak, nonatomic) IBOutlet UISwitch *SwitchContact;

- (IBAction)SwitchContact:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txt_FirstName;

@property (weak, nonatomic) IBOutlet UITextField *txt_LastName;

@property (weak, nonatomic) IBOutlet UITextField *txt_MobileNumber;

@property (weak, nonatomic) IBOutlet UITextField *txt_Email;

@property (weak, nonatomic) IBOutlet UITextField *txt_PanNo;

@property (weak, nonatomic) IBOutlet UITextField *txt_State;

@property (weak, nonatomic) IBOutlet UITextField *txt_District;

@property (weak, nonatomic) IBOutlet UITextField *txt_City;

@property (weak, nonatomic) IBOutlet UITextField *txt_Taluka;

@property (weak, nonatomic) IBOutlet UITextField *txt_Area;

@property (weak, nonatomic) IBOutlet UITextField *txt_Panchayat;

@property (weak, nonatomic) IBOutlet UITextField *txt_Pincode;

@property (weak, nonatomic) IBOutlet UITextField *txt_AddressLine1;

@property (weak, nonatomic) IBOutlet UITextField *txt_Addressine2;

@property (weak, nonatomic) IBOutlet UIButton *btn_SaveDraftContact;

- (IBAction)btn_SaveDraftContact:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btn_SubmitContact;

- (IBAction)btn_SubmitContact:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btn_CreateOptyContact;
- (IBAction)btn_CreateOptyContact:(id)sender;
// View Account
@property (weak, nonatomic) IBOutlet UIView *View_Account;

@property (strong, nonatomic) IBOutlet UIView *searchView;

@property (strong, nonatomic) IBOutlet UITableView *tbl_SearchContact;


@property (weak, nonatomic) IBOutlet UIButton *btnShowMore1;

- (IBAction)btnShowMore1:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *View_AccountChange;

// Switch

@property (strong, nonatomic) IBOutlet UITextField *txt_FirsTNameAccount;

@property (strong, nonatomic) IBOutlet UITextField *txt_SiteAccount;

@property (strong, nonatomic) IBOutlet UITextField *txt_MobileNumberAccount;

@property (strong, nonatomic) IBOutlet UITextField *txt_ContactAccount;
@property (nonatomic, assign) BOOL keyboardIsShown;

@property (strong, nonatomic) IBOutlet NSString *integration_id;

- (IBAction)btn_SearchContactAccount:(id)sender;



@property (weak, nonatomic) IBOutlet UISwitch *SwitchAccount;

- (IBAction)SwitchAccount:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txt_StateAccount;

@property (weak, nonatomic) IBOutlet UITextField *txt_DistrictAccount;


@property (weak, nonatomic) IBOutlet UITextField *txt_CityAccount;

@property (weak, nonatomic) IBOutlet UITextField *txt_TalukaAccount;

@property (weak, nonatomic) IBOutlet UITextField *txt_AreaAccount;

@property (weak, nonatomic) IBOutlet UITextField *txt_PanchayatAccount;

@property (weak, nonatomic) IBOutlet UITextField *txt_PincodeAccount;

@property (weak, nonatomic) IBOutlet UITextField *txt_AddressLineAccount1;

@property (weak, nonatomic) IBOutlet UITextField *txt_AddressLinrAccount2;

@property (weak, nonatomic) IBOutlet UIButton *btn_SaveDraftAccount;

- (IBAction)btn_SaveDraftAccount:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btn_SubmitAccount;

- (IBAction)btn_SubmitAccount:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btn_CreateOptyAccount;

- (IBAction)btn_CreateOptyAccount:(id)sender;




#pragma NsmutableArray Intiliazation 

@property (strong, nonatomic) NSMutableArray* ShowStates;
@property (strong, nonatomic) NSMutableDictionary* GetStatesAll;
@property (strong, nonatomic) NSMutableDictionary* GetAllStateCodes;
@property (strong, nonatomic) NSString* SelectedStateCode;
@property (strong, nonatomic) NSMutableArray* GetAllstates_Arr;
@property (strong, nonatomic) NSMutableArray* GetAllDistrict_Arr;
@property (strong, nonatomic) NSMutableArray* GetAllCities;
@property (strong, nonatomic) NSMutableArray* GetAllTaluka;
@property (strong, nonatomic) NSMutableArray* GetAllPincode;

@property (strong, nonatomic) IBOutlet NSMutableArray *District_List_PickerArr;
@property (strong, nonatomic) IBOutlet NSMutableArray *City_List_PickerArr;
@property (strong, nonatomic) IBOutlet NSMutableArray *Taluka_List_PickerArr;

//@property(nonatomic, strong) IBOutlet NSMutableArray *ContactSearch_Arr;


#pragma AutoComplete 
@property (strong, nonatomic) IBOutlet DEMODataSource *autocompleteDataSource;
@property (weak) IBOutlet MLPAutoCompleteTextField *autocompleteTextField;

@property (strong, nonatomic) IBOutlet UILabel *demoTitle;
@property (strong, nonatomic) IBOutlet UILabel *author;
@property (strong, nonatomic) IBOutlet UISegmentedControl *typeSwitch;
@end
