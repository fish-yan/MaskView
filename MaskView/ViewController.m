//
//  ViewController.m
//  MaskView
//
//  Created by 薛焱 on 16/2/19.
//  Copyright © 2016年 薛焱. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self image];
    [self label];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)image{
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
    imageView1.image = [UIImage imageNamed:@"123"];
    [self.view addSubview:imageView1];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 240, 200, 200)];
    imageView.image = [UIImage imageNamed:@"123"];
    [self.view addSubview:imageView];
    
    CAGradientLayer *mask = [[CAGradientLayer alloc]init];
    mask.frame = imageView.layer.bounds;
    mask.colors = @[(__bridge id)[UIColor clearColor].CGColor, (__bridge id)[UIColor blackColor].CGColor, (__bridge id)[UIColor clearColor].CGColor];
    mask.locations = @[@(0.0), @(0.5), @(1.0)];
    mask.startPoint = CGPointMake(0, 0);
    mask.endPoint = CGPointMake(1, 1);
    //    [self.view.layer addSublayer:mask];
    UIView *maskView = [[UIView alloc]initWithFrame:imageView.bounds];
    [maskView.layer addSublayer:mask];
    imageView.maskView = maskView;
    
    
    CGRect frame = maskView.frame;
    frame.origin.x -= 200;
    maskView.frame = frame;
    [UIView animateWithDuration:3 animations:^{
        CGRect frame = maskView.frame;
        frame.origin.x += 400;
        maskView.frame = frame;
    }];
}


- (void)label{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 460, 400, 200)];
    label.text = @"测试测试测试测试测试测试";
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:40];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor blackColor];
    CAGradientLayer *mask = [[CAGradientLayer alloc]init];
    mask.frame = label.layer.bounds;
    mask.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor blackColor].CGColor, (__bridge id)[UIColor clearColor].CGColor, (__bridge id)[UIColor blackColor].CGColor,(__bridge id)[UIColor clearColor].CGColor,];
    mask.locations = @[@(0.01), @(0.2),@(0.8), @(0.99)];
    mask.startPoint = CGPointMake(0, 0);
    mask.endPoint = CGPointMake(1, 0);
    //    [self.view.layer addSublayer:mask];
    UIView *maskView = [[UIView alloc]initWithFrame:label.bounds];
    [maskView.layer addSublayer:mask];
    label.maskView = maskView;
    self.view.backgroundColor = [UIColor blackColor];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = @-100;
    animation.toValue = @500;
    animation.duration = 2;
    animation.repeatCount = INT32_MAX;
    [maskView.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
