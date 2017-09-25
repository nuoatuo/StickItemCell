//
//  XZStickItemCell.m
//  StickItemCell
//
//  Created by 夜风 on 2017/9/11.
//  Copyright © 2017年 夜风. All rights reserved.
//

#import "XZStickItemCell.h"

@implementation XZStickItemCell
#pragma mark - 注册Cell
/**
 注册"悬浮Cell"
 
 @param collectionView  集合视图
 */
+ (void)registerCell:(UICollectionView *)collectionView {
    
    if ((!collectionView) ||
        (![collectionView isKindOfClass:[UICollectionView class]])) {
        return;
    }

    [collectionView registerClass:self forCellWithReuseIdentifier:NSStringFromClass(self)];
}

#pragma mark - init
/**
 实例化"悬浮Cell"
 
 @param collectionView  集合视图
 @param atIndexPath 位置
 
 @return self
 */
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)atIndexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self) forIndexPath:atIndexPath];
}

@end
