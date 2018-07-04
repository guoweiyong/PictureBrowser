//
//  GYPictureCollectionViewCell.m
//  PictureBrowser
//
//  Created by apple on 2018/6/29.
//  Copyright © 2018年 yunjiazhineng. All rights reserved.
//

#import "GYPictureCollectionViewCell.h"

@interface GYPictureCollectionViewCell()

/** 显示图片 */
@property (nonatomic, strong) UIImageView *imageView;

/** 图片显示高度约束 */
@property (nonatomic, strong) NSLayoutConstraint *imageViewHeihtCons;

/** 图片放大的倍数 */
@property (nonatomic, assign) CGFloat scaleImageView;
@end

@implementation GYPictureCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //初始化
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    self.scaleImageView = 1.0;
    //1.添加子控件
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.translatesAutoresizingMaskIntoConstraints = false;
    imageView.userInteractionEnabled = YES;
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    //2.布局子控件
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:@{@"imageView":imageView}]];
    //设置图片在水平方面的大小
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    self.imageViewHeihtCons = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.imageViewHeihtCons];
    
    //1.给图片添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scaleImageView:)];
    tap.numberOfTapsRequired = 2; //点击几下
    tap.numberOfTouchesRequired = 1;//几跟手指
    [imageView addGestureRecognizer:tap];
    
    //2.图片实现一个缩放手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchImage:)];
    [imageView addGestureRecognizer:pinch];
    
    //3.给view添加点击手势
    UITapGestureRecognizer *viewTag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTag:)];
    [self addGestureRecognizer:viewTag];
}


/**
 图片双击手势

 @param tapGR <#tapGR description#>
 */
- (void)scaleImageView:(UITapGestureRecognizer *)tapGR {
    if (self.scaleImageView == 2.0) {
        self.imageView.transform = CGAffineTransformIdentity;
        self.scaleImageView = 1.0;
    }else {
        self.scaleImageView += 1.0;
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, self.scaleImageView, self.scaleImageView);
    }
}

/**
 图片的捏合手势

 @param pinchGR <#pinchGR description#>
 */
- (void)pinchImage:(UIPinchGestureRecognizer *)pinchGR {
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinchGR.scale, pinchGR.scale);
    pinchGR.scale = 1;
}

/**
 view的点击手势

 @param tapGR <#tapGR description#>
 */
- (void)viewTag:(UITapGestureRecognizer *)tapGR {
    CGPoint currentPoint = [tapGR locationInView:self];
    if (!CGRectContainsPoint(self.imageView.frame, currentPoint)) {
        self.removeViewFormSuperViewCallBack();
    }
}



- (void)setImage:(NSString *)image {
    _image = image;
    
    //接下来我要赋值  通过url 和  图片的名字
    UIImage *Bimage = [UIImage imageNamed:image];
    self.imageView.image = Bimage;
    
    //通过比例计算图片显示的高度
    CGFloat scaleImageHeight = Bimage.size.height/Bimage.size.width *([UIScreen mainScreen].bounds.size.width);
    self.imageViewHeihtCons.constant = scaleImageHeight;
    
    [self layoutIfNeeded];
}

@end
