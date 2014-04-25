//
//  LoginViewController.h
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-22.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerificationView.h"
#import "MBProgressHUD.h"
#import "MYBlurIntroductionView.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate,MBProgressHUDDelegate,MYIntroductionDelegate>
{
    NSString *collageCode;
    NSDictionary *collageDic;

}
@property (weak, nonatomic) IBOutlet UIButton *collageBtn;
@property (weak, nonatomic) IBOutlet UIButton *siginBtn;
@property (weak, nonatomic) IBOutlet UIView *viewBack;
@property (weak, nonatomic) IBOutlet UITextField *studentNum;
@property (weak, nonatomic) IBOutlet UITextField *passwrd;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;

@property (strong,nonatomic) MBProgressHUD *mBProgressHUD;
@property (strong,nonatomic) UIView *blackView;
@property (strong,nonatomic) UIView *chooseTableView;
@property (strong,nonatomic) VerificationView *verficationView;//验证码主view
@property (strong,nonatomic) UIImageView *imageView;//验证码图片
@property (strong,nonatomic) UITextField *textFile;//验证码输入框
@property (strong,nonatomic) UIButton *cheakBtn;//提交按钮
@property (strong,nonatomic) NSString *sysnState;
@property (strong,nonatomic) NSDictionary *dic;
@property (strong,nonatomic) NSDictionary *logDic;
@property (strong,nonatomic) NSString *flag;
@end
