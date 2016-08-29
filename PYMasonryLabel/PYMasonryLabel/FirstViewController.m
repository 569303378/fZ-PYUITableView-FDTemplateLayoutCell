//
//  FirstViewController.m
//  PYMasonryLabel
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"button返回" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(button) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}
- (void)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
