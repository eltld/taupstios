//
//  Request.m
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-24.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "Request.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation Request

+(NSString *)URLdeal:(NSString *)url{
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return url;
}
+(NSDictionary *) issysnWithStudentId:(NSString *)studentId andCollageCode:(NSString *)collageCode
{
    __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/data/user/issysn?school=%@&student_id=%@",BaseRequestStr,collageCode,studentId]]];
    [request setRequestMethod:@"GET"];
//    [request setCompletionBlock:^{
//        NSData *data = [request responseData];
//         self.logDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//
//           }];
    [request startSynchronous];
    NSData *data = [request responseData];
    NSDictionary *logDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return logDic;
}
+(NSDictionary *) signInWithInfo:(NSDictionary *) userInfo
{
    NSString *studentId = userInfo[@"id"];
    NSString *password = userInfo[@"password"];
    NSString *collageCode = userInfo[@"collage"];
    NSString *code = userInfo[@"code"];
    NSString *state = userInfo[@"state"];
    //[ASIHTTPRequest clearSession];
    
    NSString *url = [NSString stringWithFormat:@"%@/data/user/login?student_id=%@&pwd=%@&school=%@&code=%@&issysn=%@",BaseRequestStr,studentId,password,collageCode,code,state];

       __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];

    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];
NSString *a = [request responseString];
NSLog(@"hello%@",a);
    NSData *data = [request responseData];
    NSDictionary *logDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return logDic;
}

+(NSArray *) taskList:(NSString *)taskId
{
    NSString *url;
    if (taskId!=nil) {
            url = [NSString stringWithFormat:@"%@/data/task/taskList2Down_2?task_id=%@",BaseRequestStr,taskId];
    }else{
            url = [NSString stringWithFormat:@"%@/data/task/taskList2Down_2",BaseRequestStr];
    }

    __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];
//    NSString *a = [request responseString];
//    NSLog(@"hello%@",a);
    NSData *data = [request responseData];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return arr;
}

+(NSArray *) rankList:(NSString *)type {
    NSString *url = [NSString stringWithFormat:@"%@/data/ranking/list?type=%@",BaseRequestStr,type];
    __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];
    //    NSString *a = [request responseString];
    //    NSLog(@"hello%@",a);
    NSData *data = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *arr = [dic objectForKey:@"rankList"];
    
    return arr;
}

+(NSDictionary *) userInfo:(NSString *)userId{
    
    NSString *url;
    if (userId==nil) {
        url = [NSString stringWithFormat:@"%@/data/user/userInfo",BaseRequestStr];
    }else{
        url = [NSString stringWithFormat:@"%@/data/user/userInfo?users_id=%@",BaseRequestStr,userId];
    }

    __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];

    NSData *data = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    
    return dic;
}

+(NSArray *) taskMsgList2Down:(NSString *)taskId{
    NSString *url= [NSString stringWithFormat:@"%@/data/taskmsg/taskMsgList2Down?task_id=%@",BaseRequestStr,taskId];
    
    
    __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];

    NSData *data = [request responseData];
    //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    return arr;
}

+(NSArray *) newsList2Down:(NSString *)newsId{
    NSString *url;
    if (newsId==nil) {
        url= [NSString stringWithFormat:@"%@/data/news/newsList2Down",BaseRequestStr];
    }else{
        url= [NSString stringWithFormat:@"%@/data/news/newsList2Down?news_id=%@",BaseRequestStr,newsId];
    }

    __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];

    NSData *data = [request responseData];
    //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    return arr;

}

+(NSDictionary *) addTaskWithTitle:(NSString *)title andContent:(NSString *)content andReward:(NSString *)rewards andTime:(NSString *)time{
    NSString *url = [NSString stringWithFormat:@"%@/data/task/save?title=%@&content=%@&rewards=%@&end_of_time=%@&task_level=1",BaseRequestStr,title,content,rewards,time];
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    __unsafe_unretained ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
//[ASIHTTPRequest clearSession];
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];
NSString *a = [request responseString];
NSLog(@"hello%@",a);
    NSData *data = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    return dic;
}
@end
