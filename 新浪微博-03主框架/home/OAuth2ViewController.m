//
//  ViewController.m
//  新浪微博-01OAuth认证
//
//  Created by yang on 15-5-6.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "OAuth2ViewController.h"
#import "AFNetworking.h"
#import "SinaAPIConstant.h"
#import "WBAppDelegate.h"
#import "WBTabBarViewController.h"
@interface OAuth2ViewController ()<UIWebViewDelegate>

@end

@implementation OAuth2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//添加webView显示用户授权页面
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    webView.delegate = self;
    
    //通过帐户管理类判断帐户是否有效并且不超期
    WBAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    if(![appDelegate.accountManager isValidateAccount] || ![appDelegate.accountManager isExpires])
    {
        //访问新浪的OAuth认证页面
        NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",kOAuth2URL,kAppKey,kRedirectURL];
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
    }
}

#pragma mark - WebView代理方法
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //NSLog(@"%@",request);
    //取出返回的code
    NSString *urlStr =  request.URL.absoluteString;
    //NSLog(@"%@",urlStr);
    NSRange range = [urlStr rangeOfString:@"code="];
    if(range.length)
    {
        NSString *code = [urlStr substringFromIndex:range.location+range.length];
        NSLog(@"code=%@",code);
        
        [self requestAccessToken:code];
    }
        return YES;
}
-(void)requestAccessToken:(NSString *)code
{
    //获取acess_token
    AFHTTPRequestOperationManager *manager =  [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:kAppKey forKey:@"client_id"];
    [parameters setObject:kAppSecret forKey:@"client_secret"];
    [parameters setObject:kGrandType forKey:@"grant_type"];
    [parameters setObject:code forKey:@"code"];
    [parameters setObject:kRedirectURL forKey:@"redirect_uri"];
    
    [manager POST:kAccessTokenURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求成功：%@",responseObject);
        //创建帐户对象
        Account *account = [Account accountWithDic:responseObject];
        //保存帐户对象
        WBAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        [appDelegate.accountManager archiveAccount:account];
        //显示主界面
        
        WBTabBarViewController* main=[[WBTabBarViewController alloc]init];
        appDelegate.window.rootViewController=main;
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"post请求失败:%@",error);
    }];
}
@end
