//
//  MYTableViewCell.m
//  PYMasonryLabel
//
//  Created by Apple on 16/8/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MYTableViewCell.h"
#import "Masonry.h"
@implementation MYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //视图
        [self createSubViews];
    }
    return self;
}

#pragma mark = 创建视图
- (void)createSubViews {
    //头像
    _myImageView = [[UIImageView alloc] init];
    _myImageView.layer.cornerRadius=20;//宽度的一半
    _myImageView.layer.masksToBounds=YES;
    _myImageView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_myImageView];
    
    //标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    
    //价格
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_priceLabel];
    
    //自适应label
    _label = [[UILabel alloc] init];
    _label.backgroundColor = [UIColor orangeColor];
    _label.numberOfLines = 0;
    [self.contentView addSubview:_label];

    //地点
    _label_1 = [[UILabel alloc] init];
    _label_1.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_label_1];
    
    //button
//    _button = [[UIButton alloc] init];
//    [_button setImage:[UIImage imageNamed:@"1"] forState:(UIControlStateNormal)];
//    [_button setImage:[UIImage imageNamed:@"2"] forState:(UIControlStateNormal)];
//    [_button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
//    [_button setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 0, 0))];
//    [self.contentView addSubview:_button];
    
    
    [_myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.myImageView.mas_right).offset(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.myImageView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.label_1.mas_top).offset(-10);
    }];

    [_label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
//    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.contentView).offset(-10);
//        make.bottom.equalTo(self.contentView).offset(-10);
//        make.width.mas_equalTo(40);
//        make.height.mas_equalTo(40);
//
//    }];
}
#pragma mark = button点击事件
- (void)buttonAction{
    NSLog(@"11");
    self.button.selected = !self.button.selected;
    if (self.button.selected) {
        [self.button setImage:[UIImage imageNamed:@"1"] forState:(UIControlStateNormal)];

    } else {
        [self.button setImage:[UIImage imageNamed:@"2"] forState:(UIControlStateNormal)];

    }
    
}
#pragma mark = 赋值
- (void)setModel:(MYModel *)model {
    if (_model != model) {
        _model = model;
        _label.text = [NSString stringWithFormat:@"%@", model.text];
        _myImageView.image = [UIImage imageNamed:model.imageV];
        _titleLabel.text = [NSString stringWithFormat:@"%@", model.titleLabel];
        _priceLabel.text = [NSString stringWithFormat:@"%@", model.priceLabel];
        _label_1.text = [NSString stringWithFormat:@"%@", model.label_1];
    }
}






















@end
