//
//  settingGroup.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "settingGroup.h"

@implementation settingGroup

+(instancetype)groupWithItem:(NSArray *)items{
    
    settingGroup *group = [[self alloc] init];
    group.items = items;
    
    return group;
}

@end
