//
//  PipeLineTableViewCell.h
//  CRM_APP
//
//  Created by admin on 07/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UserDetails_Var.h"
#import "DetailViewController.h"
@interface PipeLineTableViewCell : UITableViewCell
{
    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
    int selectedIndex ;
}
@property(nonatomic,strong) DetailViewController *detailViewController;

@property int flagCheck;

@property (strong, nonatomic) IBOutlet UILabel *lbl_PPL;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C0;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C1;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C1A;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C2;

@property (strong, nonatomic) IBOutlet UILabel *lbl_C3;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Total;

@property (weak, nonatomic) IBOutlet UITableView *tbl_InnerPL;

@end
