//
//  TDViewController.h
//  ViewSwitcherTest
//
//  Created by Ben on 12-11-13.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDViewController : UIViewController
- (IBAction)showTabBarView;
- (IBAction)viewSwitcher:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *tabBarView;
@property (nonatomic) BOOL isTabBarViewShown;
@property (nonatomic, weak) UIViewController * currentShownView;
@end
