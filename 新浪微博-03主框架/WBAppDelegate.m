//
//  WBAppDelegate.m
//  新浪微博-03主框架
//
//  Created by len on 15-5-7.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBAppDelegate.h"
#import "WBTabBarViewController.h"
#import "OAuth2ViewController.h"
#import "WBNewFeatureViewController.h"


@implementation WBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    //显示新特性
    WBNewFeatureViewController* newFeature=[[WBNewFeatureViewController alloc]init];
    self.window.rootViewController=newFeature;
    
    
    
    
    
//    
//    
//    //判断是否已经login
//    if([self.accountManager isValidateAccount]||[self.accountManager isExpires])
//    {
//    
//        OAuth2ViewController* login=[[OAuth2ViewController alloc]init];
//        self.window.rootViewController=login;
//    
//    }
//    
//    else{
//    
//    
//    
//    //设置主控制器
//    WBTabBarViewController* controller=[[WBTabBarViewController alloc]init];
//    self.window.rootViewController=controller;
//    
//    
//        self.window.rootViewController=controller;
//    }
    [self.window makeKeyAndVisible];
    
    
    return YES;
}
#pragma mark新特征已经显示后，然后在用户偏好中进行记录
-(void)newFeatureDidAppear
{

    
    
   NSString* version= [ [[NSBundle mainBundle]infoDictionary]objectForKey:(NSString *)kCFBundleVersionKey];
    
    
    
                       [[NSUserDefaults standardUserDefaults]setObject:version forKey:@"lastVersion"];
    [[NSUserDefaults standardUserDefaults]synchronize];
                       
                       
}

#pragma mark 读取用户偏好，返回新特征是否需要显示
-(BOOL)newFeatureIsShowed
{

    return NO;
}
#pragma mark 账户管理对象的get方法
-(AccountManager *)accountManager
{
if(!_accountManager)
{
    _accountManager=[[AccountManager alloc]init];
}
    return _accountManager;


}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
