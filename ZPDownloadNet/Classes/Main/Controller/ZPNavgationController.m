//
//  ZPNavgationController.m
//  ZPDownloadNet
//
//  Created by 赵鹏 on 15/4/29.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "ZPNavgationController.h"

@interface ZPNavgationController ()

@end

@implementation ZPNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏标题颜色
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:211/255.0 green:64/255.0 blue:79/255.0 alpha:1],NSForegroundColorAttributeName,nil]];
    
//    [self.navigationBar setBarTintColor:[UIColor colorWithRed:211/255.0 green:64/255.0 blue:79/255.0 alpha:1.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
