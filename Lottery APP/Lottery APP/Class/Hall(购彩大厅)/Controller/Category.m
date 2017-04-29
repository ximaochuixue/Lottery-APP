//
//  Category.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/29.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "Category.h"

@implementation Category

+(instancetype)categoryWithDict:(NSDictionary *)dict{
    
    Category *cate = [[self alloc] init];
    [cate setValuesForKeysWithDictionary:dict];
    return cate;
}

@end
