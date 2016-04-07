//
//  SingletonClass.h
//  CRM_APP
//
//  Created by Admin on 03/02/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject
@property(strong,nonatomic)NSMutableArray *GetPL_PPLDSM_SingletonArr,*GetSalesPipeLineDashboard_DSEPLArrSingleton;

@property(strong,nonatomic)NSMutableArray *GetSalesPipeLineDashboard_DSMPLAll_singleTonArr;

//For Neev
@property(strong,nonatomic)NSMutableArray *GetPPL_LOB_ArrSingleton,*GetSalesPipeLineDashboardNEEVPPL_ArrSingleton,*GetPL_LOBPPL_Arrsingleton;


+(SingletonClass*)sharedobject;

@end
