//
//  NewModel.m
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "NewModel.h"

@implementation NewModel

-(NSDictionary *)attributeMapDictionary{
    NSDictionary *mapAtt = @{
                             @"classname":@"classname",
                             @"content":@"content",
                             @"department":@"department",
                             @"grade":@"grade",
                             @"news_id":@"news_id",
                             @"photo":@"photo",
                             @"sex":@"sex",
                             @"send":@"send",
                             @"source":@"source",
                             @"special":@"special",
                             @"time":@"time",
                             @"type":@"type",
                             @"username":@"username"
                             };
    return mapAtt;
   
}

@end
