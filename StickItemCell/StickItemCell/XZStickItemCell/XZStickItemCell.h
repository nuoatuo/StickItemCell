//
//  XZStickItemCell.h
//  StickItemCell
//
//  Created by 夜风 on 2017/9/11.
//  Copyright © 2017年 夜风. All rights reserved.
//
#pragma mark ***悬浮Cell***

#import <UIKit/UIKit.h>


@interface XZStickItemCell : UICollectionViewCell

/**
 注册"悬浮Cell"
 
 @param collectionView  集合视图
 */
+ (void)registerCell:(UICollectionView *)collectionView;

/**
 实例化"悬浮Cell"
 
 @param collectionView  集合视图
 @param atIndexPath 位置
 
 @return self
 */
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)atIndexPath;

@end
