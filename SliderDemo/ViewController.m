//
//  ViewController.m
//  SliderDemo
//
//  Created by Cloudox on 16/3/24.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//设备的宽高
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height

@property (nonatomic, strong) UILabel *valueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 滑动条slider
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((SCREENWIDTH - 250) / 2, 200, 250, 20)];
    slider.minimumValue = 9;// 设置最小值
    slider.maximumValue = 11;// 设置最大值
    slider.value = (slider.minimumValue + slider.maximumValue) / 2;// 设置初始值
    slider.continuous = YES;// 设置可连续变化
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值变化添加响应方法
    [self.view addSubview:slider];
    
    // 当前值label
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH - 100) / 2, slider.frame.origin.y + 30, 100, 20)];
    self.valueLabel.textAlignment = NSTextAlignmentCenter;
    self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];
    [self.view addSubview:self.valueLabel];
    
    // 最小值label
    UILabel *minLabel = [[UILabel alloc] initWithFrame:CGRectMake(slider.frame.origin.x - 35, slider.frame.origin.y, 30, 20)];
    minLabel.textAlignment = NSTextAlignmentRight;
    minLabel.text = [NSString stringWithFormat:@"%.1f", slider.minimumValue];
    [self.view addSubview:minLabel];
    
    // 最大值label
    UILabel *maxLabel = [[UILabel alloc] initWithFrame:CGRectMake(slider.frame.origin.x + slider.frame.size.width + 5, slider.frame.origin.y, 30, 20)];
    maxLabel.textAlignment = NSTextAlignmentLeft;
    maxLabel.text = [NSString stringWithFormat:@"%.1f", slider.maximumValue];
    [self.view addSubview:maxLabel];
}

// slider变动时改变label值
- (void)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
