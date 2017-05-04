//
//  NewCollectionCell.h
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/4.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCollectionCell : UICollectionViewCell

@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UIButton *startBtn;

-(void)setupIndexPath:(NSIndexPath *)indexPath;

@end
