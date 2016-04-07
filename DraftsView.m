//
//  DraftsView.m
//  CRM_APP
//
//  Created by Preeti Sakhare on 9/21/15.
//  Copyright (c) 2015 TataTechnologies. All rights reserved.
//

#import "DraftsView.h"
#import "DraftsTableViewCell.h"
#import "DSM.h"
#import "DSE.h"
#import "DraftsDetailViewController.h"

@interface DraftsView ()

@end

@implementation DraftsView

@synthesize drafts;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drafts =[[NSArray alloc] init];
    self.appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.draftTableview.delegate=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nback.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    // Navigation bar button on right side
    UIButton *btnInfo =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnInfo setImage:[UIImage imageNamed:@"header_icon_1.png"] forState:UIControlStateNormal];
    [btnInfo addTarget:self action:@selector(info_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnInfo setFrame:CGRectMake(-15, -5, 40, 40)];
    
    UIButton *btnLogout =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLogout setImage:[UIImage imageNamed:@"header_icon_2.png"] forState:UIControlStateNormal];
    [btnLogout addTarget:self action:@selector(logOut_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnLogout setFrame:CGRectMake(44, -5, 40, 40)];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(10,10,90,40)];
    [rightBarButtonItems addSubview:btnInfo];
    [rightBarButtonItems addSubview:btnLogout];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
    self.splitViewController.delegate = self;
    self.masterPopoverController.delegate=self;
    UIBarButtonItem *barButtonItem = self.splitViewController.displayModeButtonItem;
    barButtonItem.title = @"Show master";
    
      [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nback.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
    if ([self.appdelegate.flagappname isEqualToString:@"DSM"])
    {
        
      
        
        
        NSError *error;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"DSM"
                                                  inManagedObjectContext:self.appdelegate.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        self.drafts = [self.appdelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if ([self.drafts count]==0)
        {
            
        }
        else
        {
            

        
        for (DSM *info in self.drafts)
        {
            NSLog(@"firstname: %@", info.firstname);
            NSLog(@"lastname: %@", info.lastname);
            NSLog(@"cellnumber: %@", info.cellnumber);
            NSLog(@"email: %@", info.email);
            
        }
        }
    }
    else if ([self.appdelegate.flagappname isEqualToString:@"DSE"])
    {
        
        NSError *error;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"DSE"
                                                  inManagedObjectContext:self.appdelegate.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        self.drafts = [self.appdelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if ([self.drafts count]==0)
        {
            
        }
        else
        {
            

        
        for (DSE *info in self.drafts)
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
            
            
            
        }
        }
        
    }
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    
    
    if ([self.appdelegate.flagappname isEqualToString:@"DSM"])
    {
        
        
        
        
        NSError *error;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"DSM"
                                                  inManagedObjectContext:self.appdelegate.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        self.drafts = [self.appdelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if ([self.drafts count]==0)
        {
            
        }
        else
        {
            

        
        for (DSM *info in self.drafts)
        {
            NSLog(@"firstname: %@", info.firstname);
            NSLog(@"lastname: %@", info.lastname);
            NSLog(@"cellnumber: %@", info.cellnumber);
            NSLog(@"email: %@", info.email);
            
        }
        }
        
    }
    else if ([self.appdelegate.flagappname isEqualToString:@"DSE"])
    {
        
        NSError *error;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"DSE"
                                                  inManagedObjectContext:self.appdelegate.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        self.drafts = [self.appdelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if ([self.drafts count]==0)
        {
            
        }
        else
        {
            

        
        for (DSE *info in self.drafts)
        {
            NSLog(@"firstname: %@", info.firstname);
            NSLog(@"lastname: %@", info.lastname);
            NSLog(@"cellnumber: %@", info.cellnumber);
            NSLog(@"email: %@", info.email);
            
//            NSLog(@"area: %@", info.area);
//            NSLog(@"state: %@", info.state);
//            NSLog(@"district: %@", info.district);
//            NSLog(@"city: %@", info.city);
//            NSLog(@"taluka: %@", info.taluka);
//            NSLog(@"pincode: %@", info.pincode);
//            NSLog(@"panchayat: %@", info.panchayat);
//            NSLog(@"accountname: %@", info.accountname);
//            
//            NSLog(@"lob: %@", info.lob);
//            NSLog(@"ppl: %@", info.ppl);
//            NSLog(@"pl: %@", info.pl);
//            NSLog(@"application: %@", info.application);
//            NSLog(@"sourceofcontact: %@", info.sourceofcontact);
//            NSLog(@"financier: %@", info.financier);
            
            
            
        }
        }
    }
    [self.draftTableview reloadData];
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LobListFound:) name:@"LobListFound" object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Activity_PPL_Found:) name:@"Activity_PPL_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Createoptyfornewcontact_found:) name:@"Createoptyfornewcontact_found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Allstates_Found:) name:@"Allstates_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllDistrict_Found:) name:@"Alldistricts_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Allcities_Found:) name:@"Allcities_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Alltaluka_Found:) name:@"Alltaluka_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Finance_Data_Found:) name:@"Finance_Data_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PLUpdateOpty_Found:) name:@"PLUpdateOpty_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AppType_Data_Found:) name:@"AppType_Data_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UsageCategory_Found:) name:@"UsageCategory_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BodyTypeDSMData_Found:) name:@"BodyTypeDSMData_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ListofActiveMicroMarketDSMData_Found:) name:@"ListofActiveMicroMarketDSMData_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PL_ProductID_RequestData_Found:) name:@"PL_ProductID_RequestData_Found" object:nil];
    //
    //    //GetALLPPLRelatedProductdata_found
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetALLPPLRelatedProductdata_found:) name:@"GetALLPPLRelatedProductdata_found" object:nil];
    //
    //
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetCampainDetailsForDSMdata_found:) name:@"GetCampainDetailsForDSMdata_found" object:nil];
    //
    //    //GetCampainDetailsForDSMdata_found
    //
    //
    //
    //    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CreateoptyforexistingContactData_Found:) name:@"CreateoptyforexistingContactData_Found" object:nil];
    //    //
    //    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ContactSelection_found:) name:@"showAlert" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactqueryfound:) name:@"contactqueryfound" object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(prospectupdatefound:) name:@"prospectupdatefound" object:nil];
    //
    //
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PincodeConnectioninCreateOptyVCFound:) name:@"PincodeConnectioninCreateOptyVCFound" object:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LobListFound" object:nil]; //Gomzy //
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Activity_PPL_Found" object:nil];
    //
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Createoptyfornewcontact_found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Allstates_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Alldistricts_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Allcities_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Allcities_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Alltaluka_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Finance_Data_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PLUpdateOpty_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AppType_Data_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UsageCategory_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"BodyTypeDSMData_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ListofActiveMicroMarketDSMData_Found" object:nil];
    //
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PL_ProductID_RequestData_Found" object:nil];
    //
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GetALLPPLRelatedProductdata_found" object:nil];
    //
    //
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CreateoptyforexistingContactData_Found" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"contactqueryfound" object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"prospectupdatefound" object:nil];
    //    
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PincodeConnectioninCreateOptyVCFound" object:nil];
    //    
    //    
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GetCampainDetailsForDSMdata_found" object:nil];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.drafts count]==0) {
        UILabel *noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.draftTableview.bounds.size.width, self.draftTableview.bounds.size.height)];
        noDataLabel.text             = @"No Drafts Saved";
        noDataLabel.textColor        = [UIColor blackColor];
        noDataLabel.textAlignment    = NSTextAlignmentCenter;
        self.draftTableview.backgroundView = noDataLabel;
        self.draftTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 0;
    }
    else{
        return 1;
    }

}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0 || indexPath.row == ([indexPath length]-1))
    {
        cell.layer.cornerRadius = 10;
        
        
    }
    cell.layer.cornerRadius = 10;
    cell.layer.borderWidth=2.0f;
    cell.layer.borderColor=[UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1].CGColor;
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    /*
     UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 320, 3)];/// change size as you need.
     separatorLineView.backgroundColor = [UIColor redColor];// you can also put image here
     [cell.contentView addSubview:separatorLineView];*/
    
    
    UIView *bgColorView = [[UIView alloc] init];
    [bgColorView setBackgroundColor:[UIColor colorWithRed:(245/255.0) green:(244/255.0) blue:(244/255.0) alpha:1]];
    bgColorView.layer.cornerRadius = 10;
    // [cell setSelectedBackgroundView:bgColorView];
    // [bgColorView release];
    
    cell.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(244/255.0) blue:(244/255.0) alpha:1] ;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    cell.textLabel.textColor=[UIColor colorWithRed:(65/255.0) green:(68/255.0) blue:(77/255.0) alpha:1];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    cell.selectedBackgroundView=bgColorView;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.drafts count]==0) {
        return 0;
    }
    else{
    return [self.drafts count];
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if (tableView == self.draftTableview)
    //    {
    static NSString *MyIdentifier = @"draftsIdentifier";
    
    DraftsTableViewCell *cell = [self.draftTableview dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[DraftsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:MyIdentifier];
    }
    cell.layer.borderColor =  [UIColor colorWithRed:(218/255.0) green:(218/255.0) blue:(218/255.0) alpha:1].CGColor;
    cell.layer.borderWidth = 1.0f;
    cell.layer.cornerRadius=10;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.backgroundColor=[UIColor clearColor];
    
    cell.firstname.text =[[self.drafts objectAtIndex:indexPath.row] valueForKey:@"firstname"];
    cell.lastname.text =[[self.drafts objectAtIndex:indexPath.row] valueForKey:@"lastname"];
    cell.Cellnumber.text = [[self.drafts objectAtIndex:indexPath.row] valueForKey:@"cellnumber"];
    cell.email.text = [[self.drafts objectAtIndex:indexPath.row] valueForKey:@"email"];
    
    cell.lob.text =[[self.drafts objectAtIndex:indexPath.row] valueForKey:@"lob"];
    cell.ppl.text =[[self.drafts objectAtIndex:indexPath.row] valueForKey:@"ppl"];
    cell.pl.text = [[self.drafts objectAtIndex:indexPath.row] valueForKey:@"pl"];
    cell.application.text = [[self.drafts objectAtIndex:indexPath.row] valueForKey:@"application"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.; // you can have your own choice, of course
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editdrafts"]) {
        NSManagedObject *selectedDevice = [self.drafts objectAtIndex:[[self.draftTableview indexPathForSelectedRow] row]];
        
        DraftsDetailViewController *destViewController = segue.destinationViewController;
        destViewController.draftsdetail = selectedDevice;
    }
}


@end
