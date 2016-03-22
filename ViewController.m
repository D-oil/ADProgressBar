//
//  ViewController.m
//  ADprogressBar
//
//  Created by andong on 16/3/21.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ViewController.h"
#import "ADCircularProgressBar.h"

@interface ViewController ()
//圆形进度条
@property (nonatomic, strong)ADCircularProgressBar *circularPro;
//五角星形
@property (nonatomic, strong)ADCircularProgressBar *pentagramPro;
//半圆形
@property (nonatomic, strong)ADCircularProgressBar *sicirclePro;

@property (weak, nonatomic) IBOutlet UISlider *progressSlider;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    self.circularPro          = [[ADCircularProgressBar alloc]initWithFrame:CGRectMake(0, 0, 100, 100) WithType:kCircular];
    self.circularPro.center   = CGPointMake(self.view.frame.size.width/3 - 20, self.view.frame.size.height/4);
    
    [self.view addSubview:self.circularPro];
    
    self.pentagramPro         = [[ADCircularProgressBar alloc]initWithFrame:CGRectMake(0, 0, 100, 100) WithType:kPentagram];
    self.pentagramPro.center  = CGPointMake(self.view.frame.size.width/3 * 2 +20, self.view.frame.size.height/4);
    
    [self.view addSubview:self.pentagramPro];
    
    self.sicirclePro         = [[ADCircularProgressBar alloc]initWithFrame:CGRectMake(0, 0, 100, 100) WithType:kSicircle];
    self.sicirclePro.center  = CGPointMake(self.view.frame.size.width/3 - 20, self.view.frame.size.height/4 *2);
    
    [self.view addSubview:self.sicirclePro];
    
    
    [self.progressSlider addTarget:self action:@selector(sliderChangeValue) forControlEvents:UIControlEventValueChanged];
    
    
    
}


-(void)sliderChangeValue
{
    self.circularPro.endValue = self.progressSlider.value;
    self.pentagramPro.endValue = self.progressSlider.value;
    self.sicirclePro.endValue = self.progressSlider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
