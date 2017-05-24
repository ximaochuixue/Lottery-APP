//
//  settingItem.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "settingItem.h"

@implementation settingItem

+(instancetype) initWithimage:(UIImage *)image title:(NSString *)title{
    
    settingItem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}


@end
