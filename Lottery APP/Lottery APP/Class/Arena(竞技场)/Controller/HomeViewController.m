//
//  HomeViewController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/12.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "HomeViewController.h"

#import "SocialTableController.h"

#import "topLable.h"

static NSInteger num = 8;

@interface HomeViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *TitleScrollerView;
@property (strong, nonatomic) IBOutlet UIScrollView *ContentScrollerView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"竞技场房间列表";
    
    self.ContentScrollerView.delegate = self;
    
    [self setUpAllChildVc];
    [self setUpTitle];
    [self scrollViewDidEndScrollingAnimation:self.ContentScrollerView];
    
}


-(void)setUpAllChildVc{
    
    SocialTableController *social1 = [[SocialTableController alloc] init];
    social1.title = @"一号";
    [self addChildViewController:social1];
    
    SocialTableController *social2 = [[SocialTableController alloc] init];
    social2.title = @"二号";
    [self addChildViewController:social2];
    
    SocialTableController *social3 = [[SocialTableController alloc] init];
    social3.title = @"三号";
    [self addChildViewController:social3];
    
    SocialTableController *social4 = [[SocialTableController alloc] init];
    social4.title = @"四号";
    [self addChildViewController:social4];
    
    SocialTableController *social5 = [[SocialTableController alloc] init];
    social5.title = @"五号";
    [self addChildViewController:social5];
    
    SocialTableController *social6 = [[SocialTableController alloc] init];
    social6.title = @"六号";
    [self addChildViewController:social6];
    
    SocialTableController *social7 = [[SocialTableController alloc] init];
    social7.title = @"七号";
    [self addChildViewController:social7];
    
    SocialTableController *social8 = [[SocialTableController alloc] init];
    social8.title = @"八号";
    [self addChildViewController:social8];
}


-(void) setUpTitle{
    
    CGFloat labelW = 100;
    CGFloat labelY = 0;
    CGFloat labelH = self.TitleScrollerView.frame.size.height;
    
    
    for (NSInteger i = 0; i < num; i++) {
        topLable *label = [[topLable alloc] init];
        label.text = [self.childViewControllers[i] title];
        CGFloat labelX = i * labelW;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
        label.tag = i;
        [self.TitleScrollerView addSubview:label];
        
        if (i == 0) {
            label.scale = 1.0;
        }
    }
    
    self.TitleScrollerView.contentSize = CGSizeMake(num * labelW, 0);
    self.ContentScrollerView.contentSize = CGSizeMake(num * [UIScreen mainScreen].bounds.size.width, 0);

}

- (void)labelClick:(UITapGestureRecognizer *)tap
{
    
    NSInteger index = tap.view.tag;
    
    // 让底部的内容scrollView滚动到对应位置
    CGPoint offset = self.ContentScrollerView.contentOffset;
    offset.x = index * self.ContentScrollerView.frame.size.width;
    [self.ContentScrollerView setContentOffset:offset animated:YES];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 当前位置需要显示的控制器的索引
    NSInteger index = offsetX / width;
    
    // 让对应的顶部标题居中显示
    topLable *label = self.TitleScrollerView.subviews[index];
    CGPoint titleOffset = self.TitleScrollerView.contentOffset;
    titleOffset.x = label.center.x - width * 0.5;
    // 左边超出处理
    if (titleOffset.x < 0) titleOffset.x = 0;
    // 右边超出处理
    CGFloat maxTitleOffsetX = self.TitleScrollerView.contentSize.width - width;
    if (titleOffset.x > maxTitleOffsetX) titleOffset.x = maxTitleOffsetX;
    
    [self.TitleScrollerView setContentOffset:titleOffset animated:YES];
    
    
    // 取出需要显示的控制器
    UIViewController *willShowVc = self.childViewControllers[index];
    
    // 如果当前位置的位置已经显示过了，就直接返回
    if ([willShowVc isViewLoaded]) return;
    
    // 添加控制器的view到contentScrollView中;
    willShowVc.view.frame = CGRectMake(offsetX, 0, width, height);
    [scrollView addSubview:willShowVc.view];
}

/**
 * 手指松开scrollView后，scrollView停止减速完毕就会调用这个
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/**
 * 只要scrollView在滚动，就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scale = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (scale < 0 || scale > self.TitleScrollerView.subviews.count - 1) return;
    
    // 获得需要操作的左边label
    NSInteger leftIndex = scale;
    topLable *leftLabel = self.TitleScrollerView.subviews[leftIndex];
    
    // 获得需要操作的右边label
    NSInteger rightIndex = leftIndex + 1;
    topLable *rightLabel = (rightIndex == self.TitleScrollerView.subviews.count) ? nil : self.TitleScrollerView.subviews[rightIndex];
    
    // 右边比例
    CGFloat rightScale = scale - leftIndex;
    // 左边比例
    CGFloat leftScale = 1 - rightScale;
    
    // 设置label的比例
    leftLabel.scale = leftScale;
    rightLabel.scale = rightScale;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
