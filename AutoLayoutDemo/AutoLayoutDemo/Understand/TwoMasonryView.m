//
//  TwoMasonryView.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/27.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "TwoMasonryView.h"

#define kMarginTop 20
#define kMarginLeft 20
#define kMarginRight 20
#define kMarginBottom 20
#define kMarginBetween 8

@interface TwoMasonryView ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation TwoMasonryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initRedView];
        [self initBlueView];
        [self subviewsLayout];
    }
    return self;
}

- (void)initRedView
{
    _redView = [[UIView alloc] init];
    _redView.backgroundColor = [UIColor redColor];
    [self addSubview:_redView];
}

- (void)initBlueView
{
    _blueView = [[UIView alloc] init];
    _blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:_blueView];
}

- (void)subviewsLayout
{
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kMarginLeft);
        make.top.mas_equalTo(kMarginTop);
        make.bottom.mas_equalTo(-kMarginBottom);
        make.width.equalTo(_blueView);
    }];
    
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_redView.mas_right).offset(kMarginBetween);
        make.top.bottom.and.width.equalTo(_redView);
        make.right.mas_equalTo(-kMarginRight);
    }];
}

@end
