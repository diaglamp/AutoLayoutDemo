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
#import "AutomaticCell.h"
#import "CompatibilityVC.h"


typedef NS_ENUM(NSInteger, VCCellType) {
    VCCellTypeUnderstand,
    VCCellTypeIntrinsic,
    VCCellTypeRemakeConstraints,
    VCCellTypeAutomatic,
    VCCellTypeCompatibility,
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
@property (nonatomic,strong) DataModel *dataModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"Home";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self updateCellTypes];
    
    _dataModel = [[DataModel alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    _tableView.tableFooterView = [[UIView alloc] init];
    
    
    
}

- (void)updateCellTypes
{
    _cellTypes = @[
                   @(VCCellTypeUnderstand)
                   ,@(VCCellTypeIntrinsic)
                   ,@(VCCellTypeRemakeConstraints)
                   ,@(VCCellTypeAutomatic)
                   ,@(VCCellTypeCompatibility)
                   ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellTypes.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    VCCellType type = [_cellTypes[indexPath.row] integerValue];
    switch (type) {
        case VCCellTypeUnderstand:
        case VCCellTypeIntrinsic:
        case VCCellTypeRemakeConstraints:
        case VCCellTypeCompatibility:
        {
            height = 44;
        }   break;
        case VCCellTypeAutomatic:
        {
            static AutomaticCell *cell;
            //只初始化一次cell
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AutomaticCell class])];
                if (!cell) {
                    cell = [[AutomaticCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([AutomaticCell class])];
                }
            });

            cell.dataModel = _dataModel;
            
            if (_dataModel.cellHeight <= 0) {
                //使用systemLayoutSizeFittingSize获取高度
                _dataModel.cellHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
            }
            
            height = _dataModel.cellHeight;
        }   break;
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    VCCellType type = [_cellTypes[indexPath.row] integerValue];
    switch (type) {
        case VCCellTypeUnderstand:
        case VCCellTypeIntrinsic:
        case VCCellTypeRemakeConstraints:
        case VCCellTypeCompatibility:
        {
            cell = [self normalCell:tableView atIndexPath:indexPath];
        }   break;
        case VCCellTypeAutomatic:
        {
            cell = [self automaticCell:tableView atIndexPath:indexPath];
        }
    }
    return cell;
}

- (UITableViewCell *)normalCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
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
        case VCCellTypeCompatibility:
        {
            title = @"Compatibility";
        }   break;
        default:
            break;
    }
    
    cell.textLabel.text = title;
    return cell;
}

- (UITableViewCell *)automaticCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    AutomaticCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AutomaticCell class])];
    if (!cell) {
        cell = [[AutomaticCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([AutomaticCell class])];
    }
    cell.dataModel = _dataModel;
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
        case VCCellTypeCompatibility:
        {
            [self pushToCompatibilityVC];
        }   break;
        default:
            break;
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

- (void)pushToCompatibilityVC
{
    CompatibilityVC *vc = [[CompatibilityVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
