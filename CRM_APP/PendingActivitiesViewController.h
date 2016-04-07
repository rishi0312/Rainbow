//
//  PendingActivitiesViewController.h
//  CRM_APP
//
//  Created by Nihal Shaikh on 10/14/15.
//  Copyright (c) 2015 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDetails_Var.h"
#import "AppDelegate.h"


@interface PendingActivitiesViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    
    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
    ActivityDone *activityDone;
    ActivityFinalDone *activityFinalDone;



}


@property int flagset;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UIView *opty_view;
@property(strong,nonatomic) IBOutlet  AppDelegate *appdelegate;


@property(weak,nonatomic)NSString *_FirstName;

@property(weak,nonatomic)NSString *_LastName;

@property(weak,nonatomic)NSString *_CellularNumber;


@property(weak,nonatomic)NSString *_OptyId;

@property(weak,nonatomic)NSString *_ContactId;

@property(weak,nonatomic)NSString *_ActivityId;

@property (strong, nonatomic) IBOutlet UILabel *optyCounter;



@property (weak, nonatomic) IBOutlet UILabel *lbl_customerName;


@property (weak, nonatomic) IBOutlet UILabel *lbl_custtomerNumber;


@property (weak, nonatomic) IBOutlet UILabel *lbl_assigntoName;



@property (weak, nonatomic) IBOutlet UILabel *lbl_assigntoNumber;


@property(nonatomic, strong) NSString *Activityflag;




@end
