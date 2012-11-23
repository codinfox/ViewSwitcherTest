//
//  TDTimeLine.h
//  ViewSwitcherTest
//
//  Created by Ben on 12-11-23.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDTimeLine;

@protocol TDTimeLineDelegate <NSObject>

@required
- (NSIndexPath *)indexPathForCellString:(NSString *) str;
- (UITableView *)tableViewForTimeLine:(TDTimeLine *) timeline;
- (void)scrollToRow:(NSInteger)row;

@end

@interface TDTimeLine : UIViewController

@property (nonatomic, strong) IBOutlet UIView * timeline;

- (id)initWithDelegate:(id<TDTimeLineDelegate>)delegate;

@end

