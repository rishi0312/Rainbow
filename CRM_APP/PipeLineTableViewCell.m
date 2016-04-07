//
//  PipeLineTableViewCell.m
//  CRM_APP
//
//  Created by admin on 07/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import "PipeLineTableViewCell.h"
#import "PipeLineDropForPLCell.h"
#import "GetSalesPipeLineDashboard_DSM.h"
#import "RequestDelegate.h"
#import "TBXML.h"
#import "SingletonClass.h"
#import "GetMMPipeLineView_DSE.h"
#import "PipeLineDrilforPL.h"

@implementation PipeLineTableViewCell
@synthesize flagCheck;
- (void)awakeFromNib {
    // Initialization code
    NSLog(@"---- GetSalesPipeLineDashboard_DSM  :%@",salesPipelineDashboardDSMForPL.PPL);
    
    NSLog(@"Check Flag Status :%@",salesPipelineDashboardDSMForPL.FromCheck);
    // Call PL Dril WS for PPL DSM
   // [self CallPLDrilFromPPL];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ReloadDataFunction:)
                                                 name:@"refresh"
                                               object:nil];
    
    selectedIndex = -1;
    userDetailsVal_ = [UserDetails_Var sharedmanager]; //usedetails instance
    self.detailViewController = [[DetailViewController alloc]init];
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];//AppDelegate instance
    self.tbl_InnerPL.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];


}
- (void)ReloadDataFunction:(NSNotification*)notification
{
    [self.tbl_InnerPL reloadData];
}
-(void)CallPLDrilFromPPL
{
    NSString* envelopeText = [NSString stringWithFormat:
                              @"<SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              @"<SOAP:Body>"
                              @"<GetSalesPipeLineDashboard_DSE xmlns=\"com.cordys.tatamotors.Dsmsiebelwsapp\" preserveSpace=\"no\" qAccess=\"0\" qValues=\"\">"
                              @"<fromdate>01-JAN-2015</fromdate>"
                              @"<todate>01-JAN-2016</todate>"
                              @"<PrimaryEmployeeID>'%@'</PrimaryEmployeeID>"
                              @"<PPL>%@</PPL>"
                              @"</GetSalesPipeLineDashboard_DSE>"
                              @"</SOAP:Body>"
                              @"</SOAP:Envelope>",userDetailsVal_.PRIMARY_EMP,salesPipelineDashboardDSMForPL.PPL];
    
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
/*- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
// Return the number o
//return 8;
{
    if([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]||[userDetailsVal_.POSITION_TYPE isEqual:@"DSE"])
    {
        return  [PipeLineDrilforPL_arr count];
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* MyIdentifier = @"PipeLineForPL";
    cell = [self.tbl_InnerPL dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[PipeLineDropForPLCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:MyIdentifier];
    }
    //cell.lbl_date.text=complaintRegistereed_Object1.complaint_date;
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
     pipeLineDrilforPL=nil;
     pipeLineDrilforPL=[[PipeLineDrilforPL alloc] init];
     pipeLineDrilforPL=[PipeLineDrilforPL_arr objectAtIndex:indexPath.row];
    
    PipeLineDropForPLCell* cell;
    static NSString* MyIdentifier = @"PipeLineForPL";
    cell = [self.tbl_InnerPL dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[PipeLineDropForPLCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:MyIdentifier];
    }
    //cell.textLabel.text=@"Extra Ining T20";
    cell.lbl_PLName.text=pipeLineDrilforPL.PL;
    cell.lbl_C0.text=pipeLineDrilforPL.C0;
    cell.lbl_C1.text=pipeLineDrilforPL.C1;
    cell.lbl_C1A.text=pipeLineDrilforPL.C1A;
    cell.lbl_C2.text=pipeLineDrilforPL.C2;
    cell.lbl_C3.text=pipeLineDrilforPL.C3;
    //cell.backgroundColor=[UIColor redColor];
    return cell;
}
#pragma mark -
#pragma mark UITableView Delegate
- (void)tableView:(UITableView*)tableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* MyIdentifier = @"PipeLineForPL";
    PipeLineDropForPLCell* cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[PipeLineDropForPLCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:MyIdentifier];
    }
    NSLog(@"Row Selected ... %ld", (long)indexPath.row);
 
}

@end