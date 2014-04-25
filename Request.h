//
//  Request.h
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-24.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject
{

}

+(NSString *)URLdeal:(NSString *)url;

//是否已经同步过
+(NSDictionary *) issysnWithStudentId:(NSString *)studentId andCollageCode:(NSString *)collageCode;
//登入或者同步
+(NSDictionary *) signInWithInfo:(NSDictionary *) userInfo;
//请求任务列表。
+(NSArray *) taskList:(NSString *)taskId;;
//请求排行榜列表
+(NSArray *) rankList:(NSString *)type;;
//获取用户资料
+(NSDictionary *) userInfo:(NSString *)userId;

+(NSArray *) taskMsgList2Down:(NSString *)taskId;

+(NSArray *) newsList2Down:(NSString *)newsId;


+(NSDictionary *) addTaskWithTitle:(NSString *)title andContent:(NSString *)content andReward:(NSString *)rewards andTime:(NSString *)time;

@end
