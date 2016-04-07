//
//  AppDelegate.m
//  test
//

//  Copyright (c) 2013 Tata Motors. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "IQKeyboardManager.h"
#import "DetailViewController.h"
@implementation AppDelegate
@synthesize URL,artifact,loginUD,loginX;// string url ,loginId
@synthesize tableCounter;
@synthesize listofProduct_analytics;
@synthesize flagget;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    
    
   /* self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController_iPhone" bundle:nil];
        MasterViewController *masterViewController = [storyboard instantiateViewControllerWithIdentifier:@"masterViewController"];
        
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        self.window.rootViewController = self.navigationController;
    } else {
        MasterViewController *masterViewController = [storyboard instantiateViewControllerWithIdentifier:@"masterViewController"];
        UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        
        //DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPad" bundle:nil];
        DetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
        

        UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
        
        masterViewController.detailViewController = detailViewController;
        
        self.splitViewController = [[UISplitViewController alloc] init];
        self.splitViewController.delegate = detailViewController;
        self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];
        
        self.window.rootViewController = self.splitViewController;
    }
    [self.window makeKeyAndVisible];
    return YES;*/
    
    //Production
  self.URL = @"https://tmcrmapps.inservices.tatamotors.com/cordys/com.eibus.web.soap.Gateway.wcp?organization=o=MobileApps,cn=cordys,cn=cbop,o=tatamotors.com";
    
    //QA
//    self.URL = @"http://tmcrmappsqa.inservices.tatamotors.com/cordys/com.eibus.web.soap.Gateway.wcp?organization=o=MobileApps,cn=cordys,cn=cbop,o=tatamotors.com";
//
    
  //  self.URL = @"http://tmcrmapps.inservices.tatamotors.com/cordys/com.eibus.web.soap.Gateway.wcp?organization=o=MobileApps,cn=cordys,cn=cbop,o=tatamotors.com";
    
    self.authenticated = NO;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    self.splitViewController = (UISplitViewController *)self.window.rootViewController;
    
    
    /* UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
     UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
     splitViewController.delegate = (id)navigationController.topViewController;*/
    
    
    //[self.splitViewController.view setBackgroundColor:[UIColor redColor]];
    
    self.window.rootViewController=vc;
    
    [vc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self.splitViewController presentViewController:vc animated:YES completion:nil];
    
    
    //ONE LINE OF CODE.
    //Enabling keyboard manager(Use this line to enable managing distance between keyboard & textField/textView).
    [[IQKeyboardManager sharedManager] setEnable:YES];
    
    //(Optional)Set Distance between keyboard & textField, Default is 10.
    //[[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:15];
    
    //(Optional)Enable autoToolbar behaviour. If It is set to NO. You have to manually create UIToolbar for keyboard. Default is NO.
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
    //(Optional)Setting toolbar behaviour to IQAutoToolbarBySubviews to manage previous/next according to UITextField's hierarchy in it's SuperView. Set it to IQAutoToolbarByTag to manage previous/next according to UITextField's tag property in increasing order. Default is `IQAutoToolbarBySubviews`.
    //[[IQKeyboardManager sharedManager] setToolbarManageBehaviour:IQAutoToolbarBySubviews];
    
    //(Optional)Resign textField if touched outside of UITextField/UITextView. Default is NO.
    //[[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    
    //(Optional)Giving permission to modify TextView's frame. Default is NO.
    //[[IQKeyboardManager sharedManager] setCanAdjustTextView:YES];
    
    //(Optional)Show TextField placeholder texts on autoToolbar. Default is NO.
    [[IQKeyboardManager sharedManager] setShouldShowTextFieldPlaceholder:YES];

    
    [self.window makeKeyAndVisible];
    return YES;
    
    
    // Override point for customization after application launch.
    
   /*  UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
     UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
     splitViewController.delegate = (id)navigationController.topViewController;
     return YES;*/
}
-(void)createAlertWithTitle:(NSString*)title message:(NSString*)message
{
    /*
     alertProgress = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
     UIActivityIndicatorView *loadingView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
     [loadingView startAnimating];
     loadingView.frame=CGRectMake(130.0f, 82.0f, 20.0f, 20.0f);
     [alertProgress addSubview:loadingView];
     [alertProgress show];*/
}
-(void)hideAlert
{
    // [alertProgress dismissWithClickedButtonIndex:0 animated:YES];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.ttl.Drafts" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Drafts" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Drafts.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}
//[[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}



@end
