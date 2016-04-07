//
//  CreateoptyExistingContactViewController.h
//  testapp
//
//  Created by Admin on 05/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UserDetails_Var.h"
#import <QuartzCore/QuartzCore.h>


@interface CreateoptyExistingContactViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
    
}


@property (weak, nonatomic) IBOutlet UITableView *tableview1;

@property (weak, nonatomic) IBOutlet UITableView *tableview2;

- (IBAction)btn_search:(id)sender;

- (IBAction)createOptyWithNewContactAction:(id)sender;

@property(nonatomic, strong) IBOutlet NSMutableArray *ContactList;

@property (weak, nonatomic) IBOutlet UITextField *txt_contactsearch;

@property (weak, nonatomic) IBOutlet UILabel *label_opportunity;

@property (weak, nonatomic) IBOutlet UILabel *label_contact;


@property(strong,nonatomic)NSMutableDictionary *GetAllStateCodes;

@end
