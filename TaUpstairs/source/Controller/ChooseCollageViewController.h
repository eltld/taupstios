//
//  ChooseCollageViewController.h
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-24.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface ChooseCollageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //NSArray *collageArr;
    
}

@property(strong,nonatomic) NSArray *collageArr;
@property(strong,nonatomic) NSDictionary *collageDic;
@property(retain,nonatomic) UITableView *tableView;
@property(strong,nonatomic) LoginViewController *delegate;
@end
