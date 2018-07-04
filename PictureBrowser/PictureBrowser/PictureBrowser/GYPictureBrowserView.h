//
//  GYPictureBrowserView.h
//  PictureBrowser
//
//  Created by apple on 2018/7/3.
//  Copyright © 2018年 yunjiazhineng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GYPictureBrowserView : UIView

/**
 初始化
 
 @param frame 视图frame
 @param images 需要展示的图片
 @return return value description
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images imageIndex:(NSInteger)index;
@end
