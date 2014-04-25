//
//  MenuViewController.h
//  BusinessCloud
//
//  Created by Hcat on 13-10-12.
//  Copyright (c) 2013年 Hcat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTabBar.h"


@protocol MenuViewControllerDelegate;

@interface MenuViewController : UIViewController{
    
}

@property(nonatomic, strong) NSArray *viewControllers;
@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic,assign) NSUInteger selectedIndex;
@property (nonatomic,strong,readonly) CommonTabBar *tabBar;
@property(nonatomic,assign) id<MenuViewControllerDelegate> delegate;
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic) BOOL tabBarHidden;
@property(nonatomic,assign) NSInteger animateDriect;


- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

@end

@protocol MenuViewControllerDelegate <NSObject>
@optional
- (BOOL)tabBarController:(MenuViewController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(MenuViewController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end


@interface UIViewController (MenuViewControllerSupport)
@property(nonatomic, readonly) MenuViewController *menuViewController;
@end

