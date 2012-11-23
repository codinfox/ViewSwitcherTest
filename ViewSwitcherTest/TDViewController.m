//
//  TDViewController.m
//  ViewSwitcherTest
//
//  Created by Ben on 12-11-13.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import "TDViewController.h"
#import "TDFirstViewController.h"
#import "TDSecondViewController.h"
#import "TDThirdViewController.h"

@interface TDViewController ()
@property (nonatomic, strong) TDFirstViewController * firstViewController;
@property (nonatomic, strong) TDSecondViewController * secondViewController;
@property (nonatomic, strong) TDThirdViewController * thirdViewController;
@end

@implementation TDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.isTabBarViewShown = NO;
    [self configureFirstViewController];
//performsegue:WithIdentifier
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setTabBarViewVisible:NO withAnimation:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Configuration

- (void)setTabBarViewVisible:(BOOL)isVisible withAnimation:(BOOL)isWithAnimation
{
    if (isVisible)
    {
        if (isWithAnimation)
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGRect frame = self.tabBarView.frame;
                frame.origin.y = 390;
                self.tabBarView.frame = frame;
            } completion:nil];
        else
        {
            CGRect frame = self.tabBarView.frame;
            frame.origin.y = 390;
            self.tabBarView.frame = frame;
        }
    }
    else
    {
        if (isWithAnimation)
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = self.tabBarView.frame;
                frame.origin.y = 450;
                self.tabBarView.frame = frame;
            } completion:nil];
        else
        {
            CGRect frame = self.tabBarView.frame;
            frame.origin.y = 450;
            self.tabBarView.frame = frame;
        }
    }
    self.isTabBarViewShown = isVisible;
}

- (void)configureFirstViewController
{
    if (self.firstViewController != nil)
    {
        self.firstViewController.view.hidden = NO;
        return;
    }
    self.firstViewController = [[TDFirstViewController alloc] init];
    [self.view insertSubview:self.firstViewController.view belowSubview:self.tabBarView];
    //[self.firstViewController viewWillAppear:YES];//?
}

- (void)configureSecondViewController
{
    if (self.secondViewController != nil)
    {
        self.secondViewController.view.hidden = NO;
        return;
    }
    self.secondViewController = [[TDSecondViewController alloc] init];
    [self.view insertSubview:self.secondViewController.view belowSubview:self.tabBarView];
    //[self.secondViewController viewWillAppear:YES];
}

- (void)configureThirdViewController
{
    if (self.thirdViewController != nil)
    {
        self.thirdViewController.view.hidden = NO;
        return;
    }
    self.thirdViewController = [[TDThirdViewController alloc] init];
    [self.view insertSubview:self.thirdViewController.view belowSubview:self.tabBarView];
    //[self.thirdViewController viewWillAppear:YES];
}

- (void)clearAllViewControllers
{
    self.firstViewController.view.hidden = YES;
    self.secondViewController.view.hidden = YES;
    self.thirdViewController.view.hidden = YES;
}

#pragma mark - IBActions

- (IBAction)showTabBarView {
    if (self.isTabBarViewShown)
    {
        [self setTabBarViewVisible:NO withAnimation:YES];
    }
    else
    {
        [self setTabBarViewVisible:YES withAnimation:YES];
    }
}

- (IBAction)viewSwitcher:(UIButton *)sender {
    if ([sender.titleLabel.text isEqual:@"1st View"])
    {
        if ([self.currentShownView isMemberOfClass:[TDFirstViewController class]])
            return;
        [self clearAllViewControllers];
        [self configureFirstViewController];
        self.currentShownView = self.firstViewController;
    }else if ([sender.titleLabel.text isEqual:@"2nd View"])
    {
        if ([self.currentShownView isMemberOfClass:[TDSecondViewController class]])
            return;
        [self clearAllViewControllers];
        [self configureSecondViewController];
        self.currentShownView = self.secondViewController;
    }else if ([sender.titleLabel.text isEqual:@"3rd View"])
    {
        if ([self.currentShownView isMemberOfClass:[TDThirdViewController class]])
            return;
        [self clearAllViewControllers];
        [self configureThirdViewController];
        self.currentShownView = self.thirdViewController;
    }
}
@end
