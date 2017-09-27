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
    
    _animatedView = [[AnimatedView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    _animatedView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_animatedView];
}

@end
