//
//  ADCircularProgressBar.h
//  ADprogressBar
//
//  Created by andong on 16/3/21.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, EprogressType) {
    kCircular,  //圆型
    kPentagram, //五角星型
    kSicircle,  //半圆形
};

@interface ADCircularProgressBar : UIView

//lineWidth
@property (nonatomic, assign)CGFloat  lineWidth;
//startValue
@property (nonatomic, assign)CGFloat  startValue;
//endValue
@property (nonatomic, assign)CGFloat  endValue;
//lineColor
@property (nonatomic, strong)UIColor *lineColor;
//backGroundLineColor
@property (nonatomic, strong)UIColor *backGroundLineColor;

- (instancetype)initWithFrame:(CGRect)frame WithType:(EprogressType)type;
@end
