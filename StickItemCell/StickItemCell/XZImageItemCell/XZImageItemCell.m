//
//  XZImageItemCell.m
//  StickItemCell
//
//  Created by 夜风 on 2017/9/11.
//  Copyright © 2017年 夜风. All rights reserved.
//

#import "XZImageItemCell.h"

@interface XZImageItemCell ()

//图片视图
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@end

@implementation XZImageItemCell
#pragma mark - 注册Cell
/**
 注册"图片Cell"
 
 @param collectionView 集合视图
 */
+ (void)registerCell:(UICollectionView *)collectionView {
    
    if ((!collectionView) ||
        (![collectionView isKindOfClass:[UICollectionView class]])) {
        return;
    }
    
    NSString *cellName = NSStringFromClass(self);
    [collectionView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellWithReuseIdentifier:cellName];
    
}

#pragma mark - init
/**
 实例化"图片Cell"
 
 @param collectionView  集合视图
 @param atIndexPath 位置
 @param imgName 图片名
 
 @return self
 */
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)atIndexPath imgName:(NSString *)imgName {
    XZImageItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self) forIndexPath:atIndexPath];
    
    if (cell && imgName.length) {
        cell.picImageView.image = [UIImage imageNamed:imgName];
    }
    
    return cell;
}

#pragma mark - setter
- (void)setPicImageView:(UIImageView *)picImageView {
    picImageView.layer.masksToBounds = YES;
    
    picImageView.layer.cornerRadius = 4.0;
    
    picImageView.layer.borderWidth = 1.0;
    picImageView.layer.borderColor = [[UIColor clearColor] CGColor];
    
    
    _picImageView = picImageView;
}

#pragma mark - Size
/**
 获得"图片Cell"大小
 */
+ (CGSize)sizeOfCell {
    CGFloat width = kScreenWidth - kPadding*2;
    return CGSizeMake(width, ceilf(width * 6.0 / 16.0));
}
@end
