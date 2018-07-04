//
//  GYPictureCollectionViewCell.h
//  PictureBrowser
//
//  Created by apple on 2018/6/29.
//  Copyright © 2018年 yunjiazhineng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^removeViewFormSuperViewBlock)();

@interface GYPictureCollectionViewCell : UICollectionViewCell

/** 赋值 */
@property (nonatomic, strong) NSString *image;

/** 移除view的block回调 */
@property (nonatomic, copy) removeViewFormSuperViewBlock removeViewFormSuperViewCallBack;
@end
