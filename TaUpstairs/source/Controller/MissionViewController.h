//
//  MissionViewController.h
//  TaUpstairs
//
//  Created by Micro_Cai on 14-3-19.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *baseArr;
}

@property (retain,nonatomic) UITableView *tableView;

@end
