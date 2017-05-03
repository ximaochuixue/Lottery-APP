//
//  MyLotteryViewController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/27.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "MyLotteryViewController.h"
#import "LoginController.h"
#import "SettingTableController.h"


@interface MyLotteryViewController ()

@end

@implementation MyLotteryViewController

#pragma mark 点击了客服
-(void) clickFBMM{
    
}

#pragma mark 点击了设置
-(void)clickSetting{
    
    SettingTableController *setTvc = [[SettingTableController alloc] init];
    
    [self.navigationController pushViewController:setTvc animated:YES];

}

#pragma mark 设置self.view
-(void) setView{
    
    UIImageView *backgroundView = [[UIImageView alloc] init];
    backgroundView.image = [UIImage imageNamed:@"LoginScreen"];
    CGFloat imageW = self.view.bounds.size.width;
    CGFloat imageH = self.view.bounds.size.height / 3;
    backgroundView.frame = CGRectMake(0, 20, imageW, imageH);
    [self.view addSubview:backgroundView];
    
    
    CGFloat btnX,btnY,btnW,btnH;
    btnW = self.view.bounds.size.width / 2;
    btnX = btnW / 2;
    btnY = backgroundView.bounds.size.height + 40;
    btnH = 40;
    
    UIButton *logbtn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    
    [logbtn setBackgroundImage:[UIImage imageNamed:@"RedButton"] forState:UIControlStateNormal];
    [logbtn setTitle:@"登录" forState:UIControlStateNormal];
//    [logbtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];

    [self.view addSubview:logbtn];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的彩票";
   
    [self setView];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageNamed:@"FBMM_Barbutton"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    
    UIImage *rigthimage = [UIImage imageNamed:@"Mylottery_config"];
    rigthimage = [rigthimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rigthimage style:UIBarButtonItemStylePlain target:self action:@selector(clickSetting)];
    
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
