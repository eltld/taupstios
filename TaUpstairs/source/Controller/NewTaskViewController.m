//
//  NewTaskViewController.m
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "NewTaskViewController.h"
#import "UIButton+Bootstrap.h"
#import "JWFolders.h"
#import "FolderViewController.h"
#import "FriendlyTime.h"
#import "Request.h"
#import "DXAlertView.h"
@interface NewTaskViewController ()


@end

@implementation NewTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"贴悬赏";
    
    [self.textView setPlaceholder:@"正文（不超过140个字）"];
    [self.cfButton addTarget:self action:@selector(reward:) forControlEvents:UIControlEventTouchUpInside];
    [self.KTVButton addTarget:self action:@selector(reward:) forControlEvents:UIControlEventTouchUpInside];
    [self.dyButton addTarget:self action:@selector(reward:) forControlEvents:UIControlEventTouchUpInside];
    [self.lwButton addTarget:self action:@selector(reward:) forControlEvents:UIControlEventTouchUpInside];
    
    self.shareBgView.layer.borderWidth = 0.3;
    self.shareBgView.layer.masksToBounds = YES;
    
    self.contentBgView.layer.borderWidth = 0.3;
    self.contentBgView.layer.masksToBounds = YES;
    
    self.titleBgView.layer.borderWidth = 0.3;
    self.titleBgView.layer.masksToBounds = YES;
    
    [self.timeButton setTitle:@"点击选择截止时间" forState:UIControlStateNormal];
    
    UIButton *test = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [test setImage:[UIImage imageNamed:@"确认号"] forState:UIControlStateNormal];
    [test addTarget:self action:@selector(selectRightAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:test];
    self.navigationItem.rightBarButtonItem = rightButton;
}
-(void)selectRightAction:(id)sender
{
    NSDictionary *result = [Request addTaskWithTitle:self.titleTextField.text andContent:self.textView.text andReward:self.zdyContentLabel.text andTime:self.timeButton.titleLabel.text];
    NSLog(@"%@",[result objectForKey:@"success"]);
    if ([result objectForKey:@"success"]) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"发布结果" contentText:@"发布失败" leftButtonTitle:nil rightButtonTitle:@"确定"];
        [alert show];
        alert.rightBlock = ^() {
            NSLog(@"right button clicked");
        };
        alert.dismissBlock = ^() {
            NSLog(@"Do something interesting after dismiss block");
        };
    }

}
-(void)_recover{
    self.cfLabel.textColor = [UIColor blackColor];
    self.KTVLabel.textColor = [UIColor blackColor];
    self.dyLabel.textColor = [UIColor blackColor];
    self.lwLabel.textColor = [UIColor blackColor];
    [self.cfButton setImage:[UIImage imageNamed:@"吃饭"] forState:UIControlStateNormal];
    [self.KTVButton setImage:[UIImage imageNamed:@"ktv"] forState:UIControlStateNormal];
    [self.dyButton setImage:[UIImage imageNamed:@"电影"] forState:UIControlStateNormal];
    [self.lwButton setImage:[UIImage imageNamed:@"礼物"] forState:UIControlStateNormal];
}
-(void)reward:(UIButton*)sender{
    [self _recover];
    NSString * reward;
    [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",sender.tag]] forState:UIControlStateNormal];
    switch (sender.tag) {
        case 1:
            self.cfLabel.textColor = [UIColor redColor];
            reward = self.cfLabel.text;
            break;
        case 4:
            self.KTVLabel.textColor = [UIColor redColor];
            reward = self.KTVLabel.text;
            break;
        case 2:
            self.dyLabel.textColor = [UIColor redColor];
            reward = self.dyLabel.text;
            break;
        case 3:
            self.lwLabel.textColor = [UIColor redColor];
            reward = self.lwLabel.text;
            break;
        default:
            break;
    }
    self.zdyContentLabel.text = reward;
}

- (IBAction)zdyButton:(id)sender {
    [self _recover];
    //CGPoint openPoint = CGPointMake(CGRectGetWidth(self.view.frame) / 2, [self.zdyLabel frame].origin.y - 20);
    CGPoint openPoint = CGPointMake([self.zdyLabel frame].origin.x+35/2, [self.zdyLabel frame].origin.y+30);
    JWFolders *folder = [JWFolders folder];
    folder.contentView = [[FolderViewController alloc] initWithNibName:nil bundle:nil].view;
    folder.containerView = self.view;
    folder.position = openPoint;
    folder.direction = JWFoldersOpenDirectionDown;
    folder.contentBackgroundColor = [UIColor whiteColor];
    folder.shadowsEnabled = NO;
    folder.darkensBackground = NO;
    folder.showsNotch = YES;
    folder.closeBlock =^(UIView *contentView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction) {
        //FolderViewController *test = (FolderViewController *)contentView;
//NSLog(@"关闭了%@",((UITextField *)[contentView viewWithTag:100]).text);
        self.zdyContentLabel.text = ((UITextField *)[contentView viewWithTag:100]).text;
    };
    [folder open];

}
- (IBAction)_time:(id)sender {
    //New view controller
    UIViewController *pickerViewController = [[UIViewController alloc] init];
    //pickerViewController.view.frame = CGRectMake(100, 100, 100, 100);
    //Init the datePicker view and set self as delegate
    MGConferenceDatePicker *datePicker = [[MGConferenceDatePicker alloc] initWithFrame:self.view.bounds];
    [datePicker setDelegate:self];
    
    //OPTIONAL: Choose the background color
    [datePicker setBackgroundColor:[UIColor whiteColor]];
    
    //Set the data picker as view of the new view controller
    [pickerViewController setView:datePicker];
    
    //Present the view controller
    [self presentViewController:pickerViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Delegate
-(void)conferenceDatePicker:(MGConferenceDatePicker *)datePicker saveDate:(NSDate *)date {
    
    //self.timeButton.titleLabel.text = [[date description] substringToIndex:16];
//    [self.timeButton setTitle:[NSString stringWithFormat:@"此任务截止到 %@",[[date description] substringToIndex:16]]
//                     forState:UIControlStateNormal];
    [self.timeButton setTitle:[[date description] substringToIndex:19]
                     forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@",[date description]);
}
@end
