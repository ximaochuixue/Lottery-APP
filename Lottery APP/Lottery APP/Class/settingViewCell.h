//
//  settingViewCell.h
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class settingItem;

@interface settingViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableview;


@property (nonatomic,strong) settingItem *item;

@end
