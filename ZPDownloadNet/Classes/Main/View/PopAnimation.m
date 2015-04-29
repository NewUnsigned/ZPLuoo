//
//  PopAnimation.m
//  customGesturePopAnimation
//
//  Created by 赵鹏 on 15/4/28.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "PopAnimation.h"

@interface PopAnimation ()
@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation PopAnimation
//该方法用于返回动画执行的时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //获取动画执行的from控制器和to控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    //获取动画执行时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    //执行动画
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width,0);
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    _transitionContext = transitionContext;
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [_transitionContext completeTransition:!_transitionContext.transitionWasCancelled];
}

@end
