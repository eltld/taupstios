//
//  MessageViewCell.h
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewModel.h"
@interface MessageViewCell : UITableViewCell

@property(strong,nonatomic) NewModel *model;

@property (weak, nonatomic) IBOutlet UIView *photobg;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
