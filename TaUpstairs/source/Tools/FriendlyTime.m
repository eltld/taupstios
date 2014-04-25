//
//  FriendlyTime.m
//  TaUpstairs
//
//  Created by mac on 14-4-16.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "FriendlyTime.h"

@implementation FriendlyTime

+(NSString *)friendlyTime:(NSString *)datetime
{
    time_t current_time = time(NULL);
    
    static NSDateFormatter *dateFormatter =nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    }
    
    NSDate *date = [dateFormatter dateFromString:datetime];
    
    time_t this_time = [date timeIntervalSince1970];
    
    time_t delta = current_time - this_time;
    
    if (delta <= 0) {
        return @"刚刚";
    }
    else if (delta <60)
        return [NSString stringWithFormat:@"%ld秒前", delta];
    else if (delta <3600)
        return [NSString stringWithFormat:@"%ld分钟前", delta /60];
    else {
        struct tm tm_now, tm_in;
        localtime_r(&current_time, &tm_now);
        localtime_r(&this_time, &tm_in);
        NSString *format = nil;
        
        if (tm_now.tm_year == tm_in.tm_year) {
            if (tm_now.tm_yday == tm_in.tm_yday)
                format = @"今天 %-H:%M";
            else
                format = @"%-m月%-d日 %-H:%M";
        }
        else
            format = @"%Y年%-m月%-d日 %-H:%M";
        
        char buf[256] = {0};
        strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
        return [NSString stringWithUTF8String:buf];
    }
}
@end
