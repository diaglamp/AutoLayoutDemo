//
//  UnderstandVC.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/24.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "UnderstandVC.h"
#import "TwoFrameView.h"
#import "TwoConstraintView.h"
#import "TwoVFLView.h"
#import "TwoMasonryView.h"

#define kViewWidth 150
#define kViewHeight kViewWidth

@interface UnderstandVC ()
@property (nonatomic, strong) TwoFrameView *frameView;
@property (nonatomic, strong) TwoVFLView *vflView;
@property (nonatomic, strong) TwoConstraintView *constraintView;
@property (nonatomic, strong) TwoMasonryView *masonryView;
@end

@implementation UnderstandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Understand";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _frameView = [[TwoFrameView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight)];
    [self.view addSubview:_frameView];
    
    _constraintView = [[TwoConstraintView alloc] initWithFrame:CGRectMake(_frameView.right + 20, 0, kViewWidth, kViewHeight)];
    [self.view addSubview:_constraintView];
    
    _vflView = [[TwoVFLView alloc] initWithFrame:CGRectMake(0, _frameView.bottom + 20, kViewWidth, kViewHeight)];
    [self.view addSubview:_vflView];
    
    _masonryView = [[TwoMasonryView alloc] initWithFrame:CGRectMake(_constraintView.left, _constraintView.bottom + 20, kViewWidth, kViewHeight)];
    [self.view addSubview:_masonryView];
}


@end
