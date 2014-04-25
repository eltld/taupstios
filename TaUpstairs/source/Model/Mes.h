//
//  Mes.h
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface Mes : BaseModel

@property(strong,nonatomic)NSString *message_id;
@property(strong,nonatomic)NSString *message_time;
@property(strong,nonatomic)NSString *photo;
@property(strong,nonatomic)NSString *task_id;
@property(strong,nonatomic)NSString *username;
@property(strong,nonatomic)NSString *users_id;

@property(strong,nonatomic)NSMutableArray *content;

@end
