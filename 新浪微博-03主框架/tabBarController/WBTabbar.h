//
//  WBTabbar.h
//  新浪微博-03主框架
//
//  Created by len on 15-5-7.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTabbar;

//定义代理协议
@protocol TabbarDelegate<NSObject>
-(void)tabBar:(WBTabbar *)tabBar didSelectIndex:(NSInteger)index;//选中某个按钮时 调用代理方法  将index传给controller
@end

@interface WBTabbar : UIView

//定义代理
@property(weak,nonatomic)id<TabbarDelegate>delegate;


-(void)addButtonWithTabbarItem:(UITabBarItem *)tabbarItem;//WBTabBarViewController中点击tabbar，此处创建button



@end
