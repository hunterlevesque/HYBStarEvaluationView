//
//  ViewController.m
//  HYBStarEvaluationViewDemo-iOS
//
//  Created by heyuanbo on 16/4/8.
//  Copyright © 2016年 北京自造星球科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "HYBStarEvaluationView.h"

@interface ViewController ()<DidChangedStarDelegate>

@end

@implementation ViewController
{
    HYBStarEvaluationView * starView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 100, 30)];
    label.text = @"默认不包含半星";
    label.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label];
    starView = [[HYBStarEvaluationView alloc]initWithFrame:CGRectMake(120, 80, 125, 30) numberOfStars:5 isVariable:YES];
    starView.actualScore = 1;
    starView.fullScore = 5;
    starView.delegate = self;
    [self.view addSubview:starView];
    
    
    UILabel * secondlabel = [[UILabel alloc]initWithFrame:CGRectMake(10,150, 100, 30)];
    secondlabel.text = @"包含半星";
    secondlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:secondlabel];
    HYBStarEvaluationView *starViewContrainHalf = [[HYBStarEvaluationView alloc]initWithFrame:CGRectMake(120, 150, 125, 30) numberOfStars:5 isVariable:YES];
    starViewContrainHalf.actualScore = 1;
    starViewContrainHalf.fullScore = 5;
    starViewContrainHalf.isContrainsHalfStar = YES;
    [self.view addSubview:starViewContrainHalf];
    
    
    UILabel * thirdlabel = [[UILabel alloc]initWithFrame:CGRectMake(10,220, 100, 30)];
    thirdlabel.text = @"只展示，不可点击";
    thirdlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:thirdlabel];
    HYBStarEvaluationView *starViewUnClick = [[HYBStarEvaluationView alloc]initWithFrame:CGRectMake(120, 220, 125, 30) numberOfStars:5 isVariable:NO];
    starViewUnClick.actualScore = 1;
    starViewUnClick.fullScore = 5;
    starViewUnClick.isContrainsHalfStar = YES;
    [self.view addSubview:starViewUnClick];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"这次星级为 %f",starView.actualScore);
}

- (void)didChangeStar {
    NSLog(@"这次星级为 %f",starView.actualScore);
}

@end
