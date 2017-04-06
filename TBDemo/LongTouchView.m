//
//  longTouchView.m
//  TBDemo
//
//  Created by 柳玉峰 on 2017/4/6.
//  Copyright © 2017年 柳玉峰. All rights reserved.
//

#import "LongTouchView.h"

@implementation LongTouchView
static LongTouchView *touchView=nil;

- (void)drawRect:(CGRect)rect {
}

+ (instancetype)sharManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        touchView = [[self alloc]init];
    });
    return touchView;
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        
        self.bgView = [UIView new];
        self.bgView.backgroundColor = WHITE_COLOR;
        self.bgView.layer.masksToBounds = YES;
        self.bgView.layer.cornerRadius = 6;
        [self addSubview:self.bgView];

        self.iconIMV = [UIImageView new];
        [self.bgView addSubview:self.iconIMV];
        self.iconIMV.contentMode = UIViewContentModeScaleAspectFill;
        self.iconIMV.layer.masksToBounds = YES;
        
        self.nameLabel = [UILabel new];
        self.nameLabel.textColor = BLACK_COLOR;
        self.nameLabel.font = [UIFont systemFontOfSize:20.0f];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.bgView addSubview:self.nameLabel];
        
        self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeButton.backgroundColor = CLEAR_COLOR;
        [self.closeButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.closeButton];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo((SCREEN_HEIGHT/4)*3);
            make.centerY.equalTo(self);
        }];
        [self.iconIMV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-70);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIMV.mas_bottom);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.equalTo(self.bgView.mas_bottom);
        }];
        [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_bottom).with.offset(20);
            make.width.mas_equalTo(44);
            make.width.mas_equalTo(44);
            make.centerX.equalTo(self.mas_centerX);
        }];
        self.hidden = YES;
    }
    return self;
}

- (void)show {
    self.hidden = NO;
}

- (void)close {
    self.hidden = YES;
}

@end
