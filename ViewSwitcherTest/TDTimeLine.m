//
//  TDTimeLine.m
//  ViewSwitcherTest
//
//  Created by Ben on 12-11-23.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import "TDTimeLine.h"

@interface TDTimeLine ()

@property (nonatomic, strong) id<TDTimeLineDelegate> delegate;
@property (nonatomic) UITableView * tableview;

@end

@implementation TDTimeLine

- (id)initWithDelegate:(id<TDTimeLineDelegate>)delegate
{
    //NSLog(@"hello1");
    self = [super init];
    if (self) {
        self.delegate = delegate;
        CGRect frame = self.view.frame;
        frame.origin.x = 0;
        self.view.frame = frame;
        self.tableview = [self.delegate tableViewForTimeLine:self];
        [[self.tableview superview] addSubview:self.view];
    }
    //NSLog(@"hello2");
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint pos = [touch locationInView:self.view];
    int index = floor(pos.y / 4.6);
    [self.delegate scrollToRow:index];
}

@end
