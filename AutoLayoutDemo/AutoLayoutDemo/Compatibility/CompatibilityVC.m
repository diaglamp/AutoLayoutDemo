//
//  CompatibilityVC.m
//  AutoLayoutDemo
//
//  Created by dengweijie on 2017/9/28.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "CompatibilityVC.h"
#import "TwoFrameView.h"
#import "TwoMasonryView.h"

#define kViewWidth 150
#define kViewHeight kViewWidth

@interface CompatibilityVC ()
@property (nonatomic, strong) TwoFrameView *frameView;
@property (nonatomic, strong) TwoMasonryView *masonryView;
@end

@implementation CompatibilityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Understand";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _frameView = [[TwoFrameView alloc] init];
    [self.view addSubview:_frameView];
    
    _masonryView = [[TwoMasonryView alloc] init];
    [self.view addSubview:_masonryView];
    
    
    [_frameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.and.height.mas_equalTo(kViewWidth);
    }];
    
    [_masonryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_frameView.mas_bottom).offset(20);
        make.width.height.and.centerX.equalTo(_frameView);
    }];
}


@end
