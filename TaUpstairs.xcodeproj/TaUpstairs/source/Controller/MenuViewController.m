//
//  MenuViewController.m
//  BusinessCloud
//
//  Created by Hcat on 13-10-12.
//  Copyright (c) 2013年 Hcat. All rights reserved.
//

#import "MenuViewController.h"
#define kTabBarHeight 49.0f
#define MAIN_WIDTH 320
static MenuViewController *menuViewController;

@implementation UIViewController (MenuViewControllerSupport)

- (MenuViewController *)menuViewController
{
	return menuViewController;
}

@end


@interface MenuViewController (){
    UIView      *_containerView;
	UIView		*_transitionView;
}

@property (nonatomic,strong,readwrite) CommonTabBar *tabBar;

- (void)displayViewAtIndex:(NSUInteger)index;

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr
{
	self = [super init];
	if (self != nil)
	{
		_viewControllers = vcs;
		
		_containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
		
		_transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - kTabBarHeight)];
		_transitionView.backgroundColor =  [UIColor clearColor];
		
        
        self.tabBar = [[CommonTabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - kTabBarHeight, 320.0f, kTabBarHeight) buttonItems:arr CommonTabBarType:CommonTabBarTypeImageOnly isAnimation:YES];
        self.tabBar.titleColor = [UIColor whiteColor];
        self.tabBar.delegate = (id<CommonTabBarDelegate>)self;
        self.tabBar.titleSelectColor = [UIColor yellowColor];
        self.tabBar.titlesFont = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
        self.tabBar.backgroundImage = [UIImage imageNamed:@"cm_btmbg"];
        [self.tabBar setSelectedItemBackgroundColor:[UIColor blackColor]];
        [self.tabBar setSelectedItemTopBackgroundColor:[UIColor clearColor]];
        [self.tabBar drawItems];
		
        menuViewController = self;
        self.animateDriect = 0;
        
        
	}
	return self;
}

- (void)loadView
{
	[super loadView];
	
	[_containerView addSubview:_transitionView];
	[_containerView addSubview:_tabBar];
	self.view = _containerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor clearColor];
   
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	_tabBar = nil;
    _tabBar.delegate = nil;
	_viewControllers = nil;
}

- (void)setTabBarTransparent:(BOOL)yesOrNo
{
	if (yesOrNo == YES)
	{
		_transitionView.frame = _containerView.bounds;
	}
	else
	{
		_transitionView.frame = CGRectMake(0, 0, MAIN_WIDTH, _containerView.frame.size.height - kTabBarHeight);
	}
}

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated
{
	if (yesOrNO == YES)
	{
		if (self.tabBar.frame.origin.y == self.view.frame.size.height)
		{
			return;
		}
	}
	else
	{
		if (self.tabBar.frame.origin.y == self.view.frame.size.height - kTabBarHeight)
		{
			return;
		}
	}
	
	if (animated == YES)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3f];
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		[UIView commitAnimations];
	}
	else
	{
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
	}
}

- (UIViewController *)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    
    [self displayViewAtIndex:index];
    [self.tabBar setSelectedIndex:index];
}

- (void)displayViewAtIndex:(NSUInteger)index
{
    // Before change index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)])
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]])
        {
            return;
        }
    }
    // If target index if equal to current index, do nothing.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0)
    {
        return;
    }
    // NSLog(@"Display View.");
    _selectedIndex = index;
    
	UIViewController *selectedVC = [self.viewControllers objectAtIndex:index];
	
	selectedVC.view.frame = _transitionView.frame;
	if ([selectedVC.view isDescendantOfView:_transitionView])
	{
		[_transitionView bringSubviewToFront:selectedVC.view];
        
	}
	else
	{
		[_transitionView addSubview:selectedVC.view];
	}
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
    {
        [_delegate tabBarController:self didSelectViewController:selectedVC];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - commonTabBarDelegate

-(void)tabBar:(CommonTabBar *)tabBar didSelectIndex:(NSInteger)index{
    if (self.selectedIndex == index) {
        
    }else {
        [self displayViewAtIndex:index];
    }
}

@end
