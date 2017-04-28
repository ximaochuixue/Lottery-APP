//
//  TabBar.h
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/27.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TabBar;
@protocol TabBarDelegate <NSObject>

@optional
-(void)tabBar:(TabBar *)tabBar didClickBtn:(NSInteger)index;

@end


@interface TabBar : UIView

// UITabBarItem的模型数组
@property (nonatomic,strong) NSArray *items;

@property (nonatomic,weak) id<TabBarDelegate> delegate;

@end
