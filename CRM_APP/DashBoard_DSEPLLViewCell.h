//
//  DashBoard_DSEPLLViewCell.h
//  CRM_APP
//
//  Created by Admin on 11/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "UserDetails_Var.h"
@interface DashBoard_DSEPLLViewCell : UITableViewCell
{
    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
    int selectedIndex ;
}
@property(nonatomic,strong) DetailViewController *detailViewController;


@property (strong, nonatomic) IBOutlet UILabel *lbl_PPL;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C0;


@property (strong, nonatomic) IBOutlet UILabel *lbl_C1;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C1A;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C2;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C3;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Total;

@property (strong, nonatomic) IBOutlet UITableView *tbl_InnerPl;


@end
