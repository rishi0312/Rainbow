//
//  ActivityDashboardCollectionViewCell.h
//  CRM_APP
//
//  Created by admin on 04/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityDashboardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *view_CellData;

@property (weak, nonatomic) IBOutlet UILabel *lbl_CustomerName;

@property (weak, nonatomic) IBOutlet UILabel *lbl_CustomerNumber;

@property (weak, nonatomic) IBOutlet UILabel *lbl_PPl;

@property (weak, nonatomic) IBOutlet UILabel *lbl_SalesStage;

@property (weak, nonatomic) IBOutlet UILabel *lbl_ActivityType;

@property (weak, nonatomic) IBOutlet UILabel *lbl_PlannedDateTime;


@end
