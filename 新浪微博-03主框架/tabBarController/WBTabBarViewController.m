//
//  WBTabBarViewController.m
//  新浪微博-03主框架
//
//  Created by len on 15-5-7.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBTabBarViewController.h"
#import "WBHomeTableViewController.h"
#import "WBMessageTableViewController.h"
#import "WBProfileTableViewController.h"
#import "WBDiscoveryTableViewController.h"
#import "WBTabbar.h"


@interface WBTabBarViewController ()<TabbarDelegate>
@property(strong,nonatomic)WBTabbar* myTabbar;
@end

@implementation WBTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self replaceTabbar];
    [self childrenControllers];
}
#pragma mark 替换系统的tabbar
-(void)replaceTabbar
{
    //测试如何替换tabbar  WBTabbar是uiview
    self.myTabbar=[[WBTabbar alloc]initWithFrame:self.tabBar.bounds];//盖住下面的tabbar的颜色
    self.myTabbar.delegate=self;
    
    [self.tabBar addSubview:self.myTabbar];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    for (UIView* subView in self.tabBar.subviews) {
        if (![subView isKindOfClass:[WBTabbar class]]) {
            [subView removeFromSuperview];
        }
        
    }
}
#pragma mark- 实现代理方法   自定义tabbar的代理方法
-(void)tabBar:(WBTabbar *)tabBar didSelectIndex:(NSInteger)index
{
    //切换当前显示的控制器
    self.selectedIndex=index;
}
#pragma mark 设置所有子控制器
-(void)childrenControllers
{

    //home
    WBHomeTableViewController* homeVC=[[WBHomeTableViewController alloc]init];
    homeVC.view.backgroundColor=[UIColor redColor];
    WBNavigationController* nv1=[[WBNavigationController alloc]initWithRootViewController:homeVC];
    nv1.tabBarItem.title=@"首页";
    nv1.tabBarItem.image=[UIImage imageNamed:@"tabbar_home_os7"];
    nv1.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_home_selected_os7"];
    //nv1.tabBarItem.badgeValue=@"1";
    [self.myTabbar addButtonWithTabbarItem:nv1.tabBarItem];
    [self addChildViewController:nv1];
    
    //2.message
    WBMessageTableViewController* messageVC=[[WBMessageTableViewController alloc]init];
    messageVC.view.backgroundColor=[UIColor blueColor];
    WBNavigationController* nv2=[[WBNavigationController alloc]initWithRootViewController:messageVC];
    nv2.tabBarItem.title=@"消息";
    nv2.tabBarItem.image=[UIImage imageNamed:@"tabbar_message_center_os7"];
    nv2.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_message_center_selected_os7"];
    //nv2.tabBarItem.badgeValue=@"11";
    [self.myTabbar addButtonWithTabbarItem:nv2.tabBarItem];
    [self addChildViewController:nv2];
    
    //3.discover
    WBDiscoveryTableViewController* disVC=[[WBDiscoveryTableViewController alloc]init];
    disVC.view.backgroundColor=[UIColor greenColor];
    WBNavigationController* nv3=[[WBNavigationController alloc]initWithRootViewController:disVC];
    nv3.tabBarItem.title=@"发现";
    nv3.tabBarItem.image=[UIImage imageNamed:@"tabbar_discover_os7"];
    nv3.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_discover_selected_os7"];
    //nv3.tabBarItem.badgeValue=@"3";
    [self.myTabbar addButtonWithTabbarItem:nv3.tabBarItem];
    [self addChildViewController:nv3];
    
    //4.profile
    WBProfileTableViewController* proVC=[[WBProfileTableViewController alloc]init];
    proVC.view.backgroundColor=[UIColor yellowColor];
    WBNavigationController* nv4=[[WBNavigationController alloc]initWithRootViewController:proVC];
    nv4.tabBarItem.title=@"我";
    nv4.tabBarItem.image=[UIImage imageNamed:@"tabbar_profile_os7"];
    nv4.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_profile_selected_os7"];
    //nv4.tabBarItem.badgeValue=@"99";
    [self.myTabbar addButtonWithTabbarItem:nv4.tabBarItem];
    [self addChildViewController:nv4];

}



@end
