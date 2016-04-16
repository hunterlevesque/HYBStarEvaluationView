//
//  HYBStarEvaluationView.h
//  HYBStarEvaluationView
//
//  Created by heyuanbo on 16/4/8.
//  Copyright © 2016年 北京自造星球科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DidChangedStarDelegate <NSObject>

- (void)didChangeStar;

@end

@interface HYBStarEvaluationView : UIView

@property (nonatomic, assign) CGFloat fullScore; //评分的满分值，默认为1
@property (nonatomic, assign) CGFloat actualScore; //评分的实际分数，默认为1
@property (nonatomic, assign) BOOL isContrainsHalfStar; //是否包含半颗星，默认为NO
@property (nonatomic, weak) id<DidChangedStarDelegate> delegate;

//下面这个函数中的参数numberOfStars是我们总共的星级数,满分是几颗星，isVariable代表是否可以修改星级
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars isVariable:(BOOL)isVariable;

@end
