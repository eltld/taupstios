//
//  MesCell.m
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "MesCell.h"
#import "FriendlyTime.h"
#import "ChildMes.h"
@implementation MesCell

-(void)_initView{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _initView];
}


-(void)layoutSubviews{
    [super layoutSubviews];

    [self.photo setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://bcs.duapp.com/taupst/photo/%@",self.mes.photo]]];
    self.nickname.text = self.mes.username;
    UILabel *test = self.time;
    UILabel * label;
    self.time.text = [FriendlyTime friendlyTime:self.mes.message_time];
        for (ChildMes *keyValues in self.mes.content) {
            label = [[UILabel alloc] initWithFrame:CGRectMake(74, test.frame.origin.y+test.frame.size.height+10, 434, 20)];
            label.text = keyValues.message_content;
            [self addSubview:label];
            test = label;
        }
    
    
    self.content.text = ((ChildMes *)(self.mes.content[0])).message_content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
