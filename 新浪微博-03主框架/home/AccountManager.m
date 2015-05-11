//
//  AccountManager.m
//  新浪微博-01OAuth认证
//
//  Created by yang on 15-5-6.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "AccountManager.h"

@implementation AccountManager
static AccountManager *instance = nil;
//单例方法
+(instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AccountManager alloc]init];
    });
    return instance;
}
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.currentAccount = [self unArchiveAccount];
    }
    return self;
}
-(NSString *)archivePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    return [path stringByAppendingPathComponent:@"account.arc"];
}

//保存帐户信息
-(void)archiveAccount:(Account *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:[self archivePath]];
}
//读取帐户信息
-(Account *)unArchiveAccount
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
}
//判断是否存在有效的帐户
-(BOOL)isValidateAccount
{
    return self.currentAccount != nil;
}
//判断帐户是否超期
-(BOOL)isExpires
{
    NSDate *now = [NSDate date];
    NSDate *expiresDate = [self.currentAccount.createDate dateByAddingTimeInterval:self.currentAccount.expires_in];
    if([now compare:expiresDate]== NSOrderedAscending)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}
@end
