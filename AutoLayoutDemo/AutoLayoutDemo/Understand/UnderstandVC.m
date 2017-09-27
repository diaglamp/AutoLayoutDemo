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
#import "TwoMasonryView.h"

@interface UnderstandVC ()
@property (nonatomic, strong) TwoFrameView *frameView;
@property (nonatomic, strong) TwoConstraintView *constraintView;
@property (nonatomic, strong) TwoMasonryView *masonryView;
@end

@implementation UnderstandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Understand";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _frameView = [[TwoFrameView alloc] initWithFrame:CGRectMake(100, 0, 150, 150)];
    _frameView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_frameView];
    
    _constraintView = [[TwoConstraintView alloc] initWithFrame:CGRectMake(100, 200, 150, 150)];
    _constraintView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_constraintView];
    
    _masonryView = [[TwoMasonryView alloc] initWithFrame:CGRectMake(100, 400, 150, 150)];
    _masonryView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_masonryView];
}


@end
