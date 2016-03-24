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
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((SCREENWIDTH - 300) / 2, 200, 300, 0)];
    slider.minimumValue = 9;
    slider.maximumValue = 11;
    [slider setValue:10 animated:YES];
    slider.continuous = YES;
    slider.userInteractionEnabled = YES;
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH - 100) / 2, slider.frame.origin.y + 30, 100, 20)];
    self.valueLabel.textAlignment = NSTextAlignmentCenter;
    self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];
    [self.view addSubview:self.valueLabel];
}

- (void)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
