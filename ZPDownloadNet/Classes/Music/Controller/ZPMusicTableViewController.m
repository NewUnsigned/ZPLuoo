//
//  ZPMusicTableViewController.m
//  ZPDownloadNet
//
//  Created by 赵鹏 on 15/4/29.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "ZPMusicTableViewController.h"

@interface ZPMusicTableViewController ()

@end

@implementation ZPMusicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置左右item
    [self setLeftAndRigthItem];
}
- (void)setLeftAndRigthItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"筛选" normalImage:@"city_indicate" selectedImage:nil target:nil action:nil itemFont:14 titleColor:ZPLuooColorStyle];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:nil normalImage:@"top_bar_player_kuang" selectedImage:nil target:nil action:nil itemFont:nil titleColor:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Music_Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

@end
