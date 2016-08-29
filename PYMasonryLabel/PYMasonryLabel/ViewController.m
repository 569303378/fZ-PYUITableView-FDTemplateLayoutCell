//
//  ViewController.m
//  PYMasonryLabel
//
//  Created by Apple on 16/8/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "MYTableViewCell.h"
#import "MYModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Masonry.h"
#import "RootViewController.h"
#import "FirstViewController.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initAllData];
    [self initAllView];
}
#pragma mark = 加载数据
- (void)initAllData {
    self.array = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        MYModel *model = [[MYModel alloc] init];
        model.text = @"在东方世界里，挑选小公牛到竞技场角斗有一定的程序。每一头被带进场地的公牛都要向手持长矛刺它的斗牛士发起进攻。其勇敢程度是根据它不顾矛刃的刺痛向斗牛士进攻的次数来认真评定的在东方世界里，挑选小公牛到竞技场角斗有一定的程序。";
        model.imageV = [NSString stringWithFormat:@"5.jpg"];
        model.titleLabel = @"标题";
        model.priceLabel = @"价格";
        model.label_1 = @"地点";
//        model.label_2 = @"时间";
        [_array addObject:model];
    }
}

#pragma mark = 加载视图
- (void)initAllView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.fd_debugLogEnabled = YES;//打开自适应高度debug模式
    [self.view addSubview:_tableView];
    [_tableView registerClass:[MYTableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark = tab代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MYTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    [self setupModelOfCell:cell AtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//不改变选择颜色
    //按钮
    UIButton *button = [ UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(CGRectGetMaxX(cell.contentView.frame) - 50, CGRectGetMaxY(cell.contentView.frame) - 50, 40, 40);
    [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(accessoryButtonTappedAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:button];
    
    return cell;
    
}
#pragma mark = 点击事件
- (void)accessoryButtonTappedAction:(UIButton *)button {
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self presentViewController:firstVC animated:YES completion:nil];
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(id cell) {
        [self setupModelOfCell:cell AtIndexPath:indexPath];
    }];
}

#warning 重点(自适应高度必须实现)
//预加载Cell内容
- (void)setupModelOfCell:(MYTableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath{
    cell.model = _array[indexPath.row];
}

#pragma mark = 页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RootViewController *rootVC = [[RootViewController alloc] init];
    [self presentModalViewController:rootVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
















@end
