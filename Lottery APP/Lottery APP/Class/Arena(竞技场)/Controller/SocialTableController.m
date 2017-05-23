//
//  SocialTableController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/12.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "SocialTableController.h"

@interface SocialTableController ()

@end

@implementation SocialTableController

static NSString *ID = @"social";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
     cell.textLabel.text = [NSString stringWithFormat:@"%@ -- %zd",self.title,indexPath.row];
    
    return cell;
}



@end
