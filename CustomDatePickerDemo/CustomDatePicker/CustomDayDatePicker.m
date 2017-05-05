//
//  CustomDayDatePicker.m
//  IntelligentRestaurant
//
//  Created by xgm on 17/5/5.
//  Copyright © 2017年 xiegm. All rights reserved.
//

#import "CustomDayDatePicker.h"

@implementation CustomDayDatePicker
{
    //数据源
    NSArray *dayarr1;
    NSArray *dayarr2;
    NSMutableArray *yeararr;
    
    UIPickerView *picker;
}

@synthesize year,month,day;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        picker = [[UIPickerView alloc] initWithFrame:self.bounds];
        picker.delegate = self;
        picker.dataSource = self;
        picker.showsSelectionIndicator = YES;
        [self addSubview:picker];
        
        dayarr1 = [NSArray arrayWithObjects:@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31", nil];
        dayarr2 = [NSArray arrayWithObjects:@"31",@"29",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31", nil];
        
        yeararr = [[NSMutableArray alloc] initWithCapacity:0];
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        //年
        [formatter setDateFormat:@"yyyy"];
        year = [[formatter stringFromDate:date] intValue];
        
        //月
        [formatter setDateFormat:@"MM"];
        month = [[formatter stringFromDate:date] intValue];
        
        //日
        [formatter setDateFormat:@"dd"];
        day = [[formatter stringFromDate:date] intValue];
        
        for (int i = year-30; i<year+30; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [yeararr addObject:str];
        }
        [picker selectRow:30 inComponent:0 animated:YES];
        [picker selectRow:month-1 inComponent:1 animated:YES];
        [picker selectRow:day-1 inComponent:2 animated:YES];
    }
    return self;
}

#pragma mark - PickerView Datadelegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return yeararr.count;
    }else if (component == 1){
        return 12;
    }else{
        //获取前二个滚轮的当前所选行的索引
        int row = (int)[picker selectedRowInComponent:0];
        int nowyear = [[yeararr objectAtIndex:row] intValue];
        int nowmonth = (int)[picker selectedRowInComponent:1];
        if ((nowyear % 4 == 0 && nowyear % 100 !=0 )||(nowyear % 400 == 0)) {
            return [[dayarr2 objectAtIndex:nowmonth] intValue];
        }
        else
        {
            return [[dayarr1 objectAtIndex:nowmonth] intValue];
        }
    }
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *mycom1 = [[UILabel alloc] init];
    mycom1.textAlignment = NSTextAlignmentCenter;
    mycom1.backgroundColor = [UIColor clearColor];
    mycom1.frame = CGRectMake(0, 0, self.frame.size.width/3.0, 50);
    [mycom1 setFont:[UIFont boldSystemFontOfSize:16]];
    if (component == 0) {
        mycom1.text = [NSString stringWithFormat:@"%@",[yeararr objectAtIndex:row]];
        
    }else if (component == 1){
        mycom1.text = [NSString stringWithFormat:@"%ld",row+1];
    }else{
        mycom1.text = [NSString stringWithFormat:@"%ld",row+1];
    }
    return mycom1;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return self.frame.size.width/3.0;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0 || component == 1)
    {
        //当第一个滚轮发生变化时,刷新第二个滚轮的数据
        [picker reloadComponent:2];
        //让刷新后的第二个滚轮重新回到第一行
        [picker selectRow:0 inComponent:2 animated:YES];
    }
    int rowy = (int)[picker selectedRowInComponent:0];
    int rowm = (int)[picker selectedRowInComponent:1];
    int rowd = (int)[picker selectedRowInComponent:2];
    
    year = [[yeararr objectAtIndex:rowy] intValue];
    month = (int)rowm+1;
    day = (int)rowd+1;
    
    
    
    
}




















@end
