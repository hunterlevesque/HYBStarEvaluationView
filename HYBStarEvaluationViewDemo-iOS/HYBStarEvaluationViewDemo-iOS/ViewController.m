//
//  ViewController.m
//  HYBStarEvaluationViewDemo-iOS
//
//  Created by heyuanbo on 16/4/8.
//  Copyright © 2016年 北京自造星球科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "HYBStarEvaluationView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    HYBStarEvaluationView * starView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    starView = [[HYBStarEvaluationView alloc]initWithFrame:CGRectMake(10, 80, 125, 30) numberOfStars:5];
    starView.scorePercent = 0;
    starView.isVariable = YES;
    [self.view addSubview:starView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%f",starView.scorePercent);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
