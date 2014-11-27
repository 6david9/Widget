//
//  ViewController.m
//  Widget
//
//  Created by ly on 10/20/14.
//  Copyright (c) 2014 ly. All rights reserved.
//

#import "ViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)toggleExtensionDisplayState:(UISwitch *)sender
{
    [[NCWidgetController widgetController] setHasContent:sender.on
                           forWidgetWithBundleIdentifier:@"com.cocoabit.Widget.Shortcuts"];
}

@end
