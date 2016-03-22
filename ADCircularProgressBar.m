//
//  ADCircularProgressBar.m
//  ADprogressBar
//
//  Created by andong on 16/3/21.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADCircularProgressBar.h"

#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


@interface ADCircularProgressBar ()
//进度Layer
@property (nonatomic, strong) CAShapeLayer * progerssLayer;
//背景Layer
@property (nonatomic, strong) CAShapeLayer * backGroundLayer;
//进度
@property (nonatomic, strong) UILabel      * progerssLabel;
//赛贝尔曲线
@property (nonatomic, strong) UIBezierPath * bezierPath;
//进度条类型
@property (nonatomic, assign) EprogressType  type;

@end

@implementation ADCircularProgressBar

- (instancetype)initWithFrame:(CGRect)frame WithType:(EprogressType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    //背景Layer
    [self.layer addSublayer:self.backGroundLayer];
    //进度条Layer
    [self.layer addSublayer:self.progerssLayer];
    //添加progerssLabel
    [self addSubview:self.progerssLabel];
    
}
#pragma mark - ShapeLayer

- (UIBezierPath *)bezierPath
{
    if (_bezierPath == nil)
    {
        switch (self.type) {
            case kCircular:
                _bezierPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
                break;
            case kPentagram:
                _bezierPath = [[UIBezierPath alloc]init];
                [_bezierPath moveToPoint   :CGPointMake(50.0, 2.0)];
                [_bezierPath addLineToPoint:CGPointMake(84.0, 86.0)];
                [_bezierPath addLineToPoint:CGPointMake(6.0, 33.0)];
                [_bezierPath addLineToPoint:CGPointMake(96.0, 33.0)];
                [_bezierPath addLineToPoint:CGPointMake(17.0, 86.0)];
                [_bezierPath closePath];

                break;
            case kSicircle:
                _bezierPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.bounds.size.width/2 startAngle:M_PI endAngle:0.f clockwise:YES];
                break;
            default:
                break;
        }
        
    }
    return _bezierPath;
}



//背景ShapeLayer
- (CAShapeLayer *)backGroundLayer
{
    if (_backGroundLayer == nil) {
        _backGroundLayer = [CAShapeLayer layer];
        self.backGroundLayer.frame = self.frame;
        //default
        _backGroundLayer.lineWidth   = 1;
        _backGroundLayer.fillColor   = [UIColor clearColor].CGColor;
        _backGroundLayer.strokeColor = UIColorFromRGBWithAlpha(0x575163, 0.9).CGColor;
        _backGroundLayer.strokeStart = 0.f;
        _backGroundLayer.strokeEnd   = 1.f;
        //bezierPath
        _backGroundLayer.path = self.bezierPath.CGPath;
    }
    return _backGroundLayer;
}

//进度条ShapeLayer
- (CAShapeLayer *)progerssLayer
{
    if (_progerssLayer == nil) {
        _progerssLayer = [CAShapeLayer layer];
        _progerssLayer.frame = self.frame;
        //default
        _progerssLayer.lineWidth   = 1;
        _progerssLayer.fillColor   = [UIColor clearColor].CGColor;
        _progerssLayer.strokeColor = UIColorFromRGBWithAlpha(0x7F9B9C, 1).CGColor;
        _progerssLayer.strokeStart = 0.f;
        _progerssLayer.strokeEnd   = 0.f;
        //bezierPath
        _progerssLayer.path = self.bezierPath.CGPath;
    }
    return _progerssLayer;
}


#pragma mark - property set and get
- (void)setEndValue:(CGFloat)endValue
{
    self.progerssLayer.strokeEnd = endValue;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    self.progerssLayer.lineWidth = lineWidth;
    self.backGroundLayer.lineWidth = lineWidth;
}

- (void)setLineColor:(UIColor *)lineColor
{
    self.progerssLayer.strokeColor = lineColor.CGColor;
}
- (void)setBackGroundLineColor:(UIColor *)backGroundLineColor
{
    self.backGroundLayer.strokeColor = backGroundLineColor.CGColor;
}
@end
