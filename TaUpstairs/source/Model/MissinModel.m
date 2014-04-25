#import "MissinModel.h"

@implementation MissinModel

-(NSDictionary *)attributeMapDictionary{
    NSDictionary *mapAtt = @{
        @"taskLevel": @"task_level",
        @"taskState": @"task_state",
        @"tmCnt": @"tm_cnt",
        @"userName": @"username",
        @"photo": @"photo",
        @"userSex": @"sex",
        @"userID": @"users_id",
        @"taskTitle": @"title",
        @"taskContent": @"content",
        @"taskRewards": @"rewards",
        @"taskID": @"task_id",
        @"releaseTime": @"release_time",
        @"endOfTime": @"end_of_time",
        @"userDepartment": @"department",
        @"grade" : @"grade",
        @"signCnt" : @"sign_cnt"
        };
    return mapAtt;
    
}
@end
