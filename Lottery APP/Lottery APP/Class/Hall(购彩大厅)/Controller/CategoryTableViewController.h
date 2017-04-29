//
//  CategoryTableViewController.h
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/29.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"

@class CategoryTableViewController;

@protocol CategoryControllerDelegate <NSObject>

@optional

-(void) categoryViewController:(CategoryTableViewController *)categoryViewController didSelectSubcategories:(NSArray *)subcategoriew;

@end



@interface CategoryTableViewController : UITableViewController


@property (nonatomic,weak) id<CategoryControllerDelegate> delegate;

@end
