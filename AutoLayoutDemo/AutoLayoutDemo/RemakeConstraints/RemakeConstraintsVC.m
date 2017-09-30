//
//  RemakeConstraints.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/27.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "RemakeConstraintsVC.h"
#import "AnimatedView.h"

@interface RemakeConstraintsVC ()
@property (nonatomic, strong) AnimatedView *animatedView;
@end

@implementation RemakeConstraintsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Remake";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _animatedView = [[AnimatedView alloc] init];
    [self.view addSubview:_animatedView];
    
    [_animatedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    NSLog(@"%@ AnimatedViewFrame == %@", NSStringFromSelector(_cmd), NSStringFromCGRect(_animatedView.frame));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@ AnimatedViewFrame == %@", NSStringFromSelector(_cmd), NSStringFromCGRect(_animatedView.frame));
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"%@ AnimatedViewFrame == %@", NSStringFromSelector(_cmd), NSStringFromCGRect(_animatedView.frame));
}


@end
