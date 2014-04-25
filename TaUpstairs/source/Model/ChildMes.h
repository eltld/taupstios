//
//  childMes.h
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface ChildMes : BaseModel

@property(strong,nonatomic) NSString *message_content;
@property(strong,nonatomic) NSString *replied;
@property(strong,nonatomic) NSString *replied_id;
@property(strong,nonatomic) NSString *reply;
@property(strong,nonatomic) NSString *reply_id;

@end
