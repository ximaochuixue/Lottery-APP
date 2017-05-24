//
//  settingGroup.h
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface settingGroup : NSObject


@property (nonatomic,strong) NSArray *items;

@property (nonatomic,strong) NSString *headTitle;

@property (nonatomic,strong) NSString *footTitle;

+(instancetype) groupWithItem:(NSArray *)items;

@end
