//
//  ZPButton.m
//  WeiBo
//
//  Created by 赵鹏 on 15/4/10.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "ZPButton.h"

@implementation ZPButton


- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

- (BOOL)adjustsImageWhenHighlighted
{
    return NO;
}

@end
