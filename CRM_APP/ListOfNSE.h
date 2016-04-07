//
//  ListOfNSE.h
//  CRM_APP
//
//  Created by Admin on 11/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ListOfNSE : NSObject

/*
 <old>
 <S_PARTY>
 <POSTION_ID>1-49N3Q</POSTION_ID>
 <POSTION_NAME>TMCV-Sal-W-MUM-1001680-Thane-Pickup-DSE-15</POSTION_NAME>
 <NSE_LOBDSE_NAME>NITIN CHAUDHARY</NSE_LOBDSE_NAME>
 <POSITION_PH_NUM>9999999999</POSITION_PH_NUM>
 <LOBNAME>Pickups</LOBNAME>
 <POSITION_TYPE>DSE</POSITION_TYPE>
 <PR_EMP_ID>1-49N40</PR_EMP_ID>
 <USERID>CHAUDHARYN-EXP-06/11/2004</USERID>
 </S_PARTY>
 </old>
 */

@property(nonatomic , strong)NSString *POSTION_ID;
@property(nonatomic , strong)NSString *POSTION_NAME;
@property(nonatomic , strong)NSString *NSE_LOBDSE_NAME;
@property(nonatomic , strong)NSString *POSITION_PH_NUM;
@property(nonatomic , strong)NSString *LOBNAME;
@property(nonatomic , strong)NSString *POSITION_TYPE;
@property(nonatomic , strong)NSString *PR_EMP_ID;
@property(nonatomic , strong)NSString *USERID;
@property(nonatomic , strong)NSString *USERIDM;


@end
extern ListOfNSE *listOfNSE_list,*listOfNSE_list2,*listOfNSE_list30Days;
extern NSMutableArray *listOfNSE_list_Arr,*listOfNSE_list_Arr1,*listOfNSE_list_Arr2,*listOfNSE_list_Arr30Days,*listOfNSE_list_Arr_EMP;
