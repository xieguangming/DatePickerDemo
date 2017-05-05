//
//  JXAlertview.h
//  customalert
//
//  Created by jiangxiao on 14-7-8.
//  Copyright (c) 2014年 jiangxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomAlertDelegete <NSObject>

-(void)btnindex:(int)index :(int) tag;

@end
@interface JXAlertview : UIImageView
@property(nonatomic,retain)UILabel *title;    //标题
@property(nonatomic,retain)UILabel *message;  //消息
@property(nonatomic,retain)UIButton *cancelbtn;   //取消
@property(nonatomic,retain)UIButton *surebtn;     //确定
@property (nonatomic,retain) id<CustomAlertDelegete> delegate;

//初始化
-(void)initwithtitle:(NSString *)titleStr andcommitbtn:(NSString *)commit andStr:(NSString *)Str;

//显示
-(void)show;

//显示视图
-(void)showview;

//隐藏
//-(void)dismmis;

@end
