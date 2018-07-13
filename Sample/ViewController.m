//
//  ViewController.m
//  Sample
//
//  Created by dch on 2018/7/13.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "ViewController.h"

NSString * kViewControllerCellIdentifier = @"kViewControllerCellIdentifier";
NSString * kViewControllerDataSourceKeyTitle = @"kViewControllerDataSourceKeyTitle";
NSString * kViewControllerDataSourceKeyClass = @"kViewControllerDataSourceKeyClass";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

#pragma mark - life cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Sample list";
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tableView.frame = self.view.frame;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class viewControllerClass = self.dataSource[indexPath.row][kViewControllerDataSourceKeyClass];
    UIViewController *viewController = [[viewControllerClass alloc] init];
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kViewControllerCellIdentifier];
    cell.textLabel.text = self.dataSource[indexPath.row][kViewControllerDataSourceKeyTitle];
    return cell;
}

#pragma mark - getter and setter

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kViewControllerCellIdentifier];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[
                        @{
                            kViewControllerDataSourceKeyTitle:@"九宫格",
                            kViewControllerDataSourceKeyClass:[ViewController class]
                            }
                        ];
    }
    return _dataSource;
}

@end
