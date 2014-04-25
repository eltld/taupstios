//
//  MessageViewCell.m
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "MessageViewCell.h"
#import "FriendlyTime.h"
@implementation MessageViewCell

-(void) _initView {
    
    
    self.photobg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.photobg.layer.cornerRadius = 30;
    self.photobg.layer.borderWidth = 0.5;
    self.photobg.layer.masksToBounds = YES;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _initView];
}

-(void)layoutSubviews{
    [self.photo setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://bcs.duapp.com/taupst/photo/%@",self.model.photo]]];
    self.nickname.text = self.model.username;
    self.content.text = self.model.content;
    self.time.text = [FriendlyTime friendlyTime:self.model.time];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
