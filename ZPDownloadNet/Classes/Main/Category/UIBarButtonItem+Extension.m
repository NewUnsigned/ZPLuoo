//
//  UIBarButtonItem+Extension.m
//  3-2代码练习-彩票
//
//  Created by 赵鹏 on 15/3/4.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "ZPButton.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action itemFont:(NSUInteger)fontSize titleColor:(UIColor *)color
{
    ZPButton *itemButton = [[ZPButton alloc]init];
    //设置图片
    //如果没有图片会报错，需要判断一下
    if (normalImage != nil && ![normalImage isEqualToString:@""]) {
        [itemButton setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    }
    if (selectedImage != nil && ![selectedImage isEqualToString:@""]) {
        [itemButton setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    }
    //设置点击事件
    [itemButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置标题
    [itemButton setTitle:title forState:UIControlStateNormal];
    
    itemButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [itemButton setTitleColor:color forState:UIControlStateNormal];
    [itemButton sizeToFit];

    return [[UIBarButtonItem alloc]initWithCustomView:itemButton];
}


@end
