# HYBStarEvaluationViewDemo
a simple tool of star evaluation  一个简单的星级评价的工具

0.5 使用方法举例：

    HYBStarEvaluationView * starView = [[HYBStarEvaluationView alloc]initWithFrame:CGRectMake(10, 80, 125, 30) numberOfStars:5 isVariable:YES];
    
    starView.actualScore = 0.2; //也可不写此行代码。默认为1
    
    starView.fullScore = 1; //也可不写此行代码，默认为1

    starView.isContrainsHalfStar = YES;//是否包含半颗星，默认为NO
    
    [self.view addSubview:starView];


![image](https://github.com/Hunter-HYB/HYBStarEvaluationView/blob/master/star.gif) 
