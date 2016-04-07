//
//  accountdetails.h
//  CRM_APP
//
//  Created by Admin on 14/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSMutableArray *accountsarray;
@interface accountdetails : NSObject


@property(nonatomic,strong)NSString* accountPersonalAddressName;
@property(nonatomic,strong)NSString* accountPersonalCity;
@property(nonatomic,strong)NSString* accountPersonalCountry;
@property(nonatomic,strong)NSString* accountPersonalPostalCode;
@property(nonatomic,strong)NSString* accountPersonalState;
@property(nonatomic,strong)NSString* accountPersonalStreetAddress;
@property(nonatomic,strong)NSString* accountPersonalStreetAddress2;
@property(nonatomic,strong)NSString* accountAcoountID;
@property(nonatomic,strong)NSString* accountTMTaluka;
@property(nonatomic,strong)NSString* accountTMDistrict;
@property(nonatomic,strong)NSString* accountTMPanchayat;
@property(nonatomic,strong)NSString* accountTMArea;

@property(nonatomic,strong)NSString* accountaddressID;

@property(nonatomic,strong)NSString* accountlocation;
@property(nonatomic,strong)NSString* accountname;
@property(nonatomic,strong)NSString* accountmainmobilenumber;

@property(nonatomic,strong)NSString* accountfirstname;

@property(nonatomic,strong)NSString* accountlastname;
@property(nonatomic,strong)NSString* accountcellnumber;

@property(nonatomic,strong)NSString* accountContactId;

//
@end

extern accountdetails *accounts;











