//
//  XZImageItemCell.h
//  StickItemCell
//
//  Created by 夜风 on 2017/9/11.
//  Copyright © 2017年 夜风. All rights reserved.
//

#pragma mark ***图片Cell***

#import <UIKit/UIKit.h>

//屏幕宽度
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
//间距
#define kPadding 10.0

@interface XZImageItemCell : UICollectionViewCell
/**
 注册"图片Cell"
 
 @param collectionView 集合视图
 */
+ (void)registerCell:(UICollectionView *)collectionView;

/**
 实例化"图片Cell"
 
 @param collectionView  集合视图
 @param atIndexPath 位置
 @param imgName 图片名
 
 @return self
 */
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)atIndexPath imgName:(NSString *)imgName;

/**
 获得"图片Cell"大小
 */
+ (CGSize)sizeOfCell;

@end
