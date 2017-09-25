//
//  XZCollectionViewFlowLayout.h
//  StickItemCell
//
//  Created by 夜风 on 2017/9/8.
//  Copyright © 2017年 夜风. All rights reserved.
//


#import <UIKit/UIKit.h>


/**
 获得悬浮视图Yblock
 */
typedef void (^XZCollectionViewFlowLayoutGetStickY)(CGFloat);


@interface XZCollectionViewFlowLayout : UICollectionViewFlowLayout

//悬浮位置
@property (nonatomic, strong) NSIndexPath *stickIndexPath;
//获得悬浮视图Y
@property (nonatomic, copy) XZCollectionViewFlowLayoutGetStickY getStickTop;

/**
 实例化"子类流水布局"
 
 @param stickIndexPath 悬浮位置
 @return self
 */
+(instancetype)classInitWithStickIndexPath:(NSIndexPath *)stickIndexPath;


@end
