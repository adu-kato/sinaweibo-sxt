//
//  AccountManager.h
//  新浪微博-01OAuth认证
//
//  Created by yang on 15-5-6.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface AccountManager : NSObject
@property(strong,nonatomic)Account *currentAccount;
//单例方法
+(instancetype)shareManager;
//保存帐户信息
-(void)archiveAccount:(Account *)account;
//读取帐户信息
-(Account *)unArchiveAccount;
//判断是否存在有效的帐户
-(BOOL)isValidateAccount;
//判断帐户是否超期
-(BOOL)isExpires;
@end
