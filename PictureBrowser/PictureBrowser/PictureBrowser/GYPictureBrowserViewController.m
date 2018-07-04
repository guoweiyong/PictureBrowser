//
//  GYPictureBrowserViewController.m
//  PictureBrowser
//
//  Created by apple on 2018/6/29.
//  Copyright © 2018年 yunjiazhineng. All rights reserved.
//

#import "GYPictureBrowserViewController.h"
#import "GYPictureCollectionViewCell.h"

static NSString *pictureCellIdentifier = @"pictureCellIdentifier";

@interface GYPictureBrowserViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/** 显示器 */
@property (nonatomic, strong) UICollectionView *collectionView;

/** 数据源 */
@property (nonatomic, strong) NSArray *images;

/** 当前滑动到那个位置 */
@property (nonatomic, assign) NSInteger imageIndex;
@end

@implementation GYPictureBrowserViewController

- (instancetype)initWith:(NSArray *)images imageIndex:(NSInteger)index {
    self = [super init];
    if (self) {
        self.images = images;
        self.imageIndex = index;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    //添加视图
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    flowLayout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
//    flowLayout.minimumLineSpacing = 0;
//    flowLayout.minimumInteritemSpacing = 0;
//
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
//    collectionView.backgroundColor = [UIColor whiteColor];
//    collectionView.pagingEnabled = YES;
//
//
//    //注册cell
//    [collectionView registerClass:[GYPictureCollectionViewCell class] forCellWithReuseIdentifier:pictureCellIdentifier];
    
    [self.view addSubview:self.collectionView];
    //self.collectionView = collectionView;
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imageIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
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
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
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
