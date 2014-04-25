//
//  IndividualCenterViewController.h
//  TaUpstairs
//
//  Created by Micro_Cai on 14-3-19.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface IndividualCenterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    
    NSMutableArray *titleArray;
    UserModel *user;
}
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UIView *photoBack;

@end
