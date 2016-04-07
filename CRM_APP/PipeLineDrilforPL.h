//
//  PipeLineDrilforPL.h
//  CRM_APP
//
//  Created by admin on 10/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PipeLineDrilforPL : NSObject

@property(strong,nonatomic)NSString *PL;
@property(strong,nonatomic)NSString *C0;
@property(strong,nonatomic)NSString *C1;
@property(strong,nonatomic)NSString *C1A;
@property(strong,nonatomic)NSString *C2;
@property(strong,nonatomic)NSString *C3;
@property(strong,nonatomic)NSString *Total;

@end
extern PipeLineDrilforPL *pipeLineDrilforPL,*pipeLineDrilforPLDSE;
extern NSMutableArray *PipeLineDrilforPL_arr,*PipeLineDrilforPLDSE_arr;