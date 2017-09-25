//
//  XZStickView.h
//  StickItemCell
//
//  Created by 夜风 on 2017/9/25.
//  Copyright © 2017年 夜风. All rights reserved.
//

#pragma mark ***悬浮视图***

#import <UIKit/UIKit.h>

@interface XZStickView : UIView

//边距
@property (nonatomic, assign) CGFloat margin;

/**
 实例化“悬浮视图”

 @return self
 */
+ (instancetype)classInit;

@end
