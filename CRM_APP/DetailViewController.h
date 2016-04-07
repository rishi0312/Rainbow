//
//  DetailViewController.h
//  test
//
//  Created by Sebastian Boldt on 07.03.13.
//  Copyright (c) 2013 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UserDetails_Var.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>
@class cellStageData;
@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,CLLocationManagerDelegate> {

    UserDetails_Var *userDetailsVal_;
    AppDelegate *appdelegate;
    int selectedIndex ;
    int senderTagFrButton ;
}
@property int FlagStatus;

@property (nonatomic, retain) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UIView* viewFirst;

@property (strong, nonatomic) UIPopoverController* masterPopoverController;

@property(weak,nonatomic)UISplitViewController *splitController;

@property (weak, nonatomic) IBOutlet UIView* viewSecond;

@property (assign) CGPoint originalCenter;

@property (weak, nonatomic) IBOutlet UIView* TitleView;

@property (strong, nonatomic) IBOutlet UILabel* percentageLabel;

@property (strong, nonatomic) IBOutlet UILabel* percentageLabel1;

@property (strong, nonatomic) IBOutlet UILabel* selectedSliceLabel;

@property (strong, nonatomic) IBOutlet UITextField* numOfSlices;

@property (strong, nonatomic) IBOutlet UISegmentedControl* indexOfSlices;

@property (strong, nonatomic) IBOutlet UIButton* downArrow;

@property (nonatomic, strong) NSMutableArray* slices;

@property (nonatomic, strong) NSMutableArray* slices1;

@property (nonatomic, strong) NSArray* sliceColors;

@property (weak, nonatomic) IBOutlet UIView* middleView;

@property (strong, nonatomic) NSMutableArray* Opty_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipelineDashboard_Arr;

@property (strong, nonatomic) NSMutableArray* GetLeadGeneratorwisePipelineView_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboard_DSM_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboard_DSM60Days_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboard_DSEPLAll_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboard_DSEPLArr;

@property (strong, nonatomic) NSMutableArray* GetLOB_Arr;

@property (strong, nonatomic) NSMutableArray* GetPPL_LOB_Arr;

@property (strong, nonatomic) NSMutableArray* GetPL_LOBPPL_Arr;

@property (strong, nonatomic) NSMutableArray* EventExecutiveDashboard_NEEV_Arr;

@property (strong, nonatomic) NSMutableArray* EventActive_NEEV_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboardNEEVPPL_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboardNEEVPL_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboard_NEEV_Arr;

// DSM
@property (strong, nonatomic) NSMutableArray* GetSalesPipelineDashboardDSM_Arr;

@property (strong, nonatomic) NSMutableArray* GetPL_PPLDSM_Arr;

@property (strong, nonatomic) NSMutableArray* GetPL_LOBPPLSEC_Arr;

@property (strong, nonatomic) NSMutableArray* GetSalesPipeLineDashboard_DSMPLAll_Arr;

@property (strong, nonatomic) NSMutableArray* GetMMPipeLineView_DSM_Arr;


@property (strong, nonatomic) IBOutlet UILabel *lbl_CountPending;

@property (strong, nonatomic) IBOutlet UITableView *tbl_DSEwiseDSM;

@property (strong, nonatomic) IBOutlet UIView *view_MyActivity;

@property (strong, nonatomic) IBOutlet UIView *view_TeamActivity;



//DSE
@property (strong, nonatomic) NSMutableArray* GetMMPipeLineView_DSE_Arr;

@property (strong, nonatomic) NSMutableArray* GetMMPipeLineView_DSE_60DaysArr;

@property (strong, nonatomic) NSMutableArray* GetMMPipeLineView_DSECurrentMonth_Arr;


@property (strong, nonatomic) NSMutableArray* GetMMPipeLineView_DSEApp_Arr;

@property (strong, nonatomic) NSMutableArray* GetMMApplication_DSEApp_Arr;

@property (strong, nonatomic) NSMutableArray* GetMMApplication_DSEAppCurrent_Arr;

@property (strong, nonatomic) NSMutableArray* GetMMApplication_DSEApp60_Arr;


@property (strong, nonatomic) IBOutlet UITableView *tbl_ForPPL;


@property (strong, nonatomic) NSMutableArray* GetSalesStagesForPL;


//for tree expandable table View-3 layer
@property (nonatomic, retain) NSArray *arrayOriginal;

@property (nonatomic, retain) NSMutableArray *arForTable;

-(void)miniMizeThisRows:(NSArray*)ar;

@property (nonatomic,weak) IBOutlet UITableView *tblForCollapse;

@property(nonatomic,weak) IBOutlet UITableView *ActivityAdherenceTableView;

@property(nonatomic,weak) IBOutlet UITableView *MMPipeLineTableView;
//for expandable tableView 2 layer
@property(nonatomic,strong)NSMutableArray *textArray,*subTitleArray;
//@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,weak) IBOutlet UITableView *ExpandableTableView;
@property(nonatomic,strong) IBOutlet cellStageData *cellStageDataObj;
@property (strong, nonatomic) NSString* selectedData;
@property(nonatomic,weak) IBOutlet UIButton *ShowGeoDetail;
@property(nonatomic,weak) IBOutlet UIButton *ShowAppDetail;
@property (weak, nonatomic) IBOutlet UILabel *MMGeoLbl;


//

@property (strong, nonatomic) IBOutlet UICollectionView *collection_View;


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlPPL;

- (IBAction)btn_segmentControl:(id)sender;
- (IBAction)segmentControlPPL:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lbl_ActivityCount;

@property (weak, nonatomic) IBOutlet UIView *view_DSE;

@property (weak, nonatomic) IBOutlet UIView *view_DSEActivity;

@property (weak, nonatomic) IBOutlet UIView *view_DSEPPL;

@property (weak, nonatomic) IBOutlet UITableView *tbl_DSE;

@property (weak, nonatomic) IBOutlet UILabel *lbl_ChangeName;


@property (strong, nonatomic) IBOutlet UICollectionView *Collection_DSM;

@property (weak, nonatomic) IBOutlet UILabel *lbl_DSMStsrt;

@property (weak, nonatomic) IBOutlet UIView *view_DSM;

@property (weak, nonatomic) IBOutlet UIView *view_DSMActivity;


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlDSM;

- (IBAction)segmentControlDSM:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlActivity;

- (IBAction)segmentControlActivtyDSM:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlDate;

- (IBAction)segmentControlDate:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tbl_ActivityDSM;

@property (weak, nonatomic) IBOutlet UIView *View_PipeLine;

@property (weak, nonatomic) IBOutlet UITableView *tbl_PipeLine;





@end
