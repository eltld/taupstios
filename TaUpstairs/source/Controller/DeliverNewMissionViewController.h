//
//  DeliverNewMissionViewController.h
//  TaUpstairs
//
//  Created by Micro_Cai on 14-3-19.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "MissinModel.h"
#import "CUSFlashLabel.h"
#import "QBFlatButton.h"
@interface DeliverNewMissionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
        QBFlatButton *btn;
        QBFlatButton *btn1;
}

@property(strong,nonatomic)UserModel *user;
@property(strong,nonatomic)MissinModel *task;
@property(strong,nonatomic) NSMutableArray *mess;

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UIImageView *sex;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UILabel *department;
@property (weak, nonatomic) IBOutlet UIView *photobg;




@end
