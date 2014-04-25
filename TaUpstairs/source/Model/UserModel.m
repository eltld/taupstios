#import "UserModel.h"

@implementation UserModel
-(NSDictionary *)attributeMapDictionary{
    NSDictionary *mapAtt = @{
                             @"classname":@"classname",
                             @"department":@"department",
                             @"email":@"email",
                             @"grade":@"grade",
                             @"hide":@"hide",
                             @"introduction":@"introduction",
                             @"month_praise":@"month_praise",
                             @"open_id":@"open_id",
                             @"phone":@"phone",
                             @"photo":@"photo",
                             @"pwd":@"pwd",
                             @"qq":@"qq",
                             @"realname":@"realname",
                             @"register_time":@"register_time",
                             @"school":@"school",
                             @"sex":@"sex",
                             @"signature":@"signature",
                             @"special":@"special",
                             @"student_id":@"student_id",
                             @"total_praise":@"total_praise",
                             @"username":@"username",
                             @"users_id":@"users_id"
                             };
    return mapAtt;
    
}




@end
