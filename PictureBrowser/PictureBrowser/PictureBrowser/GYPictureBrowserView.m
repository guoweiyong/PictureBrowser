//
//  GYPictureBrowserView.m
//  PictureBrowser
//
//  Created by apple on 2018/7/3.
//  Copyright © 2018年 yunjiazhineng. All rights reserved.
//



#import "GYPictureBrowserView.h"
#import "GYPictureCollectionViewCell.h"

static NSString *pictureCellIdentifier = @"pictureCellIdentifier";

@interface GYPictureBrowserView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/** 显示器 */
@property (nonatomic, strong) UICollectionView *collectionView;

/** 数据源 */
@property (nonatomic, strong) NSArray *images;

/** 当前滑动到那个位置 */
@property (nonatomic, assign) NSInteger imageIndex;
@end

@implementation GYPictureBrowserView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images imageIndex:(NSInteger)index {
    self = [super initWithFrame:frame];
    if (self) {
        self.images = images;
        self.imageIndex = index;
        [self addSubview:self.collectionView];
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imageIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
    
    return self;
}

#pragma mark -- <UICollectionViewDelegate,UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GYPictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pictureCellIdentifier forIndexPath:indexPath];
    //赋值
    cell.image = self.images[indexPath.item];
    cell.backgroundColor = [UIColor orangeColor];
    cell.removeViewFormSuperViewCallBack = ^{
        [self removeFromSuperview];
    };
    
    return cell;
}


#pragma 检测偏移量




#pragma mark -- 懒加载

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.pagingEnabled = YES;
        
        
        //注册cell
        [_collectionView registerClass:[GYPictureCollectionViewCell class] forCellWithReuseIdentifier:pictureCellIdentifier];
    }
    
    return _collectionView;
}
@end
