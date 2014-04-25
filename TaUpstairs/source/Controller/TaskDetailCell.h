//
//  TaskDetailCell.h
//  TaUpstairs
//
//  Created by mac on 14-4-17.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBFlatButton.h"
#import "MissinModel.h"
#import "CUSFlashLabel.h"
@interface TaskDetailCell : UITableViewCell{
    QBFlatButton *btn;
    CUSFlashLabel *reward;
}
@property(strong,nonatomic)MissinModel *task;
@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskContent;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *signCnt;

@end
