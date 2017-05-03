//
//  CategoryTableViewController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/4/29.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "CategoryTableViewController.h"


@interface CategoryTableViewController ()

@property (nonatomic,strong) NSArray *categories;

@end


@implementation CategoryTableViewController


#pragma mark 懒加载数据模型
-(NSArray *)categories{
    if (_categories ==nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
        
        NSMutableArray *categoryArray = [NSMutableArray array];
        
        for(NSDictionary *dict in dictArray){
            
            [categoryArray addObject:[Category categoryWithDict:dict]];
        }
             _categories = categoryArray;
    }
    return _categories;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"category"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"category" ];
    
    Category *c = self.categories[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:c.icon];
    
    cell.imageView.highlightedImage = [UIImage imageNamed:c.highlighted_icon];
    
    cell.textLabel.highlightedTextColor = [UIColor blueColor];
    
    cell.textLabel.text = c.name;
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
//    NSLog(@"%@",cell.textLabel.text);
    
    //cell的右边有一个小箭头，距离右边有十几像素
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    /*
    cell.accessoryType = UITableViewCellAccessoryNone;//cell没有任何的样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有十几像素；
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;//cell右边有一个蓝色的圆形button；
    cell.accessoryType = UITableViewCellAccessoryCheckmark;//cell右边的形状是对号；
    */
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(categoryViewController:didSelectSubcategories:)]) {
        Category *c = self.categories[indexPath.row];
        [self.delegate categoryViewController:self didSelectSubcategories:c.subcategories];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
