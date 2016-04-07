//
//  DashBoard_DSEPLLViewCell.m
//  CRM_APP
//
//  Created by Admin on 11/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import "DashBoard_DSEPLLViewCell.h"
#import "PipeLineDrilforPL.h"
#import "PLDashBoardViewCell.h"
#import "PipeLineDropForPLCell.h"
#import "GetSalesPipeLineDashboard_DSM.h"
#import "DetailViewController.h"
@implementation DashBoard_DSEPLLViewCell

- (void)awakeFromNib {
     
    self.tbl_InnerPl.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

   [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ReloadDataFunction1:)
                                                 name:@"refresh1"
                                               object:nil];
    
    selectedIndex = -1;
    userDetailsVal_ = [UserDetails_Var sharedmanager]; //usedetails instance
    self.detailViewController = [[DetailViewController alloc]init];
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];//AppDelegate instance
    
}
- (void)ReloadDataFunction1:(NSNotification*)notification
{
    [self.tbl_InnerPl reloadData];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
// Return the number o
//return 8;
{
    if([userDetailsVal_.POSITION_TYPE isEqual:@"DSM"]||[userDetailsVal_.POSITION_TYPE isEqual:@"DSE"])
    {
        //return 6;
        return  [PipeLineDrilforPL_arr count];
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* MyIdentifier = @"DashboardPL_Cell";
    cell = [self.tbl_InnerPl dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[PLDashBoardViewCell alloc] initWithStyle:UITableViewCellStyleDefault
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
    PLDashBoardViewCell* cell;
    static NSString* MyIdentifier = @"DashboardPL_Cell";
    cell = [self.tbl_InnerPl dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[PLDashBoardViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:MyIdentifier];
    }
    cell.lbl_PL.text=pipeLineDrilforPL.PL;
    cell.lbl_C0.text=pipeLineDrilforPL.C0;
    cell.lbl_C1.text=pipeLineDrilforPL.C1;
    cell.lbl_C1A.text=pipeLineDrilforPL.C1A;
    cell.lbl_C2.text=pipeLineDrilforPL.C2;
    cell.lbl_C3.text=pipeLineDrilforPL.C3;
    [cell.lbl_Total setHidden:YES];
   // cell.backgroundColor=[UIColor redColor];
    return cell;
}
#pragma mark -
#pragma mark UITableView Delegate
- (void)tableView:(UITableView*)tableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* MyIdentifier = @"DashboardPL_Cell";
    PLDashBoardViewCell* cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[PLDashBoardViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:MyIdentifier];
    }
    NSLog(@"Row Selected ... %ld", (long)indexPath.row);
    
}
@end
