//
//  JXAlertview.m
//  customalert
//
//  Created by jiangxiao on 14-7-8.
//  Copyright (c) 2014年 jiangxiao. All rights reserved.
//

#import "JXAlertview.h"

@implementation JXAlertview
{
    UIView *view;
    int tag;
}
@synthesize title,message,cancelbtn,surebtn;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)initwithtitle:(NSString *)titleStr andcommitbtn:(NSString *)commit andStr:(NSString *)str
{
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = YES;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth =  1;
    self.layer.cornerRadius = 5;
    [self.layer setMasksToBounds:YES];
    
    
    //1. 标题
    title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    title.backgroundColor = [UIColor colorWithRed:45/255. green:54/255. blue:62/255. alpha:1];;
    title.text = titleStr;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor whiteColor];
    [self addSubview:title];
    
    //3.确定
    surebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [surebtn addTarget:self action:@selector(selectbtn:) forControlEvents:UIControlEventTouchUpInside];
    [surebtn setTitle:commit forState:0];
    surebtn.tag = 2;
    [cancelbtn setBackgroundColor:[UIColor lightGrayColor]];
    [surebtn setBackgroundColor:[UIColor colorWithRed: 228/255. green:0/255. blue:127/255. alpha:1]];
    
    if ([str isEqualToString:@"1"]) {
      surebtn.frame = CGRectMake(self.frame.size.width/2-(self.frame.size.width/2)/2.0, self.frame.size.height-45, self.frame.size.width/2, 35);
    }else{
    surebtn.frame = CGRectMake(self.frame.size.width/2-(self.frame.size.width/2-20)/2.0, self.frame.size.height-45, self.frame.size.width/2-20, 35);
    }
        surebtn.layer.borderColor = [UIColor clearColor].CGColor;
        surebtn.layer.borderWidth =  1;
        surebtn.layer.cornerRadius = 5;
        [surebtn.layer setMasksToBounds:YES];
        [self addSubview:surebtn];
}

//点击
-(void)selectbtn:(id)sender
{
    [self dismmis];
    UIButton *btn = (UIButton *)sender;
    [self.delegate btnindex:(int)btn.tag :(int)self.tag];
}

//出现
-(void)show
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    view = [[UIView alloc] initWithFrame:keyWindow.bounds];
    view.alpha = 0.3;
    view.backgroundColor = [UIColor blackColor];
    [keyWindow addSubview:view];
    
    self.alpha = 1;
    [keyWindow addSubview:self];
    [keyWindow bringSubviewToFront:self];
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animation];
    bounceAnimation.duration = 0.3;
    bounceAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    bounceAnimation.values = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0.01],
                              [NSNumber numberWithFloat:1.1],
                              [NSNumber numberWithFloat:0.9],
                              [NSNumber numberWithFloat:1.0],
                              nil];
    
    [self.layer addAnimation:bounceAnimation forKey:@"transform.scale"];
    
    CABasicAnimation *fadeInAnimation = [CABasicAnimation animation];
    fadeInAnimation.duration = 0.3;
    fadeInAnimation.fromValue = [NSNumber numberWithFloat:0];
    fadeInAnimation.toValue = [NSNumber numberWithFloat:1];
    [self.superview.layer addAnimation:fadeInAnimation forKey:@"opacity"];
}
//出现
-(void)showview
{
    tag = 5;
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    view = [[UIView alloc] initWithFrame:keyWindow.bounds];
    view.alpha = 0.3;
    view.backgroundColor = [UIColor blackColor];
    [keyWindow addSubview:view];
    
    self.alpha = 1;
    [keyWindow addSubview:self];
    [keyWindow bringSubviewToFront:self];
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromBottom;
    [self.layer addAnimation:animation forKey:@"animation"];
    
    CABasicAnimation *fadeInAnimation = [CABasicAnimation animation];
    fadeInAnimation.duration = 0.3;
    fadeInAnimation.fromValue = [NSNumber numberWithFloat:0];
    fadeInAnimation.toValue = [NSNumber numberWithFloat:1];
    [self.superview.layer addAnimation:fadeInAnimation forKey:@"opacity"];
}


//消失
-(void)dismmis
{
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         self.transform = CGAffineTransformConcat(self.transform, CGAffineTransformMakeScale(0.01, 0.01));
         view.alpha = 0;
     }
                     completion:^(BOOL finished)
     {
         [view removeFromSuperview];
         [self removeFromSuperview];
         
     }];
}


@end
