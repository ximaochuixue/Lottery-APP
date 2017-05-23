//
//  topLable.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/12.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "topLable.h"

@implementation topLable

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor colorWithRed:0.4 green:0.6 blue:0.7 alpha:1.0];
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setScale:(CGFloat)scale
{
    _scale = scale;
    
    //      R G B
    // 默认：0.4 0.6 0.7
    // 红色：1   0   0
    
    CGFloat red = 0.4 + (1 - 0.4) * scale;
    CGFloat green = 0.6 + (0 - 0.6) * scale;
    CGFloat blue = 0.7 + (0 - 0.7) * scale;
    self.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    // 大小缩放比例
    CGFloat transformScale = 1 + scale * 0.3; // [1, 1.3]
    self.transform = CGAffineTransformMakeScale(transformScale, transformScale);
}


@end
