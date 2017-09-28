//
//  DebugVC.m
//  AutoLayoutDemo
//
//  Created by dengweijie on 2017/9/28.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "DebugVC.h"
#import "TwoMasonryView.h"

#define kViewWidth 150
#define kViewHeight kViewWidth

@interface DebugVC ()
@property (nonatomic, strong) TwoMasonryView *masonryView;
@end

@implementation DebugVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Debug";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _masonryView = [[TwoMasonryView alloc] init];
    [self.view addSubview:_masonryView];
    
    [_masonryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.and.height.mas_equalTo(kViewWidth);
    }];
}


@end

//po [[UIWindow keyWindow] _autolayoutTrace]
//po 0x7f8a04c12500
//expr ((UIView *)0x7f8a04c12500).backgroundColor = [UIColor yellowColor]
