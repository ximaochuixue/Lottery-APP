//
//  updateTabbar.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "updateTabbar.h"

@implementation updateTabbar



- (void)updateTabbar:(UIViewController *)vc Withtitle:(NSString *)title{
    
    vc.title = title;
    
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]];
    
    UIOffset offset;
    
    offset.horizontal = - 500;
    
    offset.vertical =  - 500;
    
    [buttonItem setBackButtonTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
}


@end
