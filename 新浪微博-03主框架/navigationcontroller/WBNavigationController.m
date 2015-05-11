//
//  WBNavigationController.m
//  新浪微博-03主框架
//
//  Created by DuChunhui on 15/5/11.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBNavigationController.h"

@implementation WBNavigationController




//它会在你程序中每个类调用一次initialize。这个调用的时间发生在你的类接收到消息之前，但是在它的超类接收到initialize之后。
+(void)initialize
{[super initialize];
    //设置整个类外观
    UIBarButtonItem* item=[UIBarButtonItem appearance];
    //设置前景色
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];


}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//如果不是根控制器，就隐藏底部的bar
    if(self.viewControllers.count>0)
    {
     viewController.hidesBottomBarWhenPushed=YES;
    
    }
    [super pushViewController:viewController animated:animated];
}
@end
