//
//  NavigationInteractiveTransition.m
//  customGesturePopAnimation
//
//  Created by 赵鹏 on 15/4/28.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "NavigationInteractiveTransition.h"
#import "PopAnimation.h"

@interface NavigationInteractiveTransition ()
@property (nonatomic, weak) UINavigationController *navVc;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation NavigationInteractiveTransition
//创建初始化方法
- (instancetype)initWithViewController:(UIViewController *)viewController
{
    
    if (self = [super init]) {
        self.navVc = (UINavigationController *)viewController;
        self.navVc.delegate = self;
    }
    return self;
}

- (void)handleControllerPop:(UIPanGestureRecognizer *)panGes
{
    //获取用户当前触摸点x的值,对比当前设备的宽度计算动画进度
    CGFloat progress = [panGes translationInView:panGes.view].x / [UIScreen mainScreen].bounds.size.width;
    
    if (panGes.state == UIGestureRecognizerStateBegan) {//用户开始触摸设备,手势开始
        //创建一个新的手势操作对象
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        //告诉系统开始动画
        [self.navVc popViewControllerAnimated:YES];
    }else if (panGes.state == UIGestureRecognizerStateChanged){//用户移动手势
        //更新手势完成进度
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }else if (panGes.state == UIGestureRecognizerStateEnded || panGes.state == UIGestureRecognizerStateChanged){//用户结束手势,此时需要判断用户手指在屏幕上的x坐标偏移量
        
        if (progress > 0.5) {
            [self.interactivePopTransition finishInteractiveTransition];
        }else{
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}
#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    //判断当前执行的是否是pop动画
    if (operation == UINavigationControllerOperationPop) {
        return [[PopAnimation alloc]init];
    }
    return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    //判断当前执行动画的控制器是否为自定义的,如果是返回self.interactivePopTransition用于控制当前动画执行
    if ([animationController isKindOfClass:[PopAnimation class]]) {
        return self.interactivePopTransition;
    }
    return nil;
}
@end
