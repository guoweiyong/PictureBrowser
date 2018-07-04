//
//  GYPictureBrowserViewController.h
//  PictureBrowser
//
//  Created by apple on 2018/6/29.
//  Copyright © 2018年 yunjiazhineng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GYPictureBrowserViewController : UIViewController

/**
 初始化

 @param images 需要展示的图片
 @return return value description
 */
- (instancetype)initWith:(NSArray *)images imageIndex:(NSInteger)index;
@end
