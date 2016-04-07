//
//  CreateProspectViewController.m
//  ProsPectDemo
//
//  Created by admin on 05/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import "CreateProspectViewController.h"
#import "DEMOCustomAutoCompleteCell.h"
#import "DEMOCustomAutoCompleteObject.h"
#import "DEMODataSource.h"
#import "GeoCoderObject.h"
#import "MBProgressHUD.h"
#import "MLPAutoCompleteTextField.h"
#import "RequestDelegate.h"
#import "TBXML.h"
#import <QuartzCore/QuartzCore.h>
#import "Recipe.h"
#import "RecipeTableCell.h"
#import "NewContactLists.h"
#import "CreateNewOpportunityViewController.h"
#define kOFFSET_FOR_KEYBOARD 100.0

@interface CreateProspectViewController () {
    NSString* statusbutton1;
    NSString* statusbutton2;
    const CGFloat BoardHeight;
    CLGeocoder* geocoder;
    CLPlacemark* placemark;
    UIAlertView* alert;
    NSMutableArray* ProductName;
    UIActionSheet* actionSheet;
    NSString *str_States, *mobileNumberPattern;
    NSPredicate* mobileNumberPred;
    NSString *categoryString,*categoryStringAccount,*ACCOUNTID_Account;
    NSString *ContactID, *_strAccount, *Wintgration, *Waddressid, *Wcontactid, *WpersonalName;
    NSString* emailRegEx;
    NSPredicate* emailTest;
    NSString *panCardRegex,*pincodeRegx;
    NSPredicate *pantest,*pintest;
    NSString *sr_Pass1,*selected1,*newOutput1,*str_State1;
    NSArray *recipes;
    NSArray *searchResults;
    
    NSString *flagset;
    


}
@end

@implementation CreateProspectViewController
@synthesize SegmentControlProspect;
@synthesize locationManager;
@synthesize GetAllStateCodes, GetStatesAll, SelectedStateCode, ShowStates, GetAllCities, GetAllDistrict_Arr, GetAllPincode, GetAllstates_Arr, GetAllTaluka;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
     self.btn_SaveDraftContact.alpha = 0.6;
    self.btn_SaveDraftContact.enabled=NO;
    
    self.btn_SaveDraftAccount.alpha = 0.6;
    self.btn_SaveDraftAccount.enabled=NO;
    
    flagset=@"";
    NSString *integration_id=[NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    NSLog(@"%d",[integration_id intValue]);
    NSLog(@"%lld",[integration_id longLongValue]);
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nback.png"] forBarMetrics:UIBarMetricsDefault];
    NSLog(@"called Detailed ");
    self.splitViewController.delegate = self;
    [self.masterPopoverController setDelegate:self];
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //AppDelegate instance
    userDetailsVal_ = [UserDetails_Var sharedmanager]; //usedetails instance
    [self.searchView setHidden:YES];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ReloadDataFunctionViewShow:)
                                                 name:@"refreshView"
                                               object:nil];


    ProductName = [[NSMutableArray alloc] init];
    GetAllstates_Arr = [[NSMutableArray alloc] init];
    GetAllDistrict_Arr = [[NSMutableArray alloc] init];
    GetAllCities = [[NSMutableArray alloc] init];
    GetAllTaluka = [[NSMutableArray alloc] init];
    GetAllPincode = [[NSMutableArray alloc] init];
    GetStatesAll = [[NSMutableDictionary alloc] init];
    ContactSearch_Arr=[[NSMutableArray alloc] init];

    self.txt_State.delegate = self;
    self.txt_District.delegate = self;
    self.txt_State.tag = 100;
    self.txt_District.tag = 1;
    self.txt_City.tag=2;
    self.txt_Taluka.tag=3;
    self.txt_Pincode.tag=4;
    self.txt_FirstName.tag=5;
    self.txt_LastName.tag=6;
    self.txt_MobileNumber.tag=7;
    self.txt_Email.tag=8;
    self.txt_PanNo.tag=9;
    self.txt_PanNo.delegate=self;
 self.keyboardIsShown = NO;
    
    
    self.txt_StateAccount.tag=101;
    self.txt_DistrictAccount.tag=102;
    self.txt_CityAccount.tag=103;
    self.txt_TalukaAccount.tag=104;
    self.txt_PincodeAccount.tag=105;

    [self.View_ContactMain setHidden:NO];
    [self.View_Account setHidden:YES];
    GeoCodingObjecT_Arr = [[NSMutableArray alloc] init];
    statusbutton1 = @"close";
    [self.View_ContactChnage setHidden:YES];
    
    UIImage *buttonImage = [UIImage imageNamed:@"plus-5-64.png"];
    [self.btnShowMore setImage:buttonImage forState:UIControlStateNormal];
    

    UIImage *buttonImage1 = [UIImage imageNamed:@"plus-5-64.png"];
    [self.btnShowMore1 setImage:buttonImage1 forState:UIControlStateNormal];
    //self.btnShowMore.titleLabel.text = @"+";
    //self.btnShowMore1.titleLabel.text = @"+";
    statusbutton2 = @"close";
    [self.View_AccountChange setHidden:YES];

    emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    mobileNumberPattern = @"[789][0-9]{9}";
    mobileNumberPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileNumberPattern];
    
    panCardRegex = @"[A-Z]{3}P[A-Z]{1}[0-9]{4}[A-Z]{1}";
    pantest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", panCardRegex];
    
    pincodeRegx = @"[0-9]{6}";
    pintest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pincodeRegx];
    
    
    [self.SwitchContact addTarget:self
                           action:@selector(stateChangedContact:)
                 forControlEvents:UIControlEventValueChanged];

    [self.SwitchAccount addTarget:self
                           action:@selector(stateChangedAccount:)
                 forControlEvents:UIControlEventValueChanged];

    CGRect frame = SegmentControlProspect.frame;
    [SegmentControlProspect setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 60)];

    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:SegmentControlProspect
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:36];
    [SegmentControlProspect addConstraint:constraint];

    NSLayoutConstraint* constraintWidth = [NSLayoutConstraint constraintWithItem:SegmentControlProspect
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:400];
    [SegmentControlProspect addConstraint:constraintWidth];
    
    NSLog(@"--called Detailed %@",userDetailsVal_.POSITION_ID);

    geocoder = [[CLGeocoder alloc] init];
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locationManager.delegate = self;
        [locationManager requestAlwaysAuthorization];
    }
    [locationManager startUpdatingLocation];

    self.splitViewController.delegate = self;
    self.masterPopoverController.delegate = self;
    UIBarButtonItem* barButtonItem = self.splitViewController.displayModeButtonItem;
    barButtonItem.title = @"Show master";
    self.navigationItem.leftBarButtonItem = barButtonItem;

    // Do any additional setup after loading the view.
    GetAllStateCodes = [[NSMutableDictionary alloc] init];
    self.District_List_PickerArr = [[NSMutableArray alloc] init];
    self.City_List_PickerArr = [[NSMutableArray alloc] init];
    self.Taluka_List_PickerArr = [[NSMutableArray alloc] init];

    ShowStates = [[NSMutableArray alloc] initWithObjects:@"Andaman and Nicobar Island", @"Andhra Pradesh", @"Arunachal Pradesh", @"Assam", @"Bihar", @"Chandigarh", @"Chattishgarh", @"Daman and Diu", @"Delhi", @"Dadra and Nagar Haveli", @"Goa", @"Gujarat", @"Himachal Pradesh", @"Haryana", @"Jharkhand", @"Jammu & Kashmir", @"Karnataka", @"Kerala", @"Lakshwadeep", @"Maharashtra", @"Meghalaya", @"Manipur", @"Madhya Pradesh", @"Mizoram", @"Nagaland", @"Orissa", @"Punjab", @"Pondicherry", @"Rajasthan", @"Sikkim", @"Telangana", @"Tamil Nadu", @"Tripura", @"Uttarakhand", @"Uttar Pradesh", @"West Bengal", nil];

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
    str_States = [GetAllStateCodes objectForKey:self.txt_State.text];
    [self call_AllStates];
    // Do any additional setup after loading the view, typically from a nib.

    [self.autocompleteTextField setAutoCompleteTableAppearsAsKeyboardAccessory:NO];

    //[self setSimulateLatency:YES]; //Uncomment to delay the return of autocomplete suggestions.
    //[self setTestWithAutoCompleteObjectsInsteadOfStrings:YES]; //Uncomment to return autocomplete objects instead of strings to the textfield.

    //[self.autocompleteDataSource setSimulateLatency:YES];
    //[self.autocompleteDataSource setTestWithAutoCompleteObjectsInsteadOfStrings:YES];

    [self.autocompleteTextField setBorderStyle:UITextBorderStyleRoundedRect];

    //[self.autocompleteTextField setShowAutoCompleteTableWhenEditingBegins:YES];
    //[self.autocompleteTextField setAutoCompleteTableBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];

    //You can use custom TableViewCell classes and nibs in the autocomplete tableview if you wish.
    //This is only supported in iOS 6.0, in iOS 5.0 you can set a custom NIB for the cell

    if ([[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending) {
        [self.autocompleteTextField registerAutoCompleteCellClass:[DEMOCustomAutoCompleteCell class]
                                           forCellReuseIdentifier:@"CustomCellId"];
    }
    else {
        //Turn off bold effects on iOS 5.0 as they are not supported and will result in an exception
        self.autocompleteTextField.applyBoldEffectToAutoCompleteSuggestions = NO;
    }
    
    Recipe *recipe1 = [Recipe new];
    recipe1.name = @"Egg Benedict";
    recipe1.prepTime = @"30 min";
    recipe1.image = @"egg_benedict.jpg";
    recipe1.ingredients = [NSArray arrayWithObjects:@"2 fresh English muffins", @"4 eggs", @"4 rashers of back bacon", @"2 egg yolks", @"1 tbsp of lemon juice", @"125 g of butter", @"salt and pepper", nil];
    
    Recipe *recipe2 = [Recipe new];
    recipe2.name = @"Mushroom Risotto";
    recipe2.prepTime = @"30 min";
    recipe2.image = @"mushroom_risotto.jpg";
    recipe2.ingredients = [NSArray arrayWithObjects:@"1 tbsp dried porcini mushrooms", @"2 tbsp olive oil", @"1 onion, chopped", @"2 garlic cloves", @"350g/12oz arborio rice", @"1.2 litres/2 pints hot vegetable stock", @"salt and pepper", @"25g/1oz butter", nil];
    
    Recipe *recipe3 = [Recipe new];
    recipe3.name = @"Full Breakfast";
    recipe3.prepTime = @"20 min";
    recipe3.image = @"full_breakfast.jpg";
    recipe3.ingredients = [NSArray arrayWithObjects:@"2 sausages", @"100 grams of mushrooms", @"2 rashers of bacon", @"2 eggs", @"150 grams of baked beans", @"Vegetable oil", nil];
    
    Recipe *recipe4 = [Recipe new];
    recipe4.name = @"Hamburger";
    recipe4.prepTime = @"30 min";
    recipe4.image = @"hamburger.jpg";
    recipe4.ingredients = [NSArray arrayWithObjects:@"400g of ground beef", @"1/4 onion (minced)", @"1 tbsp butter", @"hamburger bun", @"1 teaspoon dry mustard", @"Salt and pepper", nil];
    
    Recipe *recipe5 = [Recipe new];
    recipe5.name = @"Ham and Egg Sandwich";
    recipe5.prepTime = @"10 min";
    recipe5.image = @"ham_and_egg_sandwich.jpg";
    recipe5.ingredients = [NSArray arrayWithObjects:@"1 unsliced loaf (1 pound) French bread", @"4 tablespoons butter", @"2 tablespoons mayonnaise", @"8 thin slices deli ham", @"1 large tomato, sliced", @"1 small onion", @"8 eggs", @"8 slices cheddar cheese", nil];
    
    Recipe *recipe6 = [Recipe new];
    recipe6.name = @"Creme Brelee";
    recipe6.prepTime = @"1 hour";
    recipe6.image = @"creme_brelee.jpg";
    recipe6.ingredients = [NSArray arrayWithObjects:@"1 quart heavy cream", @"1 vanilla bean, split and scraped", @"1 cup vanilla sugar", @"6 large egg yolks", @"2 quarts hot water", nil];
    
    Recipe *recipe7 = [Recipe new];
    recipe7.name = @"White Chocolate Donut";
    recipe7.prepTime = @"45 min";
    recipe7.image = @"white_chocolate_donut.jpg";
    recipe7.ingredients = [NSArray arrayWithObjects:@"3 1/4 cups flour", @"2 teaspoons baking powder", @"1/4 teaspoon salt", @"2 beaten eggs", @"2/3 cup sugar", @"2 ounces melted white chocolate", @"1/2 cup milk", nil];
    
    Recipe *recipe8 = [Recipe new];
    recipe8.name = @"Starbucks Coffee";
    recipe8.prepTime = @"5 min";
    recipe8.image = @"starbucks_coffee.jpg";
    recipe8.ingredients = [NSArray arrayWithObjects:@"2/3 cup whole milk", @"6 tablespoons white chocolate chips", @"coffee", @"whipped cream", nil];
    
    Recipe *recipe9 = [Recipe new];
    recipe9.name = @"Vegetable Curry";
    recipe9.prepTime = @"30 min";
    recipe9.image = @"vegetable_curry.jpg";
    recipe9.ingredients = [NSArray arrayWithObjects:@"1 tablespoon olive oil", @"1 onion, chopped", @"2 cloves garlic", @"2 1/2 tablespoons curry powder", @"2 quarts hot water", nil];
    
    Recipe *recipe10 = [Recipe new];
    recipe10.name = @"Instant Noodle with Egg";
    recipe10.prepTime = @"8 min";
    recipe10.image = @"instant_noodle_with_egg.jpg";
    recipe10.ingredients = [NSArray arrayWithObjects:@"1 pack of Instant Noodle", @"2 eggs", nil];
    
    Recipe *recipe11 = [Recipe new];
    recipe11.name = @"Noodle with BBQ Pork";
    recipe11.prepTime = @"20 min";
    recipe11.image = @"noodle_with_bbq_pork.jpg";
    recipe11.ingredients = [NSArray arrayWithObjects:@"1 pack of Instant Noodle", @"BBQ pork", @"Salt and Pepper", nil];
    
    Recipe *recipe12 = [Recipe new];
    recipe12.name = @"Japanese Noodle with Pork";
    recipe12.prepTime = @"20 min";
    recipe12.image = @"japanese_noodle_with_pork.jpg";
    recipe12.ingredients = [NSArray arrayWithObjects:@"1 pack of Japanese Noodle", @"2 green onions", @"2 garlic cloves, minced", @"4 boneless pork loin chops", nil];
    
    Recipe *recipe13 = [Recipe new];
    recipe13.name = @"Green Tea";
    recipe13.prepTime = @"5 min";
    recipe13.image = @"green_tea.jpg";
    recipe13.ingredients = [NSArray arrayWithObjects:@"Green tea", nil];
    
    Recipe *recipe14 = [Recipe new];
    recipe14.name = @"Thai Shrimp Cake";
    recipe14.prepTime = @"1.5 hours";
    recipe14.image = @"thai_shrimp_cake.jpg";
    recipe14.ingredients = [NSArray arrayWithObjects:@"8 oz (250g) peeled and deveined raw shrimp", @"2 tablespoons red curry paste", @"1 large egg", @"2 teaspoon fish sauce", @"1 tablespoon sugar", @"2 tablespoons coconut milk", @"2 tablespoons roughly chopped Thai basil leaves", nil];
    
    Recipe *recipe15 = [Recipe new];
    recipe15.name = @"Angry Birds Cake";
    recipe15.prepTime = @"4 hours";
    recipe15.image = @"angry_birds_cake.jpg";
    recipe15.ingredients = [NSArray arrayWithObjects:@"12 tablespoons (1 1/2 sticks) unsalted butter", @"2 1/2 cups all-purpose flour", @"1 tablespoon baking powder", @"1 teaspoon salt", @"1 3/4 cups sugar", @"2 large eggs, plus 3 large egg yolks", @"1 cup of milk", nil];
    
    Recipe *recipe16 = [Recipe new];
    recipe16.name = @"Ham and Cheese Panini";
    recipe16.prepTime = @"10 min";
    recipe16.image = @"ham_and_cheese_panini.jpg";
    recipe16.ingredients = [NSArray arrayWithObjects:@"2 tablespoons unsalted butter", @"4 cups thinly sliced shallots", @"2 teaspoons fresh thyme", @"1/4 cup grainy Dijon mustard", @"8 slices rustic white bread", @"8 slices Gruyere cheese", @"8 ounces sliced cooked ham", nil];
    
    recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10, recipe11, recipe12, recipe13, recipe14, recipe15, recipe16, nil];
    
    // Call
    [self ManadatoryTextFiledShow];
    
}
-(void)ManadatoryTextFiledShow
{

    self.txt_FirstName.layer.borderWidth = 1.0f;
    
     self.txt_FirstName.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
    
    self.txt_LastName.layer.borderWidth = 1.0f;
    
    self.txt_LastName.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
    
    self.txt_MobileNumber.layer.borderWidth = 1.0f;
    
    self.txt_MobileNumber.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
    
    
    self.txt_FirsTNameAccount.layer.borderWidth = 1.0f;
    
    self.txt_FirsTNameAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
    
    self.txt_SiteAccount.layer.borderWidth = 1.0f;
    
    self.txt_SiteAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
    
    self.txt_MobileNumberAccount.layer.borderWidth = 1.0f;
    
    self.txt_MobileNumberAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
    
    self.txt_ContactAccount.layer.borderWidth = 1.0f;
    
    self.txt_ContactAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
    
}
- (void)ReloadDataFunctionViewShow:(NSNotification*)notification
{
    [self PopOverdismiss];
}

#pragma viewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ReloadDataFunctionSearchBack:)
                                                 name:@"refresh14"
                                               object:nil];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetAllStatesProspect_Found:) name:@"GetAllStatesProspect_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllDistrict_Found:) name:@"AllDistrict_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllCity_Found:) name:@"AllCity_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllTalukas_Found:) name:@"AllTalukas_Found" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllPincode_Found:) name:@"AllPincode_Found" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createcontact_found:) name:@"createcontact_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactqueryfound:) name:@"contactqueryfound" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(prospectupdatefound:) name:@"prospectupdatefound" object:nil];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(contactsearchdata_found:) name:@"contactsearchdata_found" object:nil];
    
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accountcreation_found:) name:@"accountcreation_found" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accountcreation_found1:) name:@"accountcreation_found1" object:nil];
    
}
#pragma viewWillDisappear
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GetAllStatesProspect_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AllDistrict_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AllCity_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AllCities_Found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AllPincode_Found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"createcontact_found" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactqueryfound" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"prospectupdatefound" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactsearchdata_found" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"accountcreation_found" object:nil];
      [[NSNotificationCenter defaultCenter] removeObserver:self name:@"accountcreation_found1" object:nil];
    //accountcreation_found
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnShowMore:(id)sender
{

    if ([statusbutton1 isEqualToString:@"open"]) {
        //self.btnShowMore.titleLabel.text = @"+";
        UIImage *buttonImage = [UIImage imageNamed:@"plus-5-64.png"];
        [self.btnShowMore setImage:buttonImage forState:UIControlStateNormal];
        _View_ContactChnage.frame = CGRectMake(0, 0, self.view.layer.frame.size.width, 0);
        _View_ContactChnage.hidden = YES;
        statusbutton1 = @"close";
    }
    else {
        UIImage *buttonImage = [UIImage imageNamed:@"minus-5-64.png"];
        [self.btnShowMore setImage:buttonImage forState:UIControlStateNormal];
        //self.btnShowMore.titleLabel.text = @"-";
        statusbutton1 = @"open";
        _View_ContactChnage.frame = CGRectMake(0, 175, self.view.layer.frame.size.width, 350);
        _View_ContactChnage.hidden = NO;
    }
}
- (IBAction)btnShowMore1:(id)sender
{
    if ([statusbutton2 isEqualToString:@"open"]) {
        UIImage *buttonImage = [UIImage imageNamed:@"plus-5-64.png"];
        [self.btnShowMore1 setImage:buttonImage forState:UIControlStateNormal];
        _View_AccountChange.frame = CGRectMake(0, 0, self.view.layer.frame.size.width, 0);
        _View_AccountChange.hidden = YES;
        statusbutton2 = @"close";
    }
    else {
        UIImage *buttonImage = [UIImage imageNamed:@"minus-5-64.png"];
        [self.btnShowMore1 setImage:buttonImage forState:UIControlStateNormal];
        statusbutton2 = @"open";
        _View_AccountChange.frame = CGRectMake(0, 175, self.view.layer.frame.size.width, 350);
        _View_AccountChange.hidden = NO;
    }
}
- (IBAction)SegmentControlProspect:(id)sender
{
    if (self.SegmentControlProspect.selectedSegmentIndex == 0) {
        [self.View_ContactMain setHidden:NO];
        [self.View_Account setHidden:YES];
    }
    else if (self.SegmentControlProspect.selectedSegmentIndex == 1) {
        [self.View_ContactMain setHidden:YES];
        [self.View_Account setHidden:NO];
    }
}

- (IBAction)SwitchContact:(id)sender
{
    if ([self.SwitchContact isOn]) {
        NSLog(@"The Switch is On");
    }
    else {
        NSLog(@"The Switch is Off");
    }
}
- (IBAction)SwitchAccount:(id)sender
{
}

- (void)stateChangedContact:(UISwitch*)switchState
{
    if ([switchState isOn]) {
        NSLog(@"The Switch is Onn");
        NSLog(@"-- Address From GPS :%@",geoCodiingObject.Address);
        self.txt_State.text = geoCodiingObject.State;
        self.txt_District.text = [geoCodiingObject.District uppercaseString];
        self.txt_City.text = [geoCodiingObject.City uppercaseString];
       // self.txt_Pincode.text = geoCodiingObject.Pincode;
        self.txt_Taluka.text = [geoCodiingObject.Taluka uppercaseString];
        self.txt_AddressLine1.text=geoCodiingObject.Address;
    }
    else {
        NSLog(@"The Switch is Off");
        self.txt_State.text = @"";
        self.txt_District.text = @"";
        self.txt_City.text = @"";
        self.txt_Pincode.text = @"";
        self.txt_Taluka.text = @"";
        self.txt_AddressLine1.text = @"";
    }
}
- (void)stateChangedAccount:(UISwitch*)switchState
{
    if ([switchState isOn]) {
        NSLog(@"The Switch is On");
        NSLog(@"--- Geo %@", geoCodiingObject.State);
        self.txt_StateAccount.text = geoCodiingObject.State;
        self.txt_DistrictAccount.text = [geoCodiingObject.District uppercaseString];
        self.txt_CityAccount.text = [geoCodiingObject.City uppercaseString];
        //self.txt_PincodeAccount.text = geoCodiingObject.Pincode;
        self.txt_TalukaAccount.text = [geoCodiingObject.Taluka uppercaseString];
        self.txt_AddressLineAccount1.text=geoCodiingObject.Address;

    }
    else {
        NSLog(@"The Switch is Off");
        self.txt_StateAccount.text = @"";
        self.txt_DistrictAccount.text = @"";
        self.txt_CityAccount.text = @"";
        self.txt_PincodeAccount.text = @"";
        self.txt_TalukaAccount.text = @"";
        self.txt_AddressLineAccount1.text = @"";
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

            NSString* str_Data = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
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

            // geoCodiingObject.City=placemark.   userDetails.address = performerDic[@"result"][@"user"][@"address"];

            NSLog(@"-- Find Data :%@", placemark.addressDictionary[@"City"]);
            geoCodiingObject.Country = placemark.addressDictionary[@"Country"];
            geoCodiingObject.District = placemark.addressDictionary[@"SubAdministrativeArea"];
            geoCodiingObject.State = placemark.addressDictionary[@"State"];
            geoCodiingObject.Taluka = placemark.addressDictionary[@"City"];
            geoCodiingObject.Pincode = placemark.addressDictionary[@"ZIP"];
            NSString *items1 = [[[[[placemark.addressDictionary[@"FormattedAddressLines"] objectAtIndex:0]stringByAppendingString:@" "]stringByAppendingString:[placemark.addressDictionary[@"FormattedAddressLines"] objectAtIndex:1]]stringByAppendingString:@" "]stringByAppendingString:@""];
            NSLog(@"-- Items :%@",items1);
            geoCodiingObject.Address=items1;
            geoCodiingObject.City = placemark.addressDictionary[@"City"];
            [GeoCodingObjecT_Arr addObject:geoCodiingObject];
            NSLog(@" data :%@", str_Data);
        }
        else {
            NSLog(@"%@", error.debugDescription);
        }
    }];

    // Turn off the location manager to save power.
    [manager stopUpdatingLocation];
}

#pragma WebService Fetch
#pragma State
- (void)call_AllStates
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

    NSLog(@"\n envlopeString Of user details...  All State .!!!!%@", envelopeText);
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

    [[RequestDelegate alloc] initiateRequest:request name:@"getAllStatesConnectionProspect"];
} //getAllStatesConnection
- (void)GetAllStatesProspect_Found:(NSNotification*)notification
{

    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n -- State Data Response --  %@ ", response);

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
        if (GetAllstates_Arr) {
            [GetAllstates_Arr removeAllObjects];
        }
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianStatesResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {
            do {
                TBXMLElement* table = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* OPTY_ID = [TBXML childElementNamed:@"X_STATE" parentElement:table];
                NSString* C0_value = [TBXML textForElement:OPTY_ID];
                [GetStatesAll setObject:C0_value forKey:@"OPTY_ID"];
                NSArray* ProductName1 = [GetStatesAll objectForKey:@"OPTY_ID"];
                NSLog(@"\n Object Data :  %@", [GetStatesAll objectForKey:@"OPTY_ID"]);
                [ProductName addObject:ProductName1];
            } while ((tuple = tuple->nextSibling));
            NSLog(@"Objects : %@", ProductName);
        }
        else {
            alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        //  [self hideAlert];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - MLPAutoCompleteTextField Delegate

- (BOOL)autoCompleteTextField:(MLPAutoCompleteTextField*)textField
          shouldConfigureCell:(UITableViewCell*)cell
       withAutoCompleteString:(NSString*)autocompleteString
         withAttributedString:(NSAttributedString*)boldedString
        forAutoCompleteObject:(id<MLPAutoCompletionObject>)autocompleteObject
            forRowAtIndexPath:(NSIndexPath*)indexPath;
{

    //{
    //    //This is your chance to customize an autocomplete tableview cell before it appears in the autocomplete tableview
    //    NSString *filename = [autocompleteString stringByAppendingString:@".png"];
    //    filename = [filename stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    //    filename = [filename stringByReplacingOccurrencesOfString:@"&" withString:@"and"];
    //    [cell.imageView setImage:[UIImage imageNamed:filename]];
    //
    //    return YES;
    //}

    return YES;
}
- (BOOL)textField:(UITextField*)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString*)string
{
    NSRange backspaceEndRange = NSMakeRange(0, 1);

    if (NSEqualRanges(range, backspaceEndRange)) {
        NSLog(@"finished writing");
    }
    return YES;
}
- (void)autoCompleteTextField:(MLPAutoCompleteTextField*)textField
  didSelectAutoCompleteString:(NSString*)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (selectedObject) {
        NSLog(@"selected object from autocomplete menu %@ with string %@", selectedObject, [selectedObject autocompleteString]);
    }
    else {
        NSLog(@"----- Not selected Object ----");
        NSLog(@"--- Selected String :--- %@", selectedString);
        
        if(![self.txt_State.text isEqual:@""]){
        
        self.txt_State.layer.borderWidth = 1.0f;
        self.txt_State.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.txt_District.layer.borderWidth = 1.0f;
        self.txt_District.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.txt_City.layer.borderWidth = 1.0f;
        self.txt_City.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.txt_Taluka.layer.borderWidth = 1.0f;
        self.txt_Taluka.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.txt_AddressLine1.layer.borderWidth = 1.0f;
        self.txt_AddressLine1.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        }
        else if(![self.txt_StateAccount.text isEqual:@""]){
            NSLog(@"-- Test For State :");
            self.txt_StateAccount.layer.borderWidth = 1.0f;
            self.txt_StateAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
            self.txt_DistrictAccount.layer.borderWidth = 1.0f;
            self.txt_DistrictAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
            self.txt_CityAccount.layer.borderWidth = 1.0f;
            self.txt_CityAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
            self.txt_TalukaAccount.layer.borderWidth = 1.0f;
            self.txt_TalukaAccount.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
            self.txt_AddressLineAccount1.layer.borderWidth = 1.0f;
            self.txt_AddressLineAccount1.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        }else{
        }
        
        
        /*self.txt_City.layer.borderWidth = 1.0f;
        self.txt_City.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;
        self.txt_Taluka.layer.borderWidth = 1.0f;
        self.txt_Taluka.layer.borderColor = [UIColor colorWithRed:(246.0 / 255.0)green:(37.0 / 255.0)blue:(37.0 / 255.0)alpha:1].CGColor;*/
        
        
        
        if (textField.tag == 100) {
            [self getDistrictFromState:selectedString];
        }else if (textField.tag == 1) {
            [self getCityFromDistrict:selectedString];
        }else if (textField.tag == 2) {
            [self getTalukaFromCityDistrictState:@"MH" Str_DistrictFirst:self.txt_District.text  Str_CityFirst:self.txt_City.text];
        }else if (textField.tag==3){
            [self getPincodeFromData:@"MH" Str_DistrictFirst:self.txt_District.text Str_CityFirst:self.txt_City.text Str_TalukaFirst:self.txt_Taluka.text];
        } if (textField.tag == 101) {
            [self getDistrictFromState:selectedString];
        }else if (textField.tag == 102) {
            [self getCityFromDistrict:selectedString];
        }else if (textField.tag == 103) {
            [self getTalukaFromCityDistrictState:@"MH" Str_DistrictFirst:self.txt_DistrictAccount.text  Str_CityFirst:self.txt_CityAccount.text];
        }else if (textField.tag==104){
            [self getPincodeFromData:@"MH" Str_DistrictFirst:self.txt_DistrictAccount.text Str_CityFirst:self.txt_CityAccount.text Str_TalukaFirst:self.txt_TalukaAccount.text];
        }
    }
}
- (void)getDistrictFromState:(NSString*)str_State
{
    NSLog(@"Str State Values :L%@", str_State);
    
    categoryString=GetAllStateCodes[str_State];
    
    NSLog(@"--- Freeee :%@",categoryString);
    /*str_States = [ProductName objectAtIndex:buttonIndex];
    self.txt_STATE.text = NSLocalizedString([ShowStates objectAtIndex:buttonIndex], @"");
    SelectedStateCode = [GetAllStateCodes objectForKey:txt_STATE.text];*/
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetAllIndianDistricts xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<state>%@</state>"
                              @"</GetAllIndianDistricts>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",
                              categoryString];
    NSLog(@"\n Object Data :  %@", @"MH");
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
    [[RequestDelegate alloc] initiateRequest:request name:@"getAllDistrictConnection"];
}
/*-(void)AllDistrict_Found:(NSNotification*)notification
{
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....%@",response);
 
    if (self.District_List_PickerArr)
    {
        [self.District_List_PickerArr removeAllObjects];
    }
    
    TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    TBXMLElement *container = [TBXML childElementNamed:@"GetAllIndianDistrictsResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
    TBXMLElement *tuple =[TBXML childElementNamed:@"tuple" parentElement:container];
    if (tuple)
    {
        do {
            
            TBXMLElement *CX_DISTRICT_MAS  = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
            TBXMLElement *X_DISTRICT = [TBXML childElementNamed:@"X_DISTRICT" parentElement:CX_DISTRICT_MAS];
            NSString* Name = [TBXML textForElement:X_DISTRICT];
            [self.District_List_PickerArr addObject:Name];
        }while ((tuple = tuple->nextSibling));
    }
    appdelegate.districtArray=self.District_List_PickerArr;
    NSLog(@"%d",[self.District_List_PickerArr count]);
}*/
- (void)AllDistrict_Found:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response.......Prospect %@ ", response);
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"there is some technical problem while fetching data" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        //[self hideAlert];
    }
    else {

        if (GetAllDistrict_Arr) {
            [GetAllDistrict_Arr removeAllObjects];
        }

        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

        TBXMLElement* container = [TBXML childElementNamed:@"GetAllIndianDistrictsResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];

        if (tuple) {
            [self hideAlert];
            do {
                /* TBXMLElement* S_PROD_LN = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* PPL_ID = [TBXML childElementNamed:@"X_DISTRICT" parentElement:S_PROD_LN];
                NSString* PPL_ID_ = [TBXML textForElement:PPL_ID];
                NSLog(@"\n PPL_ID_ : %@", PPL_ID_);*/

                TBXMLElement* CX_DISTRICT_MAS = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
                TBXMLElement* X_DISTRICT = [TBXML childElementNamed:@"X_DISTRICT" parentElement:CX_DISTRICT_MAS];
                NSString* Name = [TBXML textForElement:X_DISTRICT];
                [self.District_List_PickerArr addObject:Name];
                [GetAllDistrict_Arr addObject:Name];
            } while ((tuple = tuple->nextSibling));
            NSLog(@" PPL %@", GetAllDistrict_Arr);
            appdelegate.districtArray = self.District_List_PickerArr;
            NSLog(@"%d", [self.District_List_PickerArr count]);
        }
        else {
            [self hideAlert];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"NEEV" message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}
- (void)getCityFromDistrict:(NSString*)str_District
{
    NSString * envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               @"<SOAP:Body>"
                               @"<GetAllIndianCity xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                               @"<state>%@</state>"
                               @"<dist>%@</dist>"
                               @"</GetAllIndianCity>"
                               @"</SOAP:Body>"
                               @"</SOAP:Envelope>",categoryString,str_District];
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL * theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@",appdelegate.URL,appdelegate.artifact]];
    NSLog(@"URL IS .... %@",theurl);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"getAllCityConnection"];
}
-(void)AllCity_Found:(NSNotification*)notification
{
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....AllCity_Found %@",response);
    if (self.City_List_PickerArr)
    {
        [self.City_List_PickerArr removeAllObjects];
    }
    TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    TBXMLElement *container = [TBXML childElementNamed:@"GetAllIndianCityResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
    TBXMLElement *tuple =[TBXML childElementNamed:@"tuple" parentElement:container];
    if (tuple)
    {
        do {
            TBXMLElement *CX_DISTRICT_MAS  = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
            TBXMLElement *X_CITY = [TBXML childElementNamed:@"X_CITY" parentElement:CX_DISTRICT_MAS];
            NSString* Name = [TBXML textForElement:X_CITY];
            [self.City_List_PickerArr addObject:Name];
        }while ((tuple = tuple->nextSibling));
    }
    appdelegate.CitiesArray=self.City_List_PickerArr;
    NSLog(@"%d",[self.City_List_PickerArr count]);
}
-(void)getTalukaFromCityDistrictState:(NSString *)str_StateFirst Str_DistrictFirst:(NSString *)str_DistrictFirst Str_CityFirst:(NSString *)str_CityFirst
{
    NSLog(@"--- Taluka :%@%@",str_DistrictFirst,str_CityFirst);
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetAllIndianTaluka xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<state>%@</state>"
                              @"<dist>%@</dist>"
                              @"<city>%@</city>"
                              @"</GetAllIndianTaluka>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",
                              categoryString, str_DistrictFirst, str_CityFirst];
    
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
    [[RequestDelegate alloc] initiateRequest:request name:@"getAllTalukasConnection"];
}
-(void)AllTalukas_Found:(NSNotification*)notification
{
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....Taluka_ListFound%@",response);
    if (self.Taluka_List_PickerArr)
    {
        [self.Taluka_List_PickerArr removeAllObjects];
    }
    TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    TBXMLElement *container = [TBXML childElementNamed:@"GetAllIndianTalukaResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
    TBXMLElement *tuple =[TBXML childElementNamed:@"tuple" parentElement:container];
    if (tuple)
    {
        do {
            TBXMLElement *CX_DISTRICT_MAS  = [TBXML childElementNamed:@"CX_DISTRICT_MAS" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];
            TBXMLElement *X_TALUKA = [TBXML childElementNamed:@"X_TALUKA" parentElement:CX_DISTRICT_MAS];
            NSString* Name = [TBXML textForElement:X_TALUKA];
            [self.Taluka_List_PickerArr addObject:Name];
        }while ((tuple = tuple->nextSibling));
    }
    appdelegate.TalukaArray=self.Taluka_List_PickerArr;
    NSLog(@"%d",[self.Taluka_List_PickerArr count]);
}

-(void)getPincodeFromData:(NSString *)str_StateFirst Str_DistrictFirst:(NSString *)str_Districtfirst  Str_CityFirst:(NSString *)str_CityFirst Str_TalukaFirst:(NSString *)str_TalukaFirst
{
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
                                      @"</SOAP:Envelope>",
                                      categoryString,str_Districtfirst,str_CityFirst,str_TalukaFirst];
            
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
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"\n Activity_PL_Found response....... %@ ", response);
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
        
        if (GetAllPincode) {
            [GetAllPincode removeAllObjects];
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
                [GetAllPincode addObject:PPL_ID_];
            } while ((tuple = tuple->nextSibling));
            appdelegate.PincodeArray=GetAllPincode;
            NSLog(@" PPL %@", GetAllPincode);
        }
        else {
            [self hideAlert];
            alert = [[UIAlertView alloc] initWithTitle:@"DSM" message:@"No data found.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

#pragma  mark- ValidationForMobileNumber


- (BOOL)myMobileNumberValidate:(NSString*)number
{
    NSString *numberRegEx = @"[0-9]{10}";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegEx];
    if ([numberTest evaluateWithObject:number] == YES)
        return TRUE;
    else
        return FALSE;
}
- (void)showAlert
{
    [MBProgressHUD showHUDAddedLoading:self.view animated:YES];
}
- (void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (IBAction)btn_SaveDraftContact:(id)sender {
}
- (IBAction)btn_SubmitContact:(id)sender {
    
    [self myMobileNumberValidate:[NSString stringWithFormat:@"%@",self.txt_MobileNumber.text]];
    
    [self showAlert];
    
    if ([_txt_FirstName.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter first name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_LastName.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter last name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_MobileNumber.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter phone number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if (_txt_MobileNumber.text && _txt_MobileNumber.text.length < 10) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([mobileNumberPred evaluateWithObject:_txt_MobileNumber.text] != YES && [_txt_MobileNumber.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([emailTest evaluateWithObject:_txt_Email.text] != YES && [_txt_Email.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid EMAIL ADDRESS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if ([pantest evaluateWithObject:_txt_PanNo.text] != YES && [_txt_PanNo.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid PAN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
//    else if ([pintest evaluateWithObject:_txt_accountpincode.text] != YES && [_txt_accountpincode.text length] != 0) {
//        
//        [self hideAlert];
//        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid pincode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert setTag:0];
//        [alert show];
//        
//    }
    else if ([pintest evaluateWithObject:_txt_Pincode.text] != YES  && [_txt_Pincode.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid pincode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert setTag:0];
        [alert show];
    }

    else{
        
        [self createContact];
    }
    /*
     if(!_txt_PanNo.text.length==0){
     
     if ([pantest evaluateWithObject:_txt_PanNo.text] != YES) {
     [self hideAlert];
     alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid PAN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
     [alert show];
     }
     }
     */
}
- (void)createContact
{
    //[self showAlert];
    NSString* envelopeText;
    /*NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                              @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<Contact>"
                              @"<CellularPhone>%@</CellularPhone>"
                              @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                              @"<EmailAddress>%@</EmailAddress>" // Email Id
                              @"<FirstName>%@</FirstName>" // First Name
                              @"<IntegrationId>%ld</IntegrationId>" // Current System Time in milliSec Time in Milliseconds
                              @"<LastName>%@</LastName>" //Last Name
                              @"<ListOfRelatedSalesRep>"
                              @"<RelatedSalesRep>"
                              @"<Position>%@</Position>" // UserDetails. Getposition name
                              @"<Id>%@</Id>" //UserDetails Row ID
                              @"</RelatedSalesRep>"
                              @"</ListOfRelatedSalesRep>"
                              @"<ListOfRelatedOrganization>"
                              @"<RelatedOrganization>"
                              @"<Organization>%@</Organization>" // User Deatails Get Org name
                              @"</RelatedOrganization>"
                              @"</ListOfRelatedOrganization>"
                              @"<ListOfPersonalAddress>"
                              @"<PersonalAddress>"
                              @"<IntegrationId>%ld</IntegrationId>"
                              @"<PersonalStreetAddress>%@</PersonalStreetAddress>"
                              @"<PersonalStreetAddress2>%@</PersonalStreetAddress2>"
                              @"<PersonalCountry>India</PersonalCountry>"
                              @"<PersonalState>%@</PersonalState>"
                              @"<TMDistrict>%@</TMDistrict>"
                              @"<PersonalCity>%@</PersonalCity>"
                              @"<TMTaluka>%@</TMTaluka>"
                              @"<TMArea>%@</TMArea>"
                              @"<PersonalPostalCode>%@</PersonalPostalCode>"
                              @"</PersonalAddress>"
                              @"</ListOfPersonalAddress>"
                              @"</Contact>"
                              @"</ListOfContactInterface>"
                              @"</SFATMCVContactInsertOrUpdate_Input>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",
                              _txt_phonenumber.text, _txt_pannumber.text, _txt_emailID.text, _txt_firstname.text, (long)[[NSDate date] timeIntervalSince1970], _txt_lastname.text, userDetailsVal_.POSITION_NAME, userDetailsVal_.ROW_ID, userDetailsVal_.ORGNAME, (long)[[NSDate date] timeIntervalSince1970], _txt_addressline1.text, _txt_addressline2.text, str, _tx_district.text, _txt_city.text, _txt_taluka.text, _txt_Area.text,_txt_pincode.text];
    */
    
    
    if(![self.txt_State.text isEqual:@""]){
        
        NSLog(@"-- Address Field 1: %@",_txt_AddressLine1.text);
        NSLog(@"-- Address Field 2: %@",_txt_Addressine2.text);
        
        if ([_txt_State.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT STATE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        else if ([_txt_District.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT DISTRICT" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([_txt_City.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT CITY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([_txt_Taluka.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT TALUKA" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([_txt_AddressLine1.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter CONTACT ADDRESS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }else{
    
            envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                              @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<Contact>"
                              @"<CellularPhone>%@</CellularPhone>"
                              @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                              @"<EmailAddress>%@</EmailAddress>"
                              @"<FirstName>%@</FirstName>"
                              @"<IntegrationId>%ld</IntegrationId>"
                              @"<LastName>Panpatil</LastName>"
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
                              @"<TMArea>%@</TMArea>"
                              @"<PersonalPostalCode>%@</PersonalPostalCode>"
                              @"</PersonalAddress>"
                              @"</ListOfPersonalAddress>"
                              @"</Contact>"
                              @"</ListOfContactInterface>"
                              @"</SFATMCVContactInsertOrUpdate_Input>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",_txt_MobileNumber.text,_txt_PanNo.text,_txt_Email.text,_txt_FirstName.text,(long)[[NSDate date] timeIntervalSince1970],userDetailsVal_.POSITION_NAME,userDetailsVal_.POSITION_ID,userDetailsVal_.ORGNAME,(long)[[NSDate date] timeIntervalSince1970],_txt_AddressLine1.text,_txt_Addressine2.text,@"MH",_txt_District.text,_txt_City.text,_txt_Taluka.text,_txt_Area.text,_txt_Pincode.text];
            
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
            [[RequestDelegate alloc] initiateRequest:request name:@"CreateContactConnetction"];
        }
        
    }else{
        
    NSLog(@"-- Address Field : %@",_txt_AddressLine1.text);
    NSLog(@"-- Address Field : %@",_txt_Addressine2.text);

    envelopeText = [NSString stringWithFormat:
                               @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               @"<SOAP:Body>"
                               @"<SFATMCVContactInsertOrUpdate_Input xmlns=\"http://siebel.com/asi/\">"
                               @"<ListOfContactInterface xmlns=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                               @"<Contact>"
                               @"<CellularPhone>%@</CellularPhone>"
                               @"<SocialSecurityNumber>%@</SocialSecurityNumber>"
                               @"<EmailAddress>%@</EmailAddress>"
                               @"<FirstName>%@</FirstName>"
                               @"<IntegrationId>%ld</IntegrationId>"
                               @"<LastName>%@</LastName>"
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
                               @"</Contact>"
                               @"</ListOfContactInterface>"
                               @"</SFATMCVContactInsertOrUpdate_Input>"
                               @"</SOAP:Body>"
                               @"</SOAP:Envelope>",_txt_MobileNumber.text,_txt_PanNo.text,_txt_Email.text,_txt_FirstName.text,(long)[[NSDate date] timeIntervalSince1970],_txt_LastName.text,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSITION_ID,userDetailsVal_.ORGNAME];
        
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
        [[RequestDelegate alloc] initiateRequest:request name:@"CreateContactConnetction"];
    }
}
- (void)createcontact_found:(NSNotification*)notification
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
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else {
        
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement* container = [TBXML childElementNamed:@"ns:SFATMCVContactInsertOrUpdate_Output" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        
        TBXMLElement* ListOfContactInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:container];
        
        TBXMLElement* Contact = [TBXML childElementNamed:@"Contact" parentElement:ListOfContactInterface];
        
        TBXMLElement* Id = [TBXML childElementNamed:@"Id" parentElement:Contact];
        TBXMLElement* Integration = [TBXML childElementNamed:@"IntegrationId" parentElement:Contact];
        
        if (Id) {
            
            ContactID = [TBXML textForElement:Id];
            
            NSString* irnt = [TBXML textForElement:Integration];
            
            NSLog(@"contact id  %@", ContactID);
            
            NSLog(@"contact id  %@", irnt);
            
            if(![self.txt_State.text isEqual:@""])
            {
               [self callCreateAccountConnection];
            }else{
                [self hideAlert];
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Prospect Created successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
            }
        }
        else {
            [self hideAlert];
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something Went Wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            [alertView show];
        }
    }
}

- (void)callCreateAccountConnection
{
    NSLog(@"\n\n.. create Account Connection ");
    NSLog(@"\n\n.. _strcontact %@", ContactID);
    
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\">"
                              @"<soapenv:Header/>"
                              @"<soapenv:Body>"
                              @"<asi:SFATMCVContactQueryById_Input>"
                              @"<asi:PrimaryRowId>%@</asi:PrimaryRowId>"
                              @"</asi:SFATMCVContactQueryById_Input>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",
                              ContactID];
    
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
    
    /*
     <soapenv:Body>
     <ns:SFATMCVContactQueryById_Output xmlns:ns="http://siebel.com/asi/" xmlns="http://siebel.com/asi/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
     <ListOfContactInterface xmlns="http://www.siebel.com/xml/Contact%20Interface">
     <Contact>
     <Id>1-7LFTWRP</Id>
     <Alias />
     <Assistant />
     <BirthDate />
     <CellularPhone>9078230112</CellularPhone>
     <Comment />
     <OrganizationName>TMCV</OrganizationName>
     <EmailAddress />
     <Branch />
     <FaxPhone />
     <FirstName>RAJAT</FirstName>
     <HomePhone />
     <Income />
     <IncomeCurrencyCode>INR</IncomeCurrencyCode>
     <IncomeExchangeDate>03/12/2016 00:00:00</IncomeExchangeDate>
     <IntegrationId>1457788443</IntegrationId>
     <JobTitle />
     <LastName>BHATIYA</LastName>
     <LoginName />
     <Gender />
     <PersonalTitle />
     <ManagerFirstName />
     <ManagerMiddleName />
     <ManagerId />
     <ManagerIntegrationId />
     <ManagerLastName />
     <ManagerPrimaryOrganization />
     <ManagerUId />
     <MiddleName />
     <MaritalStatus />
     <StdCode />
     <MotherTongue />
     <WeddingAnniversaryDate />
     <RegistrationNumber />
     <PersonUId>1-7LFTWRP</PersonUId>
     <PreferredCommunications />
     <PreferredLanguageCode />
     <PrimaryOrganization>TMCV</PrimaryOrganization>
     <Department />
     <SocialSecurityNumber />
     <Status>Active</Status>
     <SuppressAllCalls>N</SuppressAllCalls>
     <SuppressAllEmails>N</SuppressAllEmails>
     <SuppressAllMailings>N</SuppressAllMailings>
     <TimeZoneId />
     <TimeZoneName />
     <WorkPhone />
     <WorkPhoneExtension />
     <SuppressAllSMS />
     <JobTitleeCustomer />
     <PortalUserId />
     <TMDecoration />
     <TMBranch />
     <INSOccupation />
     <TMCellPhone />
     <ListOfRelatedAccount />
     <ListOfAlternatePhone />
     <ListOfCommunicationAddress />
     <ListOfRelatedSalesRep>
     <RelatedSalesRep IsPrimaryMVG="Y">
     <Position>TMCV Siebel Administrator</Position>
     <Id>1-6ZYDCFB</Id>
     <IntegrationId />
     <Login>TMCVPRDADMIN</Login>
     <Division>TMCV</Division>
     </RelatedSalesRep>
     <RelatedSalesRep IsPrimaryMVG="N">
     <Position>TMCV-Sal-W-MUM-1001680-Nerul-LCV-DSE-21</Position>
     <Id>1-1LQFGP</Id>
     <IntegrationId />
     <Login>JJOSHI1001680</Login>
     <Division>1001680-Sales-Nerul-Bafna</Division>
     </RelatedSalesRep>
     </ListOfRelatedSalesRep>
     <ListOfRelatedHouseholds />
     <ListOfRelatedOrganization>
     <RelatedOrganization IsPrimaryMVG="N">
     <Organization>BAFNA Motors (Mumbai) Pvt. Ltd.</Organization>
     <Id>1-560</Id>
     <IntegrationId>1001680</IntegrationId>
     </RelatedOrganization>
     <RelatedOrganization IsPrimaryMVG="Y">
     <Organization>TMCV</Organization>
     <Id>1-4VO</Id>
     <IntegrationId />
     </RelatedOrganization>
     </ListOfRelatedOrganization>
     <ListOfPersonalAddress />
     <ListOfOpportunity />
     </Contact>
     </ListOfContactInterface>
     </ns:SFATMCVContactQueryById_Output>
     </soapenv:Body>
     */
    
    if ([response isEqual:@""]) {
        [self hideAlert];
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
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", _strAccount);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", Wintgration);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", Waddressid);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", Wcontactid);
        
        NSLog(@"\n\n PersonalAddress_Id...!!! %@ ", WpersonalName);
        
        [self Updatecontact_created];
    }
}
- (void)Updatecontact_created
{
    
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
                              @"<IntegrationId>%@</IntegrationId>"
                              @"<PersonalAddressName>%@</PersonalAddressName>"
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
                              @"</SOAP:Envelope>",
                              Wcontactid, self.txt_FirstName.text,self.txt_LastName.text, Waddressid, Wintgration, WpersonalName, self.txt_AddressLine1.text, self.txt_Addressine2.text, self.txt_Area.text, @"MH", self.txt_District.text, self.txt_City.text, self.txt_Taluka.text];
    
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
            
            [self hideAlert];
            
            
         
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Prospect created successfully" message:idstring delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
            self.txt_State.layer.borderWidth = 1.0f;
            self.txt_State.layer.borderColor = [UIColor clearColor].CGColor;
            self.txt_District.layer.borderWidth = 1.0f;
            self.txt_District.layer.borderColor = [UIColor clearColor].CGColor;
            self.txt_City.layer.borderWidth = 1.0f;
            self.txt_City.layer.borderColor =[UIColor clearColor].CGColor;
            self.txt_Taluka.layer.borderWidth = 1.0f;
            self.txt_Taluka.layer.borderColor = [UIColor clearColor].CGColor;
            self.txt_AddressLine1.layer.borderWidth = 1.0f;
            self.txt_AddressLine1.layer.borderColor = [UIColor clearColor].CGColor;
            
            _txt_FirstName.text=@"";
            self.txt_FirstName.text = @"";
            self.txt_LastName.text = @"";
            self.txt_PanNo.text = @"";
            self.txt_MobileNumber.text = @"";
            self.txt_State.text = @"";
            self.txt_Taluka.text = @"";
            self.txt_Email.text = @"";
            self.txt_City.text = @"";
            self.txt_Area.text = @"";
            self.txt_AddressLine1.text = @"";
            self.txt_Addressine2.text = @"";
            self.txt_District.text = @"";

        }
        else {
            [self hideAlert];
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Something Went Wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            [alertView show];
        }
    }
}
- (IBAction)btn_CreateOptyContact:(id)sender {
    
    flagset=@"fromCreateProspect";
    CreateNewOpportunityViewController* searchOpportunityResult_VC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createnewopportunity"];
    searchOpportunityResult_VC1.flagset=flagset;
     searchOpportunityResult_VC1.fnamea=self.txt_FirstName.text;
    searchOpportunityResult_VC1.lnamea=self.txt_LastName.text;
    searchOpportunityResult_VC1.mobilea=self.txt_MobileNumber.text;
    searchOpportunityResult_VC1.emaila=self.txt_Email.text;
    searchOpportunityResult_VC1.pana=self.txt_PanNo.text;
    searchOpportunityResult_VC1.accnamec=self.txt_ContactAccount.text;
    searchOpportunityResult_VC1.sitec=self.txt_SiteAccount.text;
    searchOpportunityResult_VC1.mainphonec=self.txt_MobileNumberAccount.text;
    
    searchOpportunityResult_VC1.statea=self.txt_StateAccount.text;
    searchOpportunityResult_VC1.districta=self.txt_DistrictAccount.text;
    searchOpportunityResult_VC1.citya=self.txt_CityAccount.text;
    searchOpportunityResult_VC1.talukaa=self.txt_TalukaAccount.text;
    searchOpportunityResult_VC1.panchayata=self.txt_PanchayatAccount.text;
    searchOpportunityResult_VC1.add1a=self.txt_AddressLineAccount1.text;
    searchOpportunityResult_VC1.add2a=self.txt_AddressLinrAccount2.text;
    searchOpportunityResult_VC1.areaa=self.txt_AreaAccount.text;
     searchOpportunityResult_VC1.pina=self.txt_PincodeAccount.text;
    
    searchOpportunityResult_VC1.statec=self.txt_State.text;
    searchOpportunityResult_VC1.districtc=self.txt_District.text;
    searchOpportunityResult_VC1.cityc=self.txt_City.text;
    searchOpportunityResult_VC1.talukac=self.txt_Taluka.text;
    searchOpportunityResult_VC1.panchayatc=self.txt_Panchayat.text;
    searchOpportunityResult_VC1.add1c=self.txt_AddressLine1.text;
    searchOpportunityResult_VC1.add2c=self.txt_Addressine2.text;
    searchOpportunityResult_VC1.areac=self.txt_Area.text;
    searchOpportunityResult_VC1.pinc=self.txt_Pincode.text;
    
    
    [self.navigationController pushViewController:searchOpportunityResult_VC1 animated:YES];

}
#pragma mark - Button Search  Methods

- (IBAction)btn_SearchContactAccount:(id)sender {
    
    if ([mobileNumberPred evaluateWithObject:_txt_ContactAccount.text] != YES && [_txt_ContactAccount.text length] != 0)
    {
        // NO Contat No Enter:
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid Mobile NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([_txt_ContactAccount.text isEqual:@""] )
    {
        // NO Contat No Enter:
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
        
        // Call Search Contact Request:
        
        [self CallSearchContactByNumber:self.txt_ContactAccount.text];
    }
}-(void)CallSearchContactByNumber:(NSString *)contactnumber{
    
    [self showAlert];
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<SearchOnlyContact xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<Mobileno>%@</Mobileno>"
                              @"<BUID>%@</BUID>"
                              @"</SearchOnlyContact>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",contactnumber,userDetailsVal_.ORGID];
    
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
//CallSearchContactByNumber
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
        
        if (ContactSearch_Arr)
        {
            
            [ContactSearch_Arr removeAllObjects];
            
        }
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        TBXMLElement *container = [TBXML childElementNamed:@"SearchOnlyContactResponse" parentElement:[TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement]];
        TBXMLElement *ListOfContactInterface =[TBXML childElementNamed:@"tuple" parentElement:container];
  
        if (ListOfContactInterface)
        {
            
            do {
                
                TBXMLElement *Contact  = [TBXML childElementNamed:@"old" parentElement:ListOfContactInterface];
                
                TBXMLElement *SContact  = [TBXML childElementNamed:@"S_CONTACT" parentElement:Contact];
                
                
                searchContact = nil;
                searchContact = [[NewContactLists alloc]init];
                
                
                
                TBXMLElement *MOBILE_NO = [TBXML childElementNamed:@"MOBILE_NO" parentElement:SContact];
                searchContact.MOBILE_NO = [TBXML textForElement:MOBILE_NO];
                
                
                
                TBXMLElement *ADDRESS_ID = [TBXML childElementNamed:@"ADDRESS_ID" parentElement:SContact];
                searchContact.ADDRESS_ID = [TBXML textForElement:ADDRESS_ID];
                
                
                
                TBXMLElement *CONTACT_FIRST_NAME = [TBXML childElementNamed:@"CONTACT_FIRST_NAME" parentElement:SContact];
                searchContact.CONTACT_FIRST_NAME = [TBXML textForElement:CONTACT_FIRST_NAME];
                
                
                
                TBXMLElement *CONTACT_LAST_NAME = [TBXML childElementNamed:@"CONTACT_LAST_NAME" parentElement:SContact];
                
                searchContact.CONTACT_LAST_NAME = [TBXML textForElement:CONTACT_LAST_NAME];
                
                
                TBXMLElement *CONTACT_ID = [TBXML childElementNamed:@"CONTACT_ID" parentElement:SContact];
                searchContact.CONTACT_ID = [TBXML textForElement:CONTACT_ID];
                
                
                
                TBXMLElement *CONTACT_EMAIL_ID = [TBXML childElementNamed:@"CONTACT_EMAIL_ID" parentElement:SContact];
                searchContact.CONTACT_EMAIL_ID = [TBXML textForElement:CONTACT_EMAIL_ID];
                
                
                
                
                TBXMLElement *ADDLINE_ONE = [TBXML childElementNamed:@"ADDLINE_ONE" parentElement:SContact];
                searchContact.ADDLINE_ONE = [TBXML textForElement:ADDLINE_ONE];
                
                
                
                TBXMLElement *ADDLINE_TWO = [TBXML childElementNamed:@"ADDLINE_TWO" parentElement:SContact];
                searchContact.ADDLINE_TWO = [TBXML textForElement:ADDLINE_TWO];
                

                TBXMLElement *STATE = [TBXML childElementNamed:@"STATE" parentElement:SContact];
                
                searchContact.STATE= [TBXML textForElement:STATE];
                
                str_State1=[TBXML textForElement:STATE];
                /* NSLog(@"--- Category :%@",str_State);
                 sr_Pass=@"";
                 sr_Pass = [sr_Pass stringByAppendingString:str_State];
                 newOutput = [NSString stringWithFormat:@"\"%@\"", sr_Pass];
                 NSLog(@"--- newOutput :%@",newOutput);
                 sr_Pass = [@"@" stringByAppendingString:newOutput];
                 NSLog(@"--- newOutput :%@",sr_Pass);*/
                
                
                selected1 = [GetAllStateCodes objectForKey:str_State1];
                NSLog(@"selected %@",selected1);
                
                NSString *knownObject =str_State1;
                NSArray *temp = [GetAllStateCodes allKeysForObject:knownObject];
                NSString *key = [temp lastObject];
                
                NSLog(@"--- Key Data :%@",key);
                
                searchContact.STATE=key;
                
                
                TBXMLElement *DISTRICT = [TBXML childElementNamed:@"DISTRICT" parentElement:SContact];
                searchContact.DISTRICT = [TBXML textForElement:DISTRICT];
                
                
                
                TBXMLElement *CITY = [TBXML childElementNamed:@"CITY" parentElement:SContact];
                
                searchContact.CITY = [TBXML textForElement:CITY];
                
                
                
                
                TBXMLElement *TALUKA = [TBXML childElementNamed:@"TALUKA" parentElement:SContact];
                searchContact.TALUKA = [TBXML textForElement:TALUKA];
                
                
                
                
                TBXMLElement *AREA = [TBXML childElementNamed:@"AREA" parentElement:SContact];
                searchContact.AREA = [TBXML textForElement:AREA];
                
                
                
                TBXMLElement *PANCHAYAT = [TBXML childElementNamed:@"PANCHAYAT" parentElement:SContact];
                
                searchContact.PANCHAYAT = [TBXML textForElement:PANCHAYAT];
                
                
                
                
                TBXMLElement *ZIPCODE = [TBXML childElementNamed:@"ZIPCODE" parentElement:SContact];
                searchContact.ZIPCODE = [TBXML textForElement:ZIPCODE];
                
                
                [ContactSearch_Arr addObject:searchContact];
                
                
            }while ((ListOfContactInterface = ListOfContactInterface->nextSibling));
            if([ContactSearch_Arr count]>0)
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh12" object:self];
                [self PopOverShow];
               // self.View_Account.layer.opacity=0.2;
                
                NSLog(@"-- Count For Search Contact :%lu",(unsigned long)[ContactSearch_Arr count]);
                [self hideAlert];
                [self.searchView setHidden:NO];
                // Reload Table For Display Detials
                // Data Avaialble
                
                _txt_ContactAccount.text=searchContactBack.CONTACT_LAST_NAME;
            }else{
                
                [self hideAlert];
                // No Data
            }
        }
        else
        {
            [self hideAlert];
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"DSE" message:@"No contact found Please Create Contact first" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            alertView.tag=100;
            [alertView show];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        if(alertView.tag==100)
        {
            // Please Create Contact
            NSLog(@"Please Create Contact");
           // [self SwitchContact:self];
            self.SegmentControlProspect.selectedSegmentIndex=0;

            [self SegmentControlProspect:self];
            
        }
        // do something here...
    }
}
-(void)PopOverShow
{
    self.txt_FirsTNameAccount.userInteractionEnabled=NO;
    self.txt_SiteAccount.userInteractionEnabled=NO;
    self.txt_MobileNumberAccount.userInteractionEnabled=NO;
    self.txt_StateAccount.userInteractionEnabled=NO;
    self.txt_DistrictAccount.userInteractionEnabled=NO;
    self.txt_CityAccount.userInteractionEnabled=NO;
    self.txt_TalukaAccount.userInteractionEnabled=NO;
    self.txt_AreaAccount.userInteractionEnabled=NO;
    self.txt_PanchayatAccount.userInteractionEnabled=NO;
    self.txt_PincodeAccount.userInteractionEnabled=NO;
    self.txt_AddressLineAccount1.userInteractionEnabled=NO;
    self.txt_AddressLinrAccount2.userInteractionEnabled=NO;

}
-(void)PopOverdismiss
{
    self.txt_FirsTNameAccount.userInteractionEnabled=YES;
    self.txt_SiteAccount.userInteractionEnabled=YES;
    self.txt_MobileNumberAccount.userInteractionEnabled=YES;
    self.txt_StateAccount.userInteractionEnabled=YES;
    self.txt_DistrictAccount.userInteractionEnabled=YES;
    self.txt_CityAccount.userInteractionEnabled=YES;
    self.txt_TalukaAccount.userInteractionEnabled=YES;
    self.txt_AreaAccount.userInteractionEnabled=YES;
    self.txt_PanchayatAccount.userInteractionEnabled=YES;
    self.txt_PincodeAccount.userInteractionEnabled=YES;
    self.txt_AddressLineAccount1.userInteractionEnabled=YES;
    self.txt_AddressLinrAccount2.userInteractionEnabled=YES;
    
}
- (void)ReloadDataFunctionSearchBack:(NSNotification*)notification
{
    [self.searchView setHidden:YES];
    _txt_ContactAccount.text=[[searchContactBack.CONTACT_FIRST_NAME stringByAppendingString:@" "]stringByAppendingString:searchContactBack.CONTACT_LAST_NAME];
    NSLog(@"-- Search Back Contact id :%@",searchContactBack.CONTACT_ID);
}
- (IBAction)btn_SaveDraftAccount:(id)sender {
}
- (IBAction)btn_SubmitAccount:(id)sender {
    
    
    categoryStringAccount=GetAllStateCodes[_txt_StateAccount.text];
    NSLog(@"-- Selected State :%@",categoryString);
    
    // Account Creation :
    [self showAlert];
    
    if ([_txt_FirsTNameAccount.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Enter Account Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_SiteAccount.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Enter Site Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([_txt_MobileNumberAccount.text isEqualToString:@""]) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if (_txt_MobileNumberAccount.text && _txt_MobileNumberAccount.text.length < 10) {
        [self hideAlert];
        
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert setTag:0];
        [alert show];
    }
    else if ([mobileNumberPred evaluateWithObject:_txt_MobileNumberAccount.text] != YES && [_txt_MobileNumberAccount.text length] != 0) {
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([pintest evaluateWithObject:_txt_PincodeAccount.text] != YES && [_txt_PincodeAccount.text length] != 0) {
        
        [self hideAlert];
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid pincode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert setTag:0];
        [alert show];
        
    }
    else{
        [self createAccount];
    }
}//createAccount
- (void)createAccount
{
    [self showAlert];
    NSString* envelopeText;
    
    if(![self.txt_StateAccount.text isEqual:@""]){
        
        NSLog(@"-- Address Field 1: %@",_txt_AddressLineAccount1.text);
        NSLog(@"-- Address Field 2: %@",_txt_AddressLinrAccount2.text);
        
        if ([_txt_StateAccount.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT STATE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        
        else if ([_txt_DistrictAccount.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT DISTRICT" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([_txt_CityAccount.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT CITY" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([_txt_TalukaAccount.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select CONTACT TALUKA" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }
        else if ([_txt_AddressLineAccount1.text isEqualToString:@""]) {
            [self hideAlert];
            
            alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter CONTACT ADDRESS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert setTag:0];
            [alert show];
        }else{
            
            NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _txt_AddressLineAccount1.text, @"."];
            self.integration_id=[NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
//            NSLog(@"%d",[integration_id intValue]);
//             NSLog(@"%lld",[integration_id longLongValue]);
//            NSTimeInterval timeInMiliseconds = [[NSDate date] timeIntervalSince1970];
            

            NSString * envelopeText = [NSString stringWithFormat:
                                       @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                                       @"<soapenv:Header />"
                                       @"<soapenv:Body>"
                                       @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                                       @"<ListOfAccountInterface>"
                                       @"<Account operation=\"\">"
                                       @"<IntegrationId>%lld</IntegrationId>"
                                       @"<Location>%@</Location>"
                                       @"<MainPhoneNumber>%@</MainPhoneNumber>"
                                       @"<Name>%@</Name>"
                                       @"<ListOfBusinessAddress>"
                                       @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                                       @"<AddressIntegrationId>%lld</AddressIntegrationId>"
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
                                       @"</soapenv:Envelope>",
                                       [self.integration_id longLongValue],_txt_SiteAccount.text,
                                       _txt_MobileNumberAccount.text,
                                       _txt_FirsTNameAccount.text,[self.integration_id longLongValue],_txt_CityAccount.text,_txt_PincodeAccount.text,categoryStringAccount,acoounaddressline1,_txt_AddressLinrAccount2.text,_txt_DistrictAccount.text,_txt_TalukaAccount.text,searchContactBack.CONTACT_ID,
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
        
    }else{
        
        NSLog(@"-- Address Field : %@",_txt_AddressLineAccount1.text);
        NSLog(@"-- Address Field : %@",_txt_AddressLinrAccount2.text);
        
        envelopeText = [NSString stringWithFormat:
                        @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                        @"<soapenv:Header/>"
                        @"<soapenv:Body>"
                        @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                        @"<ListOfAccountInterface>"
                        @"<Account operation=\"\">"
                        @"<IntegrationId>%ld</IntegrationId>"
                        @"<Location>%@</Location>"
                        @"<MainPhoneNumber>%@</MainPhoneNumber>"
                        @"<Name>%@</Name>"
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
                        @"</soapenv:Envelope>",(long)[[NSDate date] timeIntervalSince1970],_txt_SiteAccount.text,_txt_MobileNumberAccount.text,_txt_FirsTNameAccount.text,searchContactBack.CONTACT_ID,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSITION_ID,userDetailsVal_.ORGNAME];
        
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
        [[RequestDelegate alloc] initiateRequest:request name:@"accountCreation"];
    }
}
-(void)accountcreation_found:(NSNotification*)notification
{
    
    NSError *err;
    NSString *response = [[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse. CreateAccountAgainst_ContactFound...%@",response);
    if ([response isEqual:@""])
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    else if ([response rangeOfString:@"soapenv:Fault"].location != NSNotFound )
    {
        
        if ([response rangeOfString:@"Record with identical values already exists in the Siebel database."].location != NSNotFound) {
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
        ACCOUNTID_Account = [TBXML textForElement:AccountId];
        
        NSLog(@"account ID %@",ACCOUNTID_Account);
        
        [self hideAlert];
        if(![ACCOUNTID_Account length] == 0)
        {
            [self hideAlert];
            
          /*  _txt_FirsTNameAccount.text=@"";
            _txt_SiteAccount.text=@"";
            _txt_MobileNumberAccount.text=@"";
            _txt_ContactAccount.text=@"";
            _txt_MobileNumberAccount.text=@"";
            _txt_FirsTNameAccount.text=@"";
            _txt_ContactAccount.text=@"";
            _txt_SiteAccount.text=@"";
            _txt_StateAccount.text=@"";
            _txt_TalukaAccount.text=@"";
            _txt_PincodeAccount.text=@"";
            _txt_CityAccount.text=@"";
            _txt_District.text=@"";
            _txt_Area.text=@"";
            _txt_Panchayat.text=@"";
            _txt_Addressine2.text=@"";
            _txt_AddressLine1.text=@"";
            
            */
            [self createAccount1];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Prospect created successfully" message:ACCOUNTID_Account delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            
            
            //[self accountOptylinking];
        }
        [self hideAlert];
    }
}
- (void)createAccount1
{
    NSString * acoounaddressline1 = [NSString stringWithFormat:@"%@%@", _txt_AddressLineAccount1.text, @"."];
    
    
    NSString * envelopeText = [NSString stringWithFormat:
                               @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:acc=\"http://www.siebel.com/xml/Account%%20Interface\" xmlns:asi=\"http://siebel.com/asi/\">"
                               @"<soapenv:Header />"
                               @"<soapenv:Body>"
                               @"<asi:SFATMCVAccountInsertOrUpdate_Input>"
                               @"<ListOfAccountInterface>"
                               @"<Account operation=\"\">"
                               @"<IntegrationId>%lld</IntegrationId>"
                               @"<Location>%@</Location>"
                               @"<MainPhoneNumber>%@</MainPhoneNumber>"
                               @"<Name>%@</Name>"
                               @"<ListOfBusinessAddress>"
                               @"<BusinessAddress IsPrimaryMVG=\"Y\" operation=\"\">"
                               @"<AddressIntegrationId>%lld</AddressIntegrationId>"
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
                               @"</soapenv:Envelope>",
                               [self.integration_id longLongValue],_txt_SiteAccount.text,
                               _txt_MobileNumberAccount.text,
                               _txt_FirsTNameAccount.text,[self.integration_id longLongValue],_txt_CityAccount.text,_txt_PincodeAccount.text,categoryStringAccount,acoounaddressline1,_txt_AddressLinrAccount2.text,_txt_DistrictAccount.text,_txt_TalukaAccount.text,searchContactBack.CONTACT_ID,
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
    [[RequestDelegate alloc]initiateRequest:request name:@"accountCreation1"];

}
-(void)accountcreation_found1:(NSNotification*)notification
{
    NSError *err;
    NSString *response = [[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse. CreateAccountAgainst_ContactFound...%@",response);
}
- (IBAction)btn_CreateOptyAccount:(id)sender
{
     flagset=@"fromCreateProspect";
    CreateNewOpportunityViewController* searchOpportunityResult_VC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createnewopportunity"];
    searchOpportunityResult_VC1.flagset=flagset;
    searchOpportunityResult_VC1.fnamea=self.txt_FirstName.text;
    searchOpportunityResult_VC1.lnamea=self.txt_LastName.text;
    searchOpportunityResult_VC1.mobilea=self.txt_MobileNumber.text;
    searchOpportunityResult_VC1.emaila=self.txt_Email.text;
    searchOpportunityResult_VC1.pana=self.txt_PanNo.text;
    searchOpportunityResult_VC1.accnamec=self.txt_FirsTNameAccount.text;
    searchOpportunityResult_VC1.sitec=self.txt_SiteAccount.text;
    searchOpportunityResult_VC1.mainphonec=self.txt_MobileNumberAccount.text;
    
    searchOpportunityResult_VC1.statea=self.txt_StateAccount.text;
    searchOpportunityResult_VC1.districta=self.txt_DistrictAccount.text;
    searchOpportunityResult_VC1.citya=self.txt_CityAccount.text;
    searchOpportunityResult_VC1.talukaa=self.txt_TalukaAccount.text;
    searchOpportunityResult_VC1.panchayata=self.txt_PanchayatAccount.text;
    searchOpportunityResult_VC1.add1a=self.txt_AddressLineAccount1.text;
    searchOpportunityResult_VC1.add2a=self.txt_AddressLinrAccount2.text;
    searchOpportunityResult_VC1.areaa=self.txt_AreaAccount.text;
    searchOpportunityResult_VC1.pina=self.txt_PincodeAccount.text;
    
    searchOpportunityResult_VC1.statec=self.txt_State.text;
    searchOpportunityResult_VC1.districtc=self.txt_District.text;
    searchOpportunityResult_VC1.cityc=self.txt_City.text;
    searchOpportunityResult_VC1.talukac=self.txt_Taluka.text;
    searchOpportunityResult_VC1.panchayatc=self.txt_Panchayat.text;
    searchOpportunityResult_VC1.add1c=self.txt_AddressLine1.text;
    searchOpportunityResult_VC1.add2c=self.txt_Addressine2.text;
    searchOpportunityResult_VC1.areac=self.txt_Area.text;
    searchOpportunityResult_VC1.pinc=self.txt_Pincode.text;
    [self.navigationController pushViewController:searchOpportunityResult_VC1 animated:YES];
    
}
#pragma mark - TableView Methods


#pragma mark - KeyBoard Methods

- (void)keyboardDidShowWithNotification:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGPoint adjust;
                         switch (self.interfaceOrientation) {
                             case UIInterfaceOrientationLandscapeLeft:
                                 adjust = CGPointMake(-110, 0);
                                 break;
                             case UIInterfaceOrientationLandscapeRight:
                                 adjust = CGPointMake(110, 0);
                                 break;
                             default:
                                 adjust = CGPointMake(0, -60);
                                 break;
                         }
                         CGPoint newCenter = CGPointMake(self.view.center.x+adjust.x, self.view.center.y+adjust.y);
                         [self.view setCenter:newCenter];
                         [self.author setAlpha:0];
                         [self.demoTitle setAlpha:0];
                         [self.typeSwitch setAlpha:0];
                         
                     }
                     completion:nil];
}
- (void)keyboardDidHideWithNotification:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGPoint adjust;
                         switch (self.interfaceOrientation) {
                             case UIInterfaceOrientationLandscapeLeft:
                                 adjust = CGPointMake(110, 0);
                                 break;
                             case UIInterfaceOrientationLandscapeRight:
                                 adjust = CGPointMake(-110, 0);
                                 break;
                             default:
                                 adjust = CGPointMake(0, 60);
                                 break;
                         }
                         CGPoint newCenter = CGPointMake(self.view.center.x+adjust.x, self.view.center.y+adjust.y);
                         [self.view setCenter:newCenter];
                         [self.author setAlpha:1];
                         [self.demoTitle setAlpha:1];
                         [self.typeSwitch setAlpha:1];
                     }
                     completion:nil];
    [self.autocompleteTextField setAutoCompleteTableViewHidden:NO];
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
     self.keyboardIsShown = YES;
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
         self.keyboardIsShown = NO;
        [self setViewMovedUp:NO];
        
    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:self.txt_Pincode])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
          //  [self setViewMovedUp:YES];
        }
    }
}
//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    if (self.keyboardIsShown) {
        return;
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
       // rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
       // rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

@end
