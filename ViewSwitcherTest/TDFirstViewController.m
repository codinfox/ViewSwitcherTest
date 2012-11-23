//
//  TDFirstViewController.m
//  ViewSwitcherTest
//
//  Created by Ben on 12-11-13.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import "TDFirstViewController.h"

@interface TDFirstViewController ()

@property (nonatomic) NSMutableArray * dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic) TDTimeLine * timeline;

@end

@implementation TDFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.timeline = [[TDTimeLine alloc] initWithDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.dataSource count];
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndentfier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentfier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentfier];
    }

    NSString * str = [NSString stringWithFormat:@"This is the cell: %d", indexPath.row];
    cell.textLabel.text = str;
    [self.dataSource addObject:str];
    
    return cell;
}

#pragma mark - TimeLine Delegate

- (NSIndexPath *)indexPathForCellString:(NSString *) str
{
    return nil;
}

- (UITableView *)tableViewForTimeLine:(TDTimeLine *) timeline
{
    return self.tableview;
}

- (void)scrollToRow:(NSInteger)row
{
    [self.tableview setContentOffset:CGPointMake(0, (row*44)) animated:YES];
}


@end