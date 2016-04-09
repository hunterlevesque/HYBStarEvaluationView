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

- (void)viewDidLoad {
    [super viewDidLoad];
    HYBStarEvaluationView * starView = [[HYBStarEvaluationView alloc]initWithFrame:CGRectMake(10, 80, 125, 30) numberOfStars:5 isVariable:YES];
    starView.actualScore = 0.2; 
    starView.fullScore = 1;
    [self.view addSubview:starView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
