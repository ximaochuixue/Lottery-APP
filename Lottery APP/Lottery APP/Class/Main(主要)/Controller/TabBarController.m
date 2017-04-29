//
//  TabBarController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/27.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "TabBarController.h"

#import "TabBar.h"

#import "ArenaViewController.h"
#import "DiscoverViewController.h"
#import "HallViewController.h"
#import "HistoryViewController.h"
#import "MyLotteryViewController.h"
#import "NavigationController.h"

@interface TabBarController ()<TabBarDelegate>

@property(nonatomic,strong) NSMutableArray *items;

@end

@implementation TabBarController

-(NSMutableArray *)items{
    if (_items==nil) {
        _items =[NSMutableArray array];
    }
    return _items;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
    
    [self setUpTabBar];
    

    
    // Do any additional setup after loading the view.
}

-(void) setUpAllChildViewController{
    HallViewController *hall = [[HallViewController alloc] init];
    [self setUponechildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"]];
    
    ArenaViewController *arena = [[ArenaViewController alloc] init];
    [self setUponechildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self setUponechildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]];
    
    HistoryViewController *history = [[HistoryViewController alloc] init];
    [self setUponechildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"]];
    
    MyLotteryViewController *mylottery = [[MyLotteryViewController alloc] init];
    [self setUponechildViewController:mylottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]];
    mylottery.view.backgroundColor = [UIColor whiteColor];
    
}

-(void) setUponechildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage{
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    [self.items addObject:vc.tabBarItem];
    
    vc.view.backgroundColor = [UIColor blueColor];
    
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}


-(void)setUpTabBar{
    
    [self.tabBar removeFromSuperview];
    
    TabBar *tabBar = [[TabBar alloc] init];
    
    tabBar.items = self.items;
    
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.frame;
    
    [self.view addSubview:tabBar];
}

-(void)tabBar:(TabBar *)tabBar didClickBtn:(NSInteger)index{
    
    self.selectedIndex = index;
//    NSLog(@"%ld",index);
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
