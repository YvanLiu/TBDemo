//
//  longTouchView.h
//  TBDemo
//
//  Created by 柳玉峰 on 2017/4/6.
//  Copyright © 2017年 柳玉峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LongTouchView : UIView
@property (strong, nonatomic) UIImageView *iconIMV;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIButton *closeButton;
@property (strong, nonatomic) UIView *bgView;


+ (instancetype)sharManager;
- (void)show;
@end
