//
//  GetSalesPipeLineDashboard_DSM.h
//  CRM_APP
//
//  Created by admin on 17/11/15.
//  Copyright © 2015 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetSalesPipeLineDashboard_DSM : NSObject

@property (nonatomic, copy) NSString *PL;
@property (nonatomic, copy) NSString *PPL;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *alias1;
@property (nonatomic, copy) NSString *alias2;
@property (nonatomic, copy) NSString *alias3;
@property (nonatomic, copy) NSString *alias4;
@property (nonatomic, copy) NSString *FromCheck;




@end
//extern NSMutableArray *GetAddressData_Arr;
extern GetSalesPipeLineDashboard_DSM *salesPipelineDashboardDSM,*salesPipelineDashboardDSM60,*salesPipelineDashboardDSMForPL,*salesPipelineDashboardDSEForPL;
