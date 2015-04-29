//
//  UIBarButtonItem+Extension.h
//  3-2代码练习-彩票
//
//  Created by 赵鹏 on 15/3/4.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action frame:(CGRect)frame;

@end
