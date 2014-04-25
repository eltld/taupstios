//
//  MainTabViewViewController.m
//  TaUpstairs
//
//  Created by mac on 14-4-15.
//  Copyright (c) 2014年 Micro_Cai. All rights reserved.
//

#import "MainTabViewViewController.h"
#import "MissionViewController.h"
#import "RankViewController.h"
#import "MessageViewController.h"
#import "IndividualCenterViewController.h"
@interface MainTabViewViewController ()

@end

@implementation MainTabViewViewController

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
    self.viewControllers = [self getViewcontrollers];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)getViewcontrollers
{
    NSArray* tabBarItems = nil;
    
    //任务列表
    MissionViewController *missionViewController = [[MissionViewController alloc] initWithNibName:@"MissionViewController" bundle:nil];
    missionViewController.title = @"任务";
    //FlipBoardNavigationController *navMission = [[FlipBoardNavigationController alloc] initWithRootViewController:missionViewController];
    UINavigationController *navMission = [[UINavigationController alloc] initWithRootViewController:missionViewController];
    //排行榜
    RankViewController *rankViewController = [[RankViewController alloc] initWithNibName:@"RankViewController" bundle:nil];
    rankViewController.title = @"排行榜";
    UINavigationController *navRank = [[UINavigationController alloc] initWithRootViewController:rankViewController];
    
    //消息列表
    MessageViewController *messageViewController = [[MessageViewController alloc] initWithNibName:@"MessageViewController" bundle:nil];
    messageViewController.title = @"消息";
    UINavigationController *navMessage = [[UINavigationController alloc] initWithRootViewController:messageViewController];
    
    //个人中心
    IndividualCenterViewController *individualCenterViewController = [[IndividualCenterViewController alloc] initWithNibName:@"IndividualCenterViewController" bundle:nil];
    individualCenterViewController.title = @"我";
    UINavigationController *navIndividualCenter = [[UINavigationController alloc] initWithRootViewController:individualCenterViewController];
    

    tabBarItems = [NSArray arrayWithObjects:navMessage,navMission,navRank,navIndividualCenter, nil];
    return tabBarItems;
    
}

@end
