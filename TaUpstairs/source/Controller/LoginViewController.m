//
//  LoginViewController.m
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-22.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "LoginViewController.h"
#import "MissionViewController.h"
#import "RankViewController.h"
#import "MessageViewController.h"
#import "IndividualCenterViewController.h"
#import "Request.h"
#import "ChooseCollageViewController.h"
#import "VerificationView.h"
#import "MBProgressHUD.h"
#import "SVProgressHUD.h"
#import "MainTabViewViewController.h"
#import "MYCustomPanel.h"
@interface LoginViewController ()


@end

@implementation LoginViewController
static const int CurrentHeight = 480;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) viewWillDisappear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCollage" object:nil];
    
}
-(void)viewDidAppear:(BOOL)animated{

    [self buildIntro];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self receiveNotification];

    [self controlSetting];
    
    [self viewSetting];
    //拿到学校列表字典
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"collageList" ofType:@"plist"];
    collageDic = [[NSDictionary alloc] initWithContentsOfFile:filepath];
   
}


-(void) controlSetting
{
    self.studentNum.delegate = self;
    self.passwrd.delegate = self;
    
    self.viewBack.layer.borderWidth = 0.7;
    self.viewBack.layer.cornerRadius = 5;
    self.viewBack.layer.borderColor = [UIColor whiteColor].CGColor;
    self.viewBack.layer.masksToBounds = YES;
    
    self.siginBtn.layer.cornerRadius = 5;
    self.siginBtn.layer.masksToBounds = YES;
    
    //点击外面部分收下键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyBoard)];
    
    self.backgroundView.userInteractionEnabled = YES;
    [self.backgroundView addGestureRecognizer:tap];
}


-(void) viewSetting
{
    self.blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.blackView.backgroundColor = [UIColor blackColor];
    self.blackView.alpha = 0;
    self.blackView.userInteractionEnabled = YES;
    [self.view addSubview:self.blackView];
    
    self.chooseTableView = [[UIView alloc] init];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenTheBlackView)];
    [self.blackView addGestureRecognizer:tap];
    
//初始化验证码框
    self.verficationView = [[VerificationView alloc] init];
    self.textFile = [self.verficationView textFile];
    [self.verficationView textFile].delegate = self;
    [[self.verficationView cheakBtn] addTarget:self action:@selector(commitBtnAction) forControlEvents:UIControlEventTouchUpInside];

}


-(void) hiddenKeyBoard
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    }];
    [self.studentNum resignFirstResponder];
    [self.passwrd resignFirstResponder];
}


//选择学院按钮

- (IBAction)chooseCollageBtnAction:(id)sender {
    
    [self hiddenKeyBoard];
    ChooseCollageViewController *choosCtl = [[ChooseCollageViewController alloc] init];
    choosCtl.view.frame = CGRectMake(10, (self.view.frame.size.height-49-350)/2, self.view.frame.size.width-20, 350);
    choosCtl.view.layer.masksToBounds = YES;
    choosCtl.view.layer.cornerRadius = 15;
//    choosCtl.tableView.delegate = self;
//    choosCtl.tableView.dataSource = self;
    [self showBlackBackgroundView];
    //动画
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.5;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [choosCtl.view.layer addAnimation:popAnimation forKey:nil];
    choosCtl.view.transform = CGAffineTransformScale(self.view.transform,1,1);
    
    self.chooseTableView = choosCtl.view;
    [self.view addSubview:choosCtl.view];

}
-(void) showBlackBackgroundView
{
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.alpha = 0.7;
    }];
}
-(void) hiddenTheBlackView
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.textFile resignFirstResponder];
        self.blackView.alpha = 0;
        self.chooseTableView.frame = CGRectMake(10, 1000, self.view.frame.size.width-20, 350);
        self.verficationView.hidden = YES;
    } completion:^(BOOL finished) {
        [self.chooseTableView removeFromSuperview];
    }];
}

-(void) receiveNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationMethod:) name:@"SelectCollage" object:nil];
}
//提交验证码按钮
-(void) commitBtnAction
{

    NSMutableDictionary *userdic = [[NSMutableDictionary alloc] init];
    [userdic setObject:self.studentNum.text forKey:@"id"];
    [userdic setObject:self.passwrd.text forKey:@"password"];
    [userdic setObject:collageCode forKey:@"collage"];
    [userdic setObject:self.textFile.text forKey:@"code"];
    [userdic setObject:@"0" forKey:@"state"];

    NSDictionary *dic = [Request signInWithInfo:userdic];

    if ([dic[@"isLogined"] isEqualToString:@"ture"]) {
        self.verficationView.hidden = YES;
        //推送主界面
        [self initRootViewController];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:dic[@"msg"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    
}
-(void) notificationMethod:(NSNotification *) notification
{
    NSDictionary *userinfoDic = [notification userInfo];
    collageCode = [[NSString alloc] init];
    NSString *collageStr = userinfoDic[@"collageStr"];
    collageCode = userinfoDic[@"collageCode"];
    [self.collageBtn setTitle:collageStr forState:UIControlStateNormal];
    [self hiddenTheBlackView];
}
- (IBAction)userLoginBtnAction:(id)sender {

    self.mBProgressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        self.mBProgressHUD = [[MBProgressHUD alloc] initWithView:self.view];
//        [self.view addSubview:self.mBProgressHUD];
        self.mBProgressHUD.delegate = self;
       self.mBProgressHUD.labelText = @"请稍后...";
        self.mBProgressHUD.square = YES;

   
       [self.mBProgressHUD showWhileExecuting:@selector(login) onTarget:self withObject:nil animated:YES];
    

 

    //[self.view addSubview:self.verficationView];


}
- (void)hudWasHidden:(MBProgressHUD *)hud {

    [hud removeFromSuperview];
    hud = nil;
    if ([self.flag isEqualToString:@"2"]) {//没有验证码，判断登入情况
        
      if ([self.dic[@"isLogined"] isEqualToString:@"true"]) {//登入成功
           //推送主界面
          [self initRootViewController];
      }
       else
             {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:self.dic[@"msg"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertView show];
              }
        
    }else if ([self.flag isEqualToString:@"1"])
    {
        self.blackView.alpha = 0.7;
        self.verficationView.hidden = NO;
        [self.view addSubview:self.verficationView];
        
        [[self.verficationView textFile] becomeFirstResponder];
    }

}
-(NSDictionary *)getinfoWithstate:(NSString *)state
{
    NSMutableDictionary *userdic = [[NSMutableDictionary alloc] init];
    [userdic setObject:self.studentNum.text forKey:@"id"];
    [userdic setObject:self.passwrd.text forKey:@"password"];
    [userdic setObject:collageCode forKey:@"collage"];
    [userdic setObject:state forKey:@"state"];
    return userdic;
}
-(void) login
{
    self.logDic = [Request issysnWithStudentId:self.studentNum.text andCollageCode:collageCode];
    
    self.sysnState = [self.logDic objectForKey:@"state"];
    NSString *mcode = [self.logDic objectForKey:@"mcode"];
    if (mcode!=nil) {//验证码
        self.flag = @"1";
        self.verficationView.url = mcode;
        [self.verficationView showImageView];
    }
    else
    {
        self.flag = @"2";
        self.dic = [Request signInWithInfo:[self getinfoWithstate:@"3"]];
        
    }
}

-(void) initRootViewController
{
    
    //tabbarViewController *menu = [[tabbarViewController alloc] initWithNibName:@"tabbarViewController" bundle:nil];
    MainTabViewViewController *mainView = [[MainTabViewViewController alloc] initWithNibName:@"MainTabViewViewController" bundle:nil];
    mainView.selectedIndex = 1;
    [self presentViewController:mainView animated:YES completion:nil];

}
#pragma mark - textFile Delegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    }];
    [textField resignFirstResponder];
    return YES;
}
-(void) textFieldDidBeginEditing:(UITextField *)textField
{
   
    if (self.view.frame.size.height == CurrentHeight) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0, -80, 320, self.view.frame.size.height);
        }];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Build MYBlurIntroductionView

-(void)buildIntro{
    //Create Stock Panel with header
    UIView *headerView = [[NSBundle mainBundle] loadNibNamed:@"TestHeader" owner:nil options:nil][0];
    MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Welcome to MYBlurIntroductionView" description:@"MYBlurIntroductionView is a powerful platform for building app introductions and tutorials. Built on the MYIntroductionView core, this revamped version has been reengineered for beauty and greater developer control." image:[UIImage imageNamed:@"HeaderImage.png"] header:headerView];
    
    //Create Stock Panel With Image
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Automated Stock Panels" description:@"Need a quick-and-dirty solution for your app introduction? MYBlurIntroductionView comes with customizable stock panels that make writing an introduction a walk in the park. Stock panels come with optional blurring (iOS 7) and background image. A full panel is just one method away!" image:[UIImage imageNamed:@"ForkImage.png"]];
    
    //Create Panel From Nib
    MYIntroductionPanel *panel3 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"TestPanel3"];
    
    //Create custom panel with events
    MYCustomPanel *panel4 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"MYCustomPanel"];
    
    //Add panels to an array
    NSArray *panels = @[panel1, panel2, panel3, panel4];
    
    //Create the introduction view and set its delegate
    MYBlurIntroductionView *introductionView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introductionView.delegate = self;
    introductionView.BackgroundImageView.image = [UIImage imageNamed:@"Toronto, ON.jpg"];
    //introductionView.LanguageDirection = MYLanguageDirectionRightToLeft;
    
    //Build the introduction with desired panels
    [introductionView buildIntroductionWithPanels:panels];
    
    //Add the introduction to your view
    [self.view addSubview:introductionView];
}

#pragma mark - MYIntroduction Delegate

-(void)introduction:(MYBlurIntroductionView *)introductionView didChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex{
    NSLog(@"Introduction did change to panel %d", panelIndex);
    
    //You can edit introduction view properties right from the delegate method!
    //If it is the first panel, change the color to green!
    if (panelIndex == 0) {
        [introductionView setBackgroundColor:[UIColor colorWithRed:90.0f/255.0f green:175.0f/255.0f blue:113.0f/255.0f alpha:1]];
    }
    //If it is the second panel, change the color to blue!
    else if (panelIndex == 1){
        [introductionView setBackgroundColor:[UIColor colorWithRed:50.0f/255.0f green:79.0f/255.0f blue:133.0f/255.0f alpha:1]];
    }
    
}

-(void)introduction:(MYBlurIntroductionView *)introductionView didFinishWithType:(MYFinishType)finishType {
    NSLog(@"Introduction did finish");
}

@end
