//
//  LoginViewController.m
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "AppDelegate.h"
#import "DSE.h"
#import "DSM.h"
#import "DetailViewController.h"
#import "LoginViewController.h"
#import "MBProgressHUD.h"
#import "MasterViewController.h"
#import "RequestDelegate.h"
#import "SSKeychain.h"
#import "SSKeychainQuery.h"
#import "TBXML.h"
@interface LoginViewController () {
    NSString *userName, *passWord, *user, *pass;
    NSString *password, *usernamme;
    NSArray *logingetUD, *str_CurrentDate;
    int* imageflag;
}
@end
@implementation LoginViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    NSLog(@"login..");

    imageflag = 0;
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //AppDelegate instance
    userDetailsVal_ = [UserDetails_Var sharedmanager];
    userDetailsVal_.Login_Name = @"";
    userDetailsArray = [[NSMutableArray alloc] init];
    appdelegate.flagappname = @"";
    userDetailsVal_.ROW_ID = @"";
    NSLog(@"row id cleared%@", userDetailsVal_.ROW_ID);
    user = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    pass = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    NSString* number = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSLog(@".... Detials : %@ %@--> %@", user, pass, number);
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //AppDelegate instance
    [self.username setBackgroundColor:[UIColor clearColor]];
    [self.username.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.username setTextColor:[UIColor colorWithRed:(0 / 255.0) green:(0 / 255.0) blue:(0 / 255.0) alpha:1]];
    [self.username.layer setBorderWidth:1.0];
    ;
    [self.username.layer setCornerRadius:16.0f];
    self.username.textAlignment = NSTextAlignmentCenter;
    if ([self.username respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor* color = [UIColor blackColor];
        self.username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"USER ID" attributes:@{ NSForegroundColorAttributeName : color }];
    }
    else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    // self.username.placeholder = @"Username";
    [self.password setBackgroundColor:[UIColor clearColor]];
    [self.password.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.password setTextColor:[UIColor colorWithRed:(0 / 255.0) green:(0 / 255.0) blue:(0 / 255.0) alpha:1]];
    [self.password.layer setBorderWidth:1.0];
    [self.password.layer setCornerRadius:16.0f];
    self.password.placeholder = @"Password";
    self.password.textAlignment = NSTextAlignmentCenter;
    if ([self.password respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor* color = [UIColor blackColor];
        self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD" attributes:@{ NSForegroundColorAttributeName : color }];
    }
    else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    self.LoginButton.layer.cornerRadius = 16; // this value vary as per your desire
    self.LoginButton.clipsToBounds = YES;
    globalVariables_ = [[GlobalVariables alloc] init];
    userDetailsVal_ = [UserDetails_Var sharedmanager];
    if (!GlobalVariablesArray_) {
        GlobalVariablesArray_ = [[NSMutableArray alloc] init];
    }
    else {

        [GlobalVariablesArray_ removeAllObjects];
    }

    password = [SSKeychain passwordForService:@"AnyService" account:@"AnyUser"];
    usernamme = [SSKeychain passwordForService:@"AnyService" account:@"AnyUser1"];
    self.username.text = usernamme;
    self.password.text = password;

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MMM-yy";
    //NSString * monthString = [[dateFormatter stringFromDate:date] capitalizedString];

    NSString* str_Ping = [[formatter stringFromDate:[NSDate date]] capitalizedString];
    NSLog(@"-- /   Date Formatter :%@", str_Ping);
    //str_Ping=[str_Ping capitalizedString];

    str_Ping = [str_Ping uppercaseStringWithLocale:[NSLocale currentLocale]];
    NSLog(@"Upper Case: %@", str_Ping);

    //SA3_1008870/HSA1@509C9CE572
    //SC3_1008870  excel2017*  DSM
    //RP1_1008870  excel2015    DSE

   //  self.username.text=@"RP1_1008890";
   //  self.password.text=@"excel2015";

 //   self.username.text=@"RP1_1008870";
  //  self.password.text=@"excel2015";

// For Todays  DSE Live //Production
    
    //self.username.text = @"SG3_1008870";
    //self.password.text = @"ISG1@509C9CE790";
    
 //   self.username.text = @"AU1_1008870";
 //  self.password.text = @"IAU@509C9CE581";

    // DSM Live

    //   AU1_1008870
    //   IAU@509C9CE581

    // DSM Live
   //   self.username.text=@"SC3_1008870";
    //  self.password.text=@"excel2017*";

    //   self.username.text=@"GL3_1008870";
    //  self.password.text=@"rahul1475*";

    //  GL3_1008870  rahul1475*  TMCV-Sal-W-PUN-1008870-Tathavade-HCVCargo-DSM

    // self.username.text=@"SARITAK_1001680";    // For NEEv
    // self.password.text=@"TATA2015";

//           self.username.text = @"SAMSONJ1001680"; // For DSM
//           self.password.text = @"TATA2018";
    
   // self.username.text = @"SG3_1008870"; // For DSM
      //      self.password.text = @"ISG1@509C9CE790";

//        self.username.text = @"JJOSHI1001680";  // For DSE
//        self.password.text = @"NANO2016";
    
//    self.username.text = @"SM6_1008870";  // For DSE
//    self.password.text = @"HSM3@509C9CE573";

    _transitionImageView = [[LTransitionImageView alloc] initWithFrame:CGRectMake(20, 50, 600, 600)];
    _transitionImageView.animationDuration = 3;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSLog(@"\n View Will Appear.....");

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(artifactFound:) name:@"artifactFound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(artifactFailed:) name:@"artifactFailed" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(authenticateOIDFound:) name:@"authenticateOIDFound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestDateFound:) name:@"requestDateFound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDetailsFound:) name:@"userDetailsFound" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDetailsFailed:) name:@"userDetailsFailed" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    NSLog(@"\nView Did Dissapears...!!!!");

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"artifactFound" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"artifactFailed" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"authenticateOIDFound" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"requestDateFound" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"userDetailsFound" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"userDetailsFailed" object:nil];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
        [self startAnimations];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)loginScreeb:(id)sender
{
    // [self callArtifactRequest];

    userName = self.username.text;
    passWord = self.password.text;

    NSLog(@"Username : - %@", self.username.text);
    NSLog(@"Password : - %@", self.password.text);

    NSLog(@"app status %@", appdelegate.flagappname);

    [self showAlert];

    if (self.username.text.length == 0 || self.password.text.length == 0) {

        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter USER ID and PASSWORD" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        if (imageflag == 0) {

            [SSKeychain setPassword:@"" forService:@"AnyService" account:@"AnyUser"];
            [SSKeychain setPassword:@"" forService:@"AnyService" account:@"AnyUser1"];
        }
        else {

            [SSKeychain setPassword:self.password.text forService:@"AnyService" account:@"AnyUser"];
            [SSKeychain setPassword:self.username.text forService:@"AnyService" account:@"AnyUser1"];
        }
        [self callArtifactRequest];
    }

    /* self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
     MasterViewController *masterViewController = [storyboard instantiateViewControllerWithIdentifier:@"masterViewController"];
     
     self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
     self.window.rootViewController = self.navigationController;
     } else {
     MasterViewController *masterViewController = [storyboard instantiateViewControllerWithIdentifier:@"masterViewController"];
     UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
     
     DetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
     
     
     UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
     
     masterViewController.detailViewController = detailViewController;
     
     self.splitViewController = [[UISplitViewController alloc] init];
     self.splitViewController.delegate = detailViewController;
     self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];
     
     self.window.rootViewController = self.splitViewController;
     }
     [self.window makeKeyAndVisible];
    */
    //return YES;

    /*
    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         UISplitViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SplitView"];
         //self.window = [[UIApplication sharedApplication] keyWindow];
         app_delegate.window.rootViewController= vc;*/

    // UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Attention!" message:@"The internet connection seems to be offline!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    // [alertView show];
    // [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"] animated:NO];
}

- (void)callArtifactRequest
{

    NSLog(@"appname %@", appdelegate.flagappname);

    NSString* envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                                        @"<SOAP:Header>"
                                                        @"<wsse:Security xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\">"
                                                        @"<wsse:UsernameToken xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\">"
                                                        @"<wsse:Username>%@</wsse:Username>"
                                                        @"<wsse:Password>%@</wsse:Password>"
                                                        @"</wsse:UsernameToken>"
                                                        @"</wsse:Security>"
                                                        @"<header xmlns=\"http://schemas.cordys.com/General/1.0/\">"
                                                        @"<Logger xmlns=\"http://schemas.cordys.com/General/1.0/\"/>"
                                                        @"</header>"
                                                        @"</SOAP:Header>"
                                                        @"<SOAP:Body>"
                                                        @"<samlp:Request xmlns:samlp=\"urn:oasis:names:tc:SAML:1.0:protocol\" MajorVersion=\"1\" MinorVersion=\"1\" IssueInstant=\"2010-05-03T06:53:51Z\" RequestID=\"aa23159489-0126-1853-28ca-d7024556c36\">"
                                                        @"<samlp:AuthenticationQuery>"
                                                        @"<saml:Subject xmlns:saml=\"urn:oasis:names:tc:SAML:1.0:assertion\">"
                                                        @"<saml:NameIdentifier Format=\"urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified\">%@</saml:NameIdentifier>"
                                                        @"</saml:Subject>"
                                                        @"</samlp:AuthenticationQuery>"
                                                        @"</samlp:Request>"
                                                        @"</SOAP:Body>"
                                                        @"</SOAP:Envelope>",
                                       self.username.text, self.password.text, self.username.text];

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    //<string name="URL">https://tmcrmappsqa.inservices.tatamotors.com/cordys/com.eibus.web.soap.Gateway.wcp?organization=o=MobileApps,cn=cordys,cn=cbop,o=tatamotors.com</string>
    
    
    //Production
  NSURL* theurl = [NSURL URLWithString:@"https://tmcrmapps.inservices.tatamotors.com/cordys/com.eibus.web.soap.Gateway.wcp?organization=o=MobileApps,cn=cordys,cn=cbop,o=tatamotors.com"];
    
    
    //QA
//    NSURL* theurl = [NSURL URLWithString:@"http://tmcrmappsqa.inservices.tatamotors.com/cordys/com.eibus.web.soap.Gateway.wcp?organization=o=MobileApps,cn=cordys,cn=cbop,o=tatamotors.com"];


       //NSURL * theurl = [NSURL URLWithString:@"http://tmcrmappsqa.inservices.tatamotors.com/cordys/com.eibus.web.soap.Gateway.wcp?organization=o=MobileApps,cn=cordys,cn=cbop,o=tatamotors.com"];
    
    NSLog(@"URL IS %@", theurl);
    
    NSLog(@"REQUEST IS %@", envelopeText);
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:50];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"artifactRequest"];
}



- (void)artifactFound:(NSNotification*)notification
{

    NSLog(@"APP NAME %@", appdelegate.flagappname);
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    NSLog(@"--- Response : --- %@", response);
    if ([response rangeOfString:@"samlp:Response"].location == NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter valid USER ID/PASSWORD" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView*  alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else {
        @try {
            TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
            TBXMLElement* body = [TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement];

            TBXMLElement* samlResponse = [TBXML childElementNamed:@"samlp:Response" parentElement:body];
            if (samlResponse) {
                TBXMLElement* art = [TBXML childElementNamed:@"samlp:AssertionArtifact" parentElement:samlResponse];
                appdelegate.artifact = [TBXML textForElement:art];
                NSLog(@"Samlp Art:%@", appdelegate.artifact);

                //  [self callDateRequest];

                [self CallUserDetails];
            }
            else {
                [self hideAlert];

                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Error in connecting to server. Please try later!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

                [alertView show];
            }
        }
        @catch (NSException* exception) {
            [self hideAlert];

            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Error in connecting to server. Please try later!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

            [alertView show];
        }
    }
}


- (void)artifactFailed:(NSNotification*)notification
{
    NSString* errorString = [[notification userInfo] objectForKey:@"error"];
    NSLog(@"%@", errorString);
    if ([errorString isEqualToString:@"offline"]) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"The internet connection seems to be offline!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"] animated:NO];
    }
}


- (void)callDateRequest
{
    NSString* envelopeText = [NSString stringWithFormat:

                                           @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                           @"<SOAP:Body><getCurrentDate xmlns=\"http://schemas.cordys.com/DateUtils\" />"
                                           @"</SOAP:Body>"
                                           @"</SOAP:Envelope>"];

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS .... %@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"dateRequest"];
}


- (void)requestDateFound:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    TBXMLElement* body = [TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement];

    TBXMLElement* currentDate = [TBXML childElementNamed:@"getCurrentDate" parentElement:[TBXML childElementNamed:@"getCurrentDate" parentElement:[TBXML childElementNamed:@"old" parentElement:[TBXML childElementNamed:@"tuple" parentElement:[TBXML childElementNamed:@"getCurrentDateResponse" parentElement:body]]]]];

    NSString* _ParseCurrentDate = [TBXML textForElement:currentDate];

    NSLog(@"\nCurrent date...!!!! %@", _ParseCurrentDate);
    // Convert string to date object
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
    NSDate* date = [dateFormat dateFromString:_ParseCurrentDate];

    NSLog(@"\nCurrent dateaa...!!!! %@", date);
}

- (void)callauthenticateOIDRequest
{
    NSLog(@"inside ...CallAunthrnticate");

    NSString* envelopeText = [NSString stringWithFormat:@"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                                        @"<SOAP:Body>"
                                                        @"<authenticateAgainstOID xmlns=\"http://schemas.cordys.com/OIDAuthentication\">"
                                                        @"<stringParam>%@</stringParam>"
                                                        @"<stringParam1>%@</stringParam1>"
                                                        @"</authenticateAgainstOID>"
                                                        @"</SOAP:Body>"
                                                        @"</SOAP:Envelope>",
                                       _username.text, _password.text];

    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"Envelop..%@", envelope);
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL..%@", theurl);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];

    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];

    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"authenticateOIDRequest"];
}
- (void)authenticateOIDFound:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];
    if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"The username or password you entered is incorrect.\n*The user account will be locked after 3 unsucessfull attempts."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
        [self hideAlert];
    }
    else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Request connection Time Out " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        NSLog(@"Error TBXML...%@", tbxml);
        NSLog(@"Error ...%@", err);
        TBXMLElement* body = [TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement];
        TBXMLElement* auth1 = [TBXML childElementNamed:@"authenticateAgainstOID" parentElement:[TBXML childElementNamed:@"old" parentElement:[TBXML childElementNamed:@"tuple" parentElement:[TBXML childElementNamed:@"authenticateAgainstOIDResponse" parentElement:body]]]];

        TBXMLElement* auth = [TBXML childElementNamed:@"authenticateAgainstOID" parentElement:auth1];
        NSLog(@"Authentication....%@", auth);
        if (auth) {
            NSLog(@"\nLogin Authentications ... is true....");
            [self callDateRequest];
            [self CallUserDetails];
        }
        else {
            NSLog(@"\n Login Autntications .... are fail.... ");
        }
    }
}

- (void)CallUserDetails
{

    NSLog(@"test user %@", self.username.text);
    /*
     <SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
     <SOAP:Body>
     <GetPrimaryPositionEmployee xmlns="com.cordys.tatamotors.Dsmsiebelwsapp" preserveSpace="no" qAccess="0" qValues="">
     <LOGIN>SAMSONJ1001680</LOGIN>
     </GetPrimaryPositionEmployee>
     </SOAP:Body>
     </SOAP:Envelope>
     OLD 
     NSString* envelopeText = [NSString stringWithFormat:
     @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     @"<SOAP:Body>"
     @"<GetPositionDetailsFromLogin xmlns=\"http://schemas.cordys.com/com.cordys.tatamotors.utilitysiebelwsapps\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
     @"<LOGIN>%@</LOGIN>"
     @"</GetPositionDetailsFromLogin>"
     @"</SOAP:Body>"
     @"</SOAP:Envelope>",
     self.username.text];
     */
    //NSString *str_LoginName=

    NSString* envelopeText = [NSString stringWithFormat:
                                           @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                           @"<SOAP:Body>"
                                           @"<GetPrimaryPositionEmployee xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                                           @"<LOGIN>'%@'</LOGIN>"
                                           @"</GetPrimaryPositionEmployee>"
                                           @"</SOAP:Body>"
                                           @"</SOAP:Envelope>",
                                       self.username.text];
    
    NSData* envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* theurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@&SAMLart=%@", appdelegate.URL, appdelegate.artifact]];
    NSLog(@"URL IS %@", theurl);
    NSLog(@"REQUEST IS %@", envelopeText);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:theurl];
    NSString* msglength = [NSString stringWithFormat:@"%lu", (unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc] initiateRequest:request name:@"userDetailsRequest"];
}

- (void)userDetailsFound:(NSNotification*)notification
{
    NSError* err;
    NSString* response = [[notification userInfo] objectForKey:@"response"];

    NSLog(@"response USerDetails :%@", response);
    
    if ([response isEqual:@""]) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No data found.Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([response rangeOfString:@"SOAP:Fault"].location != NSNotFound) {
        [self hideAlert];
      UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong.Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else if ([response rangeOfString:@"Connection Timed Out"].location != NSNotFound) {
        [self hideAlert];
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else{
    

    TBXML* tbxml = [TBXML newTBXMLWithXMLString:response error:&err];

    [userDetailsArray removeAllObjects];

    userDetailsVal_.Login_Name = @"";
    userDetailsVal_.POSITION_NAME = @"";
    userDetailsVal_.LOB_NAME = @"";
    userDetailsVal_.REGION_NAME = @"";
    userDetailsVal_.AREA = @"";
    userDetailsVal_.STATE = @"";
    userDetailsVal_.ROW_ID = @"";
    userDetailsVal_.POSTN = @"";
    userDetailsVal_.ORGNAME = @"";

    appdelegate.flagappname = @"";

    NSLog(@"appname %@", appdelegate.flagappname);

    NSLog(@" user values  ---  %@,%@,%@,%@,%@,%@,%@,%@,%@", userDetailsVal_.Login_Name, userDetailsVal_.POSITION_NAME, userDetailsVal_.LOB_NAME, userDetailsVal_.REGION_NAME, userDetailsVal_.AREA, userDetailsVal_.STATE, userDetailsVal_.ROW_ID, userDetailsVal_.POSTN, userDetailsVal_.ORGNAME);
    TBXMLElement* soapBody = [TBXML childElementNamed:@"SOAP:Body" parentElement:tbxml.rootXMLElement];
    TBXMLElement* container = [TBXML childElementNamed:@"GetPrimaryPositionEmployeeResponse" parentElement:soapBody];

    if (container) {
        TBXMLElement* tuple = [TBXML childElementNamed:@"tuple" parentElement:container];
        if (tuple) {

            do {

                container = [TBXML childElementNamed:@"S_USER" parentElement:[TBXML childElementNamed:@"old" parentElement:tuple]];

                TBXMLElement* POSITION_NAME = [TBXML childElementNamed:@"POSITION_NAME" parentElement:container];
                NSString* _POSITION_NAME = [TBXML textForElement:POSITION_NAME];
                userDetailsVal_.POSITION_NAME = _POSITION_NAME;
                NSLog(@"\n POSITION_NAME %@", _POSITION_NAME);
                NSLog(@"\n POSITION_NAME %@", _POSITION_NAME);

                logingetUD = [_POSITION_NAME componentsSeparatedByString:@"-"];
                NSLog(@"Elents...on   %@", [logingetUD objectAtIndex:[logingetUD count] - 1]);
                appdelegate.loginUD = [logingetUD objectAtIndex:[logingetUD count] - 1];

                /*  if([appdelegate.loginUD isEqual:@"DSM"])
            {
                userDetailsVal_.POSITION_TYPE=@"DSM";
                
            }else{
                userDetailsVal_.POSITION_TYPE=@"DSE";
            }*/

                TBXMLElement* POSITION_ID = [TBXML childElementNamed:@"POSITION_ID" parentElement:container];
                NSString* _POSITION_ID = [TBXML textForElement:POSITION_ID];
                userDetailsVal_.POSITION_ID = _POSITION_ID;

                /*
             <S_USER
             xmlns="com.cordys.tatamotors.Dsmsiebelwsapp">
             <POSITION_NAME>TMCV-Sal-W-MUM-1001680-Thane-Pickup-DSM</POSITION_NAME>
             <POSITION_ID>1-70Z</POSITION_ID>
             <DIVISION_ID>1-2E8BZ</DIVISION_ID>
             <DIVISION_NAME>1001680-Sales-Thane-Bafna</DIVISION_NAME>
             <DIV_ADD_ID>1-7DEBS2Z</DIV_ADD_ID>
             <DIV_STATE>MH</DIV_STATE>
             <DIV_DIST>THANE</DIV_DIST>
             <DIV_CITY>THANE</DIV_CITY>
             <ORGANIZATION_ID>1-560</ORGANIZATION_ID>
             <ORGANIZATION_NAME>BAFNA Motors (Mumbai) Pvt. Ltd.</ORGANIZATION_NAME>
             <EMP_ROW_ID>1-50E9AE</EMP_ROW_ID>
             <LOB>Pickups</LOB>
             <PRIMARY_POSTNID>1-70Z</PRIMARY_POSTNID>
             <PRIMARY_EMP>1-2YY5DBR</PRIMARY_EMP>
             </S_USER>
             */

                TBXMLElement* DIVISION_ID = [TBXML childElementNamed:@"DIVISION_ID" parentElement:container];
                NSString* _DIVISION_ID = [TBXML textForElement:DIVISION_ID];
                userDetailsVal_.DIVISION_ID = _DIVISION_ID;

                TBXMLElement* DIVISION_NAME = [TBXML childElementNamed:@"DIVISION_NAME" parentElement:container];
                NSString* _DIVISION_NAME = [TBXML textForElement:DIVISION_NAME];
                userDetailsVal_.DIVISION_NAME = _DIVISION_NAME;

                TBXMLElement* DIV_ADD_ID = [TBXML childElementNamed:@"DIV_ADD_ID" parentElement:container];
                NSString* _DIV_ADD_ID = [TBXML textForElement:DIV_ADD_ID];
                userDetailsVal_.DIV_ADD_ID = _DIV_ADD_ID;

                TBXMLElement* STATE = [TBXML childElementNamed:@"DIV_STATE" parentElement:container];
                NSString* _STATE = [TBXML textForElement:STATE];
                userDetailsVal_.STATE = _STATE;
                NSLog(@"\n _AREA %@", _STATE);

                TBXMLElement* DIV_DIST = [TBXML childElementNamed:@"DIV_DIST" parentElement:container];
                NSString* _DIV_DIST = [TBXML textForElement:DIV_DIST];
                userDetailsVal_.DISTRICT = _DIV_DIST;
                NSLog(@"\n _AREA %@", _DIV_DIST);

                TBXMLElement* DIV_CITY = [TBXML childElementNamed:@"DIV_CITY" parentElement:container];
                NSString* _DIV_CITY = [TBXML textForElement:DIV_CITY];
                userDetailsVal_.CITY = _DIV_CITY;
                NSLog(@"\n _AREA %@", _DIV_CITY);

                TBXMLElement* ORGANIZATION_ID = [TBXML childElementNamed:@"ORGANIZATION_ID" parentElement:container];
                NSString* _ORGANIZATION_ID = [TBXML textForElement:ORGANIZATION_ID];
                userDetailsVal_.ORGID = _ORGANIZATION_ID;
                NSLog(@"\n _ORGNAME %@", userDetailsVal_.ORGID);

                TBXMLElement* ORGNAME = [TBXML childElementNamed:@"ORGANIZATION_NAME" parentElement:container];
                NSString* _ORGNAME = [TBXML textForElement:ORGNAME];
                userDetailsVal_.ORGNAME = _ORGNAME;
                NSLog(@"\n _ORGNAME %@", userDetailsVal_.ORGNAME);

                TBXMLElement* ROW_ID = [TBXML childElementNamed:@"EMP_ROW_ID" parentElement:container];
                NSString* _ROW_ID = [TBXML textForElement:ROW_ID];
                userDetailsVal_.ROW_ID = _ROW_ID;
                NSLog(@"\n _ROW_ID %@", _ROW_ID);

                TBXMLElement* LOB_NAME = [TBXML childElementNamed:@"LOB" parentElement:container];
                NSString* _LOB_NAME = [TBXML textForElement:LOB_NAME];
                userDetailsVal_.LOB_NAME = _LOB_NAME;
                NSLog(@"\n LOB_NAME %@", _LOB_NAME);

                TBXMLElement* POSTN = [TBXML childElementNamed:@"PRIMARY_POSTNID" parentElement:container];
                NSString* _POSTN = [TBXML textForElement:POSTN];
                userDetailsVal_.POSTN = _POSTN;
                NSLog(@"\nuser application type  %@", _POSTN);

                TBXMLElement* PRIMARY_EMP = [TBXML childElementNamed:@"PRIMARY_EMP" parentElement:container];
                NSString* _PRIMARY_EMP = [TBXML textForElement:PRIMARY_EMP];
                userDetailsVal_.PRIMARY_EMP = _PRIMARY_EMP;
                NSLog(@"\n _AREA %@", _PRIMARY_EMP);

                //POSTN_TYPE_CD
                TBXMLElement* POSTN_TYPE_CD = [TBXML childElementNamed:@"POSTN_TYPE_CD" parentElement:container];
                NSString* _POSTN_TYPE_CD = [TBXML textForElement:POSTN_TYPE_CD];
                userDetailsVal_.POSITION_TYPE = _POSTN_TYPE_CD;
                NSLog(@"\n _AREA %@", _POSTN_TYPE_CD);

                userDetailsVal_.Login_Name = self.username.text;
                NSManagedObjectContext* context;

                userDetailsVal_.PassWord = self.password.text;
                NSLog(@"\n Password %@", userDetailsVal_.PassWord); //JUST TEST

                //  if ([userDetailsVal_.Login_Name isEqualToString:_POSTN_TYPE_CD ]) {
                if ([_POSTN_TYPE_CD isEqual:@"DSM"]) {

                    appdelegate.flagappname = @"DSM";

                    //                context = [appdelegate managedObjectContext];
                    //                DSM* opty = [NSEntityDescription
                    //                    insertNewObjectForEntityForName:@"DSM"
                    //                             inManagedObjectContext:context];
                    //                opty.firstname = @"NIHAL";
                    //                opty.lastname = @"SHEIKH";
                    //                opty.cellnumber = @"8899007788";
                    //                opty.email = @"nihal.sheikh@gmail.com";
                    //
                    //                opty.area = @"Rahimatpur";
                    //                opty.state = @"Maharashtra";
                    //                opty.district = @"Satara";
                    //                opty.city = @"Rahimatpur";
                    //                opty.taluka = @"Koregaon";
                    //                opty.panchayat = @"Rahimatpur";
                    //                opty.pincode = @"415511";
                    //                opty.accountname = @"Nihal";
                    //
                    //                opty.lob = @"LCV";
                    //                opty.ppl = @"7TONNNETRUCKS";
                    //                opty.pl = @"LPT613";
                    //                opty.application = @"BOTTLECARRIER";
                    //                opty.sourceofcontact = @"SHOWROOM WALKIN";
                    //                opty.financier = @"SELF";

                    NSError* error;
                    if (![context save:&error]) {
                        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                    }
                }
                else if ([userDetailsVal_.Login_Name isEqualToString:_POSTN_TYPE_CD]) {
                    appdelegate.flagappname = @"NEEV";
                }
                else if ([_POSTN_TYPE_CD isEqual:@"DSE"]) {
                    appdelegate.flagappname = @"DSE";
                    /* context = [appdelegate managedObjectContext];
                DSE* opty = [NSEntityDescription
                    insertNewObjectForEntityForName:@"DSE"
                             inManagedObjectContext:context];
                opty.firstname = @"RISHIKESH";
                opty.lastname = @"PANGE";
                opty.cellnumber = @"8899007788";
                opty.email = @"rishikesh.pange@gmail.com";

                opty.area = @"mumbai";
                opty.state = @"mumbai";
                opty.district = @"mumbai";
                opty.city = @"mumbai";
                opty.taluka = @"mumbai";
                opty.panchayat = @"mumbai";
                opty.pincode = @"mumbai";
                opty.accountname = @"amol";

                opty.lob = @"LCV";
                opty.ppl = @"7TONNNETRUCKS";
                opty.pl = @"LPT613";
                opty.application = @"BOTTLECARRIER";
                opty.sourceofcontact = @"SHOWROOM WALKIN";
                opty.financier = @"SELF";

                NSError* error;

                if (![context save:&error]) {
                    NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                }*/
                }

                NSLog(@"\n _ORGNAME %@", userDetailsVal_.Login_Name); //JUST TEST
                [self hideAlert];

                self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
                    MasterViewController* masterViewController = [storyboard instantiateViewControllerWithIdentifier:@"masterViewController"];

                    self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
                    self.window.rootViewController = self.navigationController;
                }
                else {
                    MasterViewController* masterViewController = [storyboard instantiateViewControllerWithIdentifier:@"masterViewController"];
                    UINavigationController* masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];

                    DetailViewController* detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];

                    UINavigationController* detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];

                    masterViewController.detailViewController = detailViewController;

                    self.splitViewController = [[UISplitViewController alloc] init];
                    self.splitViewController.delegate = detailViewController;
                    self.splitViewController.viewControllers = @[ masterNavigationController, detailNavigationController ];

                    self.window.rootViewController = self.splitViewController;
                }
                [self.window makeKeyAndVisible];

                /* if([userDetailsVal_.POSITION_TYPE isEqualToString:@"DSM"] || [userDetailsVal_.POSITION_TYPE isEqualToString:@"DSE"]){
                   
               }*/
                if ([userDetailsVal_.POSITION_TYPE isEqualToString:@"DSM"] || [userDetailsVal_.POSITION_TYPE isEqualToString:@"DSE"]) {

                    [userDetailsArray addObject:userDetailsVal_];
                }
                else {
                }

            } while ((tuple = tuple->nextSibling));
        }
     }
    }
}
- (void)userDetailsFailed:(NSNotification*)notification
{
    NSString* errorString = [[notification userInfo] objectForKey:@"error"];
    NSString* response = [[notification userInfo] objectForKey:@"response"];

    NSLog(@"\n artifactFailed %@", errorString);

    NSLog(@"\n artifactFailed %@", response);

    if ([errorString isEqualToString:@"offline"]) {
        [self hideAlert];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"The internet connection seems to be offline!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"] animated:NO];
    }
    else {
        [self hideAlert];
        UIAlertView*  alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your request has timed out. Cannot reach the server right now . Please try again " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"] animated:NO];
    }
}

- (void)showAlert
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)startAnimations
{
    CGFloat delay = _transitionImageView.animationDuration + 1;

    _transitionImageView.animationDirection = AnimationDirectionLeftToRight;
    _transitionImageView.image = [UIImage imageNamed:@"sti01.jpg"];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
        _transitionImageView.animationDirection = AnimationDirectionTopToBottom;
        _transitionImageView.image = [UIImage imageNamed:@"sti02.jpg"];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
            _transitionImageView.animationDirection = AnimationDirectionRightToLeft;
            _transitionImageView.image = [UIImage imageNamed:@"sti03.jpg"];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
                _transitionImageView.animationDirection = AnimationDirectionBottomToTop;
                _transitionImageView.image = [UIImage imageNamed:@"sti04.jpg"];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
                    _transitionImageView.animationDirection = AnimationDirectionTopToBottom;
                    _transitionImageView.image = [UIImage imageNamed:@"sti05.jpg"];

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
                        [self startAnimations];
                    });
                });
            });
        });
    });
}
@end
