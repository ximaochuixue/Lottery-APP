//
//  SettingTableController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "SettingTableController.h"

#import "settingItem.h"
#import "settingGroup.h"
#import "settingViewCell.h"

#import "updateTabbar.h"


@interface SettingTableController ()


@end

@implementation SettingTableController


-(NSMutableArray *)groups{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    
    return _groups;
}

-(void)setgroup{
    settingItem *item = [settingItem initWithimage:[UIImage imageNamed:@"RedeemCode"] title:@"RedeemCode"];
    
    settingGroup *group = [settingGroup groupWithItem:@[item]];
    
    group.headTitle = @"头";
    group.footTitle = @"尾";
    
    [self.groups addObject:group];
 }


- (void)viewDidLoad {
    [super viewDidLoad];
    
    updateTabbar *uptab = [[updateTabbar alloc] init];
    [uptab updateTabbar:self Withtitle:@"设置"];
    
    [self setgroup];
    [self setgroup];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    settingGroup *group = self.groups[section];

    return group.items.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    settingViewCell *cell = [[settingViewCell alloc] init];
    
    settingGroup *group = self.groups[indexPath.section];
    
    cell.item = group.items[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    settingGroup *group = self.groups[section];
    
    return group.headTitle;
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    settingGroup *group = self.groups[section];
    
    return group.footTitle;
}

@end
