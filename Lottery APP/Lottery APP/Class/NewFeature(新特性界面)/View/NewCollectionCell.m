//
//  NewCollectionCell.m
//  Lottery APP
//
//  Created by 希毛吹雪 on 2017/5/4.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "NewCollectionCell.h"

#import "TabBarController.h"

@implementation NewCollectionCell


-(UIButton *)startBtn{
    if (_startBtn == nil) {
        
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_startBtn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];

        [_startBtn sizeToFit];
        
        [_startBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
        
        _startBtn.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height * 0.9);
        
//        NSLog(@"%f %f",self.bounds.size.width/2,self.bounds.size.height/2);
        
        [self.contentView addSubview:_startBtn];
    }
    return _startBtn;
}

-(UIImageView *)imageView{
    if (_imageView == nil) {
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _imageView = imageV;
        
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}


-(void)setupIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3 ) {
        self.startBtn.hidden = NO;
    }else{
        self.startBtn.hidden = YES;
    }
}

-(void)click{
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [[TabBarController alloc] init];
}

@end
