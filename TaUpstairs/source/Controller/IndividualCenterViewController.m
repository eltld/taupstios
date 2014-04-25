//
//  IndividualCenterViewController.m
//  TaUpstairs
//
//  Created by Micro_Cai on 14-3-19.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "IndividualCenterViewController.h"
#import "Request.h"
#import "IndividualTableViewCell.h"
#import "UserModel.h"
@interface IndividualCenterViewController ()

@end

@implementation IndividualCenterViewController

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
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    self.photoBack.layer.cornerRadius = 53;
    self.photoBack.layer.masksToBounds = YES;
    titleArray = [[NSMutableArray alloc] initWithObjects:@"基本信息", @"实名信息",@"联系方式",@"任务", nil];
    user = [[UserModel alloc] initWithDataDic:[Request userInfo:nil]];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//每个section显示的标题

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    

            
  
            
            return [titleArray objectAtIndex:section];//提取标题数组的元素用来显示标题


    
    
    
}



//指定有多少个分区(Section)，默认为1

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [titleArray count];//返回标题数组中元素的个数来确定分区的个数
    
}



//指定每个分区中有多少行，默认为1

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
            
        case 0:
            
            return  2;//每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            
            break;
            
        case 1:
            
            return  5;
            
            break;
        case 2:
            
            return  3;
            
            break;
        case 3:
            
            return  2;
            
            break;
       
            
        default:
            
            return 0;
            
            break;
            
    }
    
}



//绘制Cell

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    static NSString *CellIdentifier = @"Cell";
    
    //初始化cell并指定其类型，也可自定义cell
    UINib *nib = [UINib nibWithNibName:@"IndividualTableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    IndividualTableViewCell *cell = (IndividualTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    

    if (cell==nil) {
        cell = [[IndividualTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       
    }
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    
                    cell.key.text = @"昵称";
                    cell.value.text = user.username;
                    break;
                case 1:
                    cell.key.text = @"个性签名";
                    cell.value.text = user.signature;
                    break;
                    
                    
                default:
                    break;
            }

            break;
            
           case 1:
            switch (indexPath.row) {
                case 0:
                    
                    cell.key.text = @"姓名";
                    cell.value.text = user.realname;
                    break;
                case 1:
                    cell.key.text = @"性别";
                    cell.value.text = user.sex;
                    break;
                case 2:
                    cell.key.text = @"院系";
                    cell.value.text = user.department;
                    break;
                case 3:
                    cell.key.text = @"班级";
                    cell.value.text = user.classname;
                    break;
                case 4:
                    cell.key.text = @"年级";
                    cell.value.text = user.grade;
                    break;
                default:
                    break;
            }
            break;
            case 2:
            switch (indexPath.row) {
                case 0:
                    
                    cell.key.text = @"QQ";
                    cell.value.text = user.qq;
                    break;
                case 1:
                    cell.key.text = @"电子邮箱";
                    cell.value.text = user.email;
                    break;
                case 2:
                    cell.key.text = @"移动电话";
                    cell.value.text = user.phone;
                    break;
                    
                default:
                    break;
            }
            break;
            case 3:

            switch (indexPath.row) {
                case 0:
                    
                    cell.key.text = @"我发布";
                    cell.value.text = @"点击查看";
                    break;
                case 1:
                    cell.key.text = @"我报名";
                    cell.value.text = @"点击查看";
                    break;
                    
                    
                default:
                    break;
            }
            
            break;
            
        default:
            break;
    }
       return cell;
    
}
@end
