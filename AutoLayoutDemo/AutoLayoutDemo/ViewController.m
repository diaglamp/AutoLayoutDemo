//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by 邓伟杰 on 2017/9/24.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "ViewController.h"
#import "UnderstandVC.h"
#import "IntrinsicVC.h"
#import "RemakeConstraintsVC.h"

typedef NS_ENUM(NSInteger, VCCellType) {
    VCCellTypeUnderstand,
    VCCellTypeIntrinsic,
    VCCellTypeRemakeConstraints
};

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
{
    NSArray *_cellTypes;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"Home";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self updateCellTypes];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

- (void)updateCellTypes
{
    _cellTypes = @[
                   @(VCCellTypeUnderstand)
                   ,@(VCCellTypeIntrinsic)
                   ,@(VCCellTypeRemakeConstraints)
                   ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellTypes.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reusedId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reusedId];
    }
    NSString *title = nil;
    VCCellType type = [_cellTypes[indexPath.row] integerValue];
    switch (type) {
        case VCCellTypeUnderstand:
        {
            title = @"Understand";
        }   break;
        case VCCellTypeIntrinsic:
        {
            title = @"Intrinsic";
        }   break;
        case VCCellTypeRemakeConstraints:
        {
            title = @"RemakeConstraints";
        }   break;
    }
    
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    VCCellType type = [_cellTypes[indexPath.row] integerValue];
    switch (type) {
        case VCCellTypeUnderstand:
        {
            [self pushToUnderstandVC];
        }   break;
        case VCCellTypeIntrinsic:
        {
            [self pushToIntrinsicVC];
        }   break;
        case VCCellTypeRemakeConstraints:
        {
            [self pushToRemakeConstraintsVC];
        }   break;
    }
}

- (void)pushToUnderstandVC
{
    UnderstandVC *vc = [[UnderstandVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushToIntrinsicVC
{
    IntrinsicVC *vc = [[IntrinsicVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushToRemakeConstraintsVC
{
    RemakeConstraintsVC *vc = [[RemakeConstraintsVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
