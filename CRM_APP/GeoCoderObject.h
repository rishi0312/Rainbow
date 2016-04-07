//
//  GeoCoderObject.h
//  ProsPectDemo
//
//  Created by admin on 07/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoCoderObject : NSObject

@property (nonatomic, retain) NSString* City;
@property (nonatomic, retain) NSString* State;
@property (nonatomic, retain) NSString* Country;
@property (nonatomic, retain) NSString* Pincode;
@property (nonatomic, retain) NSString* Taluka;
@property (nonatomic, retain) NSString* District;
@property (nonatomic, retain) NSString* Address;

@end
extern GeoCoderObject *geoCodiingObject;
extern NSMutableArray *GeoCodingObjecT_Arr;