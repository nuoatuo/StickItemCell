//
//  XZStickView.m
//  StickItemCell
//
//  Created by 夜风 on 2017/9/25.
//  Copyright © 2017年 夜风. All rights reserved.
//

#import "XZStickView.h"

@implementation XZStickView
#pragma mark - init
/**
 实例化“悬浮视图”
 
 @return self
 */
+ (instancetype)classInit {
    XZStickView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    view.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 64.0);
    view.margin = 10.0;
    
    return view;
}




@end
