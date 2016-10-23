//
//  BaseViewController.m
//  MAP
//
//  Created by mac on 16/10/23.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "BaseViewController.h"
#import "MapViewController.h"
#import "NaviViewController.h"

#define CellID @"CellID"

@interface BaseViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataArray;    // 单元格数量

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"地图";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    [self.view addSubview:tableView];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@"基础地图", @"导航", @"全景地图"]];
    
    
}

#pragma mark - 表视图代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 40.0f;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[MapViewController alloc] init] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[[NaviViewController alloc] init] animated:YES];
    } else {
        return;
    }

}














@end
