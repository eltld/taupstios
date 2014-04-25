//
//  NewTaskViewController.h
//  TaUpstairs
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGConferenceDatePicker.h"
#import "MGConferenceDatePickerDelegate.h"
#import "IQTextView.h"
@interface NewTaskViewController : UIViewController<MGConferenceDatePickerDelegate>
@property (weak, nonatomic) IBOutlet IQTextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UIButton *cfButton;
@property (weak, nonatomic) IBOutlet UIButton *dyButton;
@property (weak, nonatomic) IBOutlet UIButton *lwButton;
@property (weak, nonatomic) IBOutlet UIButton *KTVButton;
@property (weak, nonatomic) IBOutlet UIButton *zdyButton;

@property (weak, nonatomic) IBOutlet UIButton *timeButton;

@property (weak, nonatomic) IBOutlet UILabel *cfLabel;
@property (weak, nonatomic) IBOutlet UILabel *dyLabel;
@property (weak, nonatomic) IBOutlet UILabel *lwLabel;
@property (weak, nonatomic) IBOutlet UILabel *KTVLabel;
@property (weak, nonatomic) IBOutlet UILabel *zdyLabel;
@property (weak, nonatomic) IBOutlet UILabel *zdyContentLabel;

@property (weak, nonatomic) IBOutlet UIView *shareBgView;
@property (weak, nonatomic) IBOutlet UIView *contentBgView;
@property (weak, nonatomic) IBOutlet UIView *titleBgView;


@end
