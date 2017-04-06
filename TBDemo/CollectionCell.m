//
//  CollectionCell.m
//  TBDemo
//
//  Created by 柳玉峰 on 2017/4/6.
//  Copyright © 2017年 柳玉峰. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.iconIMV = [UIImageView new];
        [self.contentView addSubview:self.iconIMV];
        UIView *view = [UIView new];
        view.backgroundColor = WHITE_COLOR;
        [self.contentView addSubview:view];
        self.nameLbl = [UILabel new];
        [self.contentView addSubview:self.nameLbl];
        self.nameLbl.backgroundColor = WHITE_COLOR;
        self.nameLbl.font = [UIFont systemFontOfSize:15];
        self.nameLbl.textAlignment = NSTextAlignmentLeft;
        self.nameLbl.textColor = BLACK_COLOR;
        
        
        [self.iconIMV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(-50);
        }];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIMV.mas_left);
            make.right.equalTo(self.iconIMV.mas_right);
            make.top.equalTo(self.iconIMV.mas_bottom);
            make.bottom.mas_offset(-10);
        }];
        [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.equalTo(self.iconIMV.mas_bottom).with.mas_offset(5);
            make.height.mas_equalTo(15);
        }];
    }

       return self;
}



@end
