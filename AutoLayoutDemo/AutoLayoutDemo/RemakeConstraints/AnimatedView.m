//
//  AnimatedView.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/27.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "AnimatedView.h"

#define kDefaultHeight 200
#define kMarginBetween 8

@interface AnimatedView ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UISwitch *modeSwitch;
@end

@implementation AnimatedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initRedView];
        [self initBlueView];
        [self initModeSwitch];
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

- (void)initModeSwitch
{
    _modeSwitch = [[UISwitch alloc] init];
    [_modeSwitch addTarget:self action:@selector(modeSwitchValueDidChange) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_modeSwitch];
}

- (void)subviewsLayout
{
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(0);
        make.right.equalTo(self).priority(UILayoutPriorityDefaultHigh);
    }];
    
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_redView.mas_right).offset(kMarginBetween);
        make.top.bottom.and.width.equalTo(_redView);
        make.right.equalTo(self).priority(UILayoutPriorityDefaultHigh-1);
    }];
    
    [_modeSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_redView.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)modeSwitchValueDidChange
{
    [self setNeedsUpdateConstraints];
    
    UILayoutPriority priority = UILayoutPriorityDefaultHigh + (_modeSwitch.on ? + 1 : - 1);
    [_blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_redView.mas_right).offset(kMarginBetween);
        make.top.bottom.and.width.equalTo(_redView);
        make.right.equalTo(self).priority(priority);
    }];
    [UIView animateWithDuration:1 animations:^{
        [self layoutIfNeeded];
    }];
}

//- (void)updateConstraints
//{
//    UILayoutPriority priority = UILayoutPriorityDefaultHigh + (_modeSwitch.on ? + 1 : - 1);
//    [_blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_redView.mas_right).offset(kMarginBetween);
//        make.top.bottom.and.width.equalTo(_redView);
//        make.right.equalTo(self).priority(priority);
//    }];
//    [super updateConstraints];
//}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(SCREEN_WIDTH, UIViewNoIntrinsicMetric);
}

@end
