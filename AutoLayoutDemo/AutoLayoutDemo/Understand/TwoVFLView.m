//
//  TwoVFLView.m
//  AutoLayoutDemo
//
//  Created by dengweijie on 2017/9/28.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "TwoVFLView.h"

#define kMarginTop 20
#define kMarginLeft 20
#define kMarginRight 20
#define kMarginBottom 20
#define kMarginBetween 8

@interface TwoVFLView ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation TwoVFLView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        UIView *redView = [[UIView alloc] init];
        redView.translatesAutoresizingMaskIntoConstraints = NO;
        redView.backgroundColor = [UIColor redColor];
        [self addSubview:redView];
        _redView = redView;
        
        UIView *blueView = [[UIView alloc] init];
        blueView.translatesAutoresizingMaskIntoConstraints = NO;
        blueView.backgroundColor = [UIColor blueColor];
        [self addSubview:blueView];
        _blueView = blueView;
        
        //layout
        
        //把要添加约束的View转成字典
        //这个方法会自动把传入的参数以字典的形式返回，字典的KEY就是其本身的名字
        //如@{@"redView"：redView}
        NSDictionary *views = NSDictionaryOfVariableBindings(redView,blueView);
        
        //设置margin的数值
        NSDictionary *metrics = @{@"marginSide":@(kMarginTop), @"margin":@(kMarginBetween)};
        
        //Hvfl与Vvfl分别是水平方向与垂直方向的约束
        NSString *Hvfl = @"H:|-marginSide-[redView]-margin-[blueView(==redView)]-marginSide-|";
        NSString *Vvfl = @"V:|-marginSide-[redView]-marginSide-|";
        
        //添加对齐方式
        NSLayoutFormatOptions Hops = NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom;
        
        //创建约束组
        NSArray *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:Hvfl options:Hops metrics:metrics views:views];
        NSArray *constraintsV = [NSLayoutConstraint constraintsWithVisualFormat:Vvfl options:0 metrics:metrics views:views];
        
        //添加约束
        [self addConstraints:constraintsH];
        [self addConstraints:constraintsV];
        
    }
    return self;
}

@end
