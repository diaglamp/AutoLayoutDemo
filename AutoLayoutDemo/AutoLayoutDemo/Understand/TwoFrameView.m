//
//  TwoFrameView.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/27.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "TwoFrameView.h"

#define kMarginTop 20
#define kMarginLeft 20
#define kMarginRight 20
#define kMarginBottom 20
#define kMarginBetween 8

#define kSubviewWidth ((self.width - kMarginLeft - kMarginRight - kMarginBetween)/2.0)
#define kSubviewHeight (self.height - kMarginTop - kMarginBottom)

@interface TwoFrameView ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation TwoFrameView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initRedView];
        [self initBlueView];
    }
    return self;
}

- (void)initRedView
{
    _redView = [[UIView alloc] initWithFrame:CGRectMake(kMarginLeft, kMarginTop, kSubviewWidth, kSubviewHeight)];
    _redView.backgroundColor = [UIColor redColor];
    [self addSubview:_redView];
}

- (void)initBlueView
{
    _blueView = [[UIView alloc] initWithFrame:CGRectMake(_redView.right + kMarginBetween, kMarginTop, kSubviewWidth, kSubviewHeight)];
    _blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:_blueView];
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    CGFloat width = (self.width - kMarginLeft - kMarginRight - kMarginBetween)/2.0;
//    CGFloat height = self.height - kMarginTop - kMarginBottom;
//    _redView.frame = CGRectMake(kMarginLeft, kMarginTop, width, height);
//    _blueView.frame = CGRectMake(_redView.right + kMarginBetween, kMarginTop, width, height);
//}

@end
