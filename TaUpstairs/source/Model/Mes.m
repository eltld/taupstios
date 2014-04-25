//
//  Mes.m
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "Mes.h"

@implementation Mes

-(NSDictionary *)attributeMapDictionary{
    NSDictionary *mapAtt = @{
                             @"message_id":@"message_id",
                             @"message_time":@"message_time",
                             @"photo":@"photo",
                             @"task_id":@"task_id",
                             @"username":@"username",
                             @"users_id":@"users_id",
                             @"content":@"content"
                             };
    return mapAtt;
    
}

@end
