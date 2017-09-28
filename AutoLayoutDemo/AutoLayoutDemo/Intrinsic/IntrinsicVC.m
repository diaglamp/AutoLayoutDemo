//
//  IntrinsicVC.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/27.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "IntrinsicVC.h"
#import "TwoMasonryLabel.h"

@interface IntrinsicVC ()
@property (nonatomic, strong) TwoMasonryLabel *masonryLabel;
@end

@implementation IntrinsicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Intrinsic";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _masonryLabel = [[TwoMasonryLabel alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_masonryLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static NSInteger index = 0;
    NSArray *leftStrings = @[@"HELLO",@"HELLOWORLD"];
    NSArray *rightStrings = @[@"nice to meet you", @"nice to meet you,nice to meet you,nice to meet you,nice to meet you"];
    
    _masonryLabel.leftText = leftStrings[index];
    _masonryLabel.rightText = rightStrings[index];
    
    ++index;
    index %= 2;
}

@end
