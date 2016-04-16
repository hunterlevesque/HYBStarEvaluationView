//
//  HYBStarEvaluationView.m
//  HYBStarEvaluationView
//
//  Created by heyuanbo on 16/4/8.
//  Copyright © 2016年 北京自造星球科技有限公司. All rights reserved.
//

#import "HYBStarEvaluationView.h"

#define DEFAULT_STAR_NUMBER 5
#define DEFAULT_SCORE_PERCENT 1
#define STAR_GRAY @"star_gray.png"
#define STAR_YELLOW @"star_yellow.png"

@interface HYBStarEvaluationView()

@property (nonatomic, strong) UIView * frontView;
@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, assign) NSInteger numberOfStars;
@property (nonatomic, assign) BOOL isVariable; //星级展示是不是可操作的，默认为YES

@end

@implementation HYBStarEvaluationView

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars isVariable:(BOOL)isVariable {
    if (self = [super initWithFrame:frame]) {
        self.numberOfStars = numberOfStars;
        [self loadView];
        if (isVariable == YES) {
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
            [self addGestureRecognizer:tap];
        }
    }
    return self;
}

- (void)setActualScore:(CGFloat)actualScore {
    if (_actualScore == actualScore) {
        return;
    }
    _actualScore = actualScore;
    [self setNeedsLayout];
}

- (void)loadView {
    self.fullScore = 1;
    self.actualScore = 1;
    self.backgroundView = [self createStarViewWithImage:STAR_GRAY];
    self.frontView = [self createStarViewWithImage:STAR_YELLOW];
    [self addSubview:self.backgroundView];
    [self addSubview:self.frontView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.actualScore > self.fullScore) {
        _actualScore = self.fullScore;
    } else if (self.actualScore < 0) {
        _actualScore = 0;
    } else {
        _actualScore = self.actualScore;
    }
    CGFloat scorePercent = self.actualScore/self.fullScore;
    if (self.isContrainsHalfStar != YES) {
        scorePercent = [self changeToCompleteStar:scorePercent];
    }
    self.frontView.frame = CGRectMake(0, 0, self.bounds.size.width * scorePercent, self.bounds.size.height);
}

- (void)tapClick:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:self];
    CGFloat offset = point.x;
    CGFloat offsetPercent = offset/self.bounds.size.width;
    if (self.isContrainsHalfStar != YES) {
        offsetPercent = [self changeToCompleteStar:offsetPercent];
    }
    self.actualScore = offsetPercent * self.fullScore;
    NSLog(@"%f",self.actualScore);
    [self.delegate didChangeStar];
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView * view = [[UIView alloc]initWithFrame:self.bounds];
    view.backgroundColor = [UIColor clearColor];
    view.clipsToBounds = YES;
    for (NSInteger i = 0; i < self.numberOfStars; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width/self.numberOfStars, 0, self.bounds.size.width/self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (CGFloat)changeToCompleteStar:(CGFloat)percent {
    if (percent <= 0.2) {
        percent = 0.2;
    } else if (percent > 0.2 && percent <= 0.4) {
        percent = 0.4;
    } else if (percent > 0.4 && percent <= 0.6) {
        percent = 0.6;
    } else if (percent > 0.6 && percent <= 0.8) {
        percent = 0.8;
    } else {
        percent = 1.0;
    }
    return percent;
}

@end
