#import "MissionViewController.h"
#import "DeliverNewMissionViewController.h"
#import "MissinModel.h"
#import "MissionCell.h"
#import "Request.h"
#import "MJRefreshHeaderView.h"
#import "MJRefreshFooterView.h"
#import "NewTaskViewController.h"
#define kTabBarHeight 0.0f
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
@interface MissionViewController (){
    MJRefreshHeaderView *_header;
    MJRefreshFooterView *_footer;
}

@end

@implementation MissionViewController
#pragma mark 一个类只会调用一次
+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 2.设置导航栏的背景图片
    NSString *navBarBg = nil;
    if (iOS7) { // iOS7
        navBarBg = @"top2 640-64";
        navBar.tintColor = [UIColor whiteColor];
    } else { // 非iOS7
        navBarBg = @"top1 640-44";
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
    
    // 3.标题
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     }];
    
}
#pragma mark 控制状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
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

    baseArr = [[NSMutableArray alloc] init];
    //self.navigationBarHidden = false;
    [self createUI];
    [self addHeader];
    [self addFooter];

}
-(void)viewWillAppear:(BOOL)animated{
    [self reloadReceiveData];
}
- (void)addHeader
{
    __unsafe_unretained MissionViewController *vc = self;
    
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.tableView;
    header.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        // 进入刷新状态就会回调这个Block
        

        
        // 模拟延迟加载数据，因此2秒后才调用）
        // 这里的refreshView其实就是header
        [vc performSelector:@selector(doneWithView:) withObject:refreshView afterDelay:2.0];
        
        NSLog(@"%@----开始进入刷新状态", refreshView.class);
    };
    header.endStateChangeBlock = ^(MJRefreshBaseView *refreshView) {
        // 刷新完毕就会回调这个Block
        NSLog(@"%@----刷新完毕", refreshView.class);
    };
    header.refreshStateChangeBlock = ^(MJRefreshBaseView *refreshView, MJRefreshState state) {
        // 控件的刷新状态切换了就会调用这个block
        switch (state) {
            case MJRefreshStateNormal:
                NSLog(@"%@----切换到：普通状态", refreshView.class);
                break;
                
            case MJRefreshStatePulling:
                NSLog(@"%@----切换到：松开即可刷新的状态", refreshView.class);
                break;
                
            case MJRefreshStateRefreshing:
                NSLog(@"%@----切换到：正在刷新状态", refreshView.class);
                break;
            default:
                break;
        }
    };
    [header beginRefreshing];
    _header = header;
}
- (void)addFooter
{
    __unsafe_unretained MissionViewController *vc = self;
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = self.tableView;
    footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {

        
        // 模拟延迟加载数据，因此2秒后才调用）
        // 这里的refreshView其实就是footer
        [vc performSelector:@selector(doneWithView:) withObject:refreshView afterDelay:2.0];
        
        NSLog(@"%@----开始进入刷新状态", refreshView.class);
    };
    _footer = footer;
}

- (void)doneWithView:(MJRefreshBaseView *)refreshView
{
    // 刷新表格
    [self.tableView reloadData];
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [refreshView endRefreshing];
}
#pragma mark - UI
- (void)createUI{

    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"全部",@"同校",nil];
    
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    
    segmentedControl.frame = CGRectMake((self.view.frame.size.width-100)/2,(44-25)/2+20, 100, 25);
    segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    self.navigationItem.titleView = segmentedControl;
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
-(void)add{
    NewTaskViewController *addView = [[NewTaskViewController alloc] initWithNibName:@"NewTaskViewController" bundle:nil];
    [self.navigationController pushViewController:addView animated:YES];
    
}
#pragma mark - Data
-(void) reloadReceiveData
{
    NSArray *keyValuesArray = [Request taskList:nil];
    // 2.创建数组
  //  NSMutableArray *modelArray = [NSMutableArray array];
    
    // 3.遍历 转换
    for (NSDictionary *keyValues in keyValuesArray) {
        if (![keyValues isKindOfClass:[NSDictionary class]]) continue;
        MissinModel *model = [[MissinModel alloc]initWithDataDic:keyValues];
        //id model = [self objectWithKeyValues:keyValues];
        [baseArr addObject:model];
    }
    //重新加载数据
    [self.tableView reloadData];
}
#pragma mark - tableView Delegate
-(NSInteger ) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#warning 高度待定
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
-(NSInteger ) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return baseArr.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"mission";
    
    UINib *nib = [UINib nibWithNibName:@"MissionCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:reuseID];
    MissionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[MissionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        cell.backgroundColor = [UIColor grayColor];
    }
    cell.model = baseArr[indexPath.row];
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeliverNewMissionViewController *deliverCtl = [[DeliverNewMissionViewController alloc] initWithNibName:@"DeliverNewMissionViewController" bundle:nil];
    //deliverCtl.user = ;
    deliverCtl.task = baseArr[indexPath.row];
    [self.navigationController pushViewController:deliverCtl animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
