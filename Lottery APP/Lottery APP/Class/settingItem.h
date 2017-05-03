//
//  settingItem.h
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface settingItem : NSObject


@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *subTitle;

+(instancetype) initWithimage:(UIImage *)image title:(NSString *)title;

@end
