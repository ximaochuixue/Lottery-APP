//
//  ActiveController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/29.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "ActiveController.h"

#import "CategoryTableViewController.h"
#import "SubcategoryTableViewController.h"

@interface ActiveController ()

@end

@implementation ActiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat W = self.view.frame.size.width / 2;
    CGFloat H = self.view.frame.size.height;
    
    SubcategoryTableViewController *subcateVc = [[SubcategoryTableViewController alloc] init];
    subcateVc.view.frame = CGRectMake(W, 0, W, H);
    [self addChildViewController:subcateVc];
    [self.view addSubview:subcateVc.view];
    
    CategoryTableViewController *categoryVc = [[CategoryTableViewController alloc] init];
    categoryVc.delegate = subcateVc;
    categoryVc.view.frame = CGRectMake(0, 0, W, H);
    [self addChildViewController:categoryVc];
    [self.view addSubview:categoryVc.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
