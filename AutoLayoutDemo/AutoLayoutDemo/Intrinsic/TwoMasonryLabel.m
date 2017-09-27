//
//  TwoMasonryLabel.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/27.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "TwoMasonryLabel.h"

#define kMarginTop 20
#define kMarginLeft 16
#define kMarginRight 16
#define kMarginBetween 8

@interface TwoMasonryLabel ()
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@end

@implementation TwoMasonryLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _leftLabel = ({
        UILabel *alabel = [[UILabel alloc] init];
        alabel.backgroundColor = [UIColor lightGrayColor];
        alabel.textColor = [UIColor blueColor];
        alabel.font = [UIFont systemFontOfSize:13];
        alabel.textAlignment = NSTextAlignmentCenter;
        alabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        alabel;
    });
    [_leftLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:_leftLabel];
    
    _rightLabel = ({
        UILabel *alabel = [[UILabel alloc] init];
        alabel.backgroundColor = [UIColor lightGrayColor];
        alabel.textColor = [UIColor redColor];
        alabel.font = [UIFont systemFontOfSize:30];
        alabel.textAlignment = NSTextAlignmentLeft;
        alabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        alabel;
    });
    [self addSubview:_rightLabel];
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kMarginLeft);
        make.top.mas_greaterThanOrEqualTo(kMarginTop);
    }];
    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftLabel.mas_right).offset(kMarginBetween);
        make.top.mas_greaterThanOrEqualTo(kMarginTop);
        make.right.mas_equalTo(-kMarginRight);
        make.baseline.equalTo(_leftLabel);
    }];
}

- (void)setLeftText:(NSString *)leftText
{
    _leftText = leftText;
    _leftLabel.text = _leftText;
}

- (void)setRightText:(NSString *)rightText
{
    _rightText = rightText;
    _rightLabel.text = _rightText;
}

/**
 AutoLayout的优势在于
 1、靠右靠下布局
 2、居中布局
 3、不确定性布局(不等式、优先级
 
 布局代码作为一个整体，一般会放在同一个地方，方便查找和理解
 */

@end
