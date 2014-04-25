//
//  VerificationView.m
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-26.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "VerificationView.h"

@implementation VerificationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(40, 120, 250, 170);
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 40, 100, 35)];
        self.imageView.backgroundColor = [UIColor blackColor];
        self.imageView.tag = 100;
    [self addSubview:self.imageView];
        
        UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-100)/2, 10, 200, 20)];
        titleLbl.text = @"请输入验证码";
        [self addSubview:titleLbl];
        
        self.textFile = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 140, 30)];


        self.textFile.borderStyle = UITextBorderStyleRoundedRect;
        self.textFile.placeholder = @"请输入验证码";
        self.textFile.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.textFile];
        
        UIButton *change = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        change.frame = CGRectMake(165, 75, 80, 40);
        [change.layer setBorderWidth:0];
        [change setTitle:@"换一张" forState:UIControlStateNormal];
        [change addTarget:self action:@selector(showImageView) forControlEvents:UIControlEventTouchUpInside] ;
        [self addSubview:change];
        
        self.cheakBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.cheakBtn.frame = CGRectMake(10, 120, 230, 40);
        self.cheakBtn.backgroundColor = [UIColor colorWithRed:215/25.9 green:99/255.0 blue:144/255.0 alpha:1];
        [self.cheakBtn setTintColor:[UIColor whiteColor]];
        [self.cheakBtn setTitle:@"提交" forState:UIControlStateNormal];

        [self addSubview:self.cheakBtn];
        
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
        self.userInteractionEnabled = YES;
        
        self.hidden = YES;
    }
    return self;
}


-(void) showImageView
{
    NSMutableURLRequest *myRequest = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@/image/code/%@",BaseRequestStr,self.url]]];
    NSLog(@"%@/image/code/%@",BaseRequestStr,self.url);
    NSData *returnData = [ NSURLConnection sendSynchronousRequest:myRequest returningResponse:nil error:nil];
    [self.imageView setImage:[UIImage imageWithData:returnData]];

//    if( [self viewWithTag:100] ){
//        [[self viewWithTag:100] removeFromSuperview];
//    }
    [self.imageView setNeedsDisplay];
//    [self addSubview:self.imageView];
//    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
