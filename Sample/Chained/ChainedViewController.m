//
//  ChainedViewController.m
//  Sample
//
//  Created by dch on 2018/7/16.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "ChainedViewController.h"
#import "Calculator.h"

@interface ChainedViewController ()

@end

@implementation ChainedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"链式语法";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 计算结果可能不对，只为演示链式语法
    Calculator *calculator = [[Calculator alloc] init];
    CGFloat result = calculator.addition(10).subtract(5).subtract(2).multiply(3).division(4).calculate;
    NSLog(@"%f", result);
}

- (void)dealloc
{
    NSLog(@"ChainedViewController dealloc ...");
}

@end
