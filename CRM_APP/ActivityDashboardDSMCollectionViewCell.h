//
//  ActivityDashboardDSMCollectionViewCell.h
//  CRM_APP
//
//  Created by Admin on 06/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityDashboardDSMCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIView *View_CellDSMData;

@property (weak, nonatomic) IBOutlet UILabel *lbl_CustomerName;

@property (weak, nonatomic) IBOutlet UILabel *lbl_CustomerNumber;

@property (weak, nonatomic) IBOutlet UILabel *lbl_PPL;

@property (weak, nonatomic) IBOutlet UILabel *lbl_SalesStages;

@property (weak, nonatomic) IBOutlet UILabel *lbl_ActivityType;

@property (weak, nonatomic) IBOutlet UILabel *lbl_PlannedDateTime;


@end
