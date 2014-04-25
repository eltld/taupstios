//
//  childMes.m
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "ChildMes.h"

@implementation ChildMes
-(NSDictionary *)attributeMapDictionary{
    NSDictionary *mapAtt = @{
                             @"message_content":@"message_content",
                             @"replied":@"replied",
                             @"replied_id":@"replied_id",
                             @"reply":@"reply",
                             @"reply_id":@"reply_id"
                             };
    return mapAtt;
    
}

@end
