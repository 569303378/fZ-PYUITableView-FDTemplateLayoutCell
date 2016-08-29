//
//  MYTableViewCell.h
//  PYMasonryLabel
//
//  Created by Apple on 16/8/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYModel.h"
@interface MYTableViewCell : UITableViewCell
@property (nonatomic,strong)MYModel *model;
@property (nonatomic, strong)UILabel *label;
@property (nonatomic,strong)UIImageView *myImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *label_1;
@property (nonatomic, strong)UIButton *button;
@end
