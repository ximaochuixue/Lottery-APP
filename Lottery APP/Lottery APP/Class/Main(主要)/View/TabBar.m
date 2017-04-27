//
//  TabBar.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/27.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "TabBar.h"

@implementation TabBar

-(void)setItems:(NSArray *)items{
    
    _items = items;
    
    //保存按钮上的图片
    for(UITabBarItem *item in items){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [self addSubview:btn];
    }
}

-(void) layoutSubviews{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width/count;
    CGFloat h = self.bounds.size.height;
    
    for (int i=0; i<count; i++) {
        UIButton *btn = self.subviews[i];
        x = i*w;
        btn.frame = CGRectMake(x, y, w, h);
    }
}

@end
