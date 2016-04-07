//
//  PPL_DSEDashboardObject.h
//  CRM_APP
//
//  Created by admin on 05/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSMutableArray *GetPPL_DSEDashboardObject_Arr;

@interface PPL_DSEDashboardObject : NSObject

@property(nonatomic,strong)NSString* PersonalAddressName;
@property(nonatomic,strong)NSString* PersonalCity;
@property(nonatomic,strong)NSString* PersonalCountry;
@property(nonatomic,strong)NSString* PersonalPostalCode;
@property(nonatomic,strong)NSString* PersonalState;
@property(nonatomic,strong)NSString* PersonalStreetAddress;
@property(nonatomic,strong)NSString* PersonalStreetAddress2;
@property(nonatomic,strong)NSString* AddressId;
@property(nonatomic,strong)NSString* TMTaluka;
@property(nonatomic,strong)NSString* TMDistrict;
@property(nonatomic,strong)NSString* TMPanchayat;
@property(nonatomic,strong)NSString* TMArea;
@end
extern PPL_DSEDashboardObject *ppl_DSEDashboardObject;


