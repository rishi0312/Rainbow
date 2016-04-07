//
//  RequestDelegate.m
//  RetailerPortal
//
//  Created by madhu on 11/20/12.
//  Copyright (c) 2012 madhu. All rights reserved.
//

#import "RequestDelegate.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@implementation RequestDelegate
- (void)initiateRequest:(NSURLRequest*)request name:(NSString*)name
{
    /////////////////////////////////////////////////////////////////

    
    
    
    //Abhi NEw Edit Opty TEst
    if ([name isEqualToString:@"AllDataAginstOptyIDinEditOpty"]) {
        
        NSLog(@"AllDataAginstOptyIDinEditOpty...!");
        
        AllDataAginstOptyIDinEditOptydata = [[NSMutableData alloc] init];
        
        AllDataAginstOptyIDinEditOptyConnection1 = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [AllDataAginstOptyIDinEditOptyConnection1 scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [AllDataAginstOptyIDinEditOptyConnection1 start];
        
        
    }

    
    
    
    if ([name isEqualToString:@"artifactRequest"]) // for artifactrequest
    {
        NSLog(@"SENDING ARTIFACT REQUEST");
        artifactData = [[NSMutableData alloc] init];
        artifactConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [artifactConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [artifactConnection start];
        NSLog(@"Ending..");
    } //GetIndianStates
    else if ([name isEqualToString:@"ActivityDetailFetchConnection"]) {
        NSLog(@"SENDING ActivityDetailFetchConnection REQUEST");
        ActivityDetailFetchdata = [[NSMutableData alloc] init];
        getActivityDetailFetchConnection= [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivityDetailFetchConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityDetailFetchConnection start];
    }
    else if ([name isEqualToString:@"authenticateOIDRequest"]) // for Authenticte
    {
        NSLog(@"SENDING authenticateOID REQUEST");
        authenticateOIDData = [[NSMutableData alloc] init];
        authenticateOIDConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [authenticateOIDConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [authenticateOIDConnection start];
    }

    else if ([name isEqualToString:@"dateRequest"]) // for date
    {
        NSLog(@"SENDING dateRequest REQUEST");
        CurrentDateData = [[NSMutableData alloc] init];
        getCurrentDateConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getCurrentDateConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getCurrentDateConnection start];
    }
    ///////////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////////////

    else if ([name isEqualToString:@"userDetailsRequest"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        userDetailsData = [[NSMutableData alloc] init];
        getUserDetailsConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getUserDetailsConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getUserDetailsConnection start];
    }

    ///////////////////////////////////////////////////////////////////////////

    //

    ///////////////////////////////////////////////////////////////////////
    else if ([name isEqualToString:@"getListofOpportunity"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        SaleAllOpportunity = [[NSMutableData alloc] init];
        getAllOpportunity = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAllOpportunity scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllOpportunity start];
    }

    /////////////////////////////////////////////////////////////////////////////////////////////

    else if ([name isEqualToString:@"Createoptyfornewcontact"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        Createoptyfornewcontactdata = [[NSMutableData alloc] init];
        getCreateoptyfornewcontact = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getCreateoptyfornewcontact scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getCreateoptyfornewcontact start];
    }

    else if ([name isEqualToString:@"AllStates"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        AllStatesdata = [[NSMutableData alloc] init];
        getAllStatesConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAllStatesConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllStatesConnection start];
    }
    //AllDistricts
    else if ([name isEqualToString:@"AllDistricts"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        AllDistrictsdata = [[NSMutableData alloc] init];
        getAllDistrictsConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAllDistrictsConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllDistrictsConnection start];
    }
    //Alltaluka

    else if ([name isEqualToString:@"Allcities"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        Allcitiesdata = [[NSMutableData alloc] init];
        getAllcitiesconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAllcitiesconnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllcitiesconnection start];
    }
    else if ([name isEqualToString:@"getAllcitiesconnection"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        Allcitiesdata = [[NSMutableData alloc] init];
        getAllcitiesconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAllcitiesconnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllcitiesconnection start];
    }
    //
    else if ([name isEqualToString:@"getAllCityConnection"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        AllCityDataFind = [[NSMutableData alloc] init];
        getAllCityConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAllCityConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllCityConnection start];
    }

    else if ([name isEqualToString:@"Alltaluka"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        Alltalukadata = [[NSMutableData alloc] init];
        getAlltalukaconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAlltalukaconnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAlltalukaconnection start];
    }
    else if ([name isEqualToString:@"getAlltalukaconnection"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        Alltalukadata = [[NSMutableData alloc] init];
        getAlltalukaconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getAlltalukaconnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAlltalukaconnection start];
    }
    //

    else if ([name isEqualToString:@"ActivityTypeConnection"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        ActivityTypedata = [[NSMutableData alloc] init];
        getActivityTypeConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivityTypeConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityTypeConnection start];
    }

    else if ([name isEqualToString:@"ActivityCreateConnection"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        ActivityCreatedata = [[NSMutableData alloc] init];
        getActivityCreateConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivityCreateConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityCreateConnection start];
    }
    // Reason of Lost
    else if ([name isEqualToString:@"getLostReasonOpportunityConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Reason of lost");
        ReasonLostOpportunity = [[NSMutableData alloc] init];
        getLostReasonOpportunityConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getLostReasonOpportunityConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getLostReasonOpportunityConnection start];
    }
    else if ([name isEqualToString:@"getLostMakeOpportunityConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Make Lost");
        MakeLostOpportunity = [[NSMutableData alloc] init];
        getLostMakeOpportunityConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getLostMakeOpportunityConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getLostMakeOpportunityConnection start];
    }
    else if ([name isEqualToString:@"getLostModeOpportunityConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        ModeLostOpportunity = [[NSMutableData alloc] init];
        getLostModeOpportunityConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getLostModeOpportunityConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getLostModeOpportunityConnection start];
    }
    else if ([name isEqualToString:@"getListOfDSETypeConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        GetListOfDSE = [[NSMutableData alloc] init];
        getListOfDSETypeConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getListOfDSETypeConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getListOfDSETypeConnection start];
    }
    else if ([name isEqualToString:@"ActivitydetailsListfromopty"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST");
        ActivitydetailsListfromoptydata = [[NSMutableData alloc] init];
        getActivitydetailsListfromopty = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivitydetailsListfromopty scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivitydetailsListfromopty start];
    }
    else if ([name isEqualToString:@"Linkcampaign_Connection"]) // for create Activity
    {

        NSLog(@"\nSEDING Linkcampaign_Connection REQUEST");
        Linkcampaign_Data = [[NSMutableData alloc] init];
        getLinkcampaign_Connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getLinkcampaign_Connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getLinkcampaign_Connection start];
    }
    else if ([name isEqualToString:@"Linkcampaign_select_request"]) // for create Activity
    {

        NSLog(@"\nSEDING Linkcampaign_select REQUEST");
        Select_Linkcampaign_Data = [[NSMutableData alloc] init];
        getLinkcampaign_Select_connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getLinkcampaign_Select_connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getLinkcampaign_Select_connection start];
    }
    else if ([name isEqualToString:@"ActivityDetails_Connection"]) // for create Activity
    {

        NSLog(@"\nSEDING Linkcampaign_select REQUEST");
        ActivityDetails_Data = [[NSMutableData alloc] init];
        getActivityDetails_Connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivityDetails_Connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityDetails_Connection start];
    }
    else if ([name isEqualToString:@"getActivityPPLConnection"]) {
        NSLog(@"\nSEDING getActivityPPLConnection REQUEST");
        ActivityPPLData = [[NSMutableData alloc] init];
        getActivityPPLConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivityPPLConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityPPLConnection start];
    }
    else if ([name isEqualToString:@"getActivityTypeConnection1"]) // for Activity TYPE List Details //searchActivity_VC
    {
        NSLog(@"\nSEDING getActivityTypeConnection REQUEST");
        ActivityTypeData = [[NSMutableData alloc] init];
        getActivityTypeConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivityTypeConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityTypeConnection start];
    }
    else if ([name isEqualToString:@"getActivityTaluka"]) // for Activity PPL List Details //searchActivity_VC
    {
        NSLog(@"\nSEDING getActivityPPLConnection REQUEST");
        ActivityTaluka = [[NSMutableData alloc] init];
        getActivityTaluka = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getActivityTaluka scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityTaluka start];
    }
    else if ([name isEqualToString:@"getActivity_AssignTo"]) {
        NSLog(@"SENDING userDetailsRequest REQUEST Tahshil");
        SalesOppAssingTOData = [[NSMutableData alloc] init];
        getSearchOpportunityAssignTo = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [getSearchOpportunityAssignTo scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSearchOpportunityAssignTo start];
    }
    else if([name isEqualToString:@"SearchActivities_Connection"]) // for searching Activities //searchActivity_VC
    {
        NSLog(@"\nSEDING SearchActivities_Connection REQUEST");
        seachActivitiesData = [[NSMutableData alloc]init];
        getSearchActivitiesConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSearchActivitiesConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSearchActivitiesConnection start];
    }
    else if([name isEqualToString:@"getAllStatesConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        GetAllStates = [[NSMutableData alloc]init];
        getAllStatesConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAllStatesConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllStatesConnection start];
    }
    else if([name isEqualToString:@"getAllStatesConnectionProspect"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        GetAllStatesProspect = [[NSMutableData alloc]init];
        getAllStatesConnectionProspect = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAllStatesConnectionProspect scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllStatesConnectionProspect start];
    }
    else if([name isEqualToString:@"getCreateQouteConnection"]) // for search a opportunities
    {
        NSLog(@"\n SEDING REQUEST");
        CreateQouteConnection = [[NSMutableData alloc]init];
        getCreateQouteConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
        [getCreateQouteConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getCreateQouteConnection start];
        NSLog(@"......Search ");
    }
    else if([name isEqualToString:@"getupdateOptyQoute_Connection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        QouteCreationupdateOpty = [[NSMutableData alloc]init];
        getQouteCreationupdateOptyConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getQouteCreationupdateOptyConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getQouteCreationupdateOptyConnection start];
    }
    else if([name isEqualToString:@"getupdateOptyQouteConnection"]) // for Activity TYPE List Details //searchActivity_VC
    {
        NSLog(@"\nSEDING getActivityTypeConnection REQUEST");
        UpdateOpportunityQouteConnection = [[NSMutableData alloc]init];
        getupdateOpportunityQouteConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getupdateOpportunityQouteConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getupdateOpportunityQouteConnection start];
    }
    else if ([name isEqualToString:@"getDoneUPdateOptyLastConnection"])// For create contact Opportunity_DetailsVC
    {
        NSLog(@"\nSEDING SearchContactConnection REQUEST");
        DoneUPdateOptyLastData = [[NSMutableData alloc]init];
        getDoneUPdateOptyLast_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getDoneUPdateOptyLast_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getDoneUPdateOptyLast_Connection start];
    }
    else if([name isEqualToString:@"getQouteCreationConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        QouteCreationData = [[NSMutableData alloc]init];
        getQouteCreationConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getQouteCreationConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getQouteCreationConnection start];
    }
    else if([name isEqualToString:@"getQouteCreationupdateOptySales"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        QouteCreationupdateOptyData = [[NSMutableData alloc]init];
        getQouteCreationupdateOptySales = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getQouteCreationupdateOptySales scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getQouteCreationupdateOptySales start];
    }
    else if([name isEqualToString:@"AccountSearch_Connection"])
    {
        NSLog(@"\nSEDING SearchContactConnection REQUEST");
        getSearchAccountData = [[NSMutableData alloc]init];
        getSearchAccountConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSearchAccountConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSearchAccountConnection start];
    }
    else if([name isEqualToString:@"AccountUpdate_Connection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        AccountUpdateData = [[NSMutableData alloc]init];
        AccountUpdate_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [AccountUpdate_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [AccountUpdate_Connection start];
    }
    else if ([name isEqualToString:@"CreateContacWithAccountDetails_Connection"])// For create contact CreateContacWithAccount_VC
    {
        NSLog(@"\nSEDING SearchContactConnection REQUEST");
        CreateContacWithAccountDetails_Data = [[NSMutableData alloc]init];
        getCreateContacWithAccountDetails_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getCreateContacWithAccountDetails_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getCreateContacWithAccountDetails_Connection start];
        
    }
    else if([name isEqualToString:@"CreateAccount_Connection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        CreateAccount_Data = [[NSMutableData alloc]init];
        getCreateAccountE_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getCreateAccountE_Connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getCreateAccountE_Connection start];
    }
    else if([name isEqualToString:@"getAssignOptyConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        GetAssignToDSE = [[NSMutableData alloc]init];
        getAssignOptyConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAssignOptyConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAssignOptyConnection start];
    }
    else if([name isEqualToString:@"getActivityDoneConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        ActivityDoneData = [[NSMutableData alloc]init];
        getActivityDoneConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getActivityDoneConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityDoneConnection start];
    }
    else if([name isEqualToString:@"getActivitiyFinalDoneConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        ActivitiyFinalDone = [[NSMutableData alloc]init];
        ActivitiyFinalDoneConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [ActivitiyFinalDoneConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [ActivitiyFinalDoneConnection start];
    }
    else if([name isEqualToString:@"getAllDistrictConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All District");
        GetAllDistrict = [[NSMutableData alloc]init];
        getAllDistrictConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAllDistrictConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllDistrictConnection start];
    }//
    else if([name isEqualToString:@"getAllTalukasConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All District");
        GetAllTaluka = [[NSMutableData alloc]init];
        getAllTalukaConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAllTalukaConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllTalukaConnection start];
    }
    else if([name isEqualToString:@"getAllTalukaConnectionCall"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All District");
        GetAllTalukacall = [[NSMutableData alloc]init];
        getAllTalukaConnectioncall = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAllTalukaConnectioncall scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllTalukaConnectioncall start];
    }
    //getAllTalukaConnectionCall
    else if([name isEqualToString:@"getAllPincodeConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All District");
        GetAllPincode = [[NSMutableData alloc]init];
        getAllPincodeConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAllPincodeConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllPincodeConnection start];
    }
    else if([name isEqualToString:@"ProceedToQuoteCreation_Connection"])
    {
        
        NSLog(@"\nProceedToQuote_Creation REQUEST");
        ProceedToQuoteCreationdata = [[NSMutableData alloc]init];
        ProceedToQuoteCreation_connection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [ProceedToQuoteCreation_connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [ProceedToQuoteCreation_connection  start];
    }
    else if([name isEqualToString:@"AfterQuoteCreation_Connection"]) // for Activity PPL List Details //searchActivity_VC
    {
        NSLog(@"\nSEDING AfterQuoteCreation_ConnectionConnection REQUEST");
        AfterQuoteCreationData = [[NSMutableData alloc]init];
        AfterQuoteCreationConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [AfterQuoteCreationConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [AfterQuoteCreationConnection start];//getselecteddateproductreport
    }
    else if([name isEqualToString:@"getLostOpportunityConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        MakeTheLostOpportunity = [[NSMutableData alloc]init];
        getLostOpportunityConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getLostOpportunityConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getLostOpportunityConnection start];
    }
    else if([name isEqualToString:@"SearchActivities_Connection1"]) // for searching Activities //searchActivity_VC
    {
        NSLog(@"\nSEDING SearchActivities_Connection1 REQUEST");
        seachActivitiesData1 = [[NSMutableData alloc]init];
        getSearchActivitiesConnection1 =[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSearchActivitiesConnection1 scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSearchActivitiesConnection1 start];
    }
    else if([name isEqualToString:@"getActivityUpdateConnection"]) // for search a opportunities
    {
        NSLog(@"\n SEDING REQUEST");
        PendingActivtyUpdate = [[NSMutableData alloc]init];
        getupdateActivityConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
        [getupdateActivityConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getupdateActivityConnection start];
        NSLog(@"......Search ");
    }
    
    else if([name isEqualToString:@"getActivityUpdateNEWConnection"]) // for search a opportunities
    {
        NSLog(@"\n SEDING getActivityUpdateNEWConnection REQUEST");
        PendingActivtyNEWUpdate = [[NSMutableData alloc]init];
        getupdateActivityNEWConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
        [getupdateActivityNEWConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getupdateActivityNEWConnection start];
        NSLog(@"......Search ");
    }

    
    else if([name isEqualToString:@"getActivityPLConnection"])
    {
        NSLog(@"SENDING Analytis REQUEST");
        getPLData=[[NSMutableData alloc]init];
        getActivityPLConnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getActivityPLConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityPLConnection start];
    }
    else if([name isEqualToString:@"getApplicationTypeConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        GetAppTypeData = [[NSMutableData alloc]init];
        getAppType_connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAppType_connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAppType_connection start];
    }
    else if([name isEqualToString:@"getActivityFinanceConnection"]) // for FinanceList
    {
        NSLog(@"SENDING Finance_List REQUEST");
        getFinancier_List_Data= [[NSMutableData alloc]init];
        getActivityFinanceConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getActivityFinanceConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityFinanceConnection start];
    }
    else if([name isEqualToString:@"ContactSaveRequest"])
    {
        
        NSLog(@"\nSEnDING Lost_Opty REQUEST");
        ContactSavedata = [[NSMutableData alloc]init];
        ContactSave_connection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [ContactSave_connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [ContactSave_connection  start];
    }
    else if([name isEqualToString:@"adressIDRequest"])
    {
        
        NSLog(@"\nSEnDING Lost_Opty REQUEST");
        adressIDdata = [[NSMutableData alloc]init];
        adressID_connection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [adressID_connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [adressID_connection  start];
    }
    else if([name isEqualToString:@"GetLOB"]) // for LOB_List
    {
        NSLog(@"SENDING LOB_List REQUEST");
        getLobList = [[NSMutableData alloc]init];
        get_Lob_List_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [get_Lob_List_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [get_Lob_List_Connection start];
    }

    else if([name isEqualToString:@"GetPPL_List"]) // for LOB_List
    {
        NSLog(@"SENDING PPL_List REQUEST");
        getPPL_List_Data = [[NSMutableData alloc]init];
        get_PPL_List_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [get_PPL_List_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [get_PPL_List_Connection start];
    }
    
    else if([name isEqualToString:@"GetPL_List"]) // for LOB_List
    {
        NSLog(@"SENDING PL_List REQUEST");
        getPL_List_Data = [[NSMutableData alloc]init];
        get_PL_List_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [get_PL_List_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [get_PL_List_Connection start];
    }
    else if([name isEqualToString:@"GetApplication_List"]) // for GetApplication_List
    {
        NSLog(@"SENDING Application_List REQUEST");
        getApplication_List_Data= [[NSMutableData alloc]init];
        get_Application_List_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [get_Application_List_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [get_Application_List_Connection start];
    }

    else if([name isEqualToString:@"GetProduct"])
    {
        
        NSLog(@"\nGetProduct REQUEST");
        GetProductdata = [[NSMutableData alloc]init];
        GetProductconnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [GetProductconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [GetProductconnection  start];
    }
    else if([name isEqualToString:@"UpdateOpty"])
    {
        
        NSLog(@"\nUpdateOpty REQUEST");
        UpdateOptydata = [[NSMutableData alloc]init];
        UpdateOptyconnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [UpdateOptyconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [UpdateOptyconnection  start];
    }//getStatesConnection

    else if([name isEqualToString:@"getStatesConnection"])
    {
        
        NSLog(@"\nUpdateOpty REQUEST");
        StateData = [[NSMutableData alloc]init];
        StateAllconnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [StateAllconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [StateAllconnection  start];
    }
    else if([name isEqualToString:@"getAddressConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        AddressData = [[NSMutableData alloc]init];
        getAddressConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAddressConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAddressConnection start];
    }
    else if([name isEqualToString:@"getContactUpdateConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ContactDetailsUpdate = [[NSMutableData alloc]init];
        getContactUpdateConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getContactUpdateConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getContactUpdateConnection start];
    }//getApplicationbodyType
    else if([name isEqualToString:@"getApplicationbodyType"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ApplicationBodyType = [[NSMutableData alloc]init];
        getApplicationbodyTypeconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getApplicationbodyTypeconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getApplicationbodyTypeconnection start];
    }//getCustomerSegment
    else if([name isEqualToString:@"getCustomerSegment"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        CustomerSegmentData = [[NSMutableData alloc]init];
        getCustomerSegmentConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getCustomerSegmentConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getCustomerSegmentConnection start];
    }//getSalesPipelineDashboard
    else if([name isEqualToString:@"getSalesPipelineDashboard"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipelineDashboard = [[NSMutableData alloc]init];
        getSalesPipelineDashboardConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipelineDashboardConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipelineDashboardConnection start];
    }//getLeadGeneratorwisePipelineView
    else if([name isEqualToString:@"getLeadGeneratorwisePipelineView"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        LeadGeneratorwisePipelineView = [[NSMutableData alloc]init];
        getLeadGeneratorwisePipelineViewConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getLeadGeneratorwisePipelineViewConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getLeadGeneratorwisePipelineViewConnection start];
    }//getMMPipeLineView_DSM
    else if([name isEqualToString:@"getMMPipeLineView_DSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        MMPipeLineView_DSM = [[NSMutableData alloc]init];
        getMMPipeLineView_DSMConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getMMPipeLineView_DSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getMMPipeLineView_DSMConnection start];
    }//getSalesPipeLineDashboard_DSM
    else if([name isEqualToString:@"getSalesPipeLineDashboard_DSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipeLineDashboard_DSM = [[NSMutableData alloc]init];
        getSalesPipeLineDashboard_DSMConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipeLineDashboard_DSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipeLineDashboard_DSMConnection start];
    }//getSalesPipeLineDashboard_DSE
    else if([name isEqualToString:@"getSalesPipeLineDashboard_DSE"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipeLineDashboard_DSE = [[NSMutableData alloc]init];
        getSalesPipeLineDashboard_DSEConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipeLineDashboard_DSEConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipeLineDashboard_DSEConnection start];
    }

    else if([name isEqualToString:@"getSalesPipelineDashboard_NEEV"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipelineDashboard_NEEV = [[NSMutableData alloc]init];
        getSalesPipelineDashboard_NEEVConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipelineDashboard_NEEVConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipelineDashboard_NEEVConnection start];
    }//
    else if([name isEqualToString:@"getEventExecutiveDashboard_NEEV"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        EventExecutiveDashboard_NEEV = [[NSMutableData alloc]init];
        getEventExecutiveDashboard_NEEVConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getEventExecutiveDashboard_NEEVConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getEventExecutiveDashboard_NEEVConnection start];
    }//getEventActive_NEEV
    else if([name isEqualToString:@"getEventActive_NEEV"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        EventActive_NEEV = [[NSMutableData alloc]init];
        getEventActive_NEEVConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getEventActive_NEEVConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getEventActive_NEEVConnection start];
    }//
    else if([name isEqualToString:@"getSalesPipelineDashboard_NEEVPPL"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipelineDashboard_NEEVPPL = [[NSMutableData alloc]init];
        getSalesPipelineDashboard_NEEVPPLConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipelineDashboard_NEEVPPLConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipelineDashboard_NEEVPPLConnection start];
    }//
    else if([name isEqualToString:@"getSalesPipelineDashboard_NEEVPL"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipelineDashboard_NEEVPL = [[NSMutableData alloc]init];
        getSalesPipelineDashboard_NEEVPLConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipelineDashboard_NEEVPLConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipelineDashboard_NEEVPLConnection start];
    }//
    else if([name isEqualToString:@"getActivityPPLConnectionDSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ActivityPPLConnectionDSMPL = [[NSMutableData alloc]init];
        getActivityPPLConnectionDSMPLConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getActivityPPLConnectionDSMPLConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityPPLConnectionDSMPLConnection start];
    }//getActivityPLDSMConnection
    else if([name isEqualToString:@"getActivityPLDSMConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ActivityPLDSMConnection = [[NSMutableData alloc]init];
        getActivityPLDSMConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getActivityPLDSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getActivityPLDSMConnection start];
    }//
    else if([name isEqualToString:@"getSalesPipelineDashboard_DSMPLAll"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipelineDashboard_DSMPLAll = [[NSMutableData alloc]init];
        getSalesPipelineDashboard_DSMPLAllConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipelineDashboard_DSMPLAllConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipelineDashboard_DSMPLAllConnection start];
    }//
    else if([name isEqualToString:@"getEventDashboard_DSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        EventDashboard_DSM = [[NSMutableData alloc]init];
        getEventDashboard_DSMConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getEventDashboard_DSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getEventDashboard_DSMConnection start];
    }//getEventActiveDashboard_DSM
    else if([name isEqualToString:@"getEventActiveDashboard_DSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        EventActiveDashboard_DSM = [[NSMutableData alloc]init];
        getEventActiveDashboard_DSMConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getEventActiveDashboard_DSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getEventActiveDashboard_DSMConnection start];
    }//GetMMPipeLineView_DSE
    else if([name isEqualToString:@"getMMPipeLineView_DSE"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        MMPipeLineView_DSE = [[NSMutableData alloc]init];
        getgetMMPipeLineView_DSEConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getgetMMPipeLineView_DSEConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getgetMMPipeLineView_DSEConnection start];
    }//getMMGeoDashboard_DSE
    else if([name isEqualToString:@"getMMGeoDashboard_DSE"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        MMGeoDashboard_DSE = [[NSMutableData alloc]init];
        getMMGeoDashboard_DSEConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getMMGeoDashboard_DSEConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getMMGeoDashboard_DSEConnection start];
    }//getProductUpdateConnection
    else if([name isEqualToString:@"getProductUpdateConnection"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ProductUpdateConnection = [[NSMutableData alloc]init];
        getProductUpdateConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getProductUpdateConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getProductUpdateConnection start];
    }
    
    else if([name isEqualToString:@"getdetailsforopportunity"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING All Opty");
        detailsforopportunity = [[NSMutableData alloc]init];
        getdetailsforopportunity = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getdetailsforopportunity scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getdetailsforopportunity start];
    }
    
    else if([name isEqualToString:@"GetUsageCategoryDSMconnection"])
    {
        
        NSLog(@"\nUpdateOpty REQUEST");
        GetUsageCategoryDSMData = [[NSMutableData alloc]init];
        GetUsageCategoryDSM=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [GetUsageCategoryDSM scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [GetUsageCategoryDSM  start];
    }
    
    else if([name isEqualToString:@"GetBodyTypeDSM"])
    {
        
        NSLog(@"\nUpdateOpty REQUEST");
        GetBodyTypeDSMData = [[NSMutableData alloc]init];
        GetBodyTypeDSMconnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [GetBodyTypeDSMconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [GetBodyTypeDSMconnection  start];
    }
    
    else if([name isEqualToString:@"GetListofActiveMicroMarketDSM"])
    {
        
        NSLog(@"\nUpdateOpty REQUEST");
        GetListofActiveMicroMarketDSMData = [[NSMutableData alloc]init];
        GetListofActiveMicroMarketDSMconnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [GetListofActiveMicroMarketDSMconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [GetListofActiveMicroMarketDSMconnection  start];
    }
    
    else if([name isEqualToString:@"PL_ProductID_Request"])
    {
        
        NSLog(@"\nUpdateOpty REQUEST");
        PL_ProductID_RequestData = [[NSMutableData alloc]init];
        PL_ProductID_Requestconnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [PL_ProductID_Requestconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [PL_ProductID_Requestconnection  start];
    }
    
    //CreateoptyforexistingContact
    
    
    else if([name isEqualToString:@"CreateoptyforexistingContact"])
    {
        
        NSLog(@"\nUpdateOpty REQUEST");
        CreateoptyforexistingContactData = [[NSMutableData alloc]init];
        CreateoptyforexistingContactConnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [CreateoptyforexistingContactConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [CreateoptyforexistingContactConnection  start];
    }
    
    
    else if([name isEqualToString:@"GetContact"]) // for IndianStatesList
    {
        NSLog(@"SENDING Contact REQUEST");
        getContact_List_Data= [[NSMutableData alloc]init];
        get_Contact_List_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [get_Contact_List_Connection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [get_Contact_List_Connection start];
    }
    //getListofsearchOpportunity

    else if([name isEqualToString:@"getListofsearchOpportunity"]) // for IndianStatesList
    {
        NSLog(@"SENDING Contact REQUEST");
        getListofsearchOpportunityData= [[NSMutableData alloc]init];
        getListofsearchOpportunityConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getListofsearchOpportunityConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getListofsearchOpportunityConnection start];
    }

//CreateContactConnetction
    
    else if([name isEqualToString:@"CreateContactConnetction"]) // for IndianStatesList
    {
        NSLog(@"SENDING Contact REQUEST");
        createcontactData= [[NSMutableData alloc]init];
        createcontactconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [createcontactconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [createcontactconnection start];
    }
//ContactquerybyID
    
    else if([name isEqualToString:@"ContactquerybyID"]) // for IndianStatesList
    {
        NSLog(@"SENDING Contact REQUEST");
        ContactquerybyIDData= [[NSMutableData alloc]init];
        ContactquerybyIDConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [ContactquerybyIDConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [ContactquerybyIDConnection start];
    }
    //prospectupdateconnection
    
    else if([name isEqualToString:@"prospectupdateconnection"]) // for IndianStatesList
    {
        NSLog(@"SENDING Contact REQUEST");
        prospectupdateconnectionData= [[NSMutableData alloc]init];
        prospectupdateconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [prospectupdateconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [prospectupdateconnection start];
    }
    
    else if([name isEqualToString:@"AssignActivityforopportunity"]) // for IndianStatesList
    {
        NSLog(@"SENDING Contact REQUEST");
        AssignActivityforopportunityData= [[NSMutableData alloc]init];
        AssignActivityforopportunityconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [AssignActivityforopportunityconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [AssignActivityforopportunityconnection start];
    }
    
    //ppl

    else if([name isEqualToString:@"ppl"]) // for IndianStatesList
    {
        NSLog(@"SENDING Contact REQUEST");
        ppldata= [[NSMutableData alloc]init];
        pplconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [pplconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [pplconnection start];
    }


    // PinCode
    
    else if([name isEqualToString:@"getAllPincodeConnectioninCreateOptyVC"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        getAllPincodeConnectioninCreateOptyVCdata= [[NSMutableData alloc]init];
        getAllPincodeConnectioninCreateOptyVCConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getAllPincodeConnectioninCreateOptyVCConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getAllPincodeConnectioninCreateOptyVCConnection start];
    }
    
    /*
        Nihal Create Opportunity
     */
    
    //GetALLPPLRelatedProduct
    else if([name isEqualToString:@"GetALLPPLRelatedProduct"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        GetALLPPLRelatedProductdata= [[NSMutableData alloc]init];
        GetALLPPLRelatedProductConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [GetALLPPLRelatedProductConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [GetALLPPLRelatedProductConnection start];
    }
    
    
    
    
    else if([name isEqualToString:@"GetCampainDetailsForDSM"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        GetCampainDetailsForDSMdata= [[NSMutableData alloc]init];
        GetCampainDetailsForDSMConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [GetCampainDetailsForDSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [GetCampainDetailsForDSMConnection start];
    }
    
    //contactsearch
    
    else if([name isEqualToString:@"contactsearch"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        contactsearchdata= [[NSMutableData alloc]init];
        contactsearchConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [contactsearchConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [contactsearchConnection start];
    }
    //optycontactsearch
    
    else if([name isEqualToString:@"optycontactsearch"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        optycontactsearchdata= [[NSMutableData alloc]init];
        optycontactsearchConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [optycontactsearchConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [optycontactsearchConnection start];
    }
    
    
    //contactcreation
    
    
    else if([name isEqualToString:@"contactcreation"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        contactcreationdata= [[NSMutableData alloc]init];
        contactcreationConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [contactcreationConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [contactcreationConnection start];
    }
    
    else if([name isEqualToString:@"sourceofcontact"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        sourceofcontactdata= [[NSMutableData alloc]init];
        sourceofcontactConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [sourceofcontactConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [sourceofcontactConnection start];
    }
    
    else if([name isEqualToString:@"getcustomerType"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        getcustomerTypedata= [[NSMutableData alloc]init];
        getcustomerTypeConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getcustomerTypeConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getcustomerTypeConnection start];
    }
    
    //accountCreation
    
    else if([name isEqualToString:@"accountCreation"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        accountCreationdata= [[NSMutableData alloc]init];
        accountCreationConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [accountCreationConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [accountCreationConnection start];
    }
    else if([name isEqualToString:@"accountCreation1"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        accountCreationdata1= [[NSMutableData alloc]init];
        accountCreationConnection1 = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [accountCreationConnection1 scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [accountCreationConnection1 start];
    }
    //contactoptylink
    
    else if([name isEqualToString:@"contactoptylink"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        contactoptylinkdata= [[NSMutableData alloc]init];
        contactoptylinkConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [contactoptylinkConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [contactoptylinkConnection start];
    }
    
    /**
     *   DashBoard New
     */
    //SearchActivities_ConnectionDashboard
    else if([name isEqualToString:@"SearchActivities_ConnectionDashboard"])
    {
        NSLog(@"SENDING Contact REQUEST SearchActivities_ConnectionDashboard ");
        SearchActivities_Data= [[NSMutableData alloc]init];
        SearchActivities_DashboardConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [SearchActivities_DashboardConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [SearchActivities_DashboardConnection start];
    }//SearchActivities_ConnectionDashboard30days
    //Dashboard

    else if([name isEqualToString:@"SearchActivities_ConnectionDashboard30days"])
    {
        NSLog(@"SENDING Contact REQUEST SearchActivities_ConnectionDashboard30days ");
        SearchActivities_Data30dys= [[NSMutableData alloc]init];
        SearchActivities_DashboardConnection30days = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [SearchActivities_DashboardConnection30days scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [SearchActivities_DashboardConnection30days start];
    }
    else if([name isEqualToString:@"getMMPipeLineView_DSE_SH"])
    {
        NSLog(@"SENDING Contact REQUEST getMMPipeLineView_DSE_SH ");
        MMPipeLineView_DSE_Data= [[NSMutableData alloc]init];
        MMPipeLineViewDSE_DashboardConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [MMPipeLineViewDSE_DashboardConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [MMPipeLineViewDSE_DashboardConnection start];
    }
    //getSalesPipeLineDashboard_DSM60Days Dashboard
    else if([name isEqualToString:@"getSalesPipeLineDashboard_DSM60Days"])
    {
        NSLog(@"SENDING Product Nname");
        SalesPipeLineDashboard_DSM60DaysData = [[NSMutableData alloc]init];
        getSalesPipeLineDashboard_DSM60DaysConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipeLineDashboard_DSM60DaysConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipeLineDashboard_DSM60DaysConnection start];
    }
    else if([name isEqualToString:@"getMMGeoDashboard_DSE60Days"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        MMGeoDashboard_DSE60Days = [[NSMutableData alloc]init];
        getMMGeoDashboard_DSE60DaysConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getMMGeoDashboard_DSE60DaysConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getMMGeoDashboard_DSE60DaysConnection start];
    }
    //getMMApplicationDashboard_DSE60
    else if([name isEqualToString:@"getMMApplicationDashboard_DSE60"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        MMApplicationDashboard_DSE60Days = [[NSMutableData alloc]init];
        getMMApplicationDashboard_DSE60DaysConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getMMApplicationDashboard_DSE60DaysConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getMMApplicationDashboard_DSE60DaysConnection start];
    }//getMMApplicationDashboard_DSECurrent
    else if([name isEqualToString:@"getMMApplicationDashboard_DSECurrent"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        MMApplicationDashboard_DSECurrent = [[NSMutableData alloc]init];
        getMMApplicationDashboard_DSECurrentConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getMMApplicationDashboard_DSECurrentConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getMMApplicationDashboard_DSECurrentConnection start];
    }//getSalesPipeLineDashboard_CallPLDrilFromPPL
    else if([name isEqualToString:@"getSalesPipeLineDashboard_CallPLDrilFromPPL"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        SalesPipeLineDashboard_CallPLDrilFromPPL = [[NSMutableData alloc]init];
        getSalesPipeLineDashboard_CallPLDrilFromPPLConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getSalesPipeLineDashboard_CallPLDrilFromPPLConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getSalesPipeLineDashboard_CallPLDrilFromPPLConnection start];
    }//getListOfNseOrDseForDSM
    else if([name isEqualToString:@"getListOfNseOrDseForDSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ListOfNseOrDseForDSM = [[NSMutableData alloc]init];
        getListOfNseOrDseForDSMConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getListOfNseOrDseForDSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getListOfNseOrDseForDSMConnection start];
    }//getListOfTeamActivityDSM
    else if([name isEqualToString:@"getListOfTeamActivityDSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ListOfTeamActivityDSM = [[NSMutableData alloc]init];
        getListOfTeamActivityDSMConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getListOfTeamActivityDSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getListOfTeamActivityDSMConnection start];
    }//getDSEwisePipeLinecurrentMonth_DSM
    else if([name isEqualToString:@"getDSEwisePipeLinecurrentMonth_DSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        DSEwisePipeLinecurrentMonth = [[NSMutableData alloc]init];
        getDSEwisePipeLinecurrentMonth_DSMConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getDSEwisePipeLinecurrentMonth_DSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getDSEwisePipeLinecurrentMonth_DSMConnection start];
    }//getDSEwisePipeLineLast30Days_DSM
    else if([name isEqualToString:@"getDSEwisePipeLineLast30Days_DSM"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        DSEwisePipeLine30Days=[[NSMutableData alloc]init];
        getDSEwisePipeLineLast30Days_DSMConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getDSEwisePipeLineLast30Days_DSMConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getDSEwisePipeLineLast30Days_DSMConnection start];
    }//getListOfTeamActivityDSM30Days
    else if([name isEqualToString:@"getListOfTeamActivityDSM30Days"]) //for search opportunity screen // for sale stage
    {
        NSLog(@"SENDING Product Nname");
        ListOfTeamActivityDSM30Days = [[NSMutableData alloc]init];
        getListOfTeamActivityDSMConnection30Days= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getListOfTeamActivityDSMConnection30Days scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getListOfTeamActivityDSMConnection30Days start];
    }
    else if([name isEqualToString:@"newoptyactivity"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        newoptyactivitydata= [[NSMutableData alloc]init];
        newoptyactivityConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [newoptyactivityConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [newoptyactivityConnection start];
    }
    else if([name isEqualToString:@"getallaccountpincode"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        getallaccountpincodedata= [[NSMutableData alloc]init];
        getallaccountpincodeconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getallaccountpincodeconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getallaccountpincodeconnection start];
    }
    
    
    
    else if([name isEqualToString:@"getaccountdetails"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        getaccountdetailsdata= [[NSMutableData alloc]init];
        getaccountdetailsconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getaccountdetailsconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getaccountdetailsconnection start];
    }

    else if([name isEqualToString:@"accountCreationforupdate"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        accountCreationforupdatedata= [[NSMutableData alloc]init];
        accountCreationforupdateconnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [accountCreationforupdateconnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [accountCreationforupdateconnection start];
    }
    else if([name isEqualToString:@"getListOfNseOrDseForDSM"]) // for IndianStatesList
    {
        NSLog(@"SENDING getAllPincodeConnectioninCreateOptyVC REQUEST");
        getListOfNseOrDseForDSMdata= [[NSMutableData alloc]init];
        getListOfNseOrDseForDSMconnection1 = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [getListOfNseOrDseForDSMconnection1 scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [getListOfNseOrDseForDSMconnection1 start];
    }

    //accountCreationforupdate
}

- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{

    if (connection == AllDataAginstOptyIDinEditOptyConnection1) {
        [AllDataAginstOptyIDinEditOptydata setLength:0];
    }

    if (connection == artifactConnection)
        [artifactData setLength:0];

    else if (connection == authenticateOIDConnection)
        [authenticateOIDData setLength:0];
    
    else if (connection == getActivityDetailFetchConnection)
        [ActivityDetailFetchdata setLength:0];
    
    
    else if (connection == getCurrentDateConnection)
        [CurrentDateData setLength:0];
    else if (connection == getUserDetailsConnection)
        [userDetailsData setLength:0];

    else if (connection == getAllOpportunity)
        [SaleAllOpportunity setLength:0];

    else if (connection == getCreateoptyfornewcontact)
        [Createoptyfornewcontactdata setLength:0];

    else if (connection == getAllStatesConnection)
        [AllStatesdata setLength:0];

    else if (connection == getAllStatesConnection)
        [AllStatesdata setLength:0];

    else if (connection == getAllcitiesconnection)
        [Allcitiesdata setLength:0];

    else if (connection == getAlltalukaconnection)
        [Alltalukadata setLength:0];

    else if (connection == getActivityTypeConnection)
        [ActivityTypedata setLength:0];

    else if (connection == getActivityCreateConnection)
        [ActivityCreatedata setLength:0];

    else if (connection == getLostReasonOpportunityConnection)
        [ReasonLostOpportunity setLength:0];
    else if (connection == getLostMakeOpportunityConnection)
        [MakeLostOpportunity setLength:0];
    else if (connection == getLostModeOpportunityConnection)
        [ModeLostOpportunity setLength:0];
    else if (connection == getListOfDSETypeConnection)
        [GetListOfDSE setLength:0];
    else if (connection == getActivitydetailsListfromopty)
        [ActivitydetailsListfromoptydata setLength:0];
    else if (connection == getLinkcampaign_Connection)
        [Linkcampaign_Data setLength:0];
    else if (connection == getLinkcampaign_Select_connection)
        [Select_Linkcampaign_Data setLength:0];
    else if (connection == getActivityDetails_Connection)
        [ActivityDetails_Data setLength:0];
    else if (connection == getActivityPPLConnection)
        [ActivityPPLData setLength:0];
    else if (connection == getActivityTypeConnection)
        [ActivityTypeData setLength:0];
    else if (connection == getActivityTaluka)
        [ActivityTaluka setLength:0];
    else if (connection == getSearchOpportunityAssignTo)
        [SalesOppAssingTOData setLength:0];
    else if (connection == getSearchActivitiesConnection)
        [seachActivitiesData setLength:0];
    else if (connection == getCreateQouteConnection)
        [CreateQouteConnection setLength:0];
    else if(connection == getQouteCreationupdateOptyConnection)
        [QouteCreationupdateOpty setLength:0];
    else if (connection == getupdateOpportunityQouteConnection)
        [UpdateOpportunityQouteConnection setLength:0];
    else if (connection == getDoneUPdateOptyLast_Connection)
        [DoneUPdateOptyLastData setLength:0];
    else if(connection == getQouteCreationConnection)
        [QouteCreationData setLength:0];
    else if(connection == getQouteCreationupdateOptySales)
        [QouteCreationupdateOptyData setLength:0];
    else if (connection == getSearchAccountConnection)
        [getSearchAccountData setLength:0];
    else if(connection == AccountUpdate_Connection)
        [AccountUpdateData setLength:0];
    else if (connection == getCreateContacWithAccountDetails_Connection)
        [CreateContacWithAccountDetails_Data setLength:0];
    else if(connection == getCreateAccountE_Connection)
        [CreateAccount_Data setLength:0];
    else if(connection == getAssignOptyConnection)
        [GetAssignToDSE setLength:0];
    else if(connection == getActivityDoneConnection)
        [ActivityDoneData setLength:0];
    else if(connection == ActivitiyFinalDoneConnection)
        [ActivitiyFinalDone setLength:0];
    else if(connection == getAllDistrictConnection)
        [GetAllDistrict setLength:0];
    else if(connection == getAllCityConnection)
        [AllCityDataFind setLength:0];
    else if(connection == getAllTalukaConnection)
        [GetAllTaluka setLength:0];
    else if(connection == getAllPincodeConnection)
        [GetAllPincode setLength:0];
    else if (connection == ProceedToQuoteCreation_connection)
        [ProceedToQuoteCreationdata setLength:0];
    else if (connection == AfterQuoteCreationConnection)
        [AfterQuoteCreationData setLength:0];
    else if(connection == getLostOpportunityConnection)
        [MakeTheLostOpportunity setLength:0];
    else if (connection == getSearchActivitiesConnection1)//abhishek // for Activity search Connection
        [seachActivitiesData1 setLength:0];
    
    else if (connection == getupdateActivityNEWConnection) //ABhishek // FOR Activity UPDATE // New Hematha
        [PendingActivtyNEWUpdate setLength:0];
    
    
    else if (connection == getupdateActivityConnection)
        [PendingActivtyUpdate setLength:0];
    
    else if (connection == getActivityPLConnection)
        [getPLData setLength:0];
    else if(connection == getAppType_connection)
        [GetAppTypeData setLength:0];
    else if(connection == getActivityFinanceConnection)
        [getFinancier_List_Data setLength:0];

    else if (connection == ContactSave_connection)
        [ContactSavedata setLength:0];
    else if (connection == adressID_connection)
        [adressIDdata setLength:0];
    else if(connection==get_Lob_List_Connection)
        [getLobList setLength:0];
    
    else if(connection==get_PPL_List_Connection)
        [getPPL_List_Data setLength:0];
    
    else if(connection==get_PL_List_Connection)
        [getPL_List_Data setLength:0];
    
    else if(connection==get_Application_List_Connection)
        [getApplication_List_Data setLength:0];
    
    else if (connection == GetProductconnection)
        [GetProductdata setLength:0];
    
    else if (connection == UpdateOptyconnection)
        [UpdateOptydata setLength:0];
    else if (connection == StateAllconnection)
        [StateData setLength:0];
    else if(connection == getAddressConnection) 
        [AddressData setLength:0];
    else if(connection == getAllTalukaConnectioncall)
        [GetAllTalukacall setLength:0];
    else if(connection == getContactUpdateConnection)
        [ContactDetailsUpdate setLength:0];
    else if(connection == getApplicationbodyTypeconnection)
        [ApplicationBodyType setLength:0];
    else if(connection == getCustomerSegmentConnection)
        [CustomerSegmentData setLength:0];
    else if(connection == getSalesPipelineDashboardConnection)
        [SalesPipelineDashboard setLength:0];
    else if(connection == getLeadGeneratorwisePipelineViewConnection)
        [LeadGeneratorwisePipelineView setLength:0];
    else if(connection == getMMPipeLineView_DSMConnection)
        [MMPipeLineView_DSM setLength:0];
    else if(connection == getSalesPipeLineDashboard_DSMConnection)
        [SalesPipeLineDashboard_DSM setLength:0];
    else if(connection == getSalesPipeLineDashboard_DSEConnection)
        [SalesPipeLineDashboard_DSE setLength:0];
    else if(connection == getSalesPipelineDashboard_NEEVConnection)
        [SalesPipelineDashboard_NEEV setLength:0];
    else if(connection == getEventExecutiveDashboard_NEEVConnection)
        [EventExecutiveDashboard_NEEV setLength:0];
    else if(connection == getEventActive_NEEVConnection)
        [EventActive_NEEV setLength:0];
    else if(connection == getSalesPipelineDashboard_NEEVPPLConnection)
        [SalesPipelineDashboard_NEEVPPL setLength:0];
    else if(connection == getSalesPipelineDashboard_NEEVPLConnection)
        [SalesPipelineDashboard_NEEVPL setLength:0];
    else if(connection == getActivityPPLConnectionDSMPLConnection)
        [ActivityPPLConnectionDSMPL setLength:0];
    else if(connection == getActivityPLDSMConnection)
        [ActivityPLDSMConnection setLength:0];
    else if(connection == getSalesPipelineDashboard_DSMPLAllConnection)
        [SalesPipelineDashboard_DSMPLAll setLength:0];
    else if(connection == getEventDashboard_DSMConnection)
        [EventDashboard_DSM setLength:0];
    else if(connection == getEventActiveDashboard_DSMConnection)
        [EventActiveDashboard_DSM setLength:0];
    else if(connection == getgetMMPipeLineView_DSEConnection)
        [MMPipeLineView_DSE setLength:0];
    else if(connection == getMMGeoDashboard_DSEConnection)
        [MMGeoDashboard_DSE setLength:0];
    else if(connection == getProductUpdateConnection)
        [ProductUpdateConnection setLength:0];

    else if(connection == getdetailsforopportunity) //Abhishek //For sale stage in search opportunity screen Details //
        [detailsforopportunity setLength:0];
    
    else if (connection == GetUsageCategoryDSM)
        [GetUsageCategoryDSMData setLength:0];
    
    
    else if (connection == GetBodyTypeDSMconnection)
        [GetBodyTypeDSMData setLength:0];
    
    else if (connection == GetListofActiveMicroMarketDSMconnection)
        [GetListofActiveMicroMarketDSMData setLength:0];
    
    
    else if (connection == PL_ProductID_Requestconnection)
        [PL_ProductID_RequestData setLength:0];
    
    
    else if (connection == CreateoptyforexistingContactConnection)
        [CreateoptyforexistingContactData setLength:0];
    
    
    
    else if(connection==get_Contact_List_Connection)
        [getContact_List_Data setLength:0];
    
    else if(connection==getListofsearchOpportunityConnection)
        [getListofsearchOpportunityData setLength:0];
    
    
    else if(connection==createcontactconnection)
        [createcontactData setLength:0];
    
    else if(connection==ContactquerybyIDConnection)
        [ContactquerybyIDData setLength:0];
    
    
    
    else if(connection==prospectupdateconnection)
        [prospectupdateconnectionData setLength:0];
    
    else if(connection==AssignActivityforopportunityconnection)
        [AssignActivityforopportunityData setLength:0];
    
    else if(connection==pplconnection)
        [ppldata setLength:0];
    
    
    
    
    //AllCityDataFind
    
    // PinCode For OptyView
    // Create Opty
    
    else if(connection == getAllPincodeConnectioninCreateOptyVCConnection)
        [getAllPincodeConnectioninCreateOptyVCdata setLength:0];

    else if(connection==SearchActivities_DashboardConnection)
        [SearchActivities_Data setLength:0];
    else if(connection==MMPipeLineViewDSE_DashboardConnection)
        [MMPipeLineView_DSE_Data setLength:0];
    
    else if(connection == GetALLPPLRelatedProductConnection)
        [GetALLPPLRelatedProductdata setLength:0];
    
    else if(connection == GetCampainDetailsForDSMConnection)
        [GetCampainDetailsForDSMdata setLength:0];
    
    else if(connection == contactsearchConnection)
        [contactsearchdata setLength:0];
    
    
    else if(connection == optycontactsearchConnection)
        [optycontactsearchdata setLength:0];
    
    else if(connection == contactcreationConnection)
        [contactcreationdata setLength:0];
    else if(connection == sourceofcontactConnection)
        [sourceofcontactdata setLength:0];
    
    else if(connection == getcustomerTypeConnection)
        [getcustomerTypedata setLength:0];
    
    else if(connection == accountCreationConnection)
        [accountCreationdata setLength:0];
    else if(connection == accountCreationConnection1)
        [accountCreationdata1 setLength:0];
    
    
    else if(connection == contactoptylinkConnection)
        [contactoptylinkdata setLength:0];

    
    
    
    
    /// Dashboard
    else if(connection==getSalesPipeLineDashboard_DSM60DaysConnection)
        [SalesPipeLineDashboard_DSM60DaysData setLength:0];
    else if(connection==SearchActivities_DashboardConnection30days)
        [SearchActivities_Data30dys setLength:0];
    
    
    
    
    
    // Prospect
    else if(connection==getAllStatesConnectionProspect)
        [GetAllStatesProspect setLength:0];
    
    // MMGeo for 60 Days
  
    else if(connection==getMMGeoDashboard_DSE60DaysConnection)
        [MMGeoDashboard_DSE60Days setLength:0];
    
    else if(connection==getMMApplicationDashboard_DSE60DaysConnection)
        [MMApplicationDashboard_DSE60Days setLength:0];
    
    else if(connection==getMMApplicationDashboard_DSECurrentConnection)
        [MMApplicationDashboard_DSECurrent setLength:0];
    //getSalesPipeLineDashboard_CallPLDrilFromPPLConnection
    else if(connection==getSalesPipeLineDashboard_CallPLDrilFromPPLConnection)
        [SalesPipeLineDashboard_CallPLDrilFromPPL setLength:0];
    else if(connection==getListOfNseOrDseForDSMConnection)
        [ListOfNseOrDseForDSM setLength:0];
    else if(connection==getListOfTeamActivityDSMConnection)
        [ListOfTeamActivityDSM setLength:0];
    else if(connection==getDSEwisePipeLinecurrentMonth_DSMConnection)
        [DSEwisePipeLinecurrentMonth setLength:0];
    else if(connection==getDSEwisePipeLineLast30Days_DSMConnection)
        [DSEwisePipeLine30Days setLength:0];
    
    else if(connection==getListOfTeamActivityDSMConnection30Days)
        [ListOfTeamActivityDSM30Days setLength:0];
    //DSEwisePipeLine30Days
    
    else if(connection == newoptyactivityConnection)
        [newoptyactivitydata setLength:0];
    
    else if(connection == getallaccountpincodeconnection)
        [getallaccountpincodedata setLength:0];
    
    else if(connection == getaccountdetailsconnection)
        [getaccountdetailsdata setLength:0];
    
    else if(connection == accountCreationforupdateconnection)
        [accountCreationforupdatedata setLength:0];
    
    else if(connection == getListOfNseOrDseForDSMconnection1)
        [getListOfNseOrDseForDSMdata setLength:0];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    
    
    if (connection == AllDataAginstOptyIDinEditOptyConnection1) {
        [AllDataAginstOptyIDinEditOptydata appendData:data];
    }

    
    if (connection == artifactConnection)
        [artifactData appendData:data];

    else if (connection == authenticateOIDConnection)
        [authenticateOIDData appendData:data];
    else if (connection == getCurrentDateConnection) //Abhishek //For Date
        [CurrentDateData appendData:data];

    else if (connection == getUserDetailsConnection) //Abhishek //For User Details
        [userDetailsData appendData:data];

    else if (connection == getAllOpportunity) //Abhishek //For sale stage in search opportunity screen Details
        [SaleAllOpportunity appendData:data];
    
    else if (connection == getActivityDetailFetchConnection)
        [ActivityDetailFetchdata appendData:data];
    
    

    if (connection == getCreateoptyfornewcontact)
        [Createoptyfornewcontactdata appendData:data];

    else if (connection == getAllStatesConnection)
        [AllStatesdata appendData:data];

    else if (connection == getAllDistrictsConnection)
        [AllDistrictsdata appendData:data];

    else if (connection == getAllcitiesconnection)
        [Allcitiesdata appendData:data];

    else if (connection == getAlltalukaconnection)
        [Alltalukadata appendData:data];

    else if (connection == getActivityTypeConnection)
        [ActivityTypedata appendData:data];

    else if (connection == getActivityCreateConnection)
        [ActivityCreatedata appendData:data];

    else if (connection == getLostReasonOpportunityConnection)
        [ReasonLostOpportunity appendData:data];
    else if (connection == getLostMakeOpportunityConnection)
        [MakeLostOpportunity appendData:data];
    else if (connection == getLostModeOpportunityConnection)
        [ModeLostOpportunity appendData:data];
    else if (connection == getListOfDSETypeConnection)
        [GetListOfDSE appendData:data];

    else if (connection == getActivitydetailsListfromopty)
        [ActivitydetailsListfromoptydata appendData:data];
    else if (connection == getLinkcampaign_Connection)
        [Linkcampaign_Data appendData:data];
    else if (connection == getLinkcampaign_Select_connection)
        [Select_Linkcampaign_Data appendData:data];
    else if (connection == getActivityDetails_Connection)
        [ActivityDetails_Data appendData:data];
    else if (connection == getActivityPPLConnection)
        [ActivityPPLData appendData:data];
    else if (connection == getActivityTypeConnection)
        [ActivityTypeData appendData:data];
    else if (connection == getActivityTaluka)
        [ActivityTaluka appendData:data];
    else if (connection == getSearchOpportunityAssignTo)
        [SalesOppAssingTOData appendData:data];
    else if (connection == getSearchActivitiesConnection)
        [seachActivitiesData appendData:data];
    else if (connection == getCreateQouteConnection)
        [CreateQouteConnection appendData:data];
    else if(connection == getQouteCreationupdateOptyConnection)
        [QouteCreationupdateOpty appendData:data];
    else if (connection == getupdateOpportunityQouteConnection)
        [UpdateOpportunityQouteConnection appendData:data];
    else if (connection == getDoneUPdateOptyLast_Connection)
        [DoneUPdateOptyLastData appendData:data];
    else if(connection == getQouteCreationupdateOptySales)
        [QouteCreationupdateOptyData appendData:data];
    else if (connection == getSearchAccountConnection)
        [getSearchAccountData appendData:data];
    else if(connection == AccountUpdate_Connection)
        [AccountUpdateData appendData:data];
    else if (connection == getCreateContacWithAccountDetails_Connection)
        [CreateContacWithAccountDetails_Data appendData:data];
    else if(connection == getCreateAccountE_Connection)
        [CreateAccount_Data appendData:data];
    else if(connection == getAssignOptyConnection)
        [GetAssignToDSE appendData:data];
    else if(connection == getActivityDoneConnection)
        [ActivityDoneData appendData:data];
    else if(connection == ActivitiyFinalDoneConnection)
        [ActivitiyFinalDone appendData:data];
    else if(connection == getAllDistrictConnection)
        [GetAllDistrict appendData:data];
    else if(connection == getAllCityConnection)
        [AllCityDataFind appendData:data];
    else if(connection == getAllTalukaConnection)
        [GetAllTaluka appendData:data];
    else if(connection == getAllPincodeConnection)
        [GetAllPincode appendData:data];
    else if (connection == ProceedToQuoteCreation_connection)
        [ProceedToQuoteCreationdata appendData:data];
    else if (connection == AfterQuoteCreationConnection)
        [AfterQuoteCreationData appendData:data];
    else if(connection == getLostOpportunityConnection)
        [MakeTheLostOpportunity appendData:data];
    else if (connection == getSearchActivitiesConnection1)//abhishek // for Activity searchActivities
        [seachActivitiesData1 appendData:data];
    
    else if (connection == getupdateActivityConnection)
        [PendingActivtyUpdate appendData:data];
    
    else if (connection == getupdateActivityNEWConnection) //ABHISHEK activity New Update // Hemantha
        [PendingActivtyNEWUpdate appendData:data];
    
    
    
    else if (connection == getActivityPLConnection)
        [getPLData appendData:data];
    else if(connection == getAppType_connection)
        [GetAppTypeData appendData:data];
    else if(connection == getActivityFinanceConnection)
        [getFinancier_List_Data appendData:data];
    else if (connection == ContactSave_connection)
        [ContactSavedata appendData:data];
    
    else if (connection == adressID_connection)
        [adressIDdata appendData:data];
    else if(connection==get_Lob_List_Connection)
        [getLobList appendData:data];
    else if(connection==get_PPL_List_Connection)
        [getPPL_List_Data appendData:data];
    
    else if(connection==get_PL_List_Connection)
        [getPL_List_Data appendData:data];
    
    else if(connection==get_Application_List_Connection)
        [getApplication_List_Data appendData:data];
    
    else if (connection == GetProductconnection)
        [GetProductdata appendData:data];
    
    else if (connection == UpdateOptyconnection)
        [UpdateOptydata appendData:data];
    else if (connection == StateAllconnection)
        [StateData appendData:data];
    else if(connection == getAddressConnection)
        [AddressData appendData:data];
    else if(connection == getAllTalukaConnectioncall)
        [GetAllTalukacall appendData:data];
    else if(connection == getContactUpdateConnection)
        [ContactDetailsUpdate appendData:data];
    else if(connection == getApplicationbodyTypeconnection)
        [ApplicationBodyType appendData:data];
    else if(connection == getCustomerSegmentConnection)
        [CustomerSegmentData appendData:data];
    else if(connection == getSalesPipelineDashboardConnection)
        [SalesPipelineDashboard appendData:data];
    else if(connection == getLeadGeneratorwisePipelineViewConnection)
        [LeadGeneratorwisePipelineView appendData:data];
    else if(connection == getMMPipeLineView_DSMConnection)
        [MMPipeLineView_DSM appendData:data];
    else if(connection == getSalesPipeLineDashboard_DSMConnection)
        [SalesPipeLineDashboard_DSM appendData:data];
    else if(connection == getSalesPipeLineDashboard_DSEConnection)
        [SalesPipeLineDashboard_DSE appendData:data];
    else if(connection == getSalesPipelineDashboard_NEEVConnection)
        [SalesPipelineDashboard_NEEV appendData:data];
    else if(connection == getEventExecutiveDashboard_NEEVConnection)
        [EventExecutiveDashboard_NEEV appendData:data];
    else if(connection == getEventActive_NEEVConnection)
        [EventActive_NEEV appendData:data];
    else if(connection == getSalesPipelineDashboard_NEEVPPLConnection)
        [SalesPipelineDashboard_NEEVPPL appendData:data];
    else if(connection == getSalesPipelineDashboard_NEEVPLConnection)
        [SalesPipelineDashboard_NEEVPL appendData:data];
    else if(connection == getActivityPPLConnectionDSMPLConnection)
        [ActivityPPLConnectionDSMPL appendData:data];
    else if(connection == getActivityPLDSMConnection)
        [ActivityPLDSMConnection appendData:data];
    else if(connection == getSalesPipelineDashboard_DSMPLAllConnection)
        [SalesPipelineDashboard_DSMPLAll appendData:data];
    else if(connection == getEventDashboard_DSMConnection)
        [EventDashboard_DSM appendData:data];
    else if(connection == getEventActiveDashboard_DSMConnection)
        [EventActiveDashboard_DSM appendData:data];
    else if(connection == getgetMMPipeLineView_DSEConnection)
        [MMPipeLineView_DSE appendData:data];
    else if(connection == getMMGeoDashboard_DSEConnection)
        [MMGeoDashboard_DSE appendData:data];
    else if(connection == getProductUpdateConnection)
        [ProductUpdateConnection appendData:data];
    
    
    else if (connection == GetUsageCategoryDSM)
        [GetUsageCategoryDSMData appendData:data];
    
    
    else if (connection == GetBodyTypeDSMconnection)
        [GetBodyTypeDSMData appendData:data];
    
    
    else if (connection == GetListofActiveMicroMarketDSMconnection)
        [GetListofActiveMicroMarketDSMData appendData:data];
    
    
    
    else if (connection == PL_ProductID_Requestconnection)
        [PL_ProductID_RequestData appendData:data];
    
    
    else if (connection == CreateoptyforexistingContactConnection)
        [CreateoptyforexistingContactData appendData:data];
    
    
    
    
    else if(connection==get_Contact_List_Connection)
        [getContact_List_Data appendData:data];
    
    
    
    else if(connection == getdetailsforopportunity)//Abhishek //For sale stage in search opportunity screen Details
        [detailsforopportunity appendData:data];
    
    else if(connection == getListofsearchOpportunityConnection)//Abhishek //For sale stage in search opportunity screen Details
        [getListofsearchOpportunityData appendData:data];
    
    
    else if(connection == createcontactconnection)//Abhishek //For sale stage in search opportunity screen Details
        [createcontactData appendData:data];
    
    
    
    else if(connection == ContactquerybyIDConnection)//Abhishek //For sale stage in search opportunity screen Details
        [ContactquerybyIDData appendData:data];
    
    else if(connection == prospectupdateconnection)//Abhishek //For sale stage in search opportunity screen Details
        [prospectupdateconnectionData appendData:data];
    
    
    
    else if(connection == AssignActivityforopportunityconnection)//Abhishek //For sale stage in search opportunity screen Details
        [AssignActivityforopportunityData appendData:data];
    
    else if(connection == pplconnection)//Abhishek //For sale stage in search opportunity screen Details
        [ppldata appendData:data];
    
    
    else if (connection == getAllPincodeConnectioninCreateOptyVCConnection )// For Pincode OptyView
    {
        [getAllPincodeConnectioninCreateOptyVCdata appendData:data];
    }
    else if (connection == SearchActivities_DashboardConnection )// For Pincode OptyView
    {
        [SearchActivities_Data appendData:data];
    }
    else if (connection == MMPipeLineViewDSE_DashboardConnection )// For Pincode OptyView
    {
        [MMPipeLineView_DSE_Data appendData:data];
    }
    // Create Opty
    
    
    else if (connection == GetALLPPLRelatedProductConnection )// For Pincode OptyView
    {
        [GetALLPPLRelatedProductdata appendData:data];
    }
    else if (connection == GetCampainDetailsForDSMConnection )// For Pincode OptyView
    {
        [GetCampainDetailsForDSMdata appendData:data];
    }
    
    else if (connection == contactsearchConnection)// For Pincode OptyView
    {
        [contactsearchdata appendData:data];
    }
    else if (connection == optycontactsearchConnection)// For Pincode OptyView
    {
        [optycontactsearchdata appendData:data];
    }
    
    else if (connection == contactcreationConnection)// For Pincode OptyView
    {
        [contactcreationdata appendData:data];
    }
    
    
    else if (connection == sourceofcontactConnection)// For Pincode OptyView
    {
        [sourceofcontactdata appendData:data];
    }
    
    else if (connection == getcustomerTypeConnection)// For Pincode OptyView
    {
        [getcustomerTypedata appendData:data];
    }
    else if (connection == accountCreationConnection)// For Pincode OptyView
    {
        [accountCreationdata appendData:data];
    }
    else if (connection == accountCreationConnection1)// For Pincode OptyView
    {
        [accountCreationdata1 appendData:data];
    }
    
    else if (connection == contactoptylinkConnection)// For Pincode OptyView
    {
        [contactoptylinkdata appendData:data];
    }
    // Dashboard
    else if (connection == getSalesPipeLineDashboard_DSM60DaysConnection )// For Pincode OptyView
    {
        [SalesPipeLineDashboard_DSM60DaysData appendData:data];
    }
    else if (connection == SearchActivities_DashboardConnection30days )// For Pincode OptyView
    {
        [SearchActivities_Data30dys appendData:data];
    }
    
    // Prospect
    else if (connection == getAllStatesConnectionProspect )// For Pincode OptyView
    {
        [GetAllStatesProspect appendData:data];
    }
    // MM Geo 60 Days
    else if (connection == getMMGeoDashboard_DSE60DaysConnection )
    {
        [MMGeoDashboard_DSE60Days appendData:data];
    }
    else if (connection == getMMApplicationDashboard_DSE60DaysConnection )
    {
        [MMApplicationDashboard_DSE60Days appendData:data];
    }
    else if (connection == getMMApplicationDashboard_DSECurrentConnection )
    {
        [MMApplicationDashboard_DSECurrent appendData:data];
    }
    else if (connection == getSalesPipeLineDashboard_CallPLDrilFromPPLConnection )
    {
        [SalesPipeLineDashboard_CallPLDrilFromPPL appendData:data];
    }
    else if (connection == getListOfNseOrDseForDSMConnection )
    {
        [ListOfNseOrDseForDSM appendData:data];
    }
    else if (connection == getListOfTeamActivityDSMConnection )
    {
        [ListOfTeamActivityDSM appendData:data];
    }
    else if (connection == getDSEwisePipeLinecurrentMonth_DSMConnection )
    {
        [DSEwisePipeLinecurrentMonth appendData:data];
    }
    else if (connection == getDSEwisePipeLineLast30Days_DSMConnection )
    {
        [DSEwisePipeLine30Days appendData:data];
    }
    else if (connection == getListOfTeamActivityDSMConnection30Days )
    {
        [ListOfTeamActivityDSM30Days appendData:data];
    }

    else if (connection == newoptyactivityConnection)// For Pincode OptyView
    {
        [newoptyactivitydata appendData:data];
    }
    
    
    else if (connection == getallaccountpincodeconnection)// For Pincode OptyView
    {
        [getallaccountpincodedata appendData:data];
    }
    else if (connection == getaccountdetailsconnection)// For Pincode OptyView
    {
        [getaccountdetailsdata appendData:data];
    }
    
    
    else if (connection == accountCreationforupdateconnection)// For Pincode OptyView
    {
        [accountCreationforupdatedata appendData:data];
    }
    else if (connection == getListOfNseOrDseForDSMconnection1)// For Pincode OptyView
    {
        [getListOfNseOrDseForDSMdata appendData:data];
    }
}

// to deal with self-signed certificates
- (BOOL)connection:(NSURLConnection*)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace*)protectionSpace
{
    NSLog(@"%i", [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]);
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection*)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge*)challenge
{
    if ([challenge.protectionSpace.authenticationMethod
            isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        // we only trust our own domain
        if ([challenge.protectionSpace.host isEqualToString:@"tmcrmapps.inservices.tatamotors.com"]) {
            NSURLCredential* credential =
                [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        }
    }

    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    NSLog(@"inside..did");
    
    
    if (connection == AllDataAginstOptyIDinEditOptyConnection1) {
        NSString* responseString = [[NSString alloc] initWithBytes:[AllDataAginstOptyIDinEditOptydata mutableBytes] length:[AllDataAginstOptyIDinEditOptydata length] encoding:NSUTF8StringEncoding];
        NSLog(@"AllDataAginstOptyIDinEditOpty Response is ..%@", responseString);
        
        NSNotification* AllDataAginstOptyIDinEditOptyNotification = [NSNotification notificationWithName:@"AllDataAginstOptyIDinEditOpty_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:AllDataAginstOptyIDinEditOptyNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    
    if (connection == artifactConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[artifactData mutableBytes] length:[artifactData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Artifact Response is ..%@", responseString);

        NSNotification* artifactNotification = [NSNotification notificationWithName:@"artifactFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:artifactNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == authenticateOIDConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[authenticateOIDData mutableBytes] length:[authenticateOIDData length] encoding:NSUTF8StringEncoding];
        NSLog(@"authenticateOID Response is %@", responseString);
        //  [self CheckSamalArtExpires:responseString];
        NSNotification* authenticateOIDtNotification = [NSNotification notificationWithName:@"authenticateOIDFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:authenticateOIDtNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getCurrentDateConnection) //Abhishek For Date
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[CurrentDateData mutableBytes] length:[CurrentDateData length] encoding:NSUTF8StringEncoding];
        NSLog(@"authenticateOID Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For Checking SamalArt Expiration
        NSNotification* currentDateNotification = [NSNotification notificationWithName:@"requestDateFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:currentDateNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getUserDetailsConnection) //Abhishek For user Details
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[userDetailsData mutableBytes] length:[userDetailsData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For Checking samalArt Expiration
        NSNotification* userDetailsDateNotification = [NSNotification notificationWithName:@"userDetailsFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:userDetailsDateNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getAllOpportunity) {
        NSString* responseString = [[NSString alloc] initWithBytes:[SaleAllOpportunity mutableBytes] length:[SaleAllOpportunity length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"OpportunityList_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getCreateoptyfornewcontact) {
        NSString* responseString = [[NSString alloc] initWithBytes:[Createoptyfornewcontactdata mutableBytes] length:[Createoptyfornewcontactdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"Createoptyfornewcontact_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getAllStatesConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[AllStatesdata mutableBytes] length:[AllStatesdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"Allstates_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getAllStatesConnectionProspect) {
        NSString* responseString = [[NSString alloc] initWithBytes:[GetAllStatesProspect mutableBytes] length:[GetAllStatesProspect length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"GetAllStatesProspect_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }


    else if (connection == getAllDistrictsConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[AllDistrictsdata mutableBytes] length:[AllDistrictsdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"Alldistricts_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getAllcitiesconnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[Allcitiesdata mutableBytes] length:[Allcitiesdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"Allcities_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getAlltalukaconnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[Alltalukadata mutableBytes] length:[Alltalukadata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"Alltaluka_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getActivityTypeConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivityTypedata mutableBytes] length:[ActivityTypedata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"ActivityType_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getActivityCreateConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivityCreatedata mutableBytes] length:[ActivityCreatedata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"ActivityCreate_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getLostReasonOpportunityConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[ReasonLostOpportunity mutableBytes] length:[ReasonLostOpportunity length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"LostReasonOpty_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getLostMakeOpportunityConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[MakeLostOpportunity mutableBytes] length:[MakeLostOpportunity length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"MakeLostOpty_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getLostModeOpportunityConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[ModeLostOpportunity mutableBytes] length:[ModeLostOpportunity length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"ModeLostOpty_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getListOfDSETypeConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[GetListOfDSE mutableBytes] length:[GetListOfDSE length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"ListOfDSE_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getActivitydetailsListfromopty) {
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivitydetailsListfromoptydata mutableBytes] length:[ActivitydetailsListfromoptydata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* activityfromopty = [NSNotification notificationWithName:@"ActivityListfromopty_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Notificationsss %@", activityfromopty);
        [[NSNotificationQueue defaultQueue] enqueueNotification:activityfromopty postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getLinkcampaign_Connection) {
        NSLog(@"LinkCampaign Data ..");
        NSString* responseString = [[NSString alloc] initWithBytes:[Linkcampaign_Data mutableBytes] length:[Linkcampaign_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* LinkCampaignNotification = [NSNotification notificationWithName:@"LinkCampaign_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:LinkCampaignNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if (connection == getActivityDetailFetchConnection) {
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivityDetailFetchdata mutableBytes] length:[ActivityDetailFetchdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"ActivityFetchDetail_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if (connection == getLinkcampaign_Select_connection) {
        NSLog(@"LinkCampaign Data ..");
        NSString* responseString = [[NSString alloc] initWithBytes:[Select_Linkcampaign_Data mutableBytes] length:[Select_Linkcampaign_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SelectLinkCampaignNotification = [NSNotification notificationWithName:@"SelectLinkCampaign_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:SelectLinkCampaignNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getActivityDetails_Connection) {
        NSLog(@"LinkCampaign Data ..");
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivityDetails_Data mutableBytes] length:[ActivityDetails_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SelectLinkCampaignNotification = [NSNotification notificationWithName:@"ActivityListFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:SelectLinkCampaignNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if (connection == getActivityPPLConnection) //Gautam's Acivity PPL Conection
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivityPPLData mutableBytes] length:[ActivityPPLData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* ActivityPPLNotification = [NSNotification notificationWithName:@"Activity_PPL_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:ActivityPPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getActivityTypeConnection) //Gautam's Activity Type Connection
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivityTypeData mutableBytes] length:[ActivityTypeData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* ActivityTypeNotification = [NSNotification notificationWithName:@"ActivityType_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:ActivityTypeNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getActivityTaluka) //Gautam's Activity Type Connection
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[ActivityTaluka mutableBytes] length:[ActivityTaluka length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* ActivityTypeNotification = [NSNotification notificationWithName:@"ActivityTaluka_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        [[NSNotificationQueue defaultQueue] enqueueNotification:ActivityTypeNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if (connection == getSearchOpportunityAssignTo) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString* responseString = [[NSString alloc] initWithBytes:[SalesOppAssingTOData mutableBytes] length:[SalesOppAssingTOData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@", responseString);
        [self CheckSamalArtExpires:responseString]; //For checking samalArt Expiration
        NSNotification* SaleStagePPLNotification = [NSNotification notificationWithName:@"SaleAssign_To_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString, @"response", nil]];
        NSLog(@"Nitificationsss %@", SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue] enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getSearchActivitiesConnection)// Gautam's Search ACtivity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[seachActivitiesData mutableBytes] length:[seachActivitiesData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SearchActivitiesNotification = [NSNotification notificationWithName:@"searchActivities_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:SearchActivitiesNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getCreateQouteConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[CreateQouteConnection mutableBytes] length:[CreateQouteConnection length] encoding:NSUTF8StringEncoding];
        NSLog(@"search Opty Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SearchOpportunityNotification = [NSNotification notificationWithName:@"CreateQouteConnection_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:SearchOpportunityNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getQouteCreationupdateOptyConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[QouteCreationupdateOpty mutableBytes] length:[QouteCreationupdateOpty length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"QouteCreationupdateOptyConnection_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getupdateOpportunityQouteConnection) //Gautam's Activity Type Connection
    {
        NSLog(@"CReate Actiivty ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[UpdateOpportunityQouteConnection mutableBytes] length:[UpdateOpportunityQouteConnection length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *ActivityTypeNotification = [NSNotification notificationWithName:@"CreateQouteOptyUpdatedConnection_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:ActivityTypeNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if (connection == getDoneUPdateOptyLast_Connection) // create Quatation /CreateQuote
    {
        NSString *responseString  = [[NSString alloc]initWithBytes:[DoneUPdateOptyLastData mutableBytes] length:[DoneUPdateOptyLastData length] encoding:NSUTF8StringEncoding];
        NSLog(@"\nResponseString getCreateQuoteRequest_Connection %@",responseString);
        
        [self CheckSamalArtExpires:responseString];//forchecking samalart expiration
        NSNotification *CreateQuoteNotification = [NSNotification notificationWithName:@"DoneUPdateOptyLastData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:CreateQuoteNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getQouteCreationupdateOptySales) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[QouteCreationupdateOptyData mutableBytes] length:[QouteCreationupdateOptyData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"QouteCreationupdateOptyData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if (connection == getSearchAccountConnection) // create opportunity aginst contact
    {
        NSString *responseString  = [[NSString alloc]initWithBytes:[getSearchAccountData mutableBytes] length:[getSearchAccountData length] encoding:NSUTF8StringEncoding];
        NSLog(@"\nResponseString getSearchAccountConnection %@",responseString);
        
        [self CheckSamalArtExpires:responseString];//forchecking samalart expiration
        NSNotification *SearchAccountNotification = [NSNotification notificationWithName:@"Account_Search_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:SearchAccountNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == AccountUpdate_Connection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[AccountUpdateData mutableBytes] length:[AccountUpdateData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AccountUpdate_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if (connection == getCreateContacWithAccountDetails_Connection) // create contact aginst Account
    {
        NSString *responseString  = [[NSString alloc]initWithBytes:[CreateContacWithAccountDetails_Data mutableBytes] length:[CreateContacWithAccountDetails_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"\nResponseString getCreateContacWithAccountDetails_Connection %@",responseString);
        
        [self CheckSamalArtExpires:responseString];//forchecking samalart expiration
        NSNotification *CreateContacWithAccountDetailsNotification = [NSNotification notificationWithName:@"CreateContact_FromAccountFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:CreateContacWithAccountDetailsNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getCreateAccountE_Connection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[CreateAccount_Data mutableBytes] length:[CreateAccount_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"getCreateAccountE_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getAssignOptyConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetAssignToDSE mutableBytes] length:[GetAssignToDSE length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AssignDSE_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getActivityDoneConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ActivityDoneData mutableBytes] length:[ActivityDoneData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....Done activity  %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"Done_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }else if(connection == ActivitiyFinalDoneConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ActivitiyFinalDone mutableBytes] length:[ActivityDoneData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....Done activity  %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"ActivityFinalDone_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getAllDistrictConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetAllDistrict mutableBytes] length:[GetAllDistrict length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AllDistrict_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }

    else if(connection == getAllCityConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[AllCityDataFind mutableBytes] length:[AllCityDataFind length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AllCity_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getAllTalukaConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetAllTaluka mutableBytes] length:[GetAllTaluka length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AllTalukas_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }//
    else if(connection == getAllPincodeConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetAllPincode mutableBytes] length:[GetAllPincode length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AllPincode_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == ProceedToQuoteCreation_connection)
    {
        NSLog(@"ProceedToQuoteCreation Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[ProceedToQuoteCreationdata mutableBytes] length:[ProceedToQuoteCreationdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *ProceedToQuoteCreation_Notification = [NSNotification notificationWithName:@"ProceedToQuoteCreation_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:ProceedToQuoteCreation_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == AfterQuoteCreationConnection) //Abhishek Activity Type Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[AfterQuoteCreationData mutableBytes] length:[AfterQuoteCreationData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *AfterQuoteCreationNotification = [NSNotification notificationWithName:@"AfterQuoteCreation_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:AfterQuoteCreationNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }

    else if(connection == getLostOpportunityConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MakeTheLostOpportunity mutableBytes] length:[MakeTheLostOpportunity length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"MakeLostTheOpty_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSearchActivitiesConnection1)// Abhishek Search ACtivity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[seachActivitiesData1 mutableBytes] length:[seachActivitiesData1 length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SearchActivitiesNotification1 = [NSNotification notificationWithName:@"searchActivities_Found1" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:SearchActivitiesNotification1 postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection == getupdateActivityConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[PendingActivtyUpdate mutableBytes] length:[PendingActivtyUpdate length] encoding:NSUTF8StringEncoding];
        NSLog(@"search Opty Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SearchOpportunityNotification = [NSNotification notificationWithName:@"ActivityUpdates_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:SearchOpportunityNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection == getupdateActivityNEWConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[PendingActivtyNEWUpdate mutableBytes] length:[PendingActivtyNEWUpdate length] encoding:NSUTF8StringEncoding];
        
        NSLog(@"search Opty Response is %@",responseString);
        
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        
        NSNotification *getupdateActivityNEWNotification = [NSNotification notificationWithName:@"ActivityUpdatesNEW_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        
        [[NSNotificationQueue defaultQueue]enqueueNotification:getupdateActivityNEWNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    
    
    else if(connection==getActivityPLConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getPLData mutableBytes] length:[getPLData length] encoding:NSUTF8StringEncoding];
        NSLog(@"\n Sale stage Response is.................................................. %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleTahshilNotification = [NSNotification notificationWithName:@"PLUpdateOpty_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        //NSLog(@"Nitificationsss %@",SaleTahshilNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleTahshilNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getAppType_connection) //Abhishek For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetAppTypeData mutableBytes] length:[GetAppTypeData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....LOB %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AppType_Data_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection==getActivityFinanceConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getFinancier_List_Data mutableBytes] length:[getFinancier_List_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"\n Sale stage Response is.................................................. %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleTahshilNotification = [NSNotification notificationWithName:@"Finance_Data_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        //NSLog(@"Nitificationsss %@",SaleTahshilNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleTahshilNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }

    else if(connection == ContactSave_connection)
    {
        NSLog(@"ContactSave Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[ContactSavedata mutableBytes] length:[ContactSavedata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *ContactSave_Notification = [NSNotification notificationWithName:@"ContactSave_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:ContactSave_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == adressID_connection)
    {
        NSLog(@"adressID Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[adressIDdata mutableBytes] length:[adressIDdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *adressIDdata_Notification = [NSNotification notificationWithName:@"adressID_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:adressIDdata_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection==get_Lob_List_Connection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getLobList mutableBytes] length:[getLobList length] encoding:NSUTF8StringEncoding];
        NSLog(@"authenticateOID Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *currentDateNotification = [NSNotification notificationWithName:@"LobListFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:currentDateNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    
    else if(connection==get_PPL_List_Connection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getPPL_List_Data mutableBytes] length:[getPPL_List_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"PPL_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *PPL_List_Notification = [NSNotification notificationWithName:@"PPL_ListFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:PPL_List_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==get_PL_List_Connection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getPL_List_Data mutableBytes] length:[getPL_List_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"PL_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *PL_List_Notification = [NSNotification notificationWithName:@"PL_ListFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:PL_List_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==get_Application_List_Connection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getApplication_List_Data mutableBytes] length:[getApplication_List_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"PL_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Application_List_Notification = [NSNotification notificationWithName:@"Application_ListFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Application_List_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    else if(connection == GetProductconnection)
    {
        NSLog(@"ProceedToQuoteCreation Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[GetProductdata mutableBytes] length:[GetProductdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *GetProduct_Notification = [NSNotification notificationWithName:@"GetProduct_Notification_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:GetProduct_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == UpdateOptyconnection)
    {
        NSLog(@"UPdateoPTY Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[UpdateOptydata mutableBytes] length:[UpdateOptydata length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *UpdateOpty_Notification = [NSNotification notificationWithName:@"UpdateOpty_Notification_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:UpdateOpty_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }//
    else if(connection == StateAllconnection)
    {
        NSLog(@"UPdateoPTY Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[StateData mutableBytes] length:[StateData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *UpdateOpty_Notification = [NSNotification notificationWithName:@"All_States_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:UpdateOpty_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getAddressConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[AddressData mutableBytes] length:[AddressData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AddressData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }//
    else if(connection == getAllTalukaConnectioncall) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetAllTalukacall mutableBytes] length:[GetAllTalukacall length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"AllTaluka_CallFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getContactUpdateConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ContactDetailsUpdate mutableBytes] length:[ContactDetailsUpdate length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"ContactUpdate_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getApplicationbodyTypeconnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ApplicationBodyType mutableBytes] length:[ApplicationBodyType length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"ApplicationBodyType_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getCustomerSegmentConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[CustomerSegmentData mutableBytes] length:[CustomerSegmentData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"CustomerSegmentData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSalesPipelineDashboardConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipelineDashboard mutableBytes] length:[SalesPipelineDashboard length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"SalesPipelineDashboard_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getLeadGeneratorwisePipelineViewConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[LeadGeneratorwisePipelineView mutableBytes] length:[LeadGeneratorwisePipelineView length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"LeadGeneratorwisePipelineView_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getMMPipeLineView_DSMConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MMPipeLineView_DSM mutableBytes] length:[MMPipeLineView_DSM length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"MMPipeLineView_DSM_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSalesPipeLineDashboard_DSMConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipeLineDashboard_DSM mutableBytes] length:[SalesPipeLineDashboard_DSM length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration  //SalesPipeLineDashboard_DSMConnection
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"SalesPipeLineDashboard_DSMConnection_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSalesPipeLineDashboard_DSEConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipeLineDashboard_DSE mutableBytes] length:[SalesPipeLineDashboard_DSE length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"SalesPipeLineDashboard_DSE_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSalesPipelineDashboard_NEEVConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipelineDashboard_NEEV mutableBytes] length:[SalesPipelineDashboard_NEEV length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"SalesPipelineDashboard_NEEV_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getEventExecutiveDashboard_NEEVConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[EventExecutiveDashboard_NEEV mutableBytes] length:[EventExecutiveDashboard_NEEV length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"EventExecutiveDashboard_NEEV_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getEventActive_NEEVConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[EventActive_NEEV mutableBytes] length:[EventActive_NEEV length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"EventActive_NEEV_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSalesPipelineDashboard_NEEVPPLConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipelineDashboard_NEEVPPL mutableBytes] length:[SalesPipelineDashboard_NEEVPPL length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"SalesPipelineDashboard_NEEVPPL_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSalesPipelineDashboard_NEEVPLConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipelineDashboard_NEEVPL mutableBytes] length:[SalesPipelineDashboard_NEEVPL length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"SalesPipelineDashboard_NEEVPL_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getActivityPPLConnectionDSMPLConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ActivityPPLConnectionDSMPL mutableBytes] length:[ActivityPPLConnectionDSMPL length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"ActivityPPLConnectionDSMPPL_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getActivityPLDSMConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ActivityPLDSMConnection mutableBytes] length:[ActivityPLDSMConnection length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"ActivityPLDSMConnection_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getSalesPipelineDashboard_DSMPLAllConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipelineDashboard_DSMPLAll mutableBytes] length:[SalesPipelineDashboard_DSMPLAll length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"SalesPipelineDashboard_DSMPLAll_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getEventDashboard_DSMConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[EventDashboard_DSM mutableBytes] length:[EventDashboard_DSM length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"EventDashboard_DSM_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getEventActiveDashboard_DSMConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[EventActiveDashboard_DSM mutableBytes] length:[EventActiveDashboard_DSM length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"EventActiveDashboard_DSM_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getgetMMPipeLineView_DSEConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MMPipeLineView_DSE mutableBytes] length:[MMPipeLineView_DSE length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"MMPipeLineView_DSE_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == getMMGeoDashboard_DSEConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MMGeoDashboard_DSE mutableBytes] length:[MMGeoDashboard_DSE length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"MMGeoDashboard_DSE_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getProductUpdateConnection) //Gautam's For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ProductUpdateConnection mutableBytes] length:[ProductUpdateConnection length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is.....ofProduct %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"ProductUpdateConnection_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getdetailsforopportunity) //Abhishek For PPL For Search Opportunity Connection
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[detailsforopportunity mutableBytes] length:[detailsforopportunity length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is..... %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *SaleStagePPLNotification = [NSNotification notificationWithName:@"detailsforopportunity_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        NSLog(@"Nitificationsss %@",SaleStagePPLNotification);
        [[NSNotificationQueue defaultQueue]enqueueNotification:SaleStagePPLNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == GetUsageCategoryDSM)
    {
        NSLog(@"UPdateoPTY Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[GetUsageCategoryDSMData mutableBytes] length:[GetUsageCategoryDSMData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *UpdateOpty_Notification = [NSNotification notificationWithName:@"UsageCategory_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:UpdateOpty_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == GetBodyTypeDSMconnection)
    {
        NSLog(@"UPdateoPTY Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[GetBodyTypeDSMData mutableBytes] length:[GetBodyTypeDSMData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *UpdateOpty_Notification = [NSNotification notificationWithName:@"BodyTypeDSMData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:UpdateOpty_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    else if(connection == GetListofActiveMicroMarketDSMconnection)
    {
        NSLog(@"UPdateoPTY Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[GetListofActiveMicroMarketDSMData mutableBytes] length:[GetListofActiveMicroMarketDSMData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *UpdateOpty_Notification = [NSNotification notificationWithName:@"ListofActiveMicroMarketDSMData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:UpdateOpty_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    
    else if(connection == PL_ProductID_Requestconnection)
    {
        NSLog(@"UPdateoPTY Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[PL_ProductID_RequestData mutableBytes] length:[PL_ProductID_RequestData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *UpdateOpty_Notification = [NSNotification notificationWithName:@"PL_ProductID_RequestData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:UpdateOpty_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    
    else if(connection == CreateoptyforexistingContactConnection)
    {
        NSLog(@"UPdateoPTY Data ..");
        NSString *responseString = [[NSString alloc] initWithBytes:[CreateoptyforexistingContactData mutableBytes] length:[CreateoptyforexistingContactData length] encoding:NSUTF8StringEncoding];
        NSLog(@"responseString Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For checking samalArt Expiration
        NSNotification *UpdateOpty_Notification = [NSNotification notificationWithName:@"CreateoptyforexistingContactData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:UpdateOpty_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
    }
    
    
    else if(connection==get_Contact_List_Connection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getContact_List_Data mutableBytes] length:[getContact_List_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"Contact_ListFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
        
        
        
    }
    
    else if(connection==getListofsearchOpportunityConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getListofsearchOpportunityData mutableBytes] length:[getListofsearchOpportunityData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"searchopty_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    
    
    else if(connection==createcontactconnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[createcontactData mutableBytes] length:[createcontactData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"createcontact_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection==ContactquerybyIDConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ContactquerybyIDData mutableBytes] length:[ContactquerybyIDData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"contactqueryfound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection==ContactquerybyIDConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ContactquerybyIDData mutableBytes] length:[ContactquerybyIDData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"contactqueryfound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection==prospectupdateconnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[prospectupdateconnectionData mutableBytes] length:[prospectupdateconnectionData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"prospectupdatefound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection==AssignActivityforopportunityconnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[AssignActivityforopportunityData mutableBytes] length:[AssignActivityforopportunityData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"Activityassign_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection==pplconnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ppldata mutableBytes] length:[ppldata length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"pplfound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    
    else if(connection == getAllPincodeConnectioninCreateOptyVCConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getAllPincodeConnectioninCreateOptyVCdata mutableBytes] length:[getAllPincodeConnectioninCreateOptyVCdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"PincodeConnectioninCreateOptyVCFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    //SearchActivities_DashboardConnection
    //  Create Opty   :
    
    else if(connection == GetALLPPLRelatedProductConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetALLPPLRelatedProductdata mutableBytes] length:[GetALLPPLRelatedProductdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"GetALLPPLRelatedProductdata_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == GetCampainDetailsForDSMConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[GetCampainDetailsForDSMdata mutableBytes] length:[GetCampainDetailsForDSMdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"GetCampainDetailsForDSMdata_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == contactsearchConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[contactsearchdata mutableBytes] length:[contactsearchdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"contactsearchdata_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == optycontactsearchConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[optycontactsearchdata mutableBytes] length:[optycontactsearchdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"optycontactsearchdata_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == contactcreationConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[contactcreationdata mutableBytes] length:[contactcreationdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"contactcreationdata_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection == sourceofcontactConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[sourceofcontactdata mutableBytes] length:[sourceofcontactdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"sourceofcontactdata_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection == getcustomerTypeConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getcustomerTypedata mutableBytes] length:[getcustomerTypedata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"customertype_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection == accountCreationConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[accountCreationdata mutableBytes] length:[accountCreationdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"accountcreation_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == accountCreationConnection1) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[accountCreationdata1 mutableBytes] length:[accountCreationdata1 length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"accountcreation_found1" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    
    else if(connection == contactoptylinkConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[contactoptylinkdata mutableBytes] length:[contactoptylinkdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"contactopty_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    /**
     *  New dashboard
     *
     */
    else if(connection==SearchActivities_DashboardConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SearchActivities_Data mutableBytes] length:[SearchActivities_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"SearchActivities_DataFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==SearchActivities_DashboardConnection30days)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SearchActivities_Data30dys mutableBytes] length:[SearchActivities_Data30dys length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"SearchActivities_Data30dysFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==MMPipeLineViewDSE_DashboardConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MMPipeLineView_DSE_Data mutableBytes] length:[MMPipeLineView_DSE_Data length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"MMPipeLineView_DSE_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    // 60 days
    else if(connection==getSalesPipeLineDashboard_DSM60DaysConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipeLineDashboard_DSM60DaysData mutableBytes] length:[SalesPipeLineDashboard_DSM60DaysData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"SalesPipeLineDashboard_DSM60DaysData_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    //getMMGeoDashboard_DSE60Days
    else if(connection==getMMGeoDashboard_DSE60DaysConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MMGeoDashboard_DSE60Days mutableBytes] length:[MMGeoDashboard_DSE60Days length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"MMGeoDashboard_DSE60Days_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==getMMApplicationDashboard_DSE60DaysConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MMApplicationDashboard_DSE60Days mutableBytes] length:[MMApplicationDashboard_DSE60Days length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"MMApplicationDashboard_DSE60Days_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }//getMMApplicationDashboard_DSECurrentConnection
    else if(connection==getMMApplicationDashboard_DSECurrentConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[MMApplicationDashboard_DSECurrent mutableBytes] length:[MMApplicationDashboard_DSECurrent length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"MMApplicationDashboard_DSECurrent_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==getSalesPipeLineDashboard_CallPLDrilFromPPLConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[SalesPipeLineDashboard_CallPLDrilFromPPL mutableBytes] length:[SalesPipeLineDashboard_CallPLDrilFromPPL length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"SalesPipeLineDashboard_CallPLDrilFromPPL_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==getListOfNseOrDseForDSMConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ListOfNseOrDseForDSM mutableBytes] length:[ListOfNseOrDseForDSM length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"ListOfNseOrDseForDSM_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==getListOfTeamActivityDSMConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ListOfTeamActivityDSM mutableBytes] length:[ListOfTeamActivityDSM length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"ListOfTeamActivityDSM_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }//getDSEwisePipeLinecurrentMonth_DSMConnection
    else if(connection==getDSEwisePipeLinecurrentMonth_DSMConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[DSEwisePipeLinecurrentMonth mutableBytes] length:[DSEwisePipeLinecurrentMonth length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"DSEwisePipeLinecurrentMonth_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==getDSEwisePipeLineLast30Days_DSMConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[DSEwisePipeLine30Days mutableBytes] length:[DSEwisePipeLine30Days length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"DSEwisePipeLine30Days_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection==getListOfTeamActivityDSMConnection30Days)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[ListOfTeamActivityDSM30Days mutableBytes] length:[ListOfTeamActivityDSM30Days length] encoding:NSUTF8StringEncoding];
        NSLog(@"Contact_List Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"ListOfTeamActivityDSM30Days_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == newoptyactivityConnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[newoptyactivitydata mutableBytes] length:[newoptyactivitydata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"newopty_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getallaccountpincodeconnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getallaccountpincodedata mutableBytes] length:[getallaccountpincodedata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"getallaccountpincode_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection == getaccountdetailsconnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getaccountdetailsdata mutableBytes] length:[getaccountdetailsdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"getaccountdetails_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    else if(connection == accountCreationforupdateconnection) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[accountCreationforupdatedata mutableBytes] length:[accountCreationforupdatedata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"accountCreationforupdatedata_found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    else if(connection == getListOfNseOrDseForDSMconnection1) // for Pincode
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[getListOfNseOrDseForDSMdata mutableBytes] length:[getListOfNseOrDseForDSMdata length] encoding:NSUTF8StringEncoding];
        NSLog(@"getAllPincodeConnectioninCreateOptyVCdata Response is %@",responseString);
        
        [self CheckSamalArtExpires:responseString];//For Checking SamalArt Expiration
        
        NSNotification *Taluka_Notification = [NSNotification notificationWithName:@"ListOfNseOrDseForDSM_Found" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        [[NSNotificationQueue defaultQueue]enqueueNotification:Taluka_Notification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    

}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    NSLog(@"connection didFailWithError: %@ %@", error.localizedDescription, [error.userInfo objectForKey:NSURLErrorFailingURLStringErrorKey]);

    if (connection == artifactConnection) {
        NSDictionary* errDict;
        if ([error.localizedDescription isEqualToString:@"The Internet connection appears to be offline."]) {
            errDict = [NSDictionary dictionaryWithObjectsAndKeys:@"offline", @"error", nil];
        }
        NSNotification* errNotification = [NSNotification notificationWithName:@"artifactFailed" object:nil userInfo:errDict];
        [[NSNotificationQueue defaultQueue] enqueueNotification:errNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }

    if (connection == getUserDetailsConnection) {
        NSDictionary* errDict;
        if ([error.localizedDescription isEqualToString:@"The Internet connection appears to be offline."]) {
            errDict = [NSDictionary dictionaryWithObjectsAndKeys:@"offline", @"error", nil];
        }
        NSNotification* errNotification = [NSNotification notificationWithName:@"userDetailsFailed" object:nil userInfo:errDict];
        [[NSNotificationQueue defaultQueue] enqueueNotification:errNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    if (connection == getCreateContacWithAccountDetails_Connection)//CreateOpportunityAgainstContact_VC
    {
        NSLog(@"\n please  CreateOpportunityAgainstContact_VC!!!  ");
        
        NSDictionary *errDict;
        if([error.localizedDescription isEqualToString:@"The Internet connection appears to be offline."])
        {
            errDict=[NSDictionary dictionaryWithObjectsAndKeys:@"offline",@"error", nil];
        }
        NSNotification *errNotification = [NSNotification notificationWithName:@"GetLobForSFA_Failed" object:nil userInfo:errDict];
        [[NSNotificationQueue defaultQueue]enqueueNotification:errNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
}

- (void)CheckSamalArtExpires:(NSString*)str_samalART
{
    
    NSString* tempSamalArt = str_samalART;
    
    NSString* ErrorMessage = @"Unable to bind an artifact";
    
    //  NSString *ErrorMessageSubString;// for finding Error message in response string
    // NSString* ErrorMessage = @"http://schemas.cordys.com/General/1.0/"; //Testing string

    NSLog(@"\n tempsamalArt %@", tempSamalArt);

    //    [ErrorMessage enumerateSubstringsInRange:NSMakeRange(0, [ErrorMessage length])
    //                            options:NSStringEnumerationBySentences | NSStringEnumerationLocalized
    //                         usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
    //    {
    //        NSLog(@"\n\n Sentence :%@", substring);
    //        //return substring;
    //    }];

    if ([tempSamalArt rangeOfString:ErrorMessage].location != NSNotFound) {
        NSLog(@"Yes it does contain that word");
        AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDelegate callArtifactRequest];
    }
}

@end
