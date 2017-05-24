//
//  DiscoverViewController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/27.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController () <UIWebViewDelegate>


@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发现";
    
    CGRect rect = [UIScreen mainScreen].bounds;
    rect.size.height -= 64;

    UIWebView *webV = [[UIWebView alloc] initWithFrame:rect];

    [webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.njupt.edu.cn"]]];
    webV.delegate = self;
    
    webV.scalesPageToFit = YES;
    
    self.view = webV;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
