//
//  MessageViewController.m
//  TaUpstairs
//
//  Created by Micro_Cai on 14-3-19.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "MessageViewController.h"
#import "Request.h"
#import "NewModel.h"
#import "MessageViewCell.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    news = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    [self _loadData];
}

-(void) _loadData{
    NSArray *keyValuesArray = [Request newsList2Down:nil];
    // 2.创建数组
    //  NSMutableArray *modelArray = [NSMutableArray array];
    
    // 3.遍历 转换
    for (NSDictionary *keyValues in keyValuesArray) {
        if (![keyValues isKindOfClass:[NSDictionary class]]) continue;
        NewModel *model = [[NewModel alloc]initWithDataDic:keyValues];
        //id model = [self objectWithKeyValues:keyValues];
        [news addObject:model];
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
    return 1;
}
#warning 高度待定
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
-(NSInteger ) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return news.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"messageViewCell";
    
    UINib *nib = [UINib nibWithNibName:@"MessageViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:reuseID];
    MessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[MessageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        cell.backgroundColor = [UIColor grayColor];
    }
    cell.model = news[indexPath.row];
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
@end
