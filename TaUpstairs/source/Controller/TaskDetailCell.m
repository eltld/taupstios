//
//  TaskDetailCell.m
//  TaUpstairs
//
//  Created by mac on 14-4-17.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "TaskDetailCell.h"
#import "FriendlyTime.h"
#import "QBFlatButton.h"
#import "CUSFlashLabel.h"
#import "UIButton+Bootstrap.h"
@implementation TaskDetailCell


-(void) _initView{
    reward = [[CUSFlashLabel alloc]initWithFrame:CGRectMake(128, 126, 172, 21)];
    

    [reward setFont:[UIFont systemFontOfSize:15]];
    [reward setContentMode:UIViewContentModeTop];
    [reward startAnimating];
    [self addSubview:reward];
}

-(void) sign{
    NSLog(@"点击报名事件");
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _initView];
    
}

-(void)layoutSubviews{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString* boldFontName = @"Optima-ExtraBlack";
    UIFont *nameLabelFont = [UIFont fontWithName:boldFontName size:17.0f];
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    self.taskTitle.textColor =  mainColor;
    self.taskTitle.font = nameLabelFont;
    self.taskTitle.text = _task.taskTitle;
    
    self.taskContent.text = _task.taskContent;
    
    self.endTime.text = [FriendlyTime friendlyTime:_task.endOfTime];
    self.signCnt.text = [NSString stringWithFormat:@"%@",_task.signCnt];
    
    [reward setText:_task.taskRewards];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
