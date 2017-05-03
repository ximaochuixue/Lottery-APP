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

#import "updateTabbar.h"


@interface ActiveController ()

@end


@implementation ActiveController


//-(void) NavBack{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage imageNamed:@"NavBack"] forState:UIControlStateNormal];
//    [btn sizeToFit];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    
//    [btn addTarget:self action:@selector(backtoHallview) forControlEvents:nil];
//}
//
//-(void)backtoHallview{
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    updateTabbar * uptab = [[updateTabbar alloc] init];
    [uptab updateTabbar:self Withtitle:@"生活"];
    
    
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



@end
