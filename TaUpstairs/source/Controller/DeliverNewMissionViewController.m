//
//  DeliverNewMissionViewController.m
//  TaUpstairs
//
//  Created by Micro_Cai on 14-3-19.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "DeliverNewMissionViewController.h"
#import "FriendlyTime.h"
#import "QBFlatButton.h"
#import "TaskDetailCell.h"
#import "MesCell.h"
#import "Request.h"
#import "DXAlertView.h"
#import "ChildMes.h"
@interface DeliverNewMissionViewController ()

@end

@implementation DeliverNewMissionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mess = [[NSMutableArray alloc] init];
    self.photobg.layer.cornerRadius = 65/2;
    self.photobg.layer.masksToBounds = YES;
    [self.photo setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://bcs.duapp.com/taupst/photo/%@",_task.photo]]];
    self.nickname.text = _task.userName;
    self.grade.text = _task.grade;
    self.department.text = _task.userDepartment;
    UIImage *sexima = [UIImage imageNamed:@"icon_female"];
    self.sex.image = sexima;
    
    
    [[QBFlatButton appearance] setFaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    
    btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(250,450, 50, 40);
    btn.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn.radius = 15;
    btn.margin = 4.0;
    btn.depth = 3.0;
    
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"报名" forState:UIControlStateNormal];
    
    
    [self.view addSubview:btn];
    
    
    
    btn1 = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(190,450, 50, 40);
    btn1.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn1.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn1.radius = 15;
    btn1.margin = 4.0;
    btn1.depth = 3.0;
    
    btn1.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setTitle:@"评论" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pl:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    
    [self loadmes];
}

-(void) pl:(UIButton *)sender{
    DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"评论" inputPlaceholder:@"请输入评论" leftButtonTitle:@"确定" rightButtonTitle:@"取消"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
        NSLog(@"right button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}

-(void)loadmes{
    
    NSArray *keyValuesArray = [Request taskMsgList2Down:_task.taskID];
//NSLog(@"%@",keyValuesArray);
    NSArray *contentArray;

    for (NSDictionary *keyValues in keyValuesArray) {
        if (![keyValues isKindOfClass:[NSDictionary class]]) continue;
        
        contentArray = [keyValues objectForKey:@"content"];
        NSMutableArray *childMesArray = [[NSMutableArray alloc] init];
        for (NSDictionary *keyValues in contentArray) {
            ChildMes *cModel = [[ChildMes alloc] initWithDataDic:keyValues];
            [childMesArray addObject:cModel];
        }
        Mes *model = [[Mes alloc]initWithDataDic:keyValues];
        model.content = childMesArray;
        //id model = [self objectWithKeyValues:keyValues];
        [_mess addObject:model];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView Delegate
-(NSInteger ) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    NSString *sectionTitle=[self tableView:tableView titleForHeaderInSection:section];
//    if (sectionTitle==nil) {
//        return nil;
//    }
    
    // Create label with section title
    if (section!=0) {
        UILabel *label=[[UILabel alloc] init];
        label.frame=CGRectMake(12, 0, 300, 22);
        label.backgroundColor=[UIColor clearColor];
        label.textColor=[UIColor redColor];
        label.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
        label.text=@"留言：";
        
        // Create header view and add label as a subview
        UIView *sectionView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
        [sectionView setBackgroundColor:[UIColor whiteColor]];
        [sectionView addSubview:label];
        return sectionView;
    }else{
        UILabel *label=[[UILabel alloc] init];
        label.frame=CGRectMake(12, 0, 300, 22);
        label.backgroundColor=[UIColor clearColor];
        label.textColor=[UIColor redColor];
        label.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
        label.text=@"任务详情";
        
        // Create header view and add label as a subview
        UIView *sectionView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
        [sectionView setBackgroundColor:[UIColor whiteColor]];
        [sectionView addSubview:label];
        return sectionView;
    }
}
#warning 高度待定
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
            return 250;
    }else{
        return (((Mes *)(_mess[indexPath.row])).content.count)*25+50;
        
    }
    //return 100;
}
-(NSInteger ) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    return _mess.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID;
    if (indexPath.section==0) {
        reuseID = @"taskDetail";
        UINib *nib = [UINib nibWithNibName:@"TaskDetailCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:reuseID];
        TaskDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (cell == nil) {
            cell = [[TaskDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            cell.backgroundColor = [UIColor grayColor];
        }
        cell.task = self.task;
    return cell;
    }else{
        reuseID = @"mes";
        UINib *nib = [UINib nibWithNibName:@"MesCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:reuseID];
        MesCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (cell == nil) {
            cell = [[MesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            cell.backgroundColor = [UIColor grayColor];
        }

        cell.mes = _mess[indexPath.row];
        return cell;
    }


}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


@end
