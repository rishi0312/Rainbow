//
//  ActivityDSMTableViewCell.h
//  CRM_APP
//
//  Created by Guest User on 05/03/16.
//  Copyright © 2016 TataTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityDSMTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbl_DSEName;

@property (weak, nonatomic) IBOutlet UILabel *lbl_TodayActivity;

@property (weak, nonatomic) IBOutlet UILabel *lbl_Last30Days;

@end
