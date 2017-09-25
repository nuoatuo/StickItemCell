//
//  ViewController.m
//  StickItemCell
//
//  Created by 夜风 on 2017/9/8.
//  Copyright © 2017年 夜风. All rights reserved.
//

#import "ViewController.h"
#import "XZCollectionViewFlowLayout.h"
#import "XZImageItemCell.h"
#import "XZStickItemCell.h"
#import "XZStickView.h"

/**
 组别
 */
typedef enum : NSUInteger {
    XZUpSection = 0,    //上部组
    XZStickSection,     //悬浮组
    XZDownSection,      //下部组
} XZSectionType;

//导航条高度
#define kToolBarHeight 64.0
//屏幕高度
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//底部集合视图
@property (nonatomic, strong) UICollectionView *bgCollectionView;
//悬浮视图
@property (nonatomic, strong) XZStickView *stickView;
//悬浮Cell偏移量
@property (nonatomic, assign) CGFloat stickCellY;

//上部组数据源
@property (nonatomic, strong) NSArray <NSString *>*upArray;
//下部组数据源
@property (nonatomic, strong) NSArray <NSString *>*downArray;

@end

@implementation ViewController
#pragma mark - getter
/**
 懒加载“主要信息集合视图”
 */
- (UICollectionView *)bgCollectionView {
    if (_bgCollectionView) return _bgCollectionView;
    
    //1.创建layout
    __weak ViewController *detailVC = self;
    XZCollectionViewFlowLayout *layout = [XZCollectionViewFlowLayout classInitWithStickIndexPath:[NSIndexPath indexPathForRow:0 inSection:XZStickSection]];
    layout.minimumLineSpacing = kPadding;
    layout.minimumInteritemSpacing = 0.0;
    layout.getStickTop = ^(CGFloat stickTop) {
        detailVC.stickCellY = stickTop;
        [detailVC updateStickViewY];
    };
    
    //2.创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, kToolBarHeight, kScreenWidth, kScreenHeight - kToolBarHeight) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    collectionView.contentInset = UIEdgeInsetsMake(kPadding, 0.0, kPadding, 0.0);
    
    //3.注册Cell
    [XZImageItemCell registerCell:collectionView];
    [XZStickItemCell registerCell:collectionView];
    
    //4.设置代理
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    _bgCollectionView = collectionView;
    [self.view addSubview:_bgCollectionView];
    
    return _bgCollectionView;
}

/**
 懒加载“悬浮视图”
 */
- (XZStickView *)stickView {
    if (_stickView) return _stickView;
    
    XZStickView *stickView = [XZStickView classInit];
    stickView.hidden = YES;
    
    _stickView = stickView;
    [self.view insertSubview:_stickView aboveSubview:self.bgCollectionView];
    
    return _stickView;
}

/**
 懒加载“上部组数据源”
 */
- (NSArray<NSString *> *)upArray {
    if (_upArray) return _upArray;
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i = 1; i < 5; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"00%d.jpg",i]];
    }
    _upArray = dataArray;
    
    return _upArray;
}

/**
 懒加载“下部组数据源”
 */
- (NSArray<NSString *> *)downArray {
    if (_downArray) return _downArray;
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i = 1; i < 6; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"000%d.jpg",i]];
    }
    _downArray = dataArray;
    
    return _downArray;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.bgCollectionView reloadData];
}

#pragma mark - custom
#pragma mark 更新悬浮视图Y
/**
 更新悬浮视图Y
 */
- (void)updateStickViewY {
    //0.校验
    if (self.stickCellY <= 0.0) {
        self.stickView.hidden = YES;
        return;
    }
    //NSLog(@"stickCellY = %f",self.stickCellY);
    
    //1.获得偏移量
    CGFloat offsetY = self.bgCollectionView.contentOffset.y;
    
    //2.更新悬浮视图Y
    CGRect stickFrame = self.stickView.frame;
    if (offsetY < self.stickCellY + self.stickView.margin) {
        //2.1.悬浮视图可滑动
        stickFrame.origin.y = self.bgCollectionView.frame.origin.y + self.stickCellY - offsetY;
    } else {
        //2.2.悬浮视图固定顶部
        stickFrame.origin.y = kToolBarHeight - self.stickView.margin;
    }
    self.stickView.frame = stickFrame;
    
    //3.显示分栏视图
    self.stickView.hidden = NO;
}

#pragma mark - UICollectionViewDataSource
#pragma mark 组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

#pragma mark 行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == XZUpSection) return self.upArray.count;
    
    if (section == XZStickSection) return 1;
    
    if (section == XZDownSection) return self.downArray.count;
    
    return 0;
}

#pragma mark - Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == XZUpSection) {
        return [XZImageItemCell cellWithCollectionView:collectionView atIndexPath:indexPath imgName:self.upArray[indexPath.item]];
    }
    
    if (indexPath.section == XZStickSection) {
        return [XZStickItemCell cellWithCollectionView:collectionView atIndexPath:indexPath];
    }
    
    if (indexPath.section == XZDownSection) {
         return [XZImageItemCell cellWithCollectionView:collectionView atIndexPath:indexPath imgName:self.downArray[indexPath.item]];
    }
    
    return nil;
}

#pragma mark - Cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    //悬浮Cell
    if (indexPath.section == XZStickSection) {
        return CGSizeMake(kScreenWidth, self.stickView.frame.size.height);
    }
    
    //图片Cell
    return [XZImageItemCell sizeOfCell];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //更新悬浮视图Y
    [self updateStickViewY];
}


@end
