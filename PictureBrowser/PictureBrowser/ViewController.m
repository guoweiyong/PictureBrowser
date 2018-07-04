//
//  ViewController.m
//  PictureBrowser
//
//  Created by apple on 2018/6/29.
//  Copyright © 2018年 yunjiazhineng. All rights reserved.
//

#import "ViewController.h"
#import "GYPictureBrowserViewController.h"
#import "GYPictureBrowserView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    GYPictureBrowserViewController *pictureVC = [[GYPictureBrowserViewController alloc] initWith:@[@"1",@"2",@"3"] imageIndex:0];
//    pictureVC.view.frame = self.view.bounds;
//    [self.view addSubview:pictureVC.view];
//    [self addChildViewController:pictureVC];
    GYPictureBrowserView *pictureBrowser = [[GYPictureBrowserView alloc] initWithFrame:self.view.bounds images:@[@"1",@"2",@"3"] imageIndex:0];
    [self.view addSubview:pictureBrowser];
}


@end
