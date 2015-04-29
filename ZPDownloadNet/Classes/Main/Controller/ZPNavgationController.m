//
//  ZPNavgationController.m
//  ZPDownloadNet
//
//  Created by 赵鹏 on 15/4/29.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "ZPNavgationController.h"
#import "NavigationInteractiveTransition.h"

@interface ZPNavgationController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIPanGestureRecognizer *sysGesture;
@property (nonatomic, strong) NavigationInteractiveTransition *navTransition;
@end

@implementation ZPNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏标题颜色
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:211/255.0 green:64/255.0 blue:79/255.0 alpha:1],NSForegroundColorAttributeName,nil]];
    [self addCustomGesture];
}

- (void)addCustomGesture
{
    //获取系统自带的手势操作将其关闭
    UIGestureRecognizer *ges = self.interactivePopGestureRecognizer;
    ges.enabled = NO;
    UIView *gesView = ges.view;
    
    //新建手势操作
    UIPanGestureRecognizer *customGes = [[UIPanGestureRecognizer alloc]init];
    //设置代理
    customGes.delegate = self;
    customGes.maximumNumberOfTouches = 1;
    //将新的手势操作添加到gesView上
    [gesView addGestureRecognizer:customGes];
    
    self.navTransition = [[NavigationInteractiveTransition alloc]initWithViewController:self];
    [customGes addTarget:_navTransition action:@selector(handleControllerPop:)];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
    
}

@end
