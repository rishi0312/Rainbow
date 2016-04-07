

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "UserDetails_Var.h"
#import "MLPAutoCompleteTextField.h"
#import <CoreLocation/CoreLocation.h>

@class DEMODataSource;
@class MLPAutoCompleteTextField;
@interface CreateNewOpportunityViewController : UIViewController<MLPAutoCompleteTextFieldDelegate,CLLocationManagerDelegate,UIActionSheetDelegate>
{
    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
    
}

@property (assign) int maxglobal;

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

@property (nonatomic, retain) CLLocationManager *locationManager;



@property (weak, nonatomic) IBOutlet UITextField *txt_firstname;

@property (weak, nonatomic) IBOutlet UITextField *txt_lastname;
@property (weak, nonatomic) IBOutlet UITextField *txt_mobilenumber;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountName;
@property (weak, nonatomic) IBOutlet UITextField *txt_site;
@property (weak, nonatomic) IBOutlet UITextField *txt_mainphonenumber;
@property (weak, nonatomic) IBOutlet UITextField *txt_LOB;
@property (weak, nonatomic) IBOutlet UITextField *txt_ppl;
@property (weak, nonatomic) IBOutlet UITextField *txt_pl;
@property (weak, nonatomic) IBOutlet UITextField *txt_quantity;
@property (weak, nonatomic) IBOutlet UITextField *txt_Vehicleapplication;
@property (weak, nonatomic) IBOutlet UITextField *txt_sourceOfcontact;
@property (weak, nonatomic) IBOutlet UITextField *txt_customerType;
@property (weak, nonatomic) IBOutlet UITextField *txt_vcnumber;

@property (weak, nonatomic) IBOutlet UITextField *txt_geography;
@property (weak, nonatomic) IBOutlet UITextField *txt_bodytype;

@property (weak, nonatomic) IBOutlet UITextField *txt_usagecatagory;
@property (weak, nonatomic) IBOutlet UITextField *txt_fleetsize;
@property (weak, nonatomic) IBOutlet UITextField *txt_TMLfleetsize;

@property (weak, nonatomic) IBOutlet UITextField *txt_contactpannumber;
@property (weak, nonatomic) IBOutlet UITextField *txt_contactemailid;



@property (weak, nonatomic) IBOutlet UITextField *txt_financier;
@property (weak, nonatomic) IBOutlet UITextField *txt_campaign;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountstate;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountdistrict;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountcity;
@property (weak, nonatomic) IBOutlet UITextField *txt_accounttaluka;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountarea;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountpanchayat;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountpincode;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountaddressline1;
@property (weak, nonatomic) IBOutlet UITextField *txt_accountaddressline2;

@property (weak, nonatomic) IBOutlet UITextField *txt_contactstate;

@property (weak, nonatomic) IBOutlet UITextField *txt_contactdistrict;
@property (weak, nonatomic) IBOutlet UITextField *txt_contactcity;
@property (weak, nonatomic) IBOutlet UITextField *txt_contacttaluka;
@property (weak, nonatomic) IBOutlet UITextField *txt_contactarea;
@property (weak, nonatomic) IBOutlet UITextField *txt_contactpanchayat;
@property (weak, nonatomic) IBOutlet UITextField *txt_contactpincode;

@property (weak, nonatomic) IBOutlet UITextField *txt_contactAddressline1;

@property (weak, nonatomic) IBOutlet UITextField *txt_addressline2;

//actions for button click

- (IBAction)btnaction_LOB:(id)sender;
- (IBAction)btnaction_PPL:(id)sender;
- (IBAction)btnaction_pl:(id)sender;
- (IBAction)btnaction_qty:(id)sender;
- (IBAction)btnaction_application:(id)sender;
- (IBAction)btnaction_customertype:(id)sender;
- (IBAction)btnaction_sourceofcontact:(id)sender;
- (IBAction)btnaction_VCnumber:(id)sender;
- (IBAction)btnaction_geography:(id)sender;
- (IBAction)btnactaction_bodytype:(id)sender;
- (IBAction)btnaction_usagecatagory:(id)sender;
- (IBAction)btnaction_fleetsize:(id)sender;
- (IBAction)btnaction_TMLfleetsize:(id)sender;
- (IBAction)btn_financier:(id)sender;
- (IBAction)btnaction_linkcampaign:(id)sender;
- (IBAction)btnaction_accountpickgromgps:(id)sender;
- (IBAction)btnaction_contactpickfromgps:(id)sender;
- (IBAction)btnaction_sameasaccount:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *saveDraftsBtn;


@property (weak, nonatomic) IBOutlet UISwitch *account_pickfromgps;

- (IBAction)btnaction_accountstate:(id)sender;

- (IBAction)btnaction_accountdistrict:(id)sender;

- (IBAction)btnaction_accounttaluka:(id)sender;
- (IBAction)btnaction_city:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *contact_sameasaccount;

@property (weak, nonatomic) IBOutlet UISwitch *contact_pickfromgpps;

@property(nonatomic, strong) NSString *PassContactfirstname;
@property(nonatomic, strong) NSString *PassContactlastname;
@property(nonatomic, strong) NSString *PassContactID;
@property(nonatomic, strong) NSString *PassContactMobilenumber;
@property(nonatomic, strong) NSString *PassContactsite;
@property(nonatomic, strong) NSString *PassAccountName;
@property(nonatomic, strong) NSString *flagset;


//craete prospect account tab feild
@property(nonatomic, strong) NSString *fnamea;
@property(nonatomic, strong) NSString *lnamea;
@property(nonatomic, strong) NSString *mobilea;
@property(nonatomic, strong) NSString *emaila;
@property(nonatomic, strong) NSString *pana;
@property(nonatomic, strong) NSString *statea;
@property(nonatomic, strong) NSString *districta;
@property(nonatomic, strong) NSString *citya;
@property(nonatomic, strong) NSString *talukaa;
@property(nonatomic, strong) NSString *areaa;
@property(nonatomic, strong) NSString *panchayata;
@property(nonatomic, strong) NSString *pina;
@property(nonatomic, strong) NSString *add1a;
@property(nonatomic, strong) NSString *add2a;
//end
//craete prospect contact tab feild
@property(nonatomic, strong) NSString *accnamec;
@property(nonatomic, strong) NSString *sitec;
@property(nonatomic, strong) NSString *mainphonec;
//@property(nonatomic, strong) NSString *emaila;
//@property(nonatomic, strong) NSString *pana;
@property(nonatomic, strong) NSString *statec;
@property(nonatomic, strong) NSString *districtc;
@property(nonatomic, strong) NSString *cityc;
@property(nonatomic, strong) NSString *talukac;
@property(nonatomic, strong) NSString *areac;
@property(nonatomic, strong) NSString *panchayatc;
@property(nonatomic, strong) NSString *pinc;
@property(nonatomic, strong) NSString *add1c;
@property(nonatomic, strong) NSString *add2c;
//end


@property(nonatomic,strong) NSDictionary *performerDic;

- (IBAction)account_confirmationbtnaction:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *accountconfirmationbtnoutlet;

@property (strong, nonatomic) IBOutlet NSMutableDictionary *dict;

- (IBAction)acccount_pincodeaction:(id)sender;

- (IBAction)contact_pincodeaction:(id)sender;

@end

