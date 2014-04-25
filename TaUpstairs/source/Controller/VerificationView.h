//
//  VerificationView.h
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-26.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerificationView : UIView

@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UITextField *textFile;
@property UIButton *cheakBtn;
@property (strong,nonatomic) NSString *url;
-(void) showImageView;

@end
