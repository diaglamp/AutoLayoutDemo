//
//  TwoConstraintView.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/27.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "TwoConstraintView.h"

#define kMarginTop 20
#define kMarginLeft 20
#define kMarginRight 20
#define kMarginBottom 20
#define kMarginBetween 8

@interface TwoConstraintView ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation TwoConstraintView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self initRedView];
        [self initBlueView];
        [self subviewsLayout];
    }
    return self;
}

- (void)initRedView
{
    _redView = [[UIView alloc] init];
    _redView.translatesAutoresizingMaskIntoConstraints = NO;
    _redView.backgroundColor = [UIColor redColor];
    [self addSubview:_redView];
}

- (void)initBlueView
{
    _blueView = [[UIView alloc] init];
    _blueView.translatesAutoresizingMaskIntoConstraints = NO;
    _blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:_blueView];
}

- (void)subviewsLayout
{
    //Vertical Constraints
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:kMarginTop]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_redView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:kMarginBottom]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    //Horizontal Constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:kMarginLeft]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_redView attribute:NSLayoutAttributeRight multiplier:1.0 constant:kMarginBetween]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:kMarginRight]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_blueView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
}

@end
