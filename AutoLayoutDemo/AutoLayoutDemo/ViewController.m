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

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"Home";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
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
    if (indexPath.row == 0) {
        title = @"Understand";
    } else if (indexPath.row == 1) {
        title = @"Intrinsic";
    }
    
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self pushToUnderstandVC];
    } else if (indexPath.row == 1) {
        [self pushToIntrinsicVC];
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

@end
