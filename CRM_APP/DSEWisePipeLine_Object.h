//
//  DSEWisePipeLine_Object.h
//  CRM_APP
//
//  Created by Admin on 11/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSMutableArray *DSEWisePipeLine_Object_Arr,*DSEWisePipeLine_Object_Arr1;

@interface DSEWisePipeLine_Object : NSObject

/*
 <TABLE>
 <LOGIN>JJOSHI1001680</LOGIN>
 <DSE_NAME>JIGNA JOSHI</DSE_NAME>
 <alias>65</alias>
 <alias1>3</alias1>
 <alias2>4</alias2>
 <alias3>13</alias3>
 <alias4>5</alias4>
 </TABLE>

 */

@property(nonatomic , strong)NSString *LOGIN;
@property(nonatomic , strong)NSString *DSE_NAME;
@property(nonatomic , strong)NSString *alias;
@property(nonatomic , strong)NSString *alias1;
@property(nonatomic , strong)NSString *alias2;
@property(nonatomic , strong)NSString *alias3;
@property(nonatomic , strong)NSString *alias4;


@end
extern DSEWisePipeLine_Object *dSEWisePipeLine_Object;

