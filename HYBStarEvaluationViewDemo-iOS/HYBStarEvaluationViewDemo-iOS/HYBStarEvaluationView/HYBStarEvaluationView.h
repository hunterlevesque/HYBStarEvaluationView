//
//  HYBStarEvaluationView.h
//  HYBStarEvaluationView
//
//  Created by heyuanbo on 16/4/8.
//  Copyright © 2016年 北京自造星球科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYBStarEvaluationView : UIView

@property (nonatomic, assign) BOOL isVariable; //星级展示是不是可操作的，默认为YES
@property (nonatomic, assign) CGFloat scorePercent; //评分的分数，取值范围0~1，默认为1

//这个函数中的参数numberOfStars是我们总共的星级数，scorePercent是评分分数，scorePercent的取值范围是0~1
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

@end
