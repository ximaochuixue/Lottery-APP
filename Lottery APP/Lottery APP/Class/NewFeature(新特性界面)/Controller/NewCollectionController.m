//
//  NewCollectionController.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/3.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "NewCollectionController.h"

#import "NewCollectionCell.h"
#import "UIView+Frame.h"

@interface NewCollectionController ()

@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *guideView;

@property (nonatomic, weak) UIImageView *guideLargetView;

@property (nonatomic, weak) UIImageView *guideSmallView;

@end

@implementation NewCollectionController

static NSString * const reuseIdentifier = @"cell";

- (instancetype)init{
    UICollectionViewFlowLayout *viewLayout = [[UICollectionViewFlowLayout alloc] init];
    
    viewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    viewLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    viewLayout.minimumLineSpacing = 0;
    
    viewLayout.minimumInteritemSpacing = 0;
    
    return [super initWithCollectionViewLayout:viewLayout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.bounces = NO;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.pagingEnabled = YES;
    
    // Register cell classes
    [self.collectionView registerClass:[NewCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 200;

    [self.collectionView addSubview:guideLine];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *imagename = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    cell.image = [UIImage imageNamed:imagename];
    
    [cell setupIndexPath:indexPath];
    
    return cell;
}



@end
