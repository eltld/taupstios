//
//  MissionCell.h
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-22.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MissinModel.h"

@interface MissionCell : UITableViewCell

@property (strong,nonatomic) MissinModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskReleaseTime;
@property (weak, nonatomic) IBOutlet UILabel *userDepartment;
@property (weak, nonatomic) IBOutlet UIView *photoViewBack;
@property (weak, nonatomic) IBOutlet UILabel *taskReward;
@property (weak, nonatomic) IBOutlet UILabel *replyNum;
@property (weak, nonatomic) IBOutlet UILabel *signNum;
@property (weak, nonatomic) IBOutlet UILabel *grade;


@end
