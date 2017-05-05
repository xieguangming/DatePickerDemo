//
//  ViewController.m
//  CustomDatePickerDemo
//
//  Created by xgm on 17/5/5.
//  Copyright © 2017年 www.auratech.hk. All rights reserved.
//

#import "ViewController.h"

#import "JXAlertview.h"   //第三方"年-月"日期选择器

#import "CustomDayDatePicker.h"    //'年-月-日'选择器
#import "CustomMonthDatePicker.h"  //'年-月'选择器
#import "CustomYearDatePicker.h"   //年选择器

#define WIDTH   [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<CustomAlertDelegete>
{
    CustomDayDatePicker *dayDpicker;     //'年-月-日'选择器
    CustomMonthDatePicker *monthDpicker;  //'年-月'日期选择器
    CustomYearDatePicker *yearDpicker;   //年选择器
    
    NSInteger _mark;         //标记类型
    NSString   *_selectDate; //标记选中的日期
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dayDpicker = [[CustomDayDatePicker alloc] initWithFrame:CGRectMake(0, 20, WIDTH-60, 140)];
    monthDpicker = [[CustomMonthDatePicker alloc] initWithFrame:CGRectMake(0, 20, WIDTH-100, 140)];
    yearDpicker = [[CustomYearDatePicker alloc]initWithFrame:CGRectMake(0, 20, WIDTH/2.0-30, 140)];
    
    
    
}

#pragma mark - '年月日'选择器
- (IBAction)YearMonthDay_Btn:(UIButton *)sender {
    
    JXAlertview *alert1 = [[JXAlertview alloc] initWithFrame:CGRectMake(10, 0, WIDTH-60, 200)];
    alert1.center = self.view.center;
    alert1.delegate = self;
    [alert1 initwithtitle:@"select the date" andcommitbtn:@"commit" andStr:@"0"];
    
    //我把Dpicker添加到一个弹出框上展现出来 当然大家还是可以以任何其他动画形式展现
    [alert1 addSubview:dayDpicker];
    [alert1 show];
    _mark = 1;
    
    
}

#pragma mark - '年月'选择器
- (IBAction)YearMonth_Btn:(UIButton *)sender {
    
    JXAlertview *alert2 = [[JXAlertview alloc] initWithFrame:CGRectMake(10, 0, WIDTH-100, 200)];
    alert2.center = self.view.center;
    alert2.delegate = self;
    [alert2 initwithtitle:@"select the date" andcommitbtn:@"commit" andStr:@"0"];
    
    //我把Dpicker添加到一个弹出框上展现出来 当然大家还是可以以任何其他动画形式展现
    [alert2 addSubview:monthDpicker];
    [alert2 show];
    _mark = 2;
    
    
}
#pragma mark - '年'选择器
- (IBAction)Year_Btn:(UIButton *)sender {
    
    JXAlertview *alert3 = [[JXAlertview alloc] initWithFrame:CGRectMake(10, 0, WIDTH/2.0-30, 200)];
    alert3.center = self.view.center;
    alert3.delegate = self;
    [alert3 initwithtitle:@"date" andcommitbtn:@"commit" andStr:@"1"];
    
    //我把Dpicker添加到一个弹出框上展现出来 当然大家还是可以以任何其他动画形式展现
    [alert3 addSubview:yearDpicker];
    [alert3 show];
    _mark = 3;
}


#pragma mark - CustomAlertDelegete
-(void)btnindex:(int)index :(int)tag
{
    if (index == 2 ) {
        if (_mark == 1) {
            _selectDate = [NSString stringWithFormat:@"%d-%02d-%02d",dayDpicker.year,dayDpicker.month,dayDpicker.day];
        }else if (_mark == 2){
            _selectDate = [NSString stringWithFormat:@"%d-%02d",monthDpicker.year,monthDpicker.month];
        }else{
            _selectDate = [NSString stringWithFormat:@"%d",yearDpicker.year];
        }
        
        UIButton *btn = (UIButton *)[self.view viewWithTag:100+_mark];
            [btn setTitle:_selectDate forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
