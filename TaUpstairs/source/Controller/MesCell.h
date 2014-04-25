//
//  MesCell.h
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mes.h"
@interface MesCell : UITableViewCell

@property(strong,nonatomic) Mes *mes;

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end
