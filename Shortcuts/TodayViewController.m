//
//  TodayViewController.m
//  Shortcuts
//
//  Created by ly on 10/20/14.
//  Copyright (c) 2014 ly. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

extern BOOL CTCellularDataPlanGetIsEnabled();   // 查询
extern void CTCellularDataPlanSetIsEnabled(BOOL enabled);   // 设置

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.preferredContentSize = CGSizeMake(0, 44);
    
    [self updateNetworkState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    [self updateNetworkState];

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
}

#pragma mark - Network state
- (void)updateNetworkState
{
    BOOL on = CTCellularDataPlanGetIsEnabled();
    [self setNetworkState:on];
}

- (void)setNetworkState:(BOOL)on
{
    if (on) {
        [self.cellularBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    } else {
        [self.cellularBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    CTCellularDataPlanSetIsEnabled(on);
}

#pragma mark - Action
- (IBAction)toggleState:(id)sender
{
    BOOL on = CTCellularDataPlanGetIsEnabled();
    [self setNetworkState:!on];
}

@end
