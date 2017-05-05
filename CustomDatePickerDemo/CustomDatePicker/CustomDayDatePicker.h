//
//  CustomDayDatePicker.h
//  IntelligentRestaurant
//
//  Created by xgm on 17/5/5.
//  Copyright © 2017年 xiegm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomDayDatePicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, assign)int year;  //年
@property (nonatomic, assign)int month; //月
@property (nonatomic, assign)int day;   //日

@end
