//
//  ZPTabBarController.m
//  ZPDownloadNet
//
//  Created by 赵鹏 on 15/4/29.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "ZPTabBarController.h"
#import "ZPNavgationController.h"

@interface ZPTabBarController ()

@end

@implementation ZPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self addChildVCS];
}
- (void)addChildVCS
{
    [self addChildVCWithSBName:@"ZPMusicTableViewController" title:@"音乐" normalImg:@"nav_music_off" selectedImg:@"nav_music_on"];
    [self addChildVCWithSBName:@"ZPRecommendTableViewController" title:@"推荐" normalImg:@"nav_musicians_off" selectedImg:@"nav_musicians_on"];
    [self addChildVCWithSBName:@"ZPActivityTableViewController" title:@"活动" normalImg:@"nav_around_off" selectedImg:@"nav_around_on"];
    [self addChildVCWithSBName:@"ZPMineTableViewController" title:@"我的" normalImg:@"nav_mine_off" selectedImg:@"nav_mine_on"];
}

//根据标题从storyboard里创建控制器并添加为tabbar控制器的子控制器

- (void)addChildVCWithSBName:(NSString *)sbName title:(NSString *)title normalImg:(NSString *)normalImag selectedImg:(NSString *)selectedImg
{
    UIStoryboard *tabSB = [UIStoryboard storyboardWithName:sbName bundle:nil];
    UIViewController *tabVC = tabSB.instantiateInitialViewController;
    tabVC.title = title;
    self.tabBarItem.image = [UIImage imageNamed:normalImag];
    ZPNavgationController *nav = [[ZPNavgationController alloc]initWithRootViewController:tabVC];
    [self addChildViewController:nav];
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
