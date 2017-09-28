//
//  AutomaticCell.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/28.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "AutomaticCell.h"

#define kSideMargin 16

@interface AutomaticCell ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation AutomaticCell

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
    _label = ({
        UILabel *alabel = [[UILabel alloc] init];
        alabel.backgroundColor = [UIColor clearColor];
        alabel.textColor = [UIColor redColor];
        alabel.font = [UIFont systemFontOfSize:15];
        alabel.textAlignment = NSTextAlignmentLeft;
        alabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        alabel.numberOfLines = 0;
        alabel;
    });
    _label.preferredMaxLayoutWidth = SCREEN_WIDTH - 2*kSideMargin;
    [self.contentView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kSideMargin);
        make.top.mas_equalTo(kSideMargin);
        make.right.mas_equalTo(-kSideMargin);
        make.bottom.mas_equalTo(-kSideMargin);
    }];
    
    [_label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)setDataModel:(DataModel *)dataModel
{
    _dataModel = dataModel;
    _label.text = dataModel.text;
}


@end
