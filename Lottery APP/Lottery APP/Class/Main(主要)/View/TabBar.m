//
//  TabBar.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/27.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "TabBar.h"


@interface TabBar()

@property (nonatomic,weak) UIButton *selButton;

@end

@implementation TabBar


-(void)setItems:(NSArray *)items{
    
    _items = items;
    
    //保存按钮上的图片
    for(UITabBarItem *item in items){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = self.subviews.count;
        
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        if (self.subviews.count == 1) {
            [self btnClick:btn];
        }
    }
}

-(void)btnClick:(UIButton *)button{
    _selButton.selected = NO;
    
    button.selected = YES;
    
    _selButton = button;
    
    // 通知tabBarVc切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:button.tag];
//        NSLog(@"%ld",(long)button.tag);
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
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
    }
}

@end
