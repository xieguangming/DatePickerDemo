//
//  CustomMonthDatePicker.m
//  IntelligentRestaurant
//
//  Created by xgm on 17/5/5.
//  Copyright © 2017年 xiegm. All rights reserved.
//

#import "CustomMonthDatePicker.h"

@implementation CustomMonthDatePicker

{
    NSMutableArray *yeararr;  //年份
    UIPickerView *picker;
}
@synthesize year,month;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        picker = [[UIPickerView alloc] initWithFrame:self.bounds];
        
        picker.delegate  = self;
        picker.dataSource = self;
        picker.showsSelectionIndicator = YES;
        [self addSubview:picker];
        
        
        yeararr = [[NSMutableArray alloc] initWithCapacity:0];
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy"];
        //年份
        year = [[formatter stringFromDate:date] intValue];
        [formatter setDateFormat:@"MM"];
        //月份
        month = [[formatter stringFromDate:date] intValue];
        
        for (int i = year-30; i<year+30; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            NSLog(@"%@",str);
            [yeararr addObject:str];
        }
        [picker selectRow:30 inComponent:0 animated:YES];
        [picker selectRow:month-1 inComponent:1 animated:YES];
    }
    return self;
}
#pragma mark - pickerview
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if(component == 0)
    {
        return yeararr.count;
    }
    else if(component == 1){
        
        return 12;
    }
    return 10;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *mycom1 = [[UILabel alloc] init];
    mycom1.textAlignment = NSTextAlignmentCenter;
    mycom1.backgroundColor = [UIColor clearColor];
    mycom1.frame = CGRectMake(0, 0, self.frame.size.width/2.0, 50);
    [mycom1 setFont:[UIFont boldSystemFontOfSize:16]];
    if(component == 0)
    {
        
        mycom1.text = [NSString stringWithFormat:@"%@",[yeararr objectAtIndex:row]];
        
    }
    else if(component == 1){
        
        mycom1.text = [NSString stringWithFormat:@"%ld",row+1];
    }
    return mycom1;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    
    return self.frame.size.width/2.0;
}


//选中
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
        //当第一个滚轮发生变化时,刷新第二个滚轮的数据
        [picker reloadComponent:1];
        //让刷新后的第二个滚轮重新回到第一行
        [picker selectRow:0 inComponent:1 animated:YES];
    }
    int rowy = (int)[picker selectedRowInComponent:0];
    int rowm = (int)[picker selectedRowInComponent:1];
    year = [[yeararr objectAtIndex:rowy] intValue];
    month = (int)rowm+1;
}







@end
