//
//  XZCollectionViewFlowLayout.m
//  StickItemCell
//
//  Created by 夜风 on 2017/9/8.
//  Copyright © 2017年 夜风. All rights reserved.
//

#import "XZCollectionViewFlowLayout.h"

@implementation XZCollectionViewFlowLayout
#pragma mark - init
/**
 实例化"子类流水布局"
 
 @param stickIndexPath 悬浮位置
 @return self
 */
+(instancetype)classInitWithStickIndexPath:(NSIndexPath *)stickIndexPath {
    XZCollectionViewFlowLayout *layout = [[self alloc] init];
    if (layout) {
        layout.stickIndexPath = stickIndexPath;
    }
    return layout;
}

#pragma mark - system
/**
 重绘布局属性
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    //1.校验
    NSArray *layoutArray = [super layoutAttributesForElementsInRect:rect];
    if (!layoutArray.count) return layoutArray;
    
    //2.更新悬浮顶部值
    [self updateStickTop:layoutArray];
    
    return layoutArray;
}

#pragma mark - custom
/**
 更新悬浮顶部值
 
 @param layoutArray 布局属性数据源
 */
- (void)updateStickTop:(NSArray<UICollectionViewLayoutAttributes *> *)layoutArray {
    if (!self.stickIndexPath) return;
    
    if (!self.getStickTop) return;
    
    for (UICollectionViewLayoutAttributes *attributes in layoutArray) {
        //NSLog(@"attributes:  section=%ld, item =%ld",attributes.indexPath.section,attributes.indexPath.item);
        if (attributes.indexPath != self.stickIndexPath) continue;
        
        //回调
        if (attributes.frame.origin.y > 0.0) {
            self.getStickTop(attributes.frame.origin.y);
        }
        break;
    }
}


@end
