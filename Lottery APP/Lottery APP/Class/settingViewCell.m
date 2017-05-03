//
//  settingViewCell.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "settingViewCell.h"

#import "settingItem.h"

@implementation settingViewCell


-(void)setItem:(settingItem *)item{
    _item = item;
    
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    self.imageView.image = _item.image;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
