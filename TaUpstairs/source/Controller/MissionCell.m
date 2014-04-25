#import "MissionCell.h"
#import "FriendlyTime.h"
@implementation MissionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

-(void) _initView {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    

    self.photoViewBack.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.photoViewBack.layer.cornerRadius = 25;
    self.photoViewBack.layer.borderWidth = 0.5;
    self.photoViewBack.layer.masksToBounds = YES;
}
-(void)awakeFromNib {
    [super awakeFromNib];
    [self _initView];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.userName.text = self.model.userName;
    [self.userPhoto setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://bcs.duapp.com/taupst/photo/%@",self.model.photo]]];
    self.userDepartment.text = self.model.userDepartment;
    
    NSString* boldFontName = @"Optima-ExtraBlack";
    UIFont *nameLabelFont = [UIFont fontWithName:boldFontName size:17.0f];
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    self.taskTitle.textColor =  mainColor;
    self.taskTitle.font = nameLabelFont;
    self.taskTitle.text = self.model.taskTitle;
    
    self.taskReleaseTime.text = [FriendlyTime friendlyTime:self.model.releaseTime];
    
    self.taskReward.text = self.model.taskRewards;
    self.grade.text = self.model.grade;
    self.replyNum.text =  [NSString stringWithFormat:@"%@",self.model.tmCnt];
    self.signNum.text = [NSString stringWithFormat:@"%@",self.model.signCnt];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
