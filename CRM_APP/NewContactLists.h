//
//  NewContactLists.h
//  CRM_APP
//
//  Created by Admin on 09/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewContactLists : NSObject


@property (strong, nonatomic) IBOutlet NSString *MOBILE_NO;
@property (strong, nonatomic) IBOutlet NSString *ADDRESS_ID;
@property (strong, nonatomic) IBOutlet NSString *CONTACT_FIRST_NAME;
@property (strong, nonatomic) IBOutlet NSString *CONTACT_LAST_NAME;
@property (strong, nonatomic) IBOutlet NSString *CONTACT_ID;
@property (strong, nonatomic) IBOutlet NSString *ADDLINE_ONE;
@property (strong, nonatomic) IBOutlet NSString *ADDLINE_TWO;
@property (strong, nonatomic) IBOutlet NSString *DISTRICT;
@property (strong, nonatomic) IBOutlet NSString *STATE;
@property (strong, nonatomic) IBOutlet NSString *CITY;
@property (strong, nonatomic) IBOutlet NSString *TALUKA;
@property (strong, nonatomic) IBOutlet NSString *AREA;
@property (strong, nonatomic) IBOutlet NSString *PANCHAYAT;
@property (strong, nonatomic) IBOutlet NSString *ZIPCODE;
@property (strong, nonatomic) IBOutlet NSString *CONTACT_EMAIL_ID;

@end
extern NewContactLists *selectedcontact1,*searchContact,*searchContactBack;
extern NSMutableArray *ContactSearch_Arr;
