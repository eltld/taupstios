#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface MissinModel : BaseModel

@property (strong,nonatomic) NSString *taskLevel;//任务等级
@property (strong,nonatomic) NSString *taskState;//任务状态
@property (strong,nonatomic) NSString *tmCnt;//留言数
@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *photo;
@property (strong,nonatomic) NSString *userSex;
@property (strong,nonatomic) NSString *userID;
@property (strong,nonatomic) NSString *grade;
@property (strong,nonatomic) NSString *taskTitle;//任务标题
@property (strong,nonatomic) NSString *taskContent;//任务内容
@property (strong,nonatomic) NSString *taskRewards;//任务报酬
@property (strong,nonatomic) NSString *taskID;//任务Id
@property (strong,nonatomic) NSString *releaseTime;//发布时间
@property (strong,nonatomic) NSString *endOfTime;//截止时间
@property (strong,nonatomic) NSString *userDepartment;//学院
@property (strong,nonatomic) NSString *signCnt;//报名数


@end
