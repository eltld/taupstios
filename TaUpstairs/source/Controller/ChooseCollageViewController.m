//
//  ChooseCollageViewController.m
//  TaUpstairs
//
//  Created by Shawn.Wong on 14-3-24.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "ChooseCollageViewController.h"

@interface ChooseCollageViewController ()

@end

@implementation ChooseCollageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    self.collageArr = [[NSArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"collageList" ofType:@"plist"];
    self.collageDic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    self.collageArr = [self.collageDic allKeys];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 350) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.delegate = self;
    [self.view addSubview:self.tableView];

}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.collageArr.count;
    NSLog(@"%d",self.collageArr.count);
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuserID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
        cell.backgroundColor = [UIColor clearColor];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
        btn.tag = 111;
        [cell.contentView addSubview:btn];
    }
    UIButton *btn = (UIButton *)[cell.contentView viewWithTag:111];
    [btn setTitle:self.collageArr[indexPath.row] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
-(void) selectBtnAction:(UIButton *)sender
{
    //NSString *collageStr = [[NSString alloc] init];
    NSString *collageStr = sender.titleLabel.text;
    NSString *collageCode = self.collageDic[collageStr];
    
    NSMutableDictionary *notiDic = [[NSMutableDictionary alloc] init];
    [notiDic setObject:collageStr forKey:@"collageStr"];
    [notiDic setObject:collageCode forKey:@"collageCode"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectCollage" object:nil userInfo:notiDic];
}
//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *collageStr = collageArr[indexPath.row];
//    NSMutableDictionary *notiDic = [[NSMutableDictionary alloc] init];
//    [notiDic setObject:collageStr forKey:@"collage"];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"Select" object:nil userInfo:notiDic];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
