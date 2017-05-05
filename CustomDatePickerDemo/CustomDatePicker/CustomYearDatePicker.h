//
//  CustomYearDatePicker.h
//  IntelligentRestaurant
//
//  Created by xgm on 17/5/5.
//  Copyright © 2017年 xiegm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomYearDatePicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic)int year;
@property(nonatomic)int month;
@end
